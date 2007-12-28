From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 28 Dec 2007 04:57:13 -0800
Subject: [Buildroot] [buildroot 0001789]: Linux-PAM 0.99.9.0 support for
	buildroot
Message-ID: <f07061c8235c43404412b75b441b4947@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1789 
====================================================================== 
Reported By:                chrisv
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1789
Category:                   Architecture Specific
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-16-2007 12:35 PST
Last Modified:              12-28-2007 04:57 PST
====================================================================== 
Summary:                    Linux-PAM 0.99.9.0 support for buildroot
Description: 
This patch adds Linux-PAM support to buildroot.  (NIS/YP services are
removed from PAM to make this work.)  Until to the $(buildroot) directory
to integrate into the tree.
====================================================================== 

---------------------------------------------------------------------- 
 kriegaex - 12-28-07 04:57  
---------------------------------------------------------------------- 
I tried your patch, and it applies cleanly. But afterwards I have problems
building PAM with a similar makefile adapted from yours (cf. attachment).
Do you have any hints for me? There are some in the build log, but I do
not understand them because I am an automake newbie. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-16-07 12:35  chrisv         New Issue                                    
12-16-07 12:35  chrisv         Status                   new => assigned     
12-16-07 12:35  chrisv         Assigned To               => buildroot       
12-16-07 12:35  chrisv         File Added: pam-0.99.9.0b-nonis.tar.gz           
        
12-28-07 04:56  kriegaex       File Added: make.log                         
12-28-07 04:57  kriegaex       Note Added: 0003279                          
======================================================================
