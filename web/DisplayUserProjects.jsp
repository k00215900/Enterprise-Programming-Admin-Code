<%-- 
    Document   : DisplayUserProjects
    Created on : 26-Jan-2020, 18:26:48
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
        <title>My Projects</title>
    </head>
    <body>
        <jsp:include page="navigation.jsp" flush="true" />
        <div class="container">
            <div class="projects">
                <p>${myProjects.size()}</p>
                <c:forEach var="project" items="${myProjects}">
                    <a href="${pageContext.request.contextPath}/ProjectController?menu=Drilldown&project_id=${project.project_id}" class="thumbnail_link">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/assets/img/projectImages/${project.project_image}" alt="project image">
                            <h2 class="project_name">${project.project_name}</h2>
                            <p class="project_description">${project.project_description}</p>
                            <h3>&euro;${project.project_price}</h3>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
        <script>
            src="https://code.jquery.com/jquery-1.12.4.js"
            integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
        crossorigin="anonymous"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/form-validation.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
          $(document).ready(function(){
              
              // checks width of window
              function checkWidth(){
                  if($(window).width() < 768 ){
                    
                    $('nav div i').click(function(){
                        // adds active class when hamburger menu pressed. Shows nav
                    $('ul').toggleClass('active');
                        // sets width of links to same width as window
                    $('ul li').width($(window).width());
                        // hides submenu
                    $('ul ul').css("display", "none");
                        $('nav ul li').click(function(e) {
                            e.preventDefault();
                            // checks if submenu is visible, if yes on click slides it up
                            if($(this).siblings('li').find('ul:visible').length) {
                                $('ul').slideUp('normal');
                            }
                            
                            // on click submenu slides down
                            $(this).find('ul').slideToggle('normal');
                        });
                    
                    });
                  } else if($(window).width() > 768){
                      //changes width of links back to desktop size
                      $('ul li').width(140);
                      // hides submenu
                      $('ul ul').css("display", "none");
                      
                      $('nav li').hover(
                        function() {
                            $('ul li ul li').width(240);
                            $('ul',this).stop().slideDown(200);
                        },
                        function() {
                            $('ul',this).stop().slideUp(200);
                        }
                    );
                  }  
              }
              
              function setBackground(){
                  $('#login_container').css("background-image", 'url("${pageContext.request.contextPath}/assets/img/bubbles.png")');
              }
              
              checkWidth();
              setBackground();
              // calls function every time the window is resized
              $(window).resize(checkWidth);
          });
      </script>
    </body>
</html>
