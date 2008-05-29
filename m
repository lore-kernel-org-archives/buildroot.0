From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 29 May 2008 09:02:45 -0700
Subject: [Buildroot] [buildroot 0003504]: Package php may inadvertently link
	to host iconv
Message-ID: <9aee257a96871ecaf595258a42129d07@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3504 
====================================================================== 
Reported By:                gustavoz
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3504
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-29-2008 09:02 PDT
Last Modified:              05-29-2008 09:02 PDT
====================================================================== 
Summary:                    Package php may inadvertently link to host iconv
Description: 
When building php with some libxml2 options enabled it may inadvertently
link to the host iconv if you lack a target iconv.
The best solution is to explicitly disable iconv support in libxml2.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-29-08 09:02  gustavoz       New Issue                                    
05-29-08 09:02  gustavoz       Status                   new => assigned     
05-29-08 09:02  gustavoz       Assigned To               => buildroot       
05-29-08 09:02  gustavoz       File Added: buildroot-libxml2-iconv.patch        
           
======================================================================
