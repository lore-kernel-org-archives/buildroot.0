From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 13:22:51 +0200
Subject: [Buildroot] [PATCH v2] procps-ng: bump to version 3.3.14
In-Reply-To: <20180418101334.wq7wxgd5owwsiona@tarshish>
References: <130c35b0d58841519c15a94b2730f675fa63192d.1523995096.git.baruch@tkos.co.il>
 <20180418120400.2845e55c@windsurf.numericable.fr>
 <20180418101334.wq7wxgd5owwsiona@tarshish>
Message-ID: <20180418132251.0d1d735c@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Apr 2018 13:13:34 +0300, Baruch Siach wrote:

> > I have started a new build of all the br-* pre-built toolchains with
> > the latest Git master. I'll wait for this to finish, deploy the
> > toolchains, and then apply this patch, if that's OK for you.  
> 
> That's perfectly fine with me.

OK, thanks.

> While at it, you might want to look into the issue of libgcc link failure in 
> static musl toolchains. This issue currently affects lm-sensors and multicat. 
> See http://patchwork.ozlabs.org/patch/883243/.

I did have a look at this issue two weeks ago or so, and like you, I
concluded that there was a toolchain issue. I guess it should be
reported to musl upstream. It may not be a musl issue per-se, perhaps
more a musl-into-gcc integration issue, but they might be able to help.
Do you think you could contact the musl folks about this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
