From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 29 May 2008 07:38:37 -0700
Subject: [Buildroot] [buildroot 0003484]: Package php version bump and
	enable simplexml
Message-ID: <f6675995a6327a7bc56ddaaea36af92c@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3484 
====================================================================== 
Reported By:                gustavoz
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3484
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-29-2008 07:38 PDT
Last Modified:              05-29-2008 07:38 PDT
====================================================================== 
Summary:                    Package php version bump and enable simplexml
Description: 
The php package should use version 5.2.6 which has many bugs fixed
(including security ones).
When enabling xml support with libxml2 the simplexml extension could also
be enabled.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-29-08 07:38  gustavoz       New Issue                                    
05-29-08 07:38  gustavoz       Status                   new => assigned     
05-29-08 07:38  gustavoz       Assigned To               => buildroot       
05-29-08 07:38  gustavoz       File Added: buildroot-php.patch                  
 
======================================================================
