From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 30 Apr 2008 06:26:55 -0700
Subject: [Buildroot] [buildroot 0003214]: buildroot tries to download
	grub_0.97-35.diff.gz from Debian FTP, but it doesn't exist
Message-ID: <598213d53b808ab50668a7e09cd0e81c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3214 
====================================================================== 
Reported By:                Uzi
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3214
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-30-2008 06:26 PDT
Last Modified:              04-30-2008 06:26 PDT
====================================================================== 
Summary:                    buildroot tries to download grub_0.97-35.diff.gz
from Debian FTP, but it doesn't exist
Description: 
During make process, buildroot tried to download from
http://ftp.debian.org/debian/pool/main/g/grub/grub_0.97-35.diff.gz, but
this URL is invalid, so the make process stopped.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-30-08 06:26  Uzi            New Issue                                    
04-30-08 06:26  Uzi            Status                   new => assigned     
04-30-08 06:26  Uzi            Assigned To               => buildroot       
======================================================================
