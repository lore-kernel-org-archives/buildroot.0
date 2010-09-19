From: Martin Banky <Martin.Banky@gmail.com>
Date: Sat, 18 Sep 2010 17:35:29 -0700
Subject: [Buildroot] [PATCH 09/21] gmp: bump to 5.0.1
In-Reply-To: <20100918190326.40e2090d@surf>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-9-git-send-email-Martin.Banky@gmail.com>
	<20100918190326.40e2090d@surf>
Message-ID: <AANLkTikWC9jReaZUyLeDeMXwoO90dgSrvbjiu17yHW_E@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
     Per the INSTALL file in mpfr:
"As gmp-impl.h and longlong.h are only in the GMP source directory,
you first need to copy these files to the build directory if it is
different (there may be other workarounds, such as setting $CPPFLAGS
to search the GMP source directory)."
I will change the commit log to reflect this, when I resubmit the patch set
with the other asked for changes.

Martin

On Sat, Sep 18, 2010 at 10:03 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Mon, 13 Sep 2010 20:40:36 -0700
> Martin Banky <martin.banky@gmail.com> wrote:
>
> > +     (cd $(GMP_TARGET_DIR); rm -rf config.cache; cp
> $(GMP_DIR)/longlong.h $(GMP_DIR)/gmp-impl.h ./; \
>
> Why ? Even if it's really needed, a little bit of explanation in the
> commit log would help.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100918/333e0d67/attachment.html>
