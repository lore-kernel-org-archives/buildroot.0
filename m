From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 16 Jul 2008 07:24:33 -0700
Subject: [Buildroot] [buildroot 0004154]: SDL_ttf doesn't compile if
	freetype package is not selected first
Message-ID: <d4f78764441e8f074c54f27e8f4a67f8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Last Modified:              07-16-2008 07:24 PDT
====================================================================== 
Summary:                    SDL_ttf doesn't compile if freetype package is not
selected first
Description: 
Tested on a clean view (ARM configured).
Choose to build SDL_ttf and launch compilation.

Patch correcting the problem is attached to this report.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-16-08 07:24  artemys        New Issue                                    
07-16-08 07:24  artemys        Status                   new => assigned     
07-16-08 07:24  artemys        Assigned To               => buildroot       
07-16-08 07:24  artemys        File Added: sdl_ttf-depends-on-freetype.patch    
               
======================================================================
