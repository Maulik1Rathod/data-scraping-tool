<!DOCTYPE html>
<html>
<head>
    <title>Saved Records</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
</head>
<body class="container mt-4">

    <h2 class="mb-4">Scraped Records</h2>
    <a href="<?= base_url(); ?>" class="btn btn-secondary mb-3">Back to Home</a>

    <table id="recordsTable" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Image</th>
                <th>URL</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($links as $row): ?>
                <tr>
                    <td><?= $row->id; ?></td>
                    <td><?= $row->title; ?></td>
                    <td><?= $row->description; ?></td>
                    <td>
                        <?php if($row->image): ?>
                            <img src="<?= $row->image; ?>" style="max-width:100px;">
                        <?php endif; ?>
                    </td>
                    <td><a href="<?= $row->url; ?>" target="_blank"><?= $row->url; ?></a></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

<script>
$(document).ready(function() {
    $('#recordsTable').DataTable({
        "pageLength": 10,
        "order": [[0, "desc"]]
    });
});
</script>

</body>
</html>
