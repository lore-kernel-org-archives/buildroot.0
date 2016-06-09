From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 23:42:56 +0200
Subject: [Buildroot] patch for sdl2_gfx, sdl2_image, sdl2_ttf
In-Reply-To: <CAGrGpJAcPA=Uif1YkULLTyMpqE28fX-2sqRV6Oa5Lj4yC8jNHw@mail.gmail.com>
References: <CAGrGpJAcPA=Uif1YkULLTyMpqE28fX-2sqRV6Oa5Lj4yC8jNHw@mail.gmail.com>
Message-ID: <20160609234256.1a004f8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 9 Jun 2016 15:18:34 -0600, Peter Thompson wrote:

> Attached is a patch which adds sdl2_gfx, sdl2_image and sdl2_ttf to
> Buildroot-2016.05.   The patch has been tested by running some of my SDL2
> applications on a rootfs created by Buildroot-2016.05 with the attached
> patch applied. The test was on igepv2 board using linux-omap-2.6.37-6.
> 
> If the patch is useful, and you would like me to submit/publish it more
> formally, (eg via git commit) please let me know.  This is my first time
> submitting a patch anywhere - hence my hesitancy.

Thanks for this contribution. Yes we are interested, so please make
this patch three Git commits (one per package), and then use git
format-patch + git send-email to send the patches. See the Buildroot
manual, it has all the details on how to create and send patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
