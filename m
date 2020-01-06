From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:47:04 +0100
Subject: [Buildroot] [PATCH 0/5] package: add host-coreutils (branch
 yem/host-coreutils)
In-Reply-To: <cover.1576701539.git.yann.morin.1998@free.fr>
References: <cover.1576701539.git.yann.morin.1998@free.fr>
Message-ID: <20200106214704.0413d5dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Dec 2019 21:39:04 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Yann E. MORIN (5):
>       package/coreutils: introduce a host variant
>       core/dependencies: check if we need to build our own host-coreutils
>       package/systemd: add dependency on host-coreutils
>       package/libselinux: add dependency on host-coreutils for ln --relative
>       package/libsepol: add dependency on host-coreutils for ln --relative

Thanks, I've applied to master!

One thing that would be nice is to check if
package/coreutils/0001-fix-for-dummy-man-usage.patch is still needed,
and if it is, what we can do about it. It's annoying to have AUTORECONF
= YES and GETTEXTIZE = YES just for this patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
