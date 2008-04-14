From: Joe <zentrale.at.work@gmail.com>
Date: Mon, 14 Apr 2008 15:23:37 +0200
Subject: [Buildroot] Version bumps glib and xerces
Message-ID: <48035AD9.4050504@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I've noticed that glib and xerces would need version bumpsand download 
path fixes:
glib version to: 2.16.3
glib path to: http://ftp.gnome.org/pub/gnome/sources/glib/2.16/

xerces version to 2.8.0
xerces download path to: 
ftp://www.ibiblio.org/pub/mirrors/apache/xerces/c/sources/
(couldn't find a "generic" apache mirror, and this one seems to be 
reasonably reliable)

BTW, the xerces makefile is in pretty bad shape... if some one could 
give me a quick rundown on how the ppatches shall look like, i'll do my 
best to provide one.

Greetz Joe
-- 
Sepp "ZaP" Holzmayr

please reply to: zentrale.at.work at gmail.com
"Never underestimate the bandwidth of a freight train full of DAT tapes. 
Only the round-trip is a little suboptimal."
