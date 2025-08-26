<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Linkpreview_model extends CI_Model {

    protected $table = 'url_previews';

    // public function get_all($limit, $start) {
    //     return $this->db->limit($limit, $start)->order_by('id','DESC')->get($this->table)->result();
    // }

    public function get_all() {
        $this->db->from($this->table);
        return $this->db->order_by('id','DESC')->get()->result();
    }

    public function insert($data) {
        return $this->db->insert($this->table, $data);
    }
}
