From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 8 Nov 2007 02:30:15 -0800
Subject: [Buildroot] [buildroot 0001578]: Typo in elf2flt.c prevents build
Message-ID: <932f462395c5f03722e8aacc00d1f0d9@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1578 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1578
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-08-2007 02:30 PST
Last Modified:              11-08-2007 02:30 PST
====================================================================== 
Summary:                    Typo in elf2flt.c prevents build
Description: 
There is a minor typo in the current version of elf2flt.c that causes build
error on nios2 and probably other architectures. A patch which fixes the
issue is attached.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-08-07 02:30  atle           New Issue                                    
11-08-07 02:30  atle           Status                   new => assigned     
11-08-07 02:30  atle           Assigned To               => buildroot       
11-08-07 02:30  atle           File Added: elf2flt-typo-fix.diff                
   
======================================================================
