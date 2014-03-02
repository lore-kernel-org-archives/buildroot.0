From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 02 Mar 2014 15:47:10 +0100
Subject: [Buildroot] [PATCH v5 1/3] xlib_libpthread-stubs: Rename
	package to libpthread-stubs
References: <BLU0-SMTP413A04CC0DB17EA13F7E9FBD98D0@phx.gbl>
 <20140302150146.50593a9f@skate>
Message-ID: <essbuaxqp7.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni 
<thomas.petazzoni@free-electrons.com> wrote 
in news:20140302150146.50593a9f at skate: 

> Would it be possible to dig those patches and resend them on top of the
> latest master? 

Hi,

yes, of course ;)

The next step is to update mesa3d to 10.0.3 & xorg to 1.15.0:

http://patchwork.ozlabs.org/patch/316704/
http://patchwork.ozlabs.org/patch/316705/
http://patchwork.ozlabs.org/patch/316707/
http://patchwork.ozlabs.org/patch/316706/

while I?am also waiting for the drm-related autobuild fallout ;)

Now that the drm update made it into git I will update my patches for git 
master, but afaics the opengl support is up for a change, too:

http://patchwork.ozlabs.org/patch/316706/
http://patchwork.ozlabs.org/patch/325462/

Should I wait until the new code is merged? Mesa3d introduces a new 
opengl/libgl package.

FTR: sdl needs this patch to compile with libX11>= 1.5.99.902 on x86_64:
http://hg.libsdl.org/SDL/raw-rev/91ad7b43317a

This is already fixed here, I will include it in my next patch series.

Regards, Bernd
