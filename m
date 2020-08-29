From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:56:47 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/sofia-sip: bump version to
 1.13.1
In-Reply-To: <20200829204005.2815997-2-bernd.kuhls@t-online.de>
References: <20200829204005.2815997-1-bernd.kuhls@t-online.de>
 <20200829204005.2815997-2-bernd.kuhls@t-online.de>
Message-ID: <20200829225647.7f313518@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:40:04 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Rebased patch 0001.
> 
> Added patch 0002 previously used for the sofia-sip library which was
> bundled with the freeswitch source:
> https://git.buildroot.net/buildroot/commit/package/freeswitch?id=3c2e8b2b29a88c35c8a9867537d3ce3d0af85bc2
> The bundled library was removed in freeswitch-1.10.4.
> 
> Switched upstream to freeswitch repo according to
> http://sofia-sip.sourceforge.net/
> 
> "This repository is not currently maintained.
> 
>  The FreeSWITCH project hosts a currently maintained version of this
>  library at https://github.com/freeswitch/sofia-sip"
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next.

> +SOFIA_SIP_VERSION = 1.13.1-d10a3d268c

Same question as for spandsp: why this strange versioning scheme ?

Also, could you update https://release-monitoring.org/project/10509/ ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
