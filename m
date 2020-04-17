From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:56:20 +0200
Subject: [Buildroot] [PATCH] package/qemu: enable or1k support in
 host-qemu
In-Reply-To: <20200417201626.342738-3-romain.naour@gmail.com>
References: <20200417201626.342738-1-romain.naour@gmail.com>
 <20200417201626.342738-3-romain.naour@gmail.com>
Message-ID: <20200417225620.0dde8d89@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 22:16:26 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> This change enables host qemu support for or1k which among other
> things allows to test this architecture in gitlab.
> 
> The or1k support was nammed or32 in qemu < 2.9.0 and
> renamed or1k by [1]. But only the qemu 4.2.0 has been
> tested with qemu_or1k_defconfig.
> So we may consider the or1k support was added by [1].

I was a bit confused by these last two sentences, and was not sure how
relevant this was. I reworded this paragraph slightly and applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
