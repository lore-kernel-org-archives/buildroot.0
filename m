From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 22:37:58 +0100
Subject: [Buildroot] [PATCH v5 1/3] xlib_libpthread-stubs: Rename
 package to libpthread-stubs
In-Reply-To: <essbuaxqp7.ln2@ID-313208.user.individual.net>
References: <BLU0-SMTP413A04CC0DB17EA13F7E9FBD98D0@phx.gbl>
 <20140302150146.50593a9f@skate>
 <essbuaxqp7.ln2@ID-313208.user.individual.net>
Message-ID: <20140304223758.22a685fd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 02 Mar 2014 15:47:10 +0100, Bernd Kuhls wrote:

> The next step is to update mesa3d to 10.0.3 & xorg to 1.15.0:
> 
> http://patchwork.ozlabs.org/patch/316704/
> http://patchwork.ozlabs.org/patch/316705/
> http://patchwork.ozlabs.org/patch/316707/
> http://patchwork.ozlabs.org/patch/316706/

These patches have a number of comments that have not been addressed.
Can you take them into account and resend updated versions?

> while I?am also waiting for the drm-related autobuild fallout ;)
> 
> Now that the drm update made it into git I will update my patches for git 
> master, but afaics the opengl support is up for a change, too:
> 
> http://patchwork.ozlabs.org/patch/316706/
> http://patchwork.ozlabs.org/patch/325462/

Not sure how these two patches are related. What do you mean exactly
here?

> Should I wait until the new code is merged? Mesa3d introduces a new 
> opengl/libgl package.

Which new code?

> FTR: sdl needs this patch to compile with libX11>= 1.5.99.902 on x86_64:
> http://hg.libsdl.org/SDL/raw-rev/91ad7b43317a
> 
> This is already fixed here, I will include it in my next patch series.

Huh, have you looked at sdl-0002-fix-compilation-with-libx11.patch in
package/sdl/ ?

It would be good if you could resend a complete patch series with all
the patches that you believe are still pending on libdrm/mesa/X.org. Of
course, make sure you take into account the comments that have been
given on the patches already.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
