From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 1 Nov 2008 13:24:41 -0700
Subject: [Buildroot] [buildroot 0005914]: add 915resolution and v86d
Message-ID: <4ba7a4f560073f9c955da5518c03cef1@busybox.net>
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
Last Modified:              11-01-2008 13:24 PDT
====================================================================== 
Summary:                    add 915resolution and v86d
Description: 
add 915resolution and v86d for supporting non standard video resolutions
====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-01-08 13:24  
---------------------------------------------------------------------- 
In the resolution patch:

s,$(INSTALL),$(INSTALL) -D,

for both the package. Thanks. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-01-08 03:23  robang74       New Issue                                    
11-01-08 03:23  robang74       Status                   new => assigned     
11-01-08 03:23  robang74       Assigned To               => buildroot       
11-01-08 03:23  robang74       File Added: resolutions.patch                    
11-01-08 03:23  robang74       Issue Monitored: robang74                    
11-01-08 13:24  robang74       Note Added: 0014784                          
======================================================================
