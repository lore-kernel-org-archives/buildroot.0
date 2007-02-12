From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:13 -0800
Subject: [Buildroot] [buildroot 0000516]: rename gdb-client to gdb-host
Message-ID: <ce4c57d1e26b48126a7cb857f0a29cfc@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=516 
====================================================================== 
Reported By:                akvadrako
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   516
Category:                   Documentation
Reproducibility:            N/A
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-28-2005 09:43 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    rename gdb-client to gdb-host
Description: 
The term gdb-client is deceptive - although it parallels the gdb-server
name, it is actually a full fledged gdb version.  I want to use it to
debug uClibc core files on my host system.  Although I haven't got that to
work yet, I wasted time figuring out how to do build gdb for the host not
realizing it already had a target.  With this documentation change, things
would have been a lot clearer to me.
====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 11:12  
---------------------------------------------------------------------- 
seems reasonable.  applied. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-28-05 09:43  akvadrako      New Issue                                    
10-28-05 09:43  akvadrako      Status                   new => assigned     
10-28-05 09:43  akvadrako      Assigned To               => uClibc          
10-28-05 09:43  akvadrako      File Added: br-gdb-clarify-client-name.patch     
              
04-06-06 11:12  andersen       Note Added: 0001233                          
04-06-06 11:12  andersen       Status                   assigned => closed  
04-06-06 11:12  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
