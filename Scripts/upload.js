var fileUpload = document.getElementById("FileUpload1");
fileUpload.onchange = function () {
    if (typeof (FileReader) != "undefined") {
        var dvPreview = document.getElementById("dvPreview");
        dvPreview.innerHTML = "";
        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
        if (fileUpload.files.length > 3) {
            document.getElementById("Button1").disabled = true;
            document.getElementById("lblmsg").innerHTML = "Only Three Img will be Upload";
        }
        else {
            document.getElementById("lblmsg").innerHTML = "";

            document.getElementById("Button1").disabled = false;
        }
        for (var i = 0; i < fileUpload.files.length; i++) {
            var file = fileUpload.files[i];
            if (regex.test(file.name.toLowerCase())) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = document.createElement("IMG");
                    img.height = "100";
                    img.width = "100";
                    img.src = e.target.result;
                    dvPreview.appendChild(img);
                }
                reader.readAsDataURL(file);
            } else {
                alert(file.name + " is not a valid image file.");
                dvPreview.innerHTML = "";
                return false;
            }
        }
    } else {
        alert("This browser does not support HTML5 FileReader.");
    }
}
