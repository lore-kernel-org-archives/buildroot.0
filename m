From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 17 Jul 2008 03:36:44 -0700
Subject: [Buildroot] [buildroot 0004154]: SDL_ttf doesn't compile if
	freetype package is not selected first
Message-ID: <27efe2620d0235f3549acdf64392ea76@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been set as DUPLICATE OF issue 0004164. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             07-16-2008 07:24 PDT
Last Modified:              07-17-2008 03:36 PDT
====================================================================== 
Summary:                    SDL_ttf doesn't compile if freetype package is not
selected first
Description: 
Tested on a clean view (ARM configured).
Choose to build SDL_ttf and launch compilation.

Patch correcting the problem is attached to this report.
======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
duplicate of        0004164 SDL_ttf needs SDL to be compiled first
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 07-16-08 07:38  
---------------------------------------------------------------------- 
Thanks. I've committed a slightly modified version as r22843 (the package
doesn't install showfont, so don't mention it in help and use select
instead of depends) 

---------------------------------------------------------------------- 
 bernhardf - 07-16-08 08:00  
---------------------------------------------------------------------- 
If an issue is fixed then the convention is to set it to "closed". 

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
07-16-08 08:00  bernhardf      Note Added: 0009394                          
07-16-08 08:00  bernhardf      Status                   resolved => assigned
07-17-08 03:36  bernhardf      Relationship added       duplicate of 0004164
======================================================================
