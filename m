From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 4 Aug 2008 16:07:52 -0700
Subject: [Buildroot] [buildroot 0004454]: makefile.autotools.in breaks
	_CONF_OPT
Message-ID: <1662f353447bd46e16574c3c25d31796@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4454 
====================================================================== 
Reported By:                mdombroski
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4454
Category:                   New Features
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-04-2008 16:07 PDT
Last Modified:              08-04-2008 16:07 PDT
====================================================================== 
Summary:                    makefile.autotools.in breaks _CONF_OPT
Description: 
The $($(PKG)_CONF_OPT) line is left off ./configure in
makefile.autotools.in due to forgotten newline.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-04-08 16:07  mdombroski     New Issue                                    
08-04-08 16:07  mdombroski     Status                   new => assigned     
08-04-08 16:07  mdombroski     Assigned To               => buildroot       
======================================================================
