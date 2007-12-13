From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 13 Dec 2007 04:34:21 -0800
Subject: [Buildroot] [buildroot 0001552]: lvm2 version no longer available
	for download
Message-ID: <0be6e81996385c5cd73dd7ec37a00b7a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1552 
====================================================================== 
Reported By:                Leon Bailly
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1552
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-23-2007 16:45 PDT
Last Modified:              12-13-2007 04:34 PST
====================================================================== 
Summary:                    lvm2 version no longer available for download
Description: 
Version 2.02.28 no longer available for download.
upgrading to 2.02.28 seems to work:

*** lvm2.mk.org 2007-10-23 03:08:44.000000000 +0200
--- lvm2.mk     2007-10-23 03:08:51.000000000 +0200
***************
*** 24,30 ****
  # USA

  LVM2_BASEVER=2.02
! LVM2_PATCH=26
  LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
  LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
  LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2
--- 24,30 ----
  # USA

  LVM2_BASEVER=2.02
! LVM2_PATCH=28
  LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
  LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
  LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2

====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 12-13-07 04:34  
---------------------------------------------------------------------- 
fixed 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-23-07 16:45  Leon Bailly    New Issue                                    
10-23-07 16:45  Leon Bailly    Status                   new => assigned     
10-23-07 16:45  Leon Bailly    Assigned To               => buildroot       
12-13-07 04:34  vanokuten      Status                   assigned => closed  
12-13-07 04:34  vanokuten      Note Added: 0003164                          
======================================================================
