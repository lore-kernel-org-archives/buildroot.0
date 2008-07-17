From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 17 Jul 2008 03:40:00 -0700
Subject: [Buildroot] [buildroot 0002304]: The ISO Option Fails
Message-ID: <6784f2bccc9d05054ef3274c08998783@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2304 
====================================================================== 
Reported By:                solifugus
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2304
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             02-22-2008 11:28 PST
Last Modified:              07-17-2008 03:39 PDT
====================================================================== 
Summary:                    The ISO Option Fails
Description: 
wget gives a 404 error trying to download grub_0.97-28.diff.gz
I took a look and that file isn't there.. but other versions are.
Looks like a very simple fix for someone, but I don't know where/how to
fix this.
====================================================================== 

---------------------------------------------------------------------- 
 sjhill - 02-22-08 11:39  
---------------------------------------------------------------------- 
The -28 diff no longer exists and the grub makefile was updated to use the
-31 version instead. Let us know if this fixes your problem. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-22-08 11:28  solifugus      New Issue                                    
02-22-08 11:28  solifugus      Status                   new => assigned     
02-22-08 11:28  solifugus      Assigned To               => buildroot       
02-22-08 11:39  sjhill         Status                   assigned => resolved
02-22-08 11:39  sjhill         Resolution               open => fixed       
02-22-08 11:39  sjhill         Note Added: 0005244                          
07-16-08 08:02  bernhardf      Status                   resolved => new     
07-17-08 03:39  bernhardf      Status                   new => closed       
======================================================================
