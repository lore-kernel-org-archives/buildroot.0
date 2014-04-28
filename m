From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 28 Apr 2014 22:48:38 +0200
Subject: [Buildroot] [PATCH 1/4] evemu: disable tests via evemu
 configure option
In-Reply-To: <535EABB9.1040106@mind.be>
References: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
 <1398711632-5831-2-git-send-email-ps.report@gmx.net>,
 <535EABB9.1040106@mind.be>
Message-ID: <trinity-8b8c37eb-26d1-4ccb-874c-588b0694969d-1398718118028@3capp-gmx-bs30>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

> Gesendet: Montag, 28. April 2014 um 21:27 Uhr
> Von: "Arnout Vandecappelle" <arnout@mind.be>
> An: "Peter Seiderer" <ps.report@gmx.net>, buildroot at busybox.net
> Cc: "Peter Korsgaard" <jacmet@uclibc.org>
> Betreff: Re: [Buildroot] [PATCH 1/4] evemu: disable tests via evemu configure option
>
> On 28/04/14 21:00, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  It would have been nice to have used evemu-0002-... instead of
> evemu-0005-.... It would also have been nice to avoid the [5/8] in the
> patch subject. But neither remark is critical.
> 

O.k. will fix both in next patch version...

Regards,
Peter

>  Regards,
>  Arnout
> 
> > ---
> >  package/evemu/evemu-0002-disable-tests.patch       | 19 ----------
> >  ...005-configure.ac-add-disable-tests-option.patch | 44 ++++++++++++++++++++++
> >  package/evemu/evemu.mk                             |  3 ++
> >  3 files changed, 47 insertions(+), 19 deletions(-)
> >  delete mode 100644 package/evemu/evemu-0002-disable-tests.patch
> >  create mode 100644 package/evemu/evemu-0005-configure.ac-add-disable-tests-option.patch
> [snip]
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> 
