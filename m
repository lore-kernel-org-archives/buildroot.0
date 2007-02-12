From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:11 -0800
Subject: [Buildroot] [buildroot 0000688]: bug in uclibc.mk
Message-ID: <f59a8d735a8464e4a230171b9539cb70@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=688 
====================================================================== 
Reported By:                charlesqsan
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   688
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-06-2006 03:52 PST
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    bug in uclibc.mk
Description: 
When using buildroot for XScale platform, the value of $BR2_ARM_TYPE is
supposed to be passed to $CONFIG_ARM_XSCALE=y in $(UCLIBC_DIR)/.config.
Due to incorrect coding in uclibc.mk, it doesn't work properly. Here is a
diff file to fix this.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-06-06 03:52  charlesqsan    New Issue                                    
02-06-06 03:52  charlesqsan    Status                   new => assigned     
02-06-06 03:52  charlesqsan    Assigned To               => uClibc          
02-06-06 03:52  charlesqsan    File Added: uclibc.mk.diff                    
02-09-06 10:46  prpplague      Status                   assigned => feedback
02-09-06 10:46  prpplague      Additional Information Updated                   

02-09-06 11:15  prpplague      Status                   feedback => resolved
02-09-06 11:15  prpplague      Resolution               open => fixed       
02-09-06 11:15  prpplague      Additional Information Updated                   

03-08-06 16:52  vapier         Status                   resolved => closed  
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================
