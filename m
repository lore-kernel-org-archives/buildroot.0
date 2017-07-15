From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 10:10:37 +0200
Subject: [Buildroot] [PATCH] package/rpi-firmware: install missing
 library
In-Reply-To: <20170714220936.25212-1-yann.morin.1998@free.fr>
References: <20170714220936.25212-1-yann.morin.1998@free.fr>
Message-ID: <20170715101037.60b1a463@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Jul 2017 00:09:36 +0200, Yann E. MORIN wrote:
> The vcdbg utility is linked to a few libraries, which so far were all
> provided by the rpi-userland package.
> 
> But a not-so-recent bump of rpi-firmware pulled in a vcdbg that is
> linked to an additional library, which is not privided by rpi-userland,
> so we must install it.
> 
> Reported-by: cluelessperson on #buildroot
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
