From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 13 Dec 2007 07:43:37 -0800
Subject: [Buildroot] [buildroot 0001709]: fakeroot 1.8.2 no longer available
	from Debian
Message-ID: <6bda010511ac4e235175ecfc556606b3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1709 
====================================================================== 
Reported By:                mfladischer
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1709
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-12-2007 01:02 PST
Last Modified:              12-13-2007 07:43 PST
====================================================================== 
Summary:                    fakeroot 1.8.2 no longer available from Debian
Description: 
Rev20642:
fakeroot 1.8.2 is no longer available from Debian. The new version is
1.8.10.
Patches that could not be applied to 1.8.10:
- fakeroot-uclibc-LFS.patch

====================================================================== 

---------------------------------------------------------------------- 
 bonkabonka - 12-12-07 19:25  
---------------------------------------------------------------------- 
I've attached a patch to the old patch that makes it apply to the 1.8.10
revision of fakeroot. 

---------------------------------------------------------------------- 
 vanokuten - 12-13-07 04:05  
---------------------------------------------------------------------- 
bonkabonka,

as I see you fully deleted "defined __UCLIBC__ && defined UCLIBC_HAS_LFS"
in fakeroot-uclibc-LFS.patch.patch 

seems you have to leave this defines intact

regards,
Ivan 

---------------------------------------------------------------------- 
 bonkabonka - 12-13-07 07:43  
---------------------------------------------------------------------- 
*blink*

You're right, I messed up the cut-n-paste out of the working-copy diff. 
I'll re-attach a proper version of the patch here in a second. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-12-07 01:02  mfladischer    New Issue                                    
12-12-07 01:02  mfladischer    Status                   new => assigned     
12-12-07 01:02  mfladischer    Assigned To               => buildroot       
12-12-07 07:54  swinnenb       Issue Monitored: swinnenb                    
12-12-07 19:24  bonkabonka     File Added: fakeroot-uclibc-LFS.patch.patch      
             
12-12-07 19:25  bonkabonka     Note Added: 0003119                          
12-13-07 04:05  vanokuten      Note Added: 0003134                          
12-13-07 07:43  bonkabonka     Note Added: 0003174                          
======================================================================
