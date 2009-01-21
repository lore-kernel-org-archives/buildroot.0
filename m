From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 21 Jan 2009 08:31:14 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/xerces
In-Reply-To: <87y6x5vc74.fsf@macbook.be.48ers.dk>
References: <20090120213447.41570770AD@busybox.osuosl.org>
	<87y6x5vc74.fsf@macbook.be.48ers.dk>
Message-ID: <1232523074.11888.2.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-20 klockan 23:34 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-20 21:34:46 +0000 (Tue, 20 Jan 2009)
>  ulf> New Revision: 24928
> 
>  ulf> Log:
>  ulf> Bump xerces-c to latest stable, ARM build now completes
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/package/xerces/Config.in
>  ulf>    trunk/buildroot/package/xerces/xerces.mk
> 
> How about converting to Makefile.autotools.in format while you're at
> it?

I think my priority is to get things to build at all.

Once all packages build, then it will not be hard
to get most of them into Makefile.autotools.in 

BTW: Makefile.autotools.in does not support compressed
patches *.patch.gz, *.patch.bz2, is that intentional?

BR
Ulf Samuelsson

>  ulf> +xerces-unpacked: $(XERCES_DIR)/.unpacked
>  ulf> +
>  ulf>  xerces-clean:
>  ulf>  	rm -rf $(STAGING_DIR)/usr/include/xercesc
>  ulf>  	rm -f $(STAGING_DIR)/lib/libxerces*
> 
> TARGET_DIR cleanup stuff seems to be missing.
> 

OK, Have a look at it later.
BR
Ulf Samuelsson
