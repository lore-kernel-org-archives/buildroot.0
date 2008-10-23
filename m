From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 23 Oct 2008 04:46:58 -0700
Subject: [Buildroot] [buildroot 0005684]: Xorg need font misc-misc and font
	alias
Message-ID: <33cc9e197acae839ed3edb6467fa55e7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been REOPENED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5684 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5684
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     feedback
====================================================================== 
Date Submitted:             10-23-2008 03:19 PDT
Last Modified:              10-23-2008 04:46 PDT
====================================================================== 
Summary:                    Xorg need font misc-misc and font alias
Description: 
Xorg need font misc-misc and font alias in order to run otherwise it fails
with this error: "could not load font ?fixed?"
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 10-23-08 03:24  
---------------------------------------------------------------------- 
Thanks, committed as r23769 

---------------------------------------------------------------------- 
 robang74 - 10-23-08 04:46  
---------------------------------------------------------------------- 
Xorg need font cursor-misc and font alias in order to run otherwise it
fails with this error: "could not load font ?cursor?" 

BR2_PACKAGE_XFONT_FONT_CURSOR_MISC

Sorry but adding/removing packages from menuconfig is not always areliable
process (yet). 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-23-08 03:19  robang74       New Issue                                    
10-23-08 03:19  robang74       Status                   new => assigned     
10-23-08 03:19  robang74       Assigned To               => buildroot       
10-23-08 03:19  robang74       File Added: xserver_xorg-server.patch            
       
10-23-08 03:19  robang74       Issue Monitored: robang74                    
10-23-08 03:24  jacmet         Status                   assigned => closed  
10-23-08 03:24  jacmet         Note Added: 0014014                          
10-23-08 03:24  jacmet         Resolution               open => fixed       
10-23-08 04:22  robang74       Issue End Monitor: robang74                    
10-23-08 04:46  robang74       Status                   closed => feedback  
10-23-08 04:46  robang74       Resolution               fixed => reopened   
10-23-08 04:46  robang74       Note Added: 0014024                          
======================================================================
