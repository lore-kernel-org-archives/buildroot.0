From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:41 -0800
Subject: [Buildroot] [buildroot 0000363]: can't automatic generate
	.config.cmd
Message-ID: <e3a80a8684e2ee625c057d31b225fd6a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=363 
====================================================================== 
Reported By:                lancelot
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   363
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-02-2005 19:54 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    can't automatic generate .config.cmd
Description: 
I used "svn update" today, and exec "make clean".
atfer "make menuconfig" command, the ".config.cmd" didn't automatic
generate. So that, I can't make. it will display those error info.
Makefile:68 .config.cmd : no such file or dir
make: *** No rule to make target '.config.cmd'. Stop
====================================================================== 

---------------------------------------------------------------------- 
 andersen - 08-02-05 20:10  
---------------------------------------------------------------------- 
fixed with revision 11032. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-02-05 19:54  lancelot       New Issue                                    
08-02-05 19:54  lancelot       Status                   new => assigned     
08-02-05 19:54  lancelot       Assigned To               => uClibc          
08-02-05 20:10  andersen       Note Added: 0000378                          
08-02-05 20:10  andersen       Status                   assigned => closed  
08-02-05 20:10  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
