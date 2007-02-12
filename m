From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:54 -0800
Subject: [Buildroot] [buildroot 0000294]: subversion (svn) configuration
	menu entry not working
Message-ID: <85827a56e92bb5d504f7979371db6ecc@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=294 
====================================================================== 
Reported By:                scott
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   294
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-06-2005 11:32 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    subversion (svn) configuration menu entry not
working
Description: 
There is a mistake in buildroot/Config.in:

config BR2_SVN
        string
        default "Subversion (svn) checkout command"

Should be corrected to be:

config BR2_SVN
        string "Subversion (svn) checkout command"
        default "svn co"


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-06-05 11:32  scott          New Issue                                    
06-09-05 02:50  andersen       Status                   assigned => closed  
06-09-05 02:50  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
