From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 22 Oct 2007 23:27:53 +1000
Subject: [Buildroot] Can not build toolchain for arm.
In-Reply-To: <471C7798.3030005@sfktech.com>
References: <20071021120218.1C89BA4A39@busybox.net>
	<471C7307.1020204@sfktech.com> <471C9104.5000005@promwad.com>
	<471C7798.3030005@sfktech.com>
Message-ID: <20071022132753.GA27339@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 22, 2007 at 12:12:40PM +0200, Kim Str?ger wrote:
> Kuten Ivan wrote:
> > Kim Str?ger wrote:
> >> I am trying to build just the toolchain for the arm processor,  using
> >> buildroot:  At revision 20315
> >> but I am stock with this error ??
> >>
> >> /home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:2124:
> >> error: '__mf_biglock' undeclared (first use in this function)
> >> make[5]: *** [pth/mf-runtime.lo] Error 1
> >> make[5]: Leaving directory
> >> `/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
> >
> > Please provide your .config
> > I have built 4.2.1 armv4 920t  with soft-float and without soft-float successfully.
> my .config

How about config.log from somewhere in
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap ?

I built gcc-4.2.1 + armeb + soft-float + oabi last week ok.

Did you tweak your uClibc configuration at all, eg to disabling
threading?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
