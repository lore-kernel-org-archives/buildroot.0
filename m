From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Aug 2014 14:41:32 +0200
Subject: [Buildroot] [PATCH] bfin: disable newer binutils for internal
 toolchain
In-Reply-To: <20140831082454.GA3986@waldemar-brodkorb.de>
References: <20140831082454.GA3986@waldemar-brodkorb.de>
Message-ID: <20140831144132.0b995b4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 31 Aug 2014 10:24:54 +0200, Waldemar Brodkorb wrote:
> You get following linking error, when trying to build a
> toolchain for bfin with newer binutils:
> bfin-buildroot-linux-uclibc/bin/ld: fde encoding in _divdi3_s.o(.eh_frame) prevents .eh_frame_hdr table being created.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/binutils/Config.in.host |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Could you report the bug to upstream binutils? I'd like to be able to
get rid of binutils 2.22 at some point.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
