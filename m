From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 18:51:58 +0200
Subject: [Buildroot] [PATCH] package/libselinux: host gcc at least 4.7
In-Reply-To: <20180813150559.guf6i4qh6vogmwhl@sapphire.tkos.co.il>
References: <20180813143326.14262-1-matthew.weber@rockwellcollins.com>
 <20180813144722.tagr3xka7pv24ah3@sapphire.tkos.co.il>
 <CANQCQpZnw5jjVV4LFTYwJfjvoBkws2TKKTCp3TS=tpJ3bf886g@mail.gmail.com>
 <20180813145425.vqtpzppgqznjdcmi@sapphire.tkos.co.il>
 <CANQCQpa5kOpB9ENCSBam=-Zc6QCsJgNfrYUnCoWw9g=A_S=_hg@mail.gmail.com>
 <20180813150559.guf6i4qh6vogmwhl@sapphire.tkos.co.il>
Message-ID: <20180813185158.6658248e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Aug 2018 18:05:59 +0300, Baruch Siach wrote:

> No. I mean all host and target packages that have host-libselinux in their 
> _DEPENDENCIES. Otherwise, enabling any of them would cause a build of 
> host-libselinux regardless of the Config.in dependency.
> 
> Isn't it easier to apply the alternative patch that uses the older __sync 
> routines for older gcc?

Is it would be much easier. The question is: is this patch correct ? I
am not super familiar with the semantic of those atomic operations, so
I'm not super confident in reviewing Hollis proposal. But if you think
Hollis patch is correct, a Acked-by or Reviewed-by on it would be good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
