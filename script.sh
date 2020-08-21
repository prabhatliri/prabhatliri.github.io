#!/bin/bash

cp VZ\ Messages.ipa VZ\ Messages.zip
unzip VZ\ Messages.zip
var_path=$PWD
echo $var_path
build_ver=$(defaults read $var_path/Payload/VZ\ Messages.app/Info CFBundleShortVersionString)
build_number=$(defaults read $var_path/Payload/VZ\ Messages.app/Info CFBundleVersion)
build_detail=$build_ver"("$build_number")"

echo $build_detail
menifestFilePath="'itms-services://?action=download-manifest&url=https://prabhatliri.github.io/manifest.plist'"
file="index.html"
echo '<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Rebrand Build' $build_detail '</title>
  </head> 
  <body>
<div class="col-xs-1" align="center">
    <div class="col-sm">
       <div class="card" style="width: 24rem;" >
        <br>
        <img src="msgplus.png" width="72" height="72" alt="" >
        <br>
        <div class="col-xs-1" align="center">
        <button type="button" class="btn btn-success" onclick="window.location.href = '$menifestFilePath';">Download' $build_detail'</button>
      </div>
    <div class="card-body" align="left">
      <h5 class="card-title">Rebrand Build </h5>
      <h6 class="card-subtitle mb-2 text-muted">Version' $build_detail '</h6>
      <p class="card-text"> Release notes on rebrand build :</p>
      <br>
    </div>
  </div>
    </div>
</div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>' > $file

rm VZ\ Messages.zip
rm -r $var_path/Payload