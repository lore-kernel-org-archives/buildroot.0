From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:31 -0800
Subject: [Buildroot] [buildroot 0000390]: misleading bison error durring make
Message-ID: <163f390535b0dfc6151eb2f6b9e7ce79@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=390 
====================================================================== 
Reported By:                jdupre
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   390
Category:                   Other
Reproducibility:            always
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-18-2005 14:34 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    misleading bison error durring make
Description: 
When trying to use buildroot tool on a really stripped down distribution
(Linux from Scratch 6.1), "make" failed with a message that said bison
needs to be installed.  I checked and I did have Bison 2.0 installed.

Tried again and I noticed that the failure wasn't because of bison, but
rather
/bin/sh: which: command not found
followed by the 'need to install bison' message

I installed which-2.16 and everything proceded.  I am unsure as to why the
bison error was reported.

- Joe
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-28-05 00:56  
---------------------------------------------------------------------- 
added a check for which before bison 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-18-05 14:34  jdupre         New Issue                                    
08-18-05 14:34  jdupre         Status                   new => assigned     
08-18-05 14:34  jdupre         Assigned To               => uClibc          
08-28-05 00:56  vapier         Note Added: 0000448                          
08-28-05 00:56  vapier         Status                   assigned => resolved
08-28-05 00:56  vapier         Resolution               open => fixed       
08-28-05 00:57  vapier         Status                   resolved => closed  
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
