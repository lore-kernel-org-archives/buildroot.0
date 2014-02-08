From: servo gmrt <servo.gmrt@gmail.com>
Date: Sat, 8 Feb 2014 18:49:29 +0530
Subject: [Buildroot] buildroot(busybox) problem with ccache during
 rtai-4.0-test2 compiling.
In-Reply-To: <52F0ADF4.8080509@mind.be>
References: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>
 <20140130200821.2c0559d8@skate>
 <CAEqQue1tHGgSoRZ10S1onLNVoWVTB5wvtHEZoNSsH6rqz-808g@mail.gmail.com>
 <20140131090444.725c88d4@skate>
 <CAEqQue1m_d_ouJMoHqzjyvWawHFry_1C9S39E=1AeyJqFD6R9Q@mail.gmail.com>
 <52F0ADF4.8080509@mind.be>
Message-ID: <CAEqQue2LWkRXk6xDW=znSzenJ41kGeRNc_uGj0bOM0ChhkEKeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

     Herewith I am attaching the changes I made in the buildroot, to
compile the rtai-4.0.

    I took the 02-08-2014 daily snapshot from buildroot download repository.

    I used the following command to generate the patch,

      "diff -uprN working-dir original-source-dir"

    Is above command sufficient or do I need to add any flags along with
diff command.


Regards,
B.Thiyagarajan





On Tue, Feb 4, 2014 at 2:38 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 31/01/14 12:09, servo gmrt wrote:
> > I am trying to build integrated linux-kernal, rootfs, and rtai,
> >
> > To complie rtai, I enabled rtai and patch location in .config file. Other
> > than that I have not made any changes in any of the buildroot files.
> >
> > Is there any changes I should make in buoldroot before buliding RTAI ?
>
>  The RTAI version we have in buildroot is RTAI 3.8.1. So if you are
> building RTAI 4.0, it means you are using a fork. So either you have to
> contact the maintainer of your fork, or you have to give us the patches
> that were applied in order to use RTAI 4.0.
>
>  Regards,
>  Arnout
>
> >
> > Thanks & Regards,
> > B.Thiyagarajan
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140208/3f721cd3/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: rtai-diff.patch
Type: text/x-patch
Size: 563 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140208/3f721cd3/attachment.bin>
