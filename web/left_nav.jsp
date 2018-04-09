  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <a class="navbar-brand" href="searchText.jsp">Data Analysis</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
            <a class="nav-link" href="searchText.jsp">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dash Board</span>
          </a>
        </li>
        <%
        if(session.getAttribute("userid")!=null){
        %>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
            <a class="nav-link" href="insertData.jsp">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Insert Data</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
            <a class="nav-link" href="uploadData.jsp">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Upload Data</span>
          </a>
        </li>
       
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
            <a class="nav-link" href="showData.jsp">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Show Data</span>
          </a>
        </li>
         <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
            <a class="nav-link" href="analyzeData.jsp">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Anaylyze Data</span>
          </a>
        </li>
         <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
             <a class="nav-link" href="predectionPanel.jsp">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Predict JOB Type</span>
          </a>
        </li>
         <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
             <a class="nav-link" href="predectionPanelFuture.jsp">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Predict Future Study</span>
          </a>
        </li>
         <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
             <a class="nav-link" href="predectionPanelPackage.jsp">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Predict Package</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
            <a class="nav-link" href="logout.jsp">
            <i class="fa fa-fw fa-sign-out"></i>
            <span class="nav-link-text">Logout</span>
          </a>
        </li>
        
        <%
        }
        %>
        
<!--        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
            <a class="nav-link" href="login.jsp">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Login</span>
          </a>
        </li>-->
       
          
<!--        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Combined Result">
            <a class="nav-link" href="unhide.jsp">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Unhide Data</span>
          </a>
        </li>-->
        
       
        
        
      
      </ul>
     
      
      </ul>
    </div>
  </nav>