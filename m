From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:51 -0800
Subject: [Buildroot] [buildroot 0000285]: ncurses does not install terminfo
	correctly
Message-ID: <f9a604f1ee8ca1ef25721329e5ddd75b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=285 
====================================================================== 
Reported By:                luv2skydive
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   285
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-03-2005 11:16 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    ncurses does not install terminfo correctly
Description: 
The ncurses package make file does not install the terminfo files into the
correct directory.  The attached patch (against svn) corrects this
problem.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-03-05 11:16  luv2skydive    New Issue                                    
06-03-05 11:16  luv2skydive    File Added: buildroot-ncurses.mk.patch           
        
06-09-05 05:26  andersen       Status                   assigned => closed  
06-09-05 05:26  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
