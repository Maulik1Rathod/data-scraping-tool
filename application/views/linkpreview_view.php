<!DOCTYPE html>
<html>
<head>
    <title>Link Preview Demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">

            <!-- Input Card -->
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h4 class="card-title mb-3"> Enter a URL to Preview </h4>
                    <form id="urlForm" class="d-flex gap-2">
                        <input type="text" name="url" id="url" class="form-control" placeholder="Enter URL" required>
                        <button type="submit" class="btn btn-primary">Preview</button>
                    </form>
                </div>
            </div>

            <!-- Preview Card -->
            <div id="previewBox" class="card shadow-sm mb-4" style="display:none;">
                <div class="card-body">
                    <form method="post" action="<?= site_url('preview/save'); ?>">
                        <input type="hidden" name="url" id="p_url">
                        <input type="hidden" name="title" id="p_title">
                        <input type="hidden" name="description" id="p_description">
                        <input type="hidden" name="image" id="p_image">

                        <h5 id="show_title" class="fw-bold"></h5>
                        <p id="show_desc" class="text-muted"></p>
                        <img id="show_img" src="" class="img-thumbnail mb-3" style="max-width:200px; display:none;">
                        <center>
                        <button type="submit" class="btn btn-success" style="
                        "> Save</button>
                        </center>
                    </form>
                </div>
            </div>

            <!-- Records Button -->
            <div class="text-center">
                <a href="<?= site_url('preview/records'); ?>" class="btn btn-outline-primary">
                    View All Records
                </a>
            </div>

        </div>
    </div>
</div>

<script>
$("#urlForm").submit(function(e){
    e.preventDefault();

    $.ajax({
        url: "<?= site_url('preview/fetch'); ?>",
        type: "POST",
        data: { url: $("#url").val() },
        dataType: "json",
        beforeSend: function(){
            // show loader/wait message
            $("#previewBox").hide();
            if ($("#loading").length === 0) {
                $("#urlForm").after('<p id="loading" style="color:blue;"> Fetching preview, please wait...</p>');
            }
        },
        success: function(data){
            if (data) {
                $("#p_url").val(data.url);
                $("#p_title").val(data.title);
                $("#p_description").val(data.description);
                $("#p_image").val(data.image);

                $("#show_title").text(data.title);
                $("#show_desc").text(data.description);

                if(data.image){
                    $("#show_img").attr("src", data.image).show();
                } else {
                    $("#show_img").hide();
                }

                $("#previewBox").fadeIn();
            }
        },
        error: function(xhr, status, error){
            alert("⚠️ Something went wrong: " + error);
        },
        complete: function(){
            // remove loader after ajax finishes
            $("#loading").remove();
        }
    });
});

</script>

</body>
</html>
