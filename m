From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:03 -0800
Subject: [Buildroot] [buildroot 0000755]: New package: haserl
Message-ID: <ac26461c7059505433d61c061d14d272@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=755 
====================================================================== 
Reported By:                jacmet
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   755
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-24-2006 04:50 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    New package: haserl
Description: 
This little patch adds a target for haserl to buildroot.

Haserl - Html And Shell Embedded Report Language

Haserl is a small cgi wrapper that enables shell scripts to be embedded
into html documents. It is intended for environments where something like
PHP is too big.

It was written for Linux, but is known to run on FreeBSD. The binary
generally compiles to less than 20K. A typical use is to run cgi scripts
run under a small web server, such as mini-httpd, thttpd, or the server
built into busybox.

See http://haserl.sf.net for details.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-24-06 04:50  jacmet         New Issue                                    
02-24-06 04:50  jacmet         Status                   new => assigned     
02-24-06 04:50  jacmet         Assigned To               => uClibc          
02-24-06 04:50  jacmet         File Added: haserl.patch                     
04-10-06 16:34  andersen       Status                   assigned => closed  
04-10-06 16:34  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
