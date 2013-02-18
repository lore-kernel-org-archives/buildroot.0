From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 18 Feb 2013 18:01:50 +0200
Subject: [Buildroot] multchoice menu with kconfig
In-Reply-To: <51224F93.9060102@mind.be>
References: <5122315C.3070806@petroprogram.com> <512249D5.5020107@mind.be>
 <51224C88.4020108@petroprogram.com> <51224F93.9060102@mind.be>
Message-ID: <5122506E.8030008@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

18.2.2013 17:58, Arnout Vandecappelle kirjoitti:
> On 18/02/13 16:45, Stefan Fr?berg wrote:
>> So that buildroot BR2_ENABLE_LOCALE_WHITELIST variable seems to do the
>> exactly same thing as gentoo's ${LINGUAS} variable ?
>> Just put the locales you want to keep and everything else is removed at
>> the final step of finishing rootfs ?
>>
>> It would be perfect
>
>  Yep. Check out the target-purgelocales goal in the top-level Makefile.
>
>  It's not enabled by default, though. You need to have
> BR2_ENABLE_LOCALE_PURGE set.
>
>  Regards,
>  Arnout
>

Thanks!

I also noticed that you had submitted host-gettext patch yesterday.

And because this iso-codes package does not seem to have nothing but
punch .po files
and not link against anything then changing that ISO_CODES_DEPENDENCIES
to host-gettext should be good.

Thanks again !

Regards
Stefan
