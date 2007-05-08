From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 8 May 2007 08:19:43 -0700
Subject: [Buildroot] [buildroot 0001340]: package/dash/dash.mk
Message-ID: <4e4609014b8d1e7f6e42a944da2a4ae0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1340 
====================================================================== 
Reported By:                sveinerikskjelbred
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1340
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             05-08-2007 07:31 PDT
Last Modified:              05-08-2007 08:19 PDT
====================================================================== 
Summary:                    package/dash/dash.mk
Description: 
The old version is no longer present at the site.

Index: package/dash/dash.mk
===================================================================
--- package/dash/dash.mk        (revision 18581)
+++ package/dash/dash.mk        (working copy)
@@ -8,7 +8,7 @@
 DASH_SITE:=http://ftp.debian.org/debian/pool/main/d/dash
 DASH_CAT:=$(ZCAT)
 DASH_DIR:=$(BUILD_DIR)/dash-$(DASH_VER)
-DASH_PATCH1:=dash_$(DASH_VER)-6.diff.gz
+DASH_PATCH1:=dash_$(DASH_VER)-7.diff.gz
 DASH_BINARY:=src/dash
 DASH_TARGET_BINARY:=bin/dash


====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 05-08-07 08:19  
---------------------------------------------------------------------- 
Applied as r18583. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-08-07 07:31  sveinerikskjelbredNew Issue                                    
05-08-07 07:31  sveinerikskjelbredStatus                   new => assigned     
05-08-07 07:31  sveinerikskjelbredAssigned To               => buildroot       
05-08-07 08:19  bernhardf      Status                   assigned => closed  
05-08-07 08:19  bernhardf      Note Added: 0002345                          
======================================================================
