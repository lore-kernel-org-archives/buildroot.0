From: Michael Walle <michael@walle.cc>
Date: Tue, 15 Dec 2020 11:15:45 +0100
Subject: [Buildroot] [PATCH] arch/Config.in.powerpc: Drop PPC601 support
In-Reply-To: <09b2f8e8-da8e-63d1-7b07-55a2d87280ad@gmail.com>
References: <20201215081433.4254-1-michael@walle.cc>
 <09b2f8e8-da8e-63d1-7b07-55a2d87280ad@gmail.com>
Message-ID: <c64d54bc5b158ee6f2e1a09a969c61e5@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2020-12-15 11:06, schrieb Romain Naour:
> Hello Michael,
> 
> Le 15/12/2020 ? 09:14, Michael Walle a ?crit?:
>> Linux support was removed in 5.10 [1]. Since no in-tree defconfig
>> depends on it, just remove it.
> 
> Thanks for the patch.
> 
> I'm ok with this patch but I would like a feedback from maintainers 
> because
> PPC601 removal from the latest kernel doesn't mean that we have to 
> remove it
> from Buildroot immediately.
> OTOH who is still using PPC601 in 2020 with the latest Buildroot ?
> Also, since there was no kernel in-tree defconfig for this target I'm 
> not sure
> it worth the effort.

So the other possibility would be to make 5.9 the last kernel for ppc601
and 5.10 for ppc40x. But that would mean we also have to keep the 5.9 
one
indefinitely  right?

-michael
