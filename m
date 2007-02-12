From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:27 -0800
Subject: [Buildroot] [buildroot 0000267]: Wrong path in documentation
Message-ID: <8550aaaa3810252ad5f9708a92c525cf@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=267 
====================================================================== 
Reported By:                acutetech
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   267
Category:                   Documentation
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-23-2005 08:56 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Wrong path in documentation
Description: 
http://buildroot.uclibc.org/buildroot.html#download

You say : "export PATH=$PATH:~/buildroot/build_mips/bin/" - I think this
should be export PATH=$PATH:~/buildroot/build_mips/staging_dir/bin/
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-28-05 01:06  
---------------------------------------------------------------------- 
thanks, fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-23-05 08:56  acutetech      New Issue                                    
08-28-05 01:06  vapier         Note Added: 0000453                          
08-28-05 01:06  vapier         Status                   assigned => closed  
08-28-05 01:06  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
