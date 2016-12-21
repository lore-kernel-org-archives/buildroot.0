From: Linux User <newhorizons009@gmail.com>
Date: Wed, 21 Dec 2016 10:04:23 -0500
Subject: [Buildroot] logrotate error
In-Reply-To: <20161221145757.727602a2@free-electrons.com>
References: <CA+12NBJSywCO=azSzUtUdSS3irhXTUnhNpcRL6Rr-R=g_9UbHQ@mail.gmail.com>
 <20161221145757.727602a2@free-electrons.com>
Message-ID: <CA+12NBJ5z0KaFhBWGQ9XARzbuAwKCo5Px7ZZvL-OFxjz=O-pSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Certainly I will give it a go and post my findings. Thanks Thomas.

On Wed, Dec 21, 2016 at 8:57 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Wed, 21 Dec 2016 08:22:34 -0500, Linux User wrote:
>
> > I enabled the logrotate package through the menuconfig, and my
> compilation
> > breaks. Can someone pls shed some light.
>
> This type of error really smells like you did a first build, then
> changed your Buildroot configuration, and restarted the build, without
> doing a "make clean".
>
> Can you please check if you can reproduce after a "make clean all" ?
>
> In any case, please read
> https://buildroot.org/downloads/manual/manual.html#full-rebuild.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161221/4897f419/attachment.html>
