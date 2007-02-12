From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:38 -0800
Subject: [Buildroot] [buildroot 0000226]: gdb 6.3 500-thread-timeout.patch
	incorrect
Message-ID: <18d319f49c5a963fc81b0df56d049f2f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=226 
====================================================================== 
Reported By:                Luke
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   226
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-16-2005 19:56 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    gdb 6.3 500-thread-timeout.patch incorrect
Description: 
The patch does not apply properly to the gdb 6.3 source.
====================================================================== 

---------------------------------------------------------------------- 
 Luke - 04-16-05 19:58  
---------------------------------------------------------------------- 
This version of the patch applies correctly. 

---------------------------------------------------------------------- 
 Alex Riesen - 07-30-05 09:11  
---------------------------------------------------------------------- 
the patch is with CR/LF line endings. Could the maintainers please dedosify
it? 

---------------------------------------------------------------------- 
 andersen - 08-02-05 20:17  
---------------------------------------------------------------------- 
fixed 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-16-05 19:56  Luke           New Issue                                    
04-16-05 19:57  Luke           File Added: 500-thread-timeout.patch             
      
04-16-05 19:58  Luke           Note Added: 0000169                          
07-30-05 09:11  Alex Riesen    Note Added: 0000356                          
08-02-05 20:17  andersen       Note Added: 0000379                          
08-02-05 20:17  andersen       Status                   assigned => closed  
08-02-05 20:17  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
