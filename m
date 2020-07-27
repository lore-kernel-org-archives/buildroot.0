From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 17:42:21 +0200
Subject: [Buildroot] [PATCH] package/grpc: needs host gcc >= 4.9
In-Reply-To: <BY5PR19MB3668703B0B0C459376B914B4FB750@BY5PR19MB3668.namprd19.prod.outlook.com>
References: <20200726210823.20922-1-yann.morin.1998@free.fr>
 <BY5PR19MB3668703B0B0C459376B914B4FB750@BY5PR19MB3668.namprd19.prod.outlook.com>
Message-ID: <20200727174221.1bad47f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Jul 2020 22:11:00 +0000
ratbert90 <aduskett@gmail.com> wrote:

> The problem here is two fold:
> 1) CentOS7 also comes with gcc4.8 and compiles fine.
> 
> 2) Ubuntu 14.04 still fails even when using newer GCC versions from a PPA (I tried with gcc 6 and the same error occurred)

Dammit, I've just seeing this comment now. This e-mail was weirdly
formatted and not recorded on patchwork:

  https://patchwork.ozlabs.org/project/buildroot/patch/20200726210823.20922-1-yann.morin.1998 at free.fr/

In the light of this, I've gone ahead and reverted the patch, as
obviously the problem is not related to the gcc version.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
