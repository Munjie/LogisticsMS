var $j =jQuery.noConflict();

window.onscroll = function()
{
    if( window.XMLHttpRequest ) {
        if (document.documentElement.scrollTop > 0 || self.pageYOffset > 0) {
            jQuery('#primary_left').css('position','fixed');
            jQuery('#primary_left').css('top','0');
        } else if (document.documentElement.scrollTop < 0 || self.pageYOffset < 0) {
            jQuery('#primary_left').css('position','absolute');
            jQuery('#primary_left').css('top','175px');
        }
    }
}

function initMenu() {
    jQuery('#menu ul ul').hide();
	jQuery('#menu ul li').click(function() {
		jQuery(this).parent().find("ul").slideUp('fast');
		jQuery(this).parent().find("li").removeClass("current");
		jQuery(this).find("ul").slideToggle('fast');
		jQuery(this).toggleClass("current");
  });
}
function  addall() {
     var temp_ser = new Array();
  jQuery("table input[type='text']").each(function(){
        temp_ser.push(jQuery(this).val());
    });
   jQuery('#hira').val(temp_ser);
    var temp = jQuery('#rawform').serialize();
   jQuery.post("addRawtobacco.do",temp,function (data) {
        var  t = eval('('+data+')');
        alert(t.msg);
    });

}

 
jQuery(document).ready(function() {


	initMenu(); // Initialize the menu!
	
	jQuery(".tablesorter").tablesorter(); // Tablesorter plugin
	
	jQuery('#CRCdialog').dialog({
		autoOpen: false,
		width: 650,
		modal:true,
		buttons: {
			"Done": function() {
				var number = jQuery( "#number" ),
			weight = jQuery( "#weight" );
				jQuery( "#users tbody" ).append( "<tr>" +
					"<td><input type='text' style='border: none' value="+number.val()+" name='sequence'></td>" +
							"<td><input type='text' style='border: none' value="+weight.val()+" name='checkweight'><td><a href='#' title='Edit this user' class='tooltip table_icon'><img src='../../assets/icons/actions_small/Pencil.png' alt='' width='16' height='16' /></a><a href='#' title='Preferences' class='tooltip table_icon'><img src='../../assets/icons/actions_small/Preferences.png' alt='' /></a><a href='#' title='Delete this user' class='tooltip table_icon'><img src='../../assets/icons/actions_small/Trash.png' alt='' /></a></td>"+"</tr>" );
		jQuery(".tooltip").easyTooltip({
		xOffset: -60,
		yOffset: 70
		});
				
				number.val("");
				 weight.val("");
				jQuery(this).dialog("close"); 
			}, 
			"Cancel": function() { 
				jQuery(this).dialog("close"); 
			} 
		}
	});
	
	jQuery('.CRCdialog_link').click(function(){
		jQuery('#CRCdialog').dialog('open');
		return false;
	});

	jQuery('#dialog').dialog({
		autoOpen: false,
		width: 650,
		modal:true,
		buttons: {
			"Done": function() {
				jQuery( "#users tbody" ).append( "<tr>" +
					"<td>" + name.val() + "</td>" + 
							"<td>" + email.val() + "</td>" + 
							"<td>" + password.val() + "</td>" +
						"</tr>" );  
				
				name.val("");
				email.val("");
				 password.val("");
				jQuery(this).dialog("close"); 
			}, 
			"Cancel": function() { 
				jQuery(this).dialog("close"); 
			} 
		}
	}); // Default dialog. Each should have it's own instance.
			
	jQuery('.dialog_link').click(function(){
		jQuery('#dialog').dialog('open');
		return false;
	}); // Toggle dialog
	
	jQuery('.notification').hover(function() {
 		jQuery(this).css('cursor','pointer');
 	}, function() {
		jQuery(this).css('cursor','auto');
	}); // Close notifications
			
	jQuery('.checkall').click(
		function(){
			jQuery(this).parent().parent().parent().parent().find("input[type='checkbox']").attr('checked', jQuery(this).is(':checked'));   
		}
	); // Top checkbox in a table will select all other checkboxes in a specified column
			
	jQuery('.iphone').iphoneStyle(); //iPhone like checkboxes

	jQuery('.notification span').click(function() {
		jQuery(this).parents('.notification').fadeOut(800);
	}); // Close notifications on clicking the X button
			
	jQuery(".tooltip").easyTooltip({
		xOffset: -60,
		yOffset: 70
	}); // Tooltips! 
			
	jQuery('#menu li:not(".current"), #menu ul ul li a').hover(function() {
		jQuery(this).find('span').animate({ marginLeft: '5px' }, 100);
	}, function() {
		jQuery(this).find('span').animate({ marginLeft: '0px' }, 100);           
	}); // Menu simple animation
			
	jQuery('.fade_hover').hover(
		function() {
			jQuery(this).stop().animate({opacity:0.6},200);
		},
		function() {
			jQuery(this).stop().animate({opacity:1},200);
		}
	); // The fade function
			
	//sortable, portlets
	jQuery(".column").sortable({
		connectWith: '.column',
		placeholder: 'ui-sortable-placeholder',
		forcePlaceholderSize: true,
		scroll: false,
		helper: 'clone'
	});
				
	jQuery(".portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all").find(".portlet-header").addClass("ui-widget-header ui-corner-all").prepend('<span class="ui-icon ui-icon-circle-arrow-s"></span>').end().find(".portlet-content");

	jQuery(".portlet-header .ui-icon").click(function() {
		jQuery(this).toggleClass("ui-icon-minusthick");
		jQuery(this).parents(".portlet:first").find(".portlet-content").toggle();
	});

	jQuery(".column").disableSelection();
	
	jQuery("table.stats").each(function() {
		if(jQuery(this).attr('rel')) { var statsType = jQuery(this).attr('rel'); }
		else { var statsType = 'area'; }
		
		var chart_width = (jQuery(this).parent().parent(".ui-widget").width()) - 60;
		jQuery(this).hide().visualize({		
			type: statsType,	// 'bar', 'area', 'pie', 'line'
			width: '800px',
			height: '240px',
			colors: ['#6fb9e8', '#ec8526', '#9dc453', '#ddd74c']
		}); // used with the visualize plugin. Statistics.
	});
			
	jQuery(".tabs").tabs(); // Enable tabs on all '.tabs' classes
	
	jQuery( ".datepicker" ).datepicker();
	
	jQuery(".editor").cleditor({
		width: '800px'
	}); // The WYSIWYG editor for '.editor' classes
	
	// Slider
	jQuery(".slider").slider({
		range: true,
		values: [20, 70]
	});
				
	// Progressbar
	jQuery(".progressbar").progressbar({
		value: 40 
	});
});

