From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:19:38 +0100
Subject: [Buildroot] [PATCH/next] toolchain-external: support gcc < 4.3
In-Reply-To: <bad536b8-2eac-6ea8-f7b7-8297a5c01b85@mind.be>
References: <20161123111404.20661-1-arnout@mind.be>
 <20161123132259.47f9a228@free-electrons.com>
 <bad536b8-2eac-6ea8-f7b7-8297a5c01b85@mind.be>
Message-ID: <20161123231938.1eda5882@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 13:27:38 +0100, Arnout Vandecappelle wrote:

> > The Blackfin ADI toolchains use gcc 4.3, if I remember correctly.  
> 
>  Sorry, let me correct my statement: because they are currently unused by any
> package and will very soon be untested in the autobuilders.

Huh?

toolchain/toolchain-external/toolchain-external-blackfin-uclinux/Config.in:     select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3

So it's definitely used, at least until we remove the ADI Blackfin
toolchain.

Bets regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
