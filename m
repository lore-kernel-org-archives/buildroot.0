From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jan 2014 16:32:39 +0800
Subject: [Buildroot] [PATCH] grub: bump to 0.97-67
In-Reply-To: <1386191460-10848-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386191460-10848-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140107163239.6999bd1c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Dec 2013 22:11:00 +0100, Thomas Petazzoni wrote:
> Bump to a more recent version of the Debian patches for grub legacy,
> that fix an incorrect build with gcc 4.6.
> 
> Fixes #6092 and #2629.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/grub/grub.200-fix_mbr_handling.patch     |   10 +-
>  boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |   14 +-
>  boot/grub/grub.400-nic_update2.patch          | 3332 ++++---------------------
>  boot/grub/grub.mk                             |    6 +-
>  4 files changed, 475 insertions(+), 2887 deletions(-)

Any reason why this patch was never applied? Interestingly, I don't see
it anymore in patchwork, but it wasn't applied either.

Could it be applied?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
