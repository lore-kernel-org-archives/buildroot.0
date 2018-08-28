From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Mon, 27 Aug 2018 20:11:51 -0600
Subject: [Buildroot] SDL2+directfb combo does not work as built by
 buildroot-2018.02.3
In-Reply-To: <CAGrGpJDVHStp8MUZaGb1=ZfWud-k4fQP=piwsc-QfftCDFyKog@mail.gmail.com>
References: <CAGrGpJDVHStp8MUZaGb1=ZfWud-k4fQP=piwsc-QfftCDFyKog@mail.gmail.com>
Message-ID: <CAGrGpJA=Kk0fGjMPfH3R1ZbyJbonPNPQoyC_tpjaF9Ua92BNNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

RESOLVED
SDL2-2.0.8 works on Beaglebone Black using DirectFB provided the following
patch is applied to SDL2-2.0.8.

https://hg.libsdl.org/SDL/raw-rev/751cdc74d55c

The patch was created by Sam Lantinga and will be incorporated into the
next release of SDL2.

Peter

On Sun, Aug 26, 2018 at 5:11 AM, Peter Thompson <
peter.macleod.thompson@gmail.com> wrote:

> I cannot get directfb + SDL2 working on Beaglebone Black  (see Bugzilla
> #4232 and SDL forums)
>     https://bugzilla.libsdl.org/show_bug.cgi?id=4232
>     https://discourse.libsdl.org/u/PeterThompson/activity
>
> I do not want to use X windows for the video driver.  I tried adding
> OpenGL ES to the rootfs but for that I need efl which in turn needs the
> kernel built by Buildroot.  I have a working kernel which I want to work on
> separately to attach a new display and prefer not to be forced to always
> build it through Buildroot.
>
> Suggestions?
>
> Note: SDL2+directfb combo used to work on igepv2 buildroot-2015.08.1.   I
> am just trying to migrate to the beaglebone black.
>
>
> Peter Thompson
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180827/452c7e54/attachment.html>
