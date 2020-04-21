From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:09:45 +0200
Subject: [Buildroot] [PATCHv2 01/12] support/scripts: add
 check-dotconfig.py
In-Reply-To: <20200421172646.3340666-1-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
Message-ID: <20200421220945.39040a00@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 19:26:35 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> For the same reason as for 50b747f212be2c9c0f7cf10c674ed488d042715c,
> we need to check if the generated configuration file (.config)
> contains all symbols present in the defconfig file.
> 
> If not there is an issue with the defconfig.
> 
> This script will be used in .gitlab-ci.yml.
> 
> Inspired by is_toolchain_usable() function from genrandconfig:
> https://git.busybox.net/buildroot/tree/utils/genrandconfig?h=2020.02#n164
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> v2: update with the improved patch suggested by Yann.
>     http://lists.busybox.net/pipermail/buildroot/2020-April/280679.html
> ---
>  support/scripts/check-dotconfig.py | 44 ++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100755 support/scripts/check-dotconfig.py

I have applied patches 3 to 11 in this series. For PATCH 03/11, I fixed
up the android-tools selection, as I replied to the patch. All other
patches were applied as-is. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
