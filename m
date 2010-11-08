From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Nov 2010 20:16:08 +0100
Subject: [Buildroot] java support in buildroot
In-Reply-To: <AANLkTi=-fVydqw4HBDc8WsJL8kpj956tbkuf0yps0o2p@mail.gmail.com>
References: <AANLkTins6w3F0edPkF4Tp_J8jCOoJgH+ePqm=oabZNWG@mail.gmail.com>
	<8739rodcwm.fsf@macbook.be.48ers.dk>
	<AANLkTi=-fVydqw4HBDc8WsJL8kpj956tbkuf0yps0o2p@mail.gmail.com>
Message-ID: <20101108201608.00131d2d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 7 Nov 2010 21:50:09 -0800
Don Smyth <dsmyth@signett.com> wrote:

> Patches to update java support:
> 
> 1) enable java in main Config.in (works with external glibc based
> toolchain) 2) update jamvm to 1.5.4
> 3) update concierge to 1.0.0, fix sample bundle download, fix sample
> bundle paths in init.xargs

Thanks!

Could you just give an example on how to easily test that jamvm and
concierge are working ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
