From: servo gmrt <servo.gmrt@gmail.com>
Date: Fri, 31 Jan 2014 16:39:25 +0530
Subject: [Buildroot] buildroot(busybox) problem with ccache during
 rtai-4.0-test2 compiling.
In-Reply-To: <20140131090444.725c88d4@skate>
References: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>
 <20140130200821.2c0559d8@skate>
 <CAEqQue1tHGgSoRZ10S1onLNVoWVTB5wvtHEZoNSsH6rqz-808g@mail.gmail.com>
 <20140131090444.725c88d4@skate>
Message-ID: <CAEqQue1m_d_ouJMoHqzjyvWawHFry_1C9S39E=1AeyJqFD6R9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build integrated linux-kernal, rootfs, and rtai,

To complie rtai, I enabled rtai and patch location in .config file. Other
than that I have not made any changes in any of the buildroot files.

Is there any changes I should make in buoldroot before buliding RTAI ?

Thanks & Regards,
B.Thiyagarajan


On Fri, Jan 31, 2014 at 1:34 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear servo gmrt,
>
> On Fri, 31 Jan 2014 10:43:54 +0530, servo gmrt wrote:
>
> >  Thanks for the replay,
> >
> >  I am applied rtai-4.0 hal patches to linux source (3.8.13) folder in
> > output/build/ directory, and i configured rtai-4.0.
> >
> >  I am attaching the buildroot, linux-3.8.13 and rtai-config files for
> your
> > references.
>
> Thanks, but to be able to build RTAI 4.0 altogether, you have certainly
> made changes to Buildroot itself. This is the changes I am asking for,
> so that I can reproduce your problem.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140131/a9756709/attachment.html>
