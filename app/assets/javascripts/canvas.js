var lc;
var drawing;
var shape_ids = [];
var snapshot;

function add_new_shape(){
  var shape_text = $("#new_shape").val();
  var shape_json = JSON.parse(shape_text);
  var shape = LC.createShape(shape_json.className, shape_json.data);
  shape_ids.push(shape.id);
  lc.saveShape(shape);
}

function drawing_change_handler(){
  var shape_json;
  snapshot = lc.getSnapshot();

  $("#delta_id").html("");

  snapshot.shapes.map(function(shape) {
    if (shape_ids.indexOf(shape.id) == -1){
      shape_ids.push(shape.id);
      $("#delta_id").append("<p>" + shape.id + "</p>");

      shape_json = JSON.stringify(shape);

      $("#delta_json").html(shape_json);
      $("#new_shape").val(shape_json);
    }
  });
}

$( document ).ready(function() {
  lc = LC.init(document.getElementsByClassName('literally')[0],
               {imageURLPrefix: '/assets/static/img'}
       );
  lc.on('drawingChange', function() {
    drawing_change_handler();
  });

  $("#add_shape").on('click', function(){
    add_new_shape();
  });
});

/* or if you just love jQuery,
    $('.literally').literallycanvas({imageURLPrefix: '/static/img'})
*/