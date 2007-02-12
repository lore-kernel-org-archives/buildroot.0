From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:34 -0800
Subject: [Buildroot] [buildroot 0000448]: Wrong link in
	'toolchain_build_i586/linux/include'
Message-ID: <2f736099885e77b186c3ed465cc5a647@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=448 
====================================================================== 
Reported By:                hix
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   448
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-27-2005 06:47 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    Wrong link in 'toolchain_build_i586/linux/include'
Description: 
When selecting 'i386' as 'Target Architecture' and 'i586' as 'Target
Architecture Variant', a link 'asm' is created in
'toolchain_build_i586/linux/include/' pointing to (a non existant)
'asm-i586' directory. The right target would obviously be 'asm-i386'.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-27-05 06:47  hix            New Issue                                    
09-27-05 06:47  hix            Status                   new => assigned     
09-27-05 06:47  hix            Assigned To               => uClibc          
01-24-06 12:21  prpplague      Status                   assigned => resolved
01-24-06 12:21  prpplague      Resolution               open => fixed       
01-24-06 12:21  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
