From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 15 Nov 2008 16:13:58 +0100
Subject: [Buildroot] [PATCH] Create "Shells" package category
In-Reply-To: <AFB9D622-EA20-4145-AE22-4F4DC7707912@valka.is>
References: <B675007D-8CE2-48C7-9F49-241B967F30C7@valka.is>
	<200811151432.44932.markus.heidelberg@web.de>
	<AFB9D622-EA20-4145-AE22-4F4DC7707912@valka.is>
Message-ID: <200811151613.58903.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnar Mar Sig, 15.11.2008:
> I started at the top of the package list and was going to post a patch  
> as i created them. (And found dash down on the list later on). Even  
> with such specific categories we probably wont end with more then 20,  
> but having less specific is fine by me, The categories so far:

That sounds ok. It only seemed to get a little bit to much split up, when you
started with the shells category.

> Archivers (Renamed from compressors / decompressors)
> Audio

Audio should be merged into multimedia, I'm currently preparing a patch.

> Database
> Development tools
> Hardware handling / blockdevices and filesystem maintenance (maybe  
> split this up?)
> Languages and Scripting
> Text editors
> Games
> Graphic
> Java
> Networking
> Math utilities
> Multimedia
> Package managers
> Shells
> System utilities
> XML handling
> 
> I'm going to finish moving the package on the first page into  
> categories before posting the next patch.
