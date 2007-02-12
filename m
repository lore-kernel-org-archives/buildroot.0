From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:53 -0800
Subject: [Buildroot] [buildroot 0000293]: typo for tcl-dirclean target in
	tcl.mk
Message-ID: <beb76ef19a943d2d4eb2138f61433f67@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=293 
====================================================================== 
Reported By:                jnalley
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   293
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-06-2005 09:22 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    typo for tcl-dirclean target in tcl.mk
Description: 
target tcl-dirclean in tcl.mk removes $(LESS_DIR) should be $(TCL_DIR) -
see attached patch.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-06-05 09:22  jnalley        New Issue                                    
06-06-05 09:22  jnalley        File Added: tcl-mk.patch                     
06-09-05 02:53  andersen       Status                   assigned => closed  
06-09-05 02:53  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
