From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 06 Jan 2014 16:18:03 +0100
Subject: [Buildroot] [PATCH v2] Add LBreakout2 package (SDL game)
In-Reply-To: <87vbxxxjp9.fsf@dell.be.48ers.dk>
References: <1389009246-23441-1-git-send-email-julien.boibessot@free.fr>
 <87vbxxxjp9.fsf@dell.be.48ers.dk>
Message-ID: <52CAC92B.6030403@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/06/2014 03:34 PM, Peter Korsgaard wrote:
>>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:
>  > From: Julien Boibessot <julien.boibessot@armadeus.com>
>  > Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
>  > ---
>  >  Changes since v1:
>  >  - took Thomas remarks into account: SF dl, version, license and confiure
>  >    options
>
> It needs gettext when built with uclibc+locale. Committed with that
> fixed, thanks.
>

That's why I had a "LBREAKOUT2_CONF_OPT = --disable-nls" in the first
version on my patch.
But I think your solution is cleaner.

Thanks.

Regards,
Julien
