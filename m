From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 11 Nov 2007 23:50:38 -0800
Subject: [Buildroot] [buildroot 0001585]: [buildroot] Netkit package build
	fails
Message-ID: <29ec16bd5568c33ca9f4de0f4e342e5e@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1585 
====================================================================== 
Reported By:                hwstar
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1585
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-11-2007 12:40 PST
Last Modified:              11-11-2007 23:50 PST
====================================================================== 
Summary:                    [buildroot] Netkit package build fails
Description: 
Netkit package does not build 

Make output in "Additional Information" field.

Buildroot config/system info:

SVN revision 20406
Host: Ubuntu 7.04 (Feisty)
Target: i386/i586


====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 11-11-07 23:50  
---------------------------------------------------------------------- 
you did not set BR2_INET_RPC=y when building your toolchain 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-11-07 12:40  hwstar         New Issue                                    
11-11-07 12:40  hwstar         Status                   new => assigned     
11-11-07 12:40  hwstar         Assigned To               => buildroot       
11-11-07 12:44  hwstar         Issue Monitored: hwstar                      
11-11-07 23:50  vanokuten      Note Added: 0002907                          
======================================================================
