From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 6 Dec 2007 00:42:08 -0800
Subject: [Buildroot] [buildroot 0001634]: Add support for GNU and kernel.org
	mirrors
Message-ID: <960a98a3f91883f888180e4403a413ae@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1634 
====================================================================== 
Reported By:                redhatter
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1634
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-06-2007 00:42 PST
Last Modified:              12-06-2007 00:42 PST
====================================================================== 
Summary:                    Add support for GNU and kernel.org mirrors
Description: 
Like SourceForge, the GNU.org and kernel.org sites both have their own
system of mirrors across the globe.  The following patch allows the user
to specify their own local mirror in place of the main site.

This is especially useful in universities, where there may be a local
mirror that is unmetered.  (Here in Australia for instance, most
universities allow unmetered downloads from the AARNet mirror.  Very handy
when you're only given a 150MB rolling monthly quota.)

The following is a patch against busybox SVN r20626.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-06-07 00:42  redhatter      New Issue                                    
12-06-07 00:42  redhatter      Status                   new => assigned     
12-06-07 00:42  redhatter      Assigned To               => buildroot       
12-06-07 00:42  redhatter      File Added: buildroot-add-gnu-kernel-mirror.diff 
                  
======================================================================
