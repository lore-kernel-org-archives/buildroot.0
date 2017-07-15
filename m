From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 09:08:31 +0200
Subject: [Buildroot] [PATCH] package/rpi-firmware: install missing
 library
In-Reply-To: <20170714220936.25212-1-yann.morin.1998@free.fr>
References: <20170714220936.25212-1-yann.morin.1998@free.fr>
Message-ID: <20170715090831.1ed20473@windsurf>
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

Could you qualify "not-so-recent" bump ? It's just to know if this is
applicable to our LTS release.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
