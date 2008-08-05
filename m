From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 5 Aug 2008 04:58:18 -0700
Subject: [Buildroot] [buildroot 0004474]: $(PKG)_CONF_OPT not used,
	bug in Makefile.autotools.in
Message-ID: <b3bd4c242dd7044cbad2a160bd05b5aa@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Last Modified:              08-05-2008 04:58 PDT
====================================================================== 
Summary:                    $(PKG)_CONF_OPT not used, bug in
Makefile.autotools.in
Description: 
Makefile.autotools.in is missing a backslash which leads to $(PKG)_CONF_OPT
not beeing passed to configure. Patch against r23046 attached.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-05-08 04:58  nadi           New Issue                                    
08-05-08 04:58  nadi           Status                   new => assigned     
08-05-08 04:58  nadi           Assigned To               => buildroot       
08-05-08 04:58  nadi           File Added: Makefile.autotools.in.patch          
         
======================================================================
