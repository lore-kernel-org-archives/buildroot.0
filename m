From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:07 -0800
Subject: [Buildroot] [buildroot 0000817]: The gcc 4.1 configure scripts do
	not set EXEEXT correctly when building under Cygwin
Message-ID: <338bf717feb48912cf8de6cb15addc81@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=817 
====================================================================== 
Reported By:                alessio
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   817
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-07-2006 04:15 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    The gcc 4.1 configure scripts do not set EXEEXT
correctly when building under Cygwin
Description: 
EXEEXT is set to an empty string in gcc-4.1*/gcc/Makefile
This is done by the configure scripts of all 3 stages of the gcc build

I know Cygwin is not supported and that this is probably a mistake of the
gcc team, but it would make life a lot easier if buildroot could patch gcc
to compensate for this problem.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 04-09-06 14:44  
---------------------------------------------------------------------- 
i already sent a patch upstream to get this fixed in gcc 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-07-06 04:15  alessio        New Issue                                    
04-07-06 04:15  alessio        Status                   new => assigned     
04-07-06 04:15  alessio        Assigned To               => uClibc          
04-09-06 14:44  vapier         Note Added: 0001241                          
04-09-06 14:44  vapier         Status                   assigned => closed  
04-09-06 14:44  vapier         Resolution               open => won't fix   
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
