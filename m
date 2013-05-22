From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 22 May 2013 23:12:29 +0800
Subject: [Buildroot] Does buildroot toolchain support GNU EABI?
In-Reply-To: <CAGm1_kt83BK9b4vQqZpH+mjArK6SmbhdruUUEn4TSAUcS2JXXg@mail.gmail.com>
References: <20130522092041.GA15526@zuhnb712.ap.bm.net>
 <CAGm1_kt83BK9b4vQqZpH+mjArK6SmbhdruUUEn4TSAUcS2JXXg@mail.gmail.com>
Message-ID: <CAAsE_uenmk7_qFshg+8z=T4x+oEso143z0r_u8zbKdH10Z2gGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? 2013-5-22 PM5:34?"Yegor Yefremov" <yegorslists@googlemail.com>???
>
> On Wed, May 22, 2013 at 11:20 AM, Woody Wu <narkewoody@gmail.com> wrote:
> > Hi,
> >
> > I found my buildroot toolchain is using EABI version 5. But I want to
> > create executable run an existed system that is using GNU EABI.
> >
> > Actuall, I don't know what GNU EABI is.  Can I configure buildroot to
> > support this? And, how?
>
> BR toolchains are always EABI unless you specify it to generate OABI
> binaries. See Wikipaedia for EABI info:
> http://en.wikipedia.org/wiki/EABI#EABI
>
> Yegor

Hi, Yegor

When I compile my new program using buildroot toolchain and link it to a
old shared library buit from another uClibC toolchain, it reported EABI
version mismatch. My new program is EABI version 5, and the expected to be
linked (-lfoo) is EABI version 0. When using readelf to check the library
file, it reported it's GNU EABI.  That why I thought I should try to make
my buildroot to generate GNU EABI object.  If I messed some concept, could
you please tell me what should I do?

Thanks!
-narke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130522/e6bda25d/attachment.html>
