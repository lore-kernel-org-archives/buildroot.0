From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 4 Jul 2008 01:59:14 -0700
Subject: [Buildroot] [buildroot 0003924]: Buildroot assumes that host
	glib-genmarschal is located in /usr/bin/
Message-ID: <53b2b60630fbbcc60a7c7771aa013c97@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3924 
====================================================================== 
Reported By:                UlfSamuelsson
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3924
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-04-2008 01:59 PDT
Last Modified:              07-04-2008 01:59 PDT
====================================================================== 
Summary:                    Buildroot assumes that host glib-genmarschal is
located in /usr/bin/
Description: 
The build of libglib2-2.15.4 assumes that /usr/bin/glib-genmarschal
exists.
On OpenSUSE 10.2 (at least) it it located in
/opt/gnome/bin/glib-genmarschal.

A simple fox for this problem is to do:
sudo ln -s /opt/gnome/bin/glib-genmarshal /usr/bin/glib-genmarshal

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-04-08 01:59  UlfSamuelsson  New Issue                                    
07-04-08 01:59  UlfSamuelsson  Status                   new => assigned     
07-04-08 01:59  UlfSamuelsson  Assigned To               => buildroot       
======================================================================
