From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 20 Feb 2015 08:37:26 +0200
Subject: [Buildroot] [PATCH] toolchain-external: clarify external
 toolchain description
In-Reply-To: <20150219213618.7bb7a0b4@free-electrons.com>
References: <13d64548b894fc1b351af2f9bbb861ce230144d0.1424173685.git.baruch@tkos.co.il>
 <20150219213618.7bb7a0b4@free-electrons.com>
Message-ID: <20150220063726.GR2937@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Feb 19, 2015 at 09:36:18PM +0100, Thomas Petazzoni wrote:
> On Tue, 17 Feb 2015 13:48:05 +0200, Baruch Siach wrote:
> >  # This package implements the support for external toolchains, i.e
> > -# toolchains that have not been produced by Buildroot itself and that
> > -# Buildroot can download from the Web or that are already available on
> > -# the system on which Buildroot runs. So far, we have tested this
> > +# toolchains that have not been produced locally by Buildroot itself and
> 
> I am not sure adding "locally" makes the thing clearer: you can very
> well produce a toolchain with Buildroot "locally", and then re-use it
> in a later Buildroot build as an external toolchain on the same machine.
> 
> Maybe we should simply rephrase this as:
> 
>   This package implements the support for external toolchains, i.e
>   toolchains that are available pre-built, ready to use. Such toolchain
>   me either be readily available on the Web (Linaro, Sourcery

s/me/may/

>   CodeBench, from processor vendors) or may be built with tools like
>   Crosstool-NG or Buildroot itself.

Looks good to me. Would you like me to send a patch?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
