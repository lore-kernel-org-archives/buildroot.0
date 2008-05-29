From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 29 May 2008 08:55:31 -0700
Subject: [Buildroot] [buildroot 0003494]: Package lighttpd has a dependency
	on zlib by default
Message-ID: <236b0a5dbb474f3559e5368dc86db196@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3494 
====================================================================== 
Reported By:                gustavoz
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3494
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-29-2008 08:55 PDT
Last Modified:              05-29-2008 08:55 PDT
====================================================================== 
Summary:                    Package lighttpd has a dependency on zlib by default
Description: 
The lighttpd package uses zlib for mod_compress by default and is currently
not disabled or an option with buildroot.
It also lacks the zlib dep so unless zlib is selected/built on buildroot
lighttpd won't build.
This patch will introduce a new BR2_PACKAGE_LIGHTTPD_ZLIB option to make
this conditional since forcing zlib is not really necessary.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-29-08 08:55  gustavoz       New Issue                                    
05-29-08 08:55  gustavoz       Status                   new => assigned     
05-29-08 08:55  gustavoz       Assigned To               => buildroot       
05-29-08 08:55  gustavoz       File Added: buildroot-lighttpd-zlib.patch        
           
======================================================================
