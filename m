From: =?UTF-8?B?QXJuYXVkIFLDqWJpbGxvdXQ=?= <rebillout@syscom.ch>
Date: Mon, 11 Mar 2013 10:51:14 +0100
Subject: [Buildroot] [PATCH] flot: add fillbetween plugin.
In-Reply-To: <87sj42vr7g.fsf@dell.be.48ers.dk>
References: <1360769145-1610-1-git-send-email-rebillout@syscom.ch>
 <87sj42vr7g.fsf@dell.be.48ers.dk>
Message-ID: <513DA912.6090500@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You have sharp eyes !

Thanks for committing,

Regards,
Arnaud

On 03/10/2013 11:13 PM, Peter Korsgaard wrote:
>>>>>> "Arnaud" == Arnaud R?billout<rebillout@syscom.ch>  writes:
>   Arnaud>  Flot plugin for computing bottoms for filled line and bar charts.
>   Arnaud>  Signed-off-by: Arnaud R?billout<rebillout@syscom.ch>
>   Arnaud>  ---
>   Arnaud>   package/flot/Config.in |    5 +++++
>   Arnaud>   package/flot/flot.mk   |    1 +
>   Arnaud>   2 files changed, 6 insertions(+)
>
>   Arnaud>  diff --git a/package/flot/Config.in b/package/flot/Config.in
>   Arnaud>  index 60534c1..0124b2d 100644
>   Arnaud>  --- a/package/flot/Config.in
>   Arnaud>  +++ b/package/flot/Config.in
>   Arnaud>  @@ -20,6 +20,11 @@ if BR2_PACKAGE_FLOT
>
>   Arnaud>   comment "flot plugins"
>
>   Arnaud>  +config BR2_PACKAGE_FLOT_FILLBETWEEN
>   Arnaud>  +	bool "fillbetween"
>   Arnaud>  +	help
>   Arnaud>  +	  Flot plugin for computing bottoms for filled line and bar charts.
>
> You have a trailing space here in the help text.
>
> Otherwise it looks good, committed - Thanks.
>


-- 
Arnaud R?billout
SYSCOM Instruments SA
rue de l'industrie 21
CH-1450 Sainte-Croix
Switzerland
Tel: +41 (0)24 455 44 11
