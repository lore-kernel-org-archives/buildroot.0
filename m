From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 16 Aug 2008 05:02:31 -0700
Subject: [Buildroot] [buildroot 0004454]: makefile.autotools.in breaks
	_CONF_OPT
Message-ID: <e87e380b8941ba3e6369bb39802f33e0@www.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-04-2008 16:07 PDT
Last Modified:              08-16-2008 05:02 PDT
====================================================================== 
Summary:                    makefile.autotools.in breaks _CONF_OPT
Description: 
The $($(PKG)_CONF_OPT) line is left off ./configure in
makefile.autotools.in due to forgotten newline.

====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 08-16-08 05:02  
---------------------------------------------------------------------- 
Sorry about that, fixed in r23089 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-04-08 16:07  mdombroski     New Issue                                    
08-04-08 16:07  mdombroski     Status                   new => assigned     
08-04-08 16:07  mdombroski     Assigned To               => buildroot       
08-16-08 05:02  jacmet         Status                   assigned => closed  
08-16-08 05:02  jacmet         Note Added: 0010484                          
======================================================================
