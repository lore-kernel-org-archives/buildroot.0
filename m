From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 15 Oct 2007 14:27:31 -0700
Subject: [Buildroot] [buildroot 0001527]: enabling findutils in svn revision
	20239 results in fatal build errors
Message-ID: <9e1f3e822662516f814a94ec0e32363e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1527 
====================================================================== 
Reported By:                hwstar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1527
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-14-2007 12:13 PDT
Last Modified:              10-15-2007 14:27 PDT
====================================================================== 
Summary:                    enabling findutils in svn revision 20239 results in
fatal build errors
Description: 
Findutils aborts with an error during the make process. 

May be related to bug 1479 (Coreutils fails to build) as it fails for one
of the same reasons:

./wchar.h:41:12: error: empty filename in #include

Host: Ubuntu 7.04, kernel 2.6.20-16-generic, gcc version 4.1.2 (Ubuntu
4.1.2-0ubuntu4)

SVN revision 20239

====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-15-07 14:27  
---------------------------------------------------------------------- 
Did you enable WCHAR in your toolchain build?
Some packages do requirwe WCHAR... 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-14-07 12:13  hwstar         New Issue                                    
10-14-07 12:13  hwstar         Status                   new => assigned     
10-14-07 12:13  hwstar         Assigned To               => buildroot       
10-15-07 14:27  UlfSamuelsson  Note Added: 0002823                          
======================================================================
