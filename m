From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 8 May 2007 08:18:19 -0700
Subject: [Buildroot] [buildroot 0001339]: package/cvs/cvs.mk does not
	compile any longer
Message-ID: <b75085868a1ac0b73f2cd68f9fdcc522@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1339 
====================================================================== 
Reported By:                sveinerikskjelbred
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1339
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             05-08-2007 07:25 PDT
Last Modified:              05-08-2007 08:18 PDT
====================================================================== 
Summary:                    package/cvs/cvs.mk does not compile any longer
Description: 

http://ftp.debian.org/debian/pool/main/c/cvs/cvs_1.12.13-7.diff.gz
is no longer present at the web site. Change to version -8

Index: package/cvs/cvs.mk
===================================================================
--- package/cvs/cvs.mk  (revision 18581)
+++ package/cvs/cvs.mk  (working copy)
@@ -5,7 +5,7 @@
 #############################################################
 CVS_VER:=1.12.13
 CVS_SOURCE:=cvs_$(CVS_VER).orig.tar.gz
-CVS_PATCH:=cvs_$(CVS_VER)-7.diff.gz
+CVS_PATCH:=cvs_$(CVS_VER)-8.diff.gz
 CVS_SITE:=http://ftp.debian.org/debian/pool/main/c/cvs/
 CVS_DIR:=$(BUILD_DIR)/cvs-$(CVS_VER)
 CVS_CAT:=$(ZCAT)

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 05-08-07 08:18  
---------------------------------------------------------------------- 
Fixed in r18582. Thanks for the notice. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-08-07 07:25  sveinerikskjelbredNew Issue                                    
05-08-07 07:25  sveinerikskjelbredStatus                   new => assigned     
05-08-07 07:25  sveinerikskjelbredAssigned To               => buildroot       
05-08-07 08:18  bernhardf      Status                   assigned => closed  
05-08-07 08:18  bernhardf      Note Added: 0002344                          
======================================================================
