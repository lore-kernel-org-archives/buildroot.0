From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:52 -0800
Subject: [Buildroot] [buildroot 0001045]: failure to build for x86_64
Message-ID: <c608dd2ebc6a29766a42d81810c61750@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1045 
====================================================================== 
Reported By:                d3bug
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1045
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-23-2006 19:26 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    failure to build for x86_64
Description: 
buildroot fails to build for target x86_64... nothing has been changed,
nothing extra selected - only arch x86_64 selected... nothing else, and
all prompts accepted as default
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-24-06 01:39  
---------------------------------------------------------------------- 
multilib is not supported 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-23-06 19:26  d3bug          New Issue                                    
09-23-06 19:26  d3bug          Status                   new => assigned     
09-23-06 19:26  d3bug          Assigned To               => uClibc          
09-23-06 19:26  d3bug          File Added: ss.jpg                           
09-24-06 01:39  vapier         Note Added: 0001645                          
09-24-06 01:39  vapier         Status                   assigned => closed  
09-24-06 01:39  vapier         Resolution               open => no change
required
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
