From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:42 -0800
Subject: [Buildroot] [buildroot 0000179]: libelf Source URI is broken
Message-ID: <31b3b630b0300770f3e6df244ba519a6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=179 
====================================================================== 
Reported By:                klford
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   179
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-21-2005 09:20 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    libelf Source URI is broken
Description: 
libelf SRC_URI is broken:

The correct URI is now:  http://www.mr511.de/software

I guess Micheal moved his site.
======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
has duplicate       0000196 libelf-0.8.5 wrong location
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 01-20-06 12:30  
---------------------------------------------------------------------- 
fixed as of 10083 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-21-05 09:20  klford         New Issue                                    
03-29-05 12:11  vapier         Relationship added       has duplicate 0000196
01-20-06 12:30  prpplague      Note Added: 0000962                          
01-20-06 12:30  prpplague      Status                   assigned => resolved
01-20-06 12:30  prpplague      Resolution               open => fixed       
03-08-06 16:56  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
