From: Heiko Zuerker <heiko@zuerker.org>
Date: Sat, 4 Dec 2010 11:21:18 -0600
Subject: [Buildroot] external toolchain and iconv in libglib2.mk
In-Reply-To: <1291483060.14151.2478.camel@coalu.atr>
References: <003201cb93d6$8162a080$8427e180$@zuerker.org>
	<1291483060.14151.2478.camel@coalu.atr>
Message-ID: <004501cb93d7$a9c039b0$fd40ad10$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Lionel Landwerlin
> Sent: Saturday, December 04, 2010 11:18 AM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] external toolchain and iconv in libglib2.mk
> 
> Le samedi 04 d?cembre 2010 ? 11:13 -0600, Heiko Zuerker a ?crit :
> > Hey,
> >
> > I?m using crosstools-ng (configured as external toolchain) with iconv
> > support.
> >
> > The host-libglib2 compile fails without the line:
> >
> > HOST_LIBGLIB2_CONF_OPT += --with-libiconv=gnu
> >
> > I?m not sure how to fix this correctly, any suggestions?
> >
> It sounds like an host related problem...
> Could you give us some more details about the distribution you're using ?

I'm actually using an older version of linux-from-scratch in a chroot jail, in order to provide a controlled environment for the build.
It uses glibc 2.10.1 with iconv support enabled.
 
-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org
