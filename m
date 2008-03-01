From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 1 Mar 2008 15:06:57 -0800
Subject: [Buildroot] [buildroot 0002404]: [PATCH] Modify the default
	tftpboot directory of the at91sam9261ek according to the last LSB
Message-ID: <00ce56dd3a911484a119c5a7a1154db5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2404 
====================================================================== 
Reported By:                jcdr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2404
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             03-01-2008 14:32 PST
Last Modified:              03-01-2008 15:06 PST
====================================================================== 
Summary:                    [PATCH] Modify the default tftpboot directory of the
at91sam9261ek according to the last LSB
Description: 
Last LSB ans more and more distributions uses "/var/lib/tftpboot" instead
of "/tftpboot". The provided patch in attachment fix this for the
AT91SAM9261 target only because this is the only one I have tested yet. I
suspect that the same kind of modification should be made in other place.

====================================================================== 

---------------------------------------------------------------------- 
 UlfSamuelsson - 03-01-08 15:06  
---------------------------------------------------------------------- 
NAK.
You can change the default manually if you want to. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-01-08 14:32  jcdr           New Issue                                    
03-01-08 14:32  jcdr           Status                   new => assigned     
03-01-08 14:32  jcdr           Assigned To               => buildroot       
03-01-08 14:32  jcdr           File Added:
0003-Modify-the-default-tftpboot-directory-of-the-at91sam.patch                 
  
03-01-08 15:06  UlfSamuelsson  Status                   assigned => closed  
03-01-08 15:06  UlfSamuelsson  Note Added: 0005574                          
======================================================================
