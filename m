From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 3 Mar 2008 22:28:58 -0800
Subject: [Buildroot] [buildroot 0002424]: trying to execute cross-compiled
	glib-genmarshal on host fails gtk+2.10.9 build failure
Message-ID: <8ef635188aef8f16d6b943e4b022d896@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2424 
====================================================================== 
Reported By:                ajs
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2424
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-03-2008 22:28 PST
Last Modified:              03-03-2008 22:28 PST
====================================================================== 
Summary:                    trying to execute cross-compiled glib-genmarshal on
host fails gtk+2.10.9 build failure
Description: 
The build-system of GTK+ tries to execute a cross-compiled glib-genmarshal
on the host (build machine). This fails the build.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-03-08 22:28  ajs            New Issue                                    
03-03-08 22:28  ajs            Status                   new => assigned     
03-03-08 22:28  ajs            Assigned To               => buildroot       
======================================================================
