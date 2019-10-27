From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:38:38 +0100
Subject: [Buildroot] [PATCH v2] boot/uboot: add initial environment
 support
In-Reply-To: <20190527192342.23406-1-michael@walle.cc>
References: <20190527192342.23406-1-michael@walle.cc>
Message-ID: <20191027203838.014123d1@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Mon, 27 May 2019 21:23:42 +0200
Michael Walle <michael@walle.cc> wrote:

> Since v2019.07 U-Boot supports extracting the compiled-in environment.
> As a first step, add support to the environment generation in buildroot.
> In the future, the text file may also be copied into the target
> filesystem, where it will be used by the uboot-tools.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

This feature was in the mean time added in uboot.mk, in a slightly
different form, but it does the same thing.

See:

  https://git.buildroot.org/buildroot/commit/?id=2c8ff251cb16d38fb417a488ee0367cd03eebda2

Could you check if it works for you as well?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
