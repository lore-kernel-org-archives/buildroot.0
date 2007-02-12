From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:39 -0800
Subject: [Buildroot] [buildroot 0000450]: PATCH: openssl build fails with
	x86 variants other than i386
Message-ID: <2d16b82fdc963a51cfd78598be9e6e31@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=450 
====================================================================== 
Reported By:                schieli
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   450
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-29-2005 08:53 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    PATCH: openssl build fails with x86 variants other
than i386
Description: 
Openssl Configure script uses linux-i386, linux-i386-i486, ... to select
optimizations.

This patch fix the problem.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-29-05 18:52  
---------------------------------------------------------------------- 
thanks, now in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-29-05 08:53  schieli        New Issue                                    
09-29-05 08:53  schieli        Status                   new => assigned     
09-29-05 08:53  schieli        Assigned To               => uClibc          
09-29-05 08:53  schieli        File Added: openssl_x86_variants.patch           
        
09-29-05 11:26  schieli        Issue Monitored: schieli                     
09-29-05 18:52  vapier         Note Added: 0000591                          
09-29-05 18:52  vapier         Status                   assigned => resolved
09-29-05 18:52  vapier         Resolution               open => fixed       
09-30-05 00:57  schieli        Issue End Monitor: schieli                    
03-08-06 16:56  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
