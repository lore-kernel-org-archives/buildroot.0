From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:51 -0800
Subject: [Buildroot] [buildroot 0000645]: OpenSSH requires zlib,
	but configuration file doesn't select it
Message-ID: <62e344d7b3a2dfc3f8ee7085b63c0d77@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=645 
====================================================================== 
Reported By:                wpd
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   645
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-17-2006 06:37 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    OpenSSH requires zlib, but configuration file
doesn't select it
Description: 
The makefile fragment for OpenSSH (in package/openssh/openssh.mk) lists
"zlib" as a dependency, but the Configuration file doesn't automatically
select it when openssh is selected.  I modified the config file and have
(hopefully) attached the patch file containing the one-line modification.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-17-06 06:37  wpd            New Issue                                    
01-17-06 06:37  wpd            Status                   new => assigned     
01-17-06 06:37  wpd            Assigned To               => uClibc          
01-17-06 06:37  wpd            File Added: difflog                          
01-23-06 06:46  prpplague      Status                   assigned => resolved
01-23-06 06:46  prpplague      Resolution               open => fixed       
01-23-06 06:46  prpplague      Additional Information Updated                   

03-08-06 16:56  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
