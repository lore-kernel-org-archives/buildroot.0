From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 16 Jul 2008 07:38:14 -0700
Subject: [Buildroot] [buildroot 0004154]: SDL_ttf doesn't compile if
	freetype package is not selected first
Message-ID: <50f2b9c6fca1f4418651f3629b869733@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been RESOLVED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4154 
====================================================================== 
Reported By:                artemys
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4154
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     resolved
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             07-16-2008 07:24 PDT
Last Modified:              07-16-2008 07:38 PDT
====================================================================== 
Summary:                    SDL_ttf doesn't compile if freetype package is not
selected first
Description: 
Tested on a clean view (ARM configured).
Choose to build SDL_ttf and launch compilation.

Patch correcting the problem is attached to this report.
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 07-16-08 07:38  
---------------------------------------------------------------------- 
Thanks. I've committed a slightly modified version as r22843 (the package
doesn't install showfont, so don't mention it in help and use select
instead of depends) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-16-08 07:24  artemys        New Issue                                    
07-16-08 07:24  artemys        Status                   new => assigned     
07-16-08 07:24  artemys        Assigned To               => buildroot       
07-16-08 07:24  artemys        File Added: sdl_ttf-depends-on-freetype.patch    
               
07-16-08 07:38  jacmet         Status                   assigned => resolved
07-16-08 07:38  jacmet         Resolution               open => fixed       
07-16-08 07:38  jacmet         Note Added: 0009384                          
======================================================================
