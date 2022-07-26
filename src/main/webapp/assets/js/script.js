$(".prev").click(function(e){
    e.preventDefault();
    $(".step-container").removeClass("two")
    $(".bar-content").css("width", "0%");
    $(".temp").removeClass("d-none");
    $(".prev").addClass("d-none");
    $(".next").html("Suivant");
    
    $(".next").attr("disabled", false);
});
$(".next").click(function(e){
    if(!$(".step-container").hasClass("two")){
        e.preventDefault();
        $(".step-container").addClass("two");
        $(".bar-content").css("width", "100%");
        $(".temp").addClass("d-none");
        $(".prev").removeClass("d-none");
        $(this).html("Valider");
        
        $(this).attr("disabled", "disabled");
    }
});
function stepChecker(step, current){
    var correct = [];
    var inputs = step.find('.form-control');
    $(current).removeClass('is-invalid');

    $.each(inputs, function(index, input) {
        if($(input).val() == "" || $(input).val() == "-1")
            correct.push(false);
        else
            correct.push(true);
    });
    console.log(correct);

    if(correct.indexOf(false) === -1){
        $(".next").attr("disabled", false)
    }else{
        $(".next").attr("disabled", "disabled");
    }
    return correct;
}
stepChecker($(".step.step-one"), document.querySelector('.step .form-control'))
$(".step .form-control").keyup(function(e){
    var step = $(this).parents('.step');
    stepChecker(step, this);
});
let state = false;
let password = $("input[type=password]");
let passwordStrength = $(".password-strength");
password.keyup(function(e){
    var pass = this.value;
    console.log(pass);
    checkStrength(pass);
});

function checkStrength(password) {
    let strength = 0;
    
    //If password is empty
    if (password.length == 0)
        strength = 0;
    //If password contains lowercase characters
    if (password.match(/([a-z])/))
        strength += 1;
    //If password contains uppercase characters
    if (password.match(/([A-Z])/))
        strength += 1;
    //If it has numbers and characters
    if (password.match(/([0-9])/))
        strength += 1;
    //If it has one special character
    if (password.match(/([!,%,&,@,#,$,^,*,?,_,~,-])/))
        strength += 1;

    //If password is greater than 7
    if (password.length > 7)
        strength += 1;
    // If value is less than 2
    if (strength == 0)
        manageClass('progress-bar-success progress-bar-warning progress-bar-danger', '' , '0');
    if (strength == 1)
        manageClass('progress-bar-success progress-bar-warning', 'progress-bar-danger', '10');
    if (strength == 2)
        manageClass('progress-bar-success progress-bar-warning', 'progress-bar-danger', '20');
    if (strength == 3)
        manageClass('progress-bar-success progress-bar-danger', 'progress-bar-warning', '50');
    if (strength == 4)
        manageClass('progress-bar-success progress-bar-danger', 'progress-bar-warning', '70');
    if (strength > 4)
        manageClass('progress-bar-warning progress-bar-danger', 'progress-bar-success', '100');
    
}   
function manageClass(remove, add, width) {
    passwordStrength.removeClass(remove);
    passwordStrength.addClass(add);
    passwordStrength.css('width', width+'%');
}
$("#registration").submit(function(e){
    if($("#password").val() != $("#password1").val()){
        $("input[type=password]").addClass("is-invalid");
        e.preventDefault();
    }
});
$("input[type=password]").focusin(function(e){
    console.log("dddd");
    $(this).removeClass("is-invalid");
})