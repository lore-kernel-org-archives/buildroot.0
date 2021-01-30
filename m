From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 10:28:43 +0100
Subject: [Buildroot] [PATCH v3,
 1/6] package/libupnp: security bump to version 1.14.0
In-Reply-To: <87eei4yxii.fsf@dell.be.48ers.dk>
References: <20210125194949.1173139-1-fontaine.fabrice@gmail.com>
 <87bld83me1.fsf@dell.be.48ers.dk> <87eei4yxii.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W80xSxO48N_Wa6=W81H8G6S_XU6trfMEOwS3Pc4d_JgfTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le ven. 29 janv. 2021 ? 09:09, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>  >> - Fix CallStranger a.k.a. CVE-2020-12695 as well as CVE-2020-13848
>  >> - Update indentation in hash file (two spaces)
>  >> - Backport all changes from libupnp18 to libupnp:
>  >> - Use COPYING instead of LICENSE (no license change)
>  >> - Add host-pkgconf dependency
>  >> - Add --enable-reuseaddr
>  >> - Add openssl optional dependency
>
>  >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  >> ---
>  >> Changes v2 -> v3:
>  >> - Rebase on current master
>
>  > Committed to 2020.02.x and 2020.11.x, thanks.
>
> This unfortunately breaks the old linphone stack on 2020.02.x, so I will
> bump bctoolbox/ortp/mediastreamer/linphone.
linphone also needs belle-sip and belr, I'll send a patch to add them
in 2020.02.x.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
