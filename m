From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:14:28 +0100
Subject: [Buildroot] [PATCH v1] wiringpi: bump to version 2.44
In-Reply-To: <20170315210828.3784-1-ps.report@gmx.net>
References: <20170315210828.3784-1-ps.report@gmx.net>
Message-ID: <20170318141428.0c4b6d36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Mar 2017 22:08:28 +0100, Peter Seiderer wrote:
> - rebase 0001-Adjust-for-buildroot-build.patch
> - delete 0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
>   (all changes are incorporated into wiringpi-2.44)
> - remove useless hash file (git download)

Git downloads now generate reproducible tarballs, so we in fact want to
add hashes for them as well. However, it is true that the hash is not
checked currently. This has been on the TODO-list for a while.

So I've kept the hash file (after updating it).

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../wiringpi/0001-Adjust-for-buildroot-build.patch | 26 +++++-----
>  ...de-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch | 60 ----------------------
>  package/wiringpi/wiringpi.hash                     |  2 -
>  package/wiringpi/wiringpi.mk                       |  2 +-
>  4 files changed, 14 insertions(+), 76 deletions(-)
>  delete mode 100644 package/wiringpi/0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
>  delete mode 100644 package/wiringpi/wiringpi.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
