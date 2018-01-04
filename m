From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Jan 2018 16:29:57 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20180104152048.GA3684@scaer>
References: <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer> <20171228225639.GK3428@scaer>
 <20171229055921.abdwvjddkvcuncyr@tarshish>
 <20171229093818.GA3176@scaer>
 <20171229104219.71c908e6@windsurf.lan>
 <20171229095242.GB3176@scaer>
 <20171229105521.78a4e35a@windsurf.lan>
 <20180104152048.GA3684@scaer>
Message-ID: <20180104162957.4290e890@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Jan 2018 16:20:48 +0100, Yann E. MORIN wrote:

> Upstream has merged those three patches now, so we can rely on a clean
> way to install without clobbering existing utils; we just have to use:
>     make install-noclobber

Great! So the idea is to have Busybox install its stuff *after* all the
packages that install full-blown versions. Correct ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
