From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 6 Oct 2008 16:16:28 -0700
Subject: [Buildroot] [buildroot 0005294]: setserial needs version bump
Message-ID: <e1f494999140d3601c89e8f99916ee39@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5294 
====================================================================== 
Reported By:                mjd
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5294
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-06-2008 16:16 PDT
Last Modified:              10-06-2008 16:16 PDT
====================================================================== 
Summary:                    setserial needs version bump
Description: 
The setserial makefile tries to retrieve setserial-2.17-44.tar.gz, but that
file doesn't exist in the debian mirror system.

Looking at debian, I can see setserial_2.17.orig.tar.gz and
setserial_2.17-45.diff.gz.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-06-08 16:16  mjd            New Issue                                    
10-06-08 16:16  mjd            Status                   new => assigned     
10-06-08 16:16  mjd            Assigned To               => buildroot       
======================================================================
