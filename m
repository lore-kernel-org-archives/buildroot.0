From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 4 Sep 2015 12:22:58 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] package/pkg-kernel-module.mk:
	module	build fails
In-Reply-To: <87r3memr8f.fsf@dell.be.48ers.dk>
References: <1441157873-12285-1-git-send-email-rdkehn@yahoo.com>
 <20150902092651.GB3585@free.fr> <87r3memr8f.fsf@dell.be.48ers.dk>
Message-ID: <392224124.190077.1441362178515.JavaMail.zimbra@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

----- Mail original -----
> De: "Peter Korsgaard" <peter@korsgaard.com>
> ?: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: "buildroot" <buildroot@buildroot.org>
> Envoy?: Vendredi 4 Septembre 2015 12:08:32
> Objet: Re: [Buildroot] [PATCH 1/1] package/pkg-kernel-module.mk: module	build fails

>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
> >> Fix LINUX_DIR reference when determining if kernel configuration
> >> supports loadable modules.
> 
> > Dang.. I let that skip before the release...
> 
> >> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> 
> > On principle:
> 
> > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> > However, there's a series that did not have time to make it to master
> > before the release, and that is an improvement over the current
> > situation, which would render this patch moot:
> 
> >     https://patchwork.ozlabs.org/patch/510186/
> >     https://patchwork.ozlabs.org/patch/510187/
> >     https://patchwork.ozlabs.org/patch/510188/
> 
> > So, even though this patch is good, I'd prefer we aply the series
> > instead.
> 
> Yes, I'll do so shortly for master.
> 
> > Still, the kernel-module infra is indeed broken in the release, thus
> > making all kernel module packages broken. I'll Oeter and Thomas decide
> > whether we want to put out a .1 release to fix just that.
> 
> I've created a 2015.08.x branch and applied it. I'll wait a few days and
> see if anything else shows up before releasing 2015.08.1.

Since you are preparing a bug fix release, can you backport this little
patch ? ;-)
http://patchwork.ozlabs.org/patch/512785/

Thanks!

Best regards,
Romain
> 
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
