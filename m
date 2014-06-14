From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 14 Jun 2014 06:49:15 +0200
Subject: [Buildroot] [PATCH] kernel headers: remove deprecated version
	3.8
In-Reply-To: <8738f8eenn.fsf@dell.be.48ers.dk>
References: <bf13a7c05006c4236c99.1402687305@localhost>
 <8738f8eenn.fsf@dell.be.48ers.dk>
Message-ID: <2c99e7d1-68f6-4ef2-a425-e80024e472ae@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> schreef:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> > Kernel headers version 3.8.x has been deprecated since 2013.08 and thus can
> > be removed in 2014.08.
> > An automatic selection of 3.9.x headers is performed in the legacy menu.
> > Existing automatic selections of 3.8.x headers are modified to select
> > 3.9.x.
>
> > As this patch removes the last occurrence of BR2_DEPRECATED_SINCE_2013_08,
> > the symbol is removed too.
>
> > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
>Committed, thanks.
>
>It didn't apply to HEAD (because of the version bumps of last
>wednesday), so I had to fix up the patch manually.
>
>Please consider rebasing your patches before submitting.

Sorry, I usually do but seems I forgot it this time...

Thanks,
Thomas
