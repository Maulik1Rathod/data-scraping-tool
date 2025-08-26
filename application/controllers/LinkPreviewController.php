<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LinkPreviewController extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->model('Linkpreview_model');
        $this->load->helper(['url','form']);
    }

    // Show home page 
    public function index() {
        $this->load->view('linkpreview_view');
    }

    // AJAX fetch preview
    public function fetch() {
        $url = $this->input->post('url');

        $preview = $this->get_url_preview($url);

        echo json_encode($preview);
    }

    // Save preview to DB
    public function save() {
        $post = $this->input->post();
        if ($post) {
            $this->Linkpreview_model->insert($post);
        }
        redirect(base_url());
    }

    private function get_url_preview($url) {
        $html = @file_get_contents($url);
        if(!$html) {
            return [
                'url' => $url,
                'title' => 'Not Found',
                'description' => 'Could not fetch data',
                'image' => ''
            ];
        }

        // Extract og:title first
        preg_match('/<meta property="og:title" content="(.*?)"/i', $html, $matches);
        $title = $matches[1] ?? '';

        /*
            / ... /  >> start & end of the pattern .
            . >> any character
            * >> match many times if many data
        */

        // If og:title not found, use <title>
        if (empty($title)) {
            preg_match("/<title>(.*?)<\/title>/i", $html, $matches);
            $title = $matches[1] ?? '';
        }

        // Extract meta description
        preg_match('/<meta name="description" content="(.*?)"/i', $html, $matches);
        $description = $matches[1] ?? '';

        // Extract og:image
        preg_match('/<meta property="og:image" content="(.*?)"/i', $html, $matches);
        $image = $matches[1] ?? '';

        return [
            'url' => $url,
            'title' => $title,
            'description' => $description,
            'image' => $image
        ];

    }

    // show the saved previews
    public function records() {
        $data['links'] = $this->Linkpreview_model->get_all();
        $this->load->view('records', $data);
    }


}
