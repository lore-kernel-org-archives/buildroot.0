From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 11 Sep 2008 06:45:15 -0700
Subject: [Buildroot] [buildroot 0004934]: mk.jjfs2  no parent directory
Message-ID: <dcdcaf030f873303c243ef4df27ee1e5@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4934 
====================================================================== 
Reported By:                iceman_im
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4934
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-11-2008 06:45 PDT
Last Modified:              09-11-2008 06:45 PDT
====================================================================== 
Summary:                    mk.jjfs2  no parent directory
Description: 
Error while building jffs2 rootfs.

rootdir=/home/assensg/Desktop/buildroot/project_build_arm_wchar/at91sam9260pf/root
table='target/device/Atmel/root/device_table.txt'
mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
mkfs.jffs2: skipping device_table entry '/etc': no parent directory!

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-11-08 06:45  iceman_im      New Issue                                    
09-11-08 06:45  iceman_im      Status                   new => assigned     
09-11-08 06:45  iceman_im      Assigned To               => buildroot       
======================================================================
