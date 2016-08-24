From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 19:11:14 +0200
Subject: [Buildroot] [PATCH 1/4] package/libegl: add option for wayland
 extensions
In-Reply-To: <20160823220612.GF5749@free.fr>
References: <cover.1471968455.git.yann.morin.1998@free.fr>
 <6d4c564432948310ca9502dc94c2d50a7c97f460.1471968455.git.yann.morin.1998@free.fr>
 <20160823220245.49e1b6e7@free-electrons.com>
 <20160823214351.GE5749@free.fr>
 <20160823235801.57c65bd0@free-electrons.com>
 <20160823220612.GF5749@free.fr>
Message-ID: <20160824191114.7e185af3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Aug 2016 00:06:12 +0200, Yann E. MORIN wrote:

> > OK, this is definitely a good explanation. So I should take it that you
> > expect Weston to build and work with the latest version of the NVidia
> > driver?  
> 
> Eventually. Eventually... ;-)
> 
> To be honest, this is not my highest priority for 2016.11; I have multi
> br2-external and systemd skeleton to handle first.

Sure, makes perfect. I was certainly not asking for this to be *done*,
but more on what is the general direction we are going to.

> This quick egl-wayland series (which I did not expect would be applied
> so fast!) was just a little distraction along the way. ;-) But at least,
> it paves the way toward more egl-wayland providers and users.

Sure. IMO it also makes the libgtk3 dependency a little bit easier to
understand, which is also why I applied it quickly.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
