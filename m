From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 19 Oct 2007 12:55:26 -0700
Subject: [Buildroot] [buildroot 0001541]: NCFTP don't download
Message-ID: <9f7fd4706c1d4b94e30e823564c6adc6@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1541 
====================================================================== 
Reported By:                sushisan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1541
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-18-2007 16:37 PDT
Last Modified:              10-19-2007 12:55 PDT
====================================================================== 
Summary:                    NCFTP don't download
Description: 
ncftp-3.2.0-src.tar.bz2 are not any more in the repo

====================================================================== 

---------------------------------------------------------------------- 
 sushisan - 10-18-07 19:40  
---------------------------------------------------------------------- 
This patch upgrade to ncftp-3.2.1. sorry 

---------------------------------------------------------------------- 
 vanokuten - 10-19-07 12:55  
---------------------------------------------------------------------- 
following error when BR2_PACKAGE_NCFTP_UTILS=y selected:

make[1]: Leaving directory `/opt/buildroot/build_arm/ncftp-3.2.1'
/usr/bin/install -m 0755 /opt/buildroot/build_arm/ncftp-3.2.1/bin/ncftp
/opt/buildroot/project_build_arm/uclibc/root/usr/bin
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-all
/opt/buildroot/project_build_arm/uclibc/root/usr/bin/ncftp
/usr/bin/install -m 0755
/opt/buildroot/build_arm/ncftp-3.2.1/bin/ncftpbatch
/opt/buildroot/project_build_arm/uclibc/root/usr/bin
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-all
/opt/buildroot/project_build_arm/uclibc/root/usr/bin/ncftpbatch
/usr/bin/install -m 0755
/opt/buildroot/build_arm/ncftp-3.2.1/bin/ncftpbookmarks
/opt/buildroot/project_build_arm/uclibc/root/usr/bin
/usr/bin/install: cannot stat
`/opt/buildroot/build_arm/ncftp-3.2.1/bin/ncftpbookmarks': No such file or
directory
make: ***
[/opt/buildroot/project_build_arm/uclibc/root/usr/bin/ncftpbookmarks]
Error 1 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-18-07 16:37  sushisan       New Issue                                    
10-18-07 16:37  sushisan       Status                   new => assigned     
10-18-07 16:37  sushisan       Assigned To               => buildroot       
10-18-07 16:37  sushisan       File Added: br2-ncftp.patch                    
10-18-07 19:40  sushisan       Note Added: 0002833                          
10-19-07 12:55  vanokuten      Note Added: 0002840                          
======================================================================
