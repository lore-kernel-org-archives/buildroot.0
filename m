From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 16 Jul 2008 08:31:45 -0700
Subject: [Buildroot] [buildroot 0004164]: SDL_ttf needs SDL to be compiled
	first
Message-ID: <6244397a4170b423d15918a87a03a1ed@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4164 
====================================================================== 
Reported By:                artemys
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4164
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-16-2008 08:31 PDT
Last Modified:              07-16-2008 08:31 PDT
====================================================================== 
Summary:                    SDL_ttf needs SDL to be compiled first
Description: 
It is possible to select the build of SDL_ttf even if SDL is not selected.
-> compilation error

Correction patch attached.
Same should apply to SDL_mixer...
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-16-08 08:31  artemys        New Issue                                    
07-16-08 08:31  artemys        Status                   new => assigned     
07-16-08 08:31  artemys        Assigned To               => buildroot       
07-16-08 08:31  artemys        File Added: sdl_ttf-depends-on-sdl.patch         
          
======================================================================
