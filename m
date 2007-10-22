From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 22 Oct 2007 14:26:42 -0700
Subject: [Buildroot] [buildroot 0001549]:
	buildroot/build_i386/grep-2.5.1/src/dfa.c:147: undefined
	reference to `libintl_gettext'
Message-ID: <b2ebf24df181aab30eafe06be1298026@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1549 
====================================================================== 
Reported By:                Steve Cornett
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1549
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-22-2007 14:26 PDT
Last Modified:              10-22-2007 14:26 PDT
====================================================================== 
Summary:                    buildroot/build_i386/grep-2.5.1/src/dfa.c:147:
undefined reference to `libintl_gettext'
Description: 
Configure for i386.  Build ends with:

dfa.o: In function `xmalloc':
/home/test/buildroot/build_i386/grep-2.5.1/src/dfa.c:147: undefined
reference to `libintl_gettext'

Input and log attached.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-07 14:26  Steve Cornett  New Issue                                    
10-22-07 14:26  Steve Cornett  Status                   new => assigned     
10-22-07 14:26  Steve Cornett  Assigned To               => buildroot       
10-22-07 14:26  Steve Cornett  File Added: InputAndOutput.tar                   

======================================================================
