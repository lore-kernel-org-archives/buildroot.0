From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 1 Sep 2014 21:58:18 +0200
Subject: [Buildroot] [PATCH] bfin: disable newer binutils for internal
 toolchain
In-Reply-To: <20140831144132.0b995b4e@free-electrons.com>
References: <20140831082454.GA3986@waldemar-brodkorb.de>
 <20140831144132.0b995b4e@free-electrons.com>
Message-ID: <20140901195817.GU30210@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Sun, 31 Aug 2014 10:24:54 +0200, Waldemar Brodkorb wrote:
> > You get following linking error, when trying to build a
> > toolchain for bfin with newer binutils:
> > bfin-buildroot-linux-uclibc/bin/ld: fde encoding in _divdi3_s.o(.eh_frame) prevents .eh_frame_hdr table being created.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> >  package/binutils/Config.in.host |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Could you report the bug to upstream binutils? I'd like to be able to
> get rid of binutils 2.22 at some point.
> 
> Thanks a lot!

Done:
https://sourceware.org/bugzilla/show_bug.cgi?id=17334

best regards
 Waldemar
