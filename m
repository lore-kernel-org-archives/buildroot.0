From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 4 Apr 2008 00:34:45 -0700
Subject: [Buildroot] [buildroot 0002804]: grub_0.97-31.diff gz no longer
	available from Debian
Message-ID: <21a11a0851cd08dcf1549d6b1b3acc30@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2804 
====================================================================== 
Reported By:                rah
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2804
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             04-03-2008 15:18 PDT
Last Modified:              04-04-2008 00:34 PDT
====================================================================== 
Summary:                    grub_0.97-31.diff gz no longer available from Debian
Description: 
wget --passive-ftp  -P /home/Aleks/dimmpc/buildroot/dl
"http://ftp.debian.org"/debian/pool/main/g/grub/grub_0.97-31.diff.gz
--23:55:20-- 
http://ftp.debian.org/debian/pool/main/g/grub/grub_0.97-31.diff.gz
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 04-04-08 00:34  
---------------------------------------------------------------------- 
This is already fixed in trunk (r21623). Please do a svn update or download
a new snapshot. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-03-08 15:18  rah            New Issue                                    
04-03-08 15:18  rah            Status                   new => assigned     
04-03-08 15:18  rah            Assigned To               => buildroot       
04-04-08 00:34  jacmet         Status                   assigned => closed  
04-04-08 00:34  jacmet         Note Added: 0006394                          
======================================================================
