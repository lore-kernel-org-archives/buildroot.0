From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 15 Jan 2008 15:37:32 -0800
Subject: [Buildroot] [buildroot 0001929]: at91bootstrap-2.4.tar.bz2 cannot
	be downloaded
Message-ID: <5bfdc0e49acba34c935630233e068afb@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1929 
====================================================================== 
Reported By:                tigmac
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1929
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-15-2008 06:41 PST
Last Modified:              01-15-2008 15:37 PST
====================================================================== 
Summary:                    at91bootstrap-2.4.tar.bz2 cannot be downloaded
Description: 
I have checked that no such file named at91bootstrap-2.4.tar.bz2 which
buildroot is trying to download exists on the site.
It might be a good idea to keep such file copied also on buildroot's site
a download them from there.
====================================================================== 

---------------------------------------------------------------------- 
 Ulf Samuelsson - 01-15-08 15:37  
---------------------------------------------------------------------- 
ATMEL_MIRROR has changed.
Fix your .config or do a manual download from 
ftp://ftp:linux4sam.org/pub/buildroot/at91bootstrap-2.4.tar.bz2
to your source directory $(DL_DIR) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-15-08 06:41  tigmac         New Issue                                    
01-15-08 06:41  tigmac         Status                   new => assigned     
01-15-08 06:41  tigmac         Assigned To               => buildroot       
01-15-08 15:37  Ulf Samuelsson Note Added: 0003454                          
======================================================================
