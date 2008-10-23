From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 23 Oct 2008 08:07:47 -0700
Subject: [Buildroot] [buildroot 0005704]: xkeyboard-config depends on
	xapp_xkbcomp at runtime
Message-ID: <b333afb32fb8e7def7833044f71b073a@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=5704 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5704
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-23-2008 07:51 PDT
Last Modified:              10-23-2008 08:07 PDT
====================================================================== 
Summary:                    xkeyboard-config depends on xapp_xkbcomp at runtime
Description: 
X server keyboard rules could not be parsed without the xkcomp application
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 10-23-08 08:07  
---------------------------------------------------------------------- 
thanks, committed as r23772 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-23-08 07:51  robang74       New Issue                                    
10-23-08 07:51  robang74       Status                   new => assigned     
10-23-08 07:51  robang74       Assigned To               => buildroot       
10-23-08 07:51  robang74       File Added: xkeyboard-config.patch               
    
10-23-08 07:51  robang74       Issue Monitored: robang74                    
10-23-08 08:07  jacmet         Status                   assigned => closed  
10-23-08 08:07  jacmet         Note Added: 0014084                          
======================================================================
