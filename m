From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 17:55:26 +0200
Subject: [Buildroot] [PATCH v2 1/3] testing/infra/builder: dump
 defconfig to log
In-Reply-To: <20170723214418.7130-1-ricardo.martincoski@gmail.com>
References: <20170723042019.10323-2-ricardo.martincoski@gmail.com>
 <20170723214418.7130-1-ricardo.martincoski@gmail.com>
Message-ID: <20170724175526.34c4d2e3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 18:44:16 -0300, Ricardo Martincoski wrote:
> The defconfig is composed on-the-fly by test infra + tests.
> 
> Dump it to the logfile before running 'make olddefconfig' so it can
> easily analysed when debugging.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> Changes v1 -> v2:
>   - it's really a defconfig, not a config (Yann E. MORIN);
>   - make clear on the logfile where the defconfig ends (Yann E. MORIN);
>   - remove tested-by tag since I changed the patch;
>   - patch renumbered since I kept the old patch 1 (developers file only)
>     in the patchwork as-is;
> ---
>  support/testing/infra/builder.py | 4 ++++
>  1 file changed, 4 insertions(+)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
