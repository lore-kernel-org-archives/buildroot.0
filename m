From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Jul 2018 13:36:00 +0200
Subject: [Buildroot] [PATCH] package/binutils: add binutils version 2.31
In-Reply-To: <0d2afb3c-fe85-057a-4ad3-5744eb397d6e@smile.fr>
References: <20180716213010.29310-1-romain.naour@gmail.com>
 <20180717120806.5be54c85@windsurf>
 <0d2afb3c-fe85-057a-4ad3-5744eb397d6e@smile.fr>
Message-ID: <20180717133600.23398581@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jul 2018 13:30:08 +0200, Romain Naour wrote:

> > Applied to master, thanks. Could you as follow-up patches set binutils
> > 2.30 as the default version, and drop the oldest binutils version we
> > support ?  
> 
> I'll do it, but we have to be careful with arm thumb/thumb2 dependencies.
> ADR and ADRl pseudo-ops are still broken for Binutils 2.29 and 2.30. I'm not
> sure if it's necessary to backport the fix since we have now binutils 2.31.

I haven't followed the status of this problem. Is it fixed in binutils
2.31 ?

> > Also, I'm surprised that we still have all those ARC binutils patches,
> > which should have been upstream. Could you get in touch with the
> > Synopsys guys and see what's going on with those patches ?  
> 
> I'm adding Alexey in Cc :)

Thanks :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
