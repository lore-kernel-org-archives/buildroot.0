From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 22:51:25 +0100
Subject: [Buildroot] [PATCH 1/6] support/scripts: add script to test a
 package
In-Reply-To: <085941ea3e9e9f34405ac10780d5c8aa2a6317aa.1486584734.git.yann.morin.1998@free.fr>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <085941ea3e9e9f34405ac10780d5c8aa2a6317aa.1486584734.git.yann.morin.1998@free.fr>
Message-ID: <20170209225125.1158f331@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Feb 2017 21:15:24 +0100, Yann E. MORIN wrote:
> This script helps in testing that a package builds fine on a wide range
> of architectures and toolchains: BE/LE, 32/64-bit, musl/glibc/uclibc...
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [yann.morin.1998 at free.fr:
>  - completely rewrite the script from Thomas, with help from Luca
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Another comment: now that the script itself has been merged, adding a
quick note in the manual about it would be nice, so that developers
adding new packages (or bumping versions) can quickly test by using
this script.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
