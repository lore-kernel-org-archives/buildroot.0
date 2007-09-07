From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 7 Sep 2007 12:11:42 -0700
Subject: [Buildroot] [buildroot 0001463]: build for i386/Geode fails
Message-ID: <9f9d515c1c6795af8eedda4ea816af30@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1463 
====================================================================== 
Reported By:                Bob Keyes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1463
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-13-2007 11:04 PDT
Last Modified:              09-07-2007 12:11 PDT
====================================================================== 
Summary:                    build for i386/Geode fails
Description: 
Buildroot tries to build Linx kernel, but the architecture isn't set, so it
can't find the Makefile.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-07-07 12:02  
---------------------------------------------------------------------- 
Please attach your br2.config and kernel.config for me to reproduce. 

---------------------------------------------------------------------- 
 bradmssw - 09-07-07 12:11  
---------------------------------------------------------------------- 
This has been discussed in the past and is not limited to geode by any
means:

http://www.nabble.com/Problems-with-some-x86-Target-Architecture-Variants-p12385010.html
http://www.nabble.com/GCC---march%3Dgeode-doesn't-exist--t4108131.html 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-13-07 11:04  Bob Keyes      New Issue                                    
08-13-07 11:04  Bob Keyes      Status                   new => assigned     
08-13-07 11:04  Bob Keyes      Assigned To               => buildroot       
09-07-07 12:02  bernhardf      Note Added: 0002733                          
09-07-07 12:11  bradmssw       Note Added: 0002734                          
======================================================================
