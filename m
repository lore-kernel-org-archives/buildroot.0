From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 1 Mar 2008 14:32:00 -0800
Subject: [Buildroot] [buildroot 0002404]: [PATCH] Modify the default
	tftpboot directory of the at91sam9261ek according to the last LSB
Message-ID: <b05017470d841d824e31eb87b5d6c80c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             03-01-2008 14:32 PST
Last Modified:              03-01-2008 14:32 PST
====================================================================== 
Summary:                    [PATCH] Modify the default tftpboot directory of the
at91sam9261ek according to the last LSB
Description: 
Last LSB ans more and more distributions uses "/var/lib/tftpboot" instead
of "/tftpboot". The provided patch in attachment fix this for the
AT91SAM9261 target only because this is the only one I have tested yet. I
suspect that the same kind of modification should be made in other place.

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-01-08 14:32  jcdr           New Issue                                    
03-01-08 14:32  jcdr           Status                   new => assigned     
03-01-08 14:32  jcdr           Assigned To               => buildroot       
03-01-08 14:32  jcdr           File Added:
0003-Modify-the-default-tftpboot-directory-of-the-at91sam.patch                 
  
======================================================================
