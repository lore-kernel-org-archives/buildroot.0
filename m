From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Nov 2008 02:12:20 -0800
Subject: [Buildroot] [buildroot 0006374]: SDL_ttf 2.0.9 not compatible with
	Freetype 2.X
Message-ID: <f29b30431a9289d80f47b04d6fa29146@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6374 
====================================================================== 
Reported By:                slade
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6374
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-19-2008 02:12 PST
Last Modified:              11-19-2008 02:12 PST
====================================================================== 
Summary:                    SDL_ttf 2.0.9 not compatible with Freetype 2.X
Description: 
When selecting SDL_ttf and Freetype on my buildroot config, the compilation
fail due to : 
In file included from SDL_ttf.c:42:
/home/myname/dev/system/buildroot/build_arm/staging_dir/usr/include/ft2build.h:56:38:
error: freetype/config/ftheader.h: No such file or directory

I join the patch for correcting this.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-19-08 02:12  slade          New Issue                                    
11-19-08 02:12  slade          Status                   new => assigned     
11-19-08 02:12  slade          Assigned To               => buildroot       
11-19-08 02:12  slade          File Added: sdl_ttf_mk.patch                    
======================================================================
