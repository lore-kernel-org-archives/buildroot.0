From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 2 Nov 2008 10:39:35 -0800
Subject: [Buildroot] [buildroot 0005914]: add 915resolution and v86d
Message-ID: <d2801c51182e0ed0fa0934423c3903e5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5914 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5914
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-01-2008 03:23 PDT
Last Modified:              11-02-2008 10:39 PST
====================================================================== 
Summary:                    add 915resolution and v86d
Description: 
add 915resolution and v86d for supporting non standard video resolutions
====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-01-08 13:24  
---------------------------------------------------------------------- 
In the resolutions.patch:

s,$(INSTALL),$(INSTALL) -D,

for both the package. Thanks.

 

---------------------------------------------------------------------- 
 jacmet - 11-02-08 10:39  
---------------------------------------------------------------------- 
Isn't 915resolution only for really old Intel drivers? Shouldn't we bump
the intel driver version instead? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-01-08 03:23  robang74       New Issue                                    
11-01-08 03:23  robang74       Status                   new => assigned     
11-01-08 03:23  robang74       Assigned To               => buildroot       
11-01-08 03:23  robang74       File Added: resolutions.patch                    
11-01-08 03:23  robang74       Issue Monitored: robang74                    
11-01-08 13:24  robang74       Note Added: 0014784                          
11-01-08 13:24  robang74       Note Edited: 0014784                         
11-02-08 10:39  jacmet         Note Added: 0014884                          
======================================================================
