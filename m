From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 21 Oct 2017 19:52:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: bump version to 2.3.0
In-Reply-To: <20171021190120.2652d095@windsurf>
References: <20171015202717.22211-1-bernd.kuhls@t-online.de>
 <20171021175958.56a34929@windsurf>
 <CALdGskJxEYJ-kpm_Seprhk11fQKVoCxv3TLT8_2DTd7K6j99tQ@mail.gmail.com>
 <20171021190120.2652d095@windsurf>
Message-ID: <20171021195237.7dd23f8d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Olivier,

On Sat, 21 Oct 2017 19:01:20 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Sat, 21 Oct 2017 18:58:33 +0200, Olivier Schonken wrote:
> 
> > Looks like it is looking for openjpeg2.2 headers, should be changed to
> > openjpeg-2.3
> > 
> > make[5]: Entering directory
> > `/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/build/gst1-plugins-bad-1.12.3/ext/srtp'
> >   CC       libgstsrtp_la-gstsrtp.lo
> > In file included from gstopenjpegdec.h:29:0,
> >                  from gstopenjpegdec.c:27:
> > gstopenjpeg.h:42:37: fatal error: openjpeg-2.2/openjpeg.h: No such
> > file or directory
> >  #  include <openjpeg-2.2/openjpeg.h>  
> 
> Will you send a patch? :-)

There is a upstream patch handling this error 'gst-plugins-bad: openjpeg:
Support building with openjpeg 2.3' ([1]), maybe worth a try?

Regards,
Peter

[1] https://lists.freedesktop.org/archives/gstreamer-commits/2017-October/103076.html

> 
> Thanks!
> 
> Thomas
