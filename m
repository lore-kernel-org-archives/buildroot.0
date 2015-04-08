From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:30:18 +0200
Subject: [Buildroot] [PATCH 1/2] infra/pkg-kconfig: don't require a
 kconfig file for disabled packages
In-Reply-To: <25c5ce55fd15b63fae1635bdc6940527079acdf6.1428512591.git.yann.morin.1998@free.fr>
References: <cover.1428512591.git.yann.morin.1998@free.fr>
 <25c5ce55fd15b63fae1635bdc6940527079acdf6.1428512591.git.yann.morin.1998@free.fr>
Message-ID: <20150408223018.6f1226af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  8 Apr 2015 19:08:34 +0200, Yann E. MORIN wrote:
> When a package is not enabled, we need not check that it provides
> a .config/defconfig file.
> 
> So far, all our pkg-kconfig packages unconditionally set their
> _KCONFIG_FILE, even to an empty value. But some packages (e.g.
> at91bootstrap3) wanted to set it only when enabled, and broke.
> 
> So, only do the check when the package is enabled.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
