From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:16 -0800
Subject: [Buildroot] [buildroot 0000439]: ipsec-tools package
Message-ID: <d77490c8fe1b57d0de6cdbe1b277e01c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=439 
====================================================================== 
Reported By:                steelman
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   439
Category:                   New Features
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-21-2005 07:45 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    ipsec-tools package
Description: 
This is ipsec-tools-0.6.1 buildroot package. Just add an entry in
./packages/Config.in /e voila/. It also dpends on libfl.a which is not
installed by default in staging_dir (see issue 438;
http://bugs.busybox.net/view.php?id=438 )

Everything works fine on i386 platform. I haven't tested other platfrms.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-21-05 07:45  steelman       New Issue                                    
09-21-05 07:45  steelman       Status                   new => assigned     
09-21-05 07:45  steelman       Assigned To               => uClibc          
09-21-05 07:46  steelman       File Added: ipsec-tools.tar.gz                   

01-23-06 13:44  prpplague      Status                   assigned => resolved
01-23-06 13:44  prpplague      Resolution               open => fixed       
01-23-06 13:44  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================
