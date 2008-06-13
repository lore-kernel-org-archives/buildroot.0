From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 13 Jun 2008 02:23:30 -0700
Subject: [Buildroot] [buildroot 0003714]: oprofile doesn't build because bfd
	library not found
Message-ID: <e32434f213b9d559650670039d4c28fd@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3714 
====================================================================== 
Reported By:                fabo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3714
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-13-2008 02:23 PDT
Last Modified:              06-13-2008 02:23 PDT
====================================================================== 
Summary:                    oprofile doesn't build because bfd library not found
Description: 
checking for bfd_openr in -lbfd... no
configure: error: bfd library not found

binutils is needed to build oprofile.
I used gcc4.2.1 toolchain.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-13-08 02:23  fabo           New Issue                                    
06-13-08 02:23  fabo           Status                   new => assigned     
06-13-08 02:23  fabo           Assigned To               => buildroot       
======================================================================
