From: servo gmrt <servo.gmrt@gmail.com>
Date: Fri, 31 Jan 2014 10:43:54 +0530
Subject: [Buildroot] buildroot(busybox) problem with ccache during
 rtai-4.0-test2 compiling.
In-Reply-To: <20140130200821.2c0559d8@skate>
References: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>
 <20140130200821.2c0559d8@skate>
Message-ID: <CAEqQue1tHGgSoRZ10S1onLNVoWVTB5wvtHEZoNSsH6rqz-808g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

 Thanks for the replay,

 I am applied rtai-4.0 hal patches to linux source (3.8.13) folder in
output/build/ directory, and i configured rtai-4.0.

 I am attaching the buildroot, linux-3.8.13 and rtai-config files for your
references.




* For your kind informaion i added qiv and xv packages to ,   Target
Packages -----> Graphic libraries and applications*,



Regards,

B.Thiyagarajan


On Fri, Jan 31, 2014 at 12:38 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Thu, 30 Jan 2014 19:23:38 +0530, servo gmrt wrote:
> > Dear All,
> >
> > I am trying to build rtai-4.0-test2 but it fails on my system
> >
> > I am using buildroot-2014.02 version
> >
> > When I compile the RTAI-4.0-test2 version I am getting the following
> error
> > messages,
>
> Please provide the patches you applied to Buildroot in order to build
> RTAI 4.0, so that we can reproduce the problem.
>
> >
> `/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/arch/x86/hal'
> > /run/media/thiyagu/data/buildroot/output/host/usr/bin/ccache: invalid
> > option -- 'E'
>
> This is most likely caused by missing quotes around $(CC) somewhere,
> but we would have to reproduce.
>
> > Please help to resolve the issue.
>
> Only if you provide the necessary elements :-)
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140131/d8992f8b/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-config
Type: application/octet-stream
Size: 47591 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140131/d8992f8b/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-3.8.13-config
Type: application/octet-stream
Size: 66722 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140131/d8992f8b/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: rtai-4.0-test2-config
Type: application/octet-stream
Size: 1979 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140131/d8992f8b/attachment-0002.obj>
