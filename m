From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 16 Aug 2008 05:02:54 -0700
Subject: [Buildroot] [buildroot 0004474]: $(PKG)_CONF_OPT not used,
	bug in Makefile.autotools.in
Message-ID: <92982b7b2c3f24253cf0890d98e98f31@www.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=4474 
====================================================================== 
Reported By:                nadi
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4474
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-05-2008 04:58 PDT
Last Modified:              08-16-2008 05:02 PDT
====================================================================== 
Summary:                    $(PKG)_CONF_OPT not used, bug in
Makefile.autotools.in
Description: 
Makefile.autotools.in is missing a backslash which leads to $(PKG)_CONF_OPT
not beeing passed to configure. Patch against r23046 attached.
====================================================================== 

---------------------------------------------------------------------- 
 nadi - 08-05-08 05:01  
---------------------------------------------------------------------- 
This is a duplicate to bug http://busybox.net/bugs/view.php?id=0004454, sorry. 

---------------------------------------------------------------------- 
 jacmet - 08-16-08 05:02  
---------------------------------------------------------------------- 
Sorry about that, fixed in r23089 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-05-08 04:58  nadi           New Issue                                    
08-05-08 04:58  nadi           Status                   new => assigned     
08-05-08 04:58  nadi           Assigned To               => buildroot       
08-05-08 04:58  nadi           File Added: Makefile.autotools.in.patch          
         
08-05-08 05:01  nadi           Note Added: 0010264                          
08-16-08 05:02  jacmet         Status                   assigned => closed  
08-16-08 05:02  jacmet         Note Added: 0010494                          
======================================================================
