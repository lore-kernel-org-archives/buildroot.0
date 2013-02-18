From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 18 Feb 2013 18:16:08 +0200
Subject: [Buildroot] multchoice menu with kconfig
In-Reply-To: <512251F3.7060101@mind.be>
References: <5122315C.3070806@petroprogram.com> <512249D5.5020107@mind.be>
 <51224C88.4020108@petroprogram.com> <51224F93.9060102@mind.be>
 <5122506E.8030008@petroprogram.com> <512251F3.7060101@mind.be>
Message-ID: <512253C8.2050309@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

18.2.2013 18:08, Arnout Vandecappelle kirjoitti:
> On 18/02/13 17:01, Stefan Fr?berg wrote:
>> And because this iso-codes package does not seem to have nothing but
>> punch .po files
>> and not link against anything then changing that ISO_CODES_DEPENDENCIES
>> to host-gettext should be good.
>
>  Err... But iso-codes doesn't need host-gettext, does it? It probably
> doesn't make much sense without locale support in the toolchain, but
> otherwise I see no dependencies except python (which is already a
> buildroot dependency).
>

But don't you need at least host gettext stuff to process those .po files ?

I should now tell at this point that besides giving  -lintl linker flags
and giving --disable-nls to configure scripts
I absolutely have no idea how gettext works. :D

Im confused now.
So no dependencies at all ????? Or gettext dependencies with locale
checking ?????? (Like Thomas said in his post)

Regards
Stefan
