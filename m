From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 5 Aug 2008 05:01:31 -0700
Subject: [Buildroot] [buildroot 0004474]: $(PKG)_CONF_OPT not used,
	bug in Makefile.autotools.in
Message-ID: <87957a6975a02a9bc64bfb99496fa82d@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             08-05-2008 04:58 PDT
Last Modified:              08-05-2008 05:01 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-05-08 04:58  nadi           New Issue                                    
08-05-08 04:58  nadi           Status                   new => assigned     
08-05-08 04:58  nadi           Assigned To               => buildroot       
08-05-08 04:58  nadi           File Added: Makefile.autotools.in.patch          
         
08-05-08 05:01  nadi           Note Added: 0010264                          
======================================================================
