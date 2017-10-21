From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sat, 21 Oct 2017 18:58:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: bump version to 2.3.0
In-Reply-To: <20171021175958.56a34929@windsurf>
References: <20171015202717.22211-1-bernd.kuhls@t-online.de>
 <20171021175958.56a34929@windsurf>
Message-ID: <CALdGskJxEYJ-kpm_Seprhk11fQKVoCxv3TLT8_2DTd7K6j99tQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Looks like it is looking for openjpeg2.2 headers, should be changed to
openjpeg-2.3

make[5]: Entering directory
`/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/build/gst1-plugins-bad-1.12.3/ext/srtp'
  CC       libgstsrtp_la-gstsrtp.lo
In file included from gstopenjpegdec.h:29:0,
                 from gstopenjpegdec.c:27:
gstopenjpeg.h:42:37: fatal error: openjpeg-2.2/openjpeg.h: No such
file or directory
 #  include <openjpeg-2.2/openjpeg.h>

Regards Olivier


On 21 October 2017 at 17:59, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Sun, 15 Oct 2017 22:27:17 +0200, Bernd Kuhls wrote:
> > Removed patch 0003, applied upstream:
> > https://github.com/uclouvain/openjpeg/commit/
> 51a1dcaa6ed5713520dca36fc58cd9240c08b7ca
> >
> > Renamed patch 0004.
> >
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>
> I'm not sure if it's caused by this patch, but there are some
> gstreamer/openjpeg issues:
>
>   http://autobuild.buildroot.net/results/884/
> 884956af56f63b2634a1984f5ea416075ed87bc8/build-end.log
>
> Could you have a look?
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171021/33be78fe/attachment.html>
