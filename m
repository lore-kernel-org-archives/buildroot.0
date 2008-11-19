From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Nov 2008 02:44:47 -0800
Subject: [Buildroot] [buildroot 0006374]: SDL_ttf 2.0.9 not compatible with
	Freetype 2.X
Message-ID: <a682c2b8fc70a2cfe36f636f7ac23e5c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-19-2008 02:12 PST
Last Modified:              11-19-2008 02:44 PST
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

---------------------------------------------------------------------- 
 jacmet - 11-19-08 02:44  
---------------------------------------------------------------------- 
Thanks, committed as r24099. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-19-08 02:12  slade          New Issue                                    
11-19-08 02:12  slade          Status                   new => assigned     
11-19-08 02:12  slade          Assigned To               => buildroot       
11-19-08 02:12  slade          File Added: sdl_ttf_mk.patch                    
11-19-08 02:15  slade          Issue Monitored: slade                       
11-19-08 02:44  jacmet         Status                   assigned => closed  
11-19-08 02:44  jacmet         Note Added: 0015994                          
======================================================================
