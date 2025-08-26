<?php
defined('BASEPATH') OR exit('No direct script access allowed');

if (!function_exists('get_url_preview')) {
    function get_url_preview($url) {
        $html = @file_get_contents($url);
        if (!$html) return false;

        $doc = new DOMDocument();
        @$doc->loadHTML($html);
        $metas = $doc->getElementsByTagName('meta');

        $title = '';
        $description = '';
        $image = '';

        // Get OG tags first
        foreach ($metas as $meta) {
            if ($meta->getAttribute('property') == 'og:title') {
                $title = $meta->getAttribute('content');
            }
            if ($meta->getAttribute('property') == 'og:description') {
                $description = $meta->getAttribute('content');
            }
            if ($meta->getAttribute('property') == 'og:image') {
                $image = $meta->getAttribute('content');
            }
        }

        // Fallbacks
        if (empty($title)) {
            $nodes = $doc->getElementsByTagName("title");
            $title = $nodes->length > 0 ? $nodes->item(0)->nodeValue : '';
        }
        if (empty($description)) {
            foreach ($metas as $meta) {
                if (strtolower($meta->getAttribute('name')) == 'description') {
                    $description = $meta->getAttribute('content');
                }
            }
        }

        return [
            'url' => $url,
            'title' => $title,
            'description' => $description,
            'image' => $image
        ];
    }
}
