From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 15:19:21 +0200
Subject: [Buildroot] [PATCH 0/7 v2] hashes: add more custom versions to
 the exclusion list (branch yem/no-hash-custom)
In-Reply-To: <cover.1430557268.git.yann.morin.1998@free.fr>
References: <cover.1430557268.git.yann.morin.1998@free.fr>
Message-ID: <20150502151921.09518096@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat,  2 May 2015 11:05:01 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (7):
>       pkg-infra: assign BR_NO_CHECK_HASH_FOR so it is recursively-expanded
>       boot/uboot: do not check hash for custom versions
>       boot/barebox: do not check hash for custom versions
>       boot/mxs-bootlets: do not check hash of custom tarball
>       package/xenomai: ignore custom versions
>       package/xenomai: add hash file
>       linux: do not check hashes for custom versions and tarballs

Series applied, thanks. Special thanks to Arnout for the thorough
review and commenting of this patch series.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
