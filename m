From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:14 -0800
Subject: [Buildroot] [buildroot 0000138]: New Dropbear SSHD configuration
	option for low Entropy targets
Message-ID: <a36667597e5261cf8111a9f9c5a1f0a6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=138 
====================================================================== 
Reported By:                rireland
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   138
Category:                   New Features
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-09-2005 18:37 PST
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    New Dropbear SSHD configuration option for low
Entropy targets
Description: 
The attached patch adds a BR2_CONFIG_DROPBEAR_SSHD_LOW_ENTROPY option which
will patch the config.h file to use /dev/urandom instead of /dev/random.

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-07-05 17:54  
---------------------------------------------------------------------- 
fixed in svn, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-09-05 18:37  rireland       New Issue                                    
03-09-05 18:37  rireland       File Added:
uclibc_buildroot_dropbear_sshd_low_entropy.patch                    
03-16-05 12:12  andersen       Status                   new => assigned     
03-16-05 12:12  andersen       Assigned To               => uClibc          
03-22-05 09:12  rireland       Issue Monitored: rireland                    
09-07-05 17:54  vapier         Note Added: 0000506                          
09-07-05 17:54  vapier         Status                   assigned => closed  
09-07-05 17:54  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
