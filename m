From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 16 Dec 2020 23:46:20 +0100
Subject: [Buildroot] [PATCH 2/2] package/bind: fix mdig library
 dependencies
In-Reply-To: <sjaqahxhgg.ln2@ID-313208.user.individual.net>
References: <20201212091306.222405-1-bernd.kuhls@t-online.de>
 <20201212091306.222405-2-bernd.kuhls@t-online.de>
 <20201214231433.6cbf6aab@gmx.net>
 <sjaqahxhgg.ln2@ID-313208.user.individual.net>
Message-ID: <20201216234620.1cb17aeb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Wed, 16 Dec 2020 22:25:48 +0100, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Hi Peter,
>
> Am Mon, 14 Dec 2020 23:14:33 +0100 schrieb Peter Seiderer:
>
> >> +Upstream status: pending upload
> >
> > What does 'pending upload' mean?
>
> this describes the fact that I am unable to register on gitlab.com, their
> verification mail does not arrive so I can not activate my account ;)

I used (as suggestd by Petr Vorel):

	https://gitlab.isc.org/isc-projects/bind9

>
> > Dependency entry '${ISCCFGDEPLIBS}' missing?
>
> Yes, combined with your upstream patch I think your patch should be
> applied, so I closed mine as "rejected".

Thanks (and hoping the suggested patch is accepted in one form or the
other from upstream)...

Regards,
Peter


>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
