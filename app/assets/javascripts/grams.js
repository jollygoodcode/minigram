$(document).on('ready page:load', function() {
  $('.js-gram-image-upload').on('click', function(e) {
    e.preventDefault();

    scope = this;

    cloudinary.openUploadWidget(
      {
        cloud_name: 'jollygoodcode',
        upload_preset: 'gpzt3lxz',
        cropping: 'server',
        cropping_aspect_ratio: 1,
        cropping_show_dimensions: true,
        form: '#new_gram',
        field_name: 'gram[image]'
      },
      function(error, result) {
        console.log(error, result);
        $(scope).after('<div class="gram-preview"><img src="' + result[0].url + '"></div>');
      }
    );
  });
});
