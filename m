From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 17:02:21 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-20
In-Reply-To: <20141122125901.GA4295@free.fr>
References: <20141121073012.9FBBB1015C0@stock.ovh.net>
 <20141122125901.GA4295@free.fr>
Message-ID: <20141122170221.76a772f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 22 Nov 2014 13:59:01 +0100, Yann E. MORIN wrote:

> In file included from svg/SVGAnimateMotionElement.cpp:37:0,
>                  from svg/SVGAllInOne.cpp:36:
> svg/SVGPathElement.h: In member function 'virtual WebCore::FloatRect
> WebCore::SVGPathElement::_ZTv0_n24_N7WebCore14SVGPathElement7getBBoxENS_12SVGLocatable19StyleUpdateStrategyE(WebCore::SVGLocatable::StyleUpdateStrategy)':
> svg/SVGPathElement.h:95:23: internal compiler error: in
> expand_expr_addr_expr_1, at expr.c:7669
>      virtual FloatRect getBBox(StyleUpdateStrategy = AllowStyleUpdate);
>                        ^
> 
>     http://autobuild.buildroot.net/results/22b/22b6c928e8d795f950888cb3e1cdd4ad97d98e32/
>     http://autobuild.buildroot.net/results/5af/5aff88b8c3fcbb21be5c96a0b0c358b1d71c3e96/
>     ...
> 
> They seem to all happen with the same ARM toolchain:
>     http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2014.08.tar.bz2

Already reported in gcc upstream, and I provided the test case. See
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61207.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
