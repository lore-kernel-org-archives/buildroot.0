From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 09:52:17 +0200
Subject: [Buildroot] [PATCH 2/2] package/pkg-kconfig: define
 KCONFIG_EDITORS_MAKE_ENV
In-Reply-To: <1435823045.2966.23.camel@synopsys.com>
References: <1435582227-26345-1-git-send-email-talz@ezchip.com>
 <1435582227-26345-2-git-send-email-talz@ezchip.com>
 <1435823045.2966.23.camel@synopsys.com>
Message-ID: <20150702095217.6813b8c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu, 2 Jul 2015 07:44:05 +0000, Alexey Brodkin wrote:

> I'm wondering why did you put 2 patches in one series?
>  [1] https://patchwork.ozlabs.org/patch/489307/
>  [2] https://patchwork.ozlabs.org/patch/489306/
> 
> I'd say these 2 patches solve completely different problems and so
> should be posted as 2 separate patches compared to your [PATCH 1/2],
> [PATCH 2/2].

I agree they are not related.

> The problem with series patches within series could not be applied
> separately, that means chances are you may not get either applied
> because:

That's not really true. I tend to try to apply all patches I can from a
series, even if certain other patches of the series cannot be applied.
Look at the SELinux series for example. I have not applied some of the
first patches of the series, but already applied some patches later in
the series.

So while I agree it's a bit weird to mix completely independent stuff in
one single patch series, it's not actually that problematic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
