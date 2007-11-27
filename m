From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 27 Nov 2007 01:50:02 -0800
Subject: [Buildroot] [buildroot 0001596]: SUSv3 Legacy Macros not enabled in
	uClibc default config
Message-ID: <8174f849e37840904c9b7f748af227e1@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1596 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1596
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-18-2007 07:35 PST
Last Modified:              11-27-2007 01:50 PST
====================================================================== 
Summary:                    SUSv3 Legacy Macros not enabled in uClibc default
config
Description: 
UCLIBC_SUSV3_LEGACY_MACROS is no longer set in the uClibc default config
(since svn rev 19987). I guess there is a reason for this (?), but the
problem is that some applications still are dependent on those macros
(openssl, ntp, boa, pure-ftpd, ++). I have attached a patch that makes it
possible to enable SUSV3_LEGACY_MACROS in the menuconfig (disabled by
default).

====================================================================== 

---------------------------------------------------------------------- 
 ikonst - 11-27-07 01:50  
---------------------------------------------------------------------- 
Meanwhile, I've been adding patches to legacy function calls with their
modern equivalents. Will be submitting them soon. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-18-07 07:35  atle           New Issue                                    
11-18-07 07:35  atle           Status                   new => assigned     
11-18-07 07:35  atle           Assigned To               => buildroot       
11-18-07 07:35  atle           File Added:
uclibc-config_susv3_legacy_macros.diff                    
11-27-07 01:50  ikonst         Note Added: 0002971                          
======================================================================
