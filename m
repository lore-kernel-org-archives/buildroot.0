From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:42:08 +0200
Subject: [Buildroot] [PATCH 1/3] package/xenomai: bump to version 3.0.4
In-Reply-To: <20170415174201.30459-1-romain.naour@gmail.com>
References: <20170415174201.30459-1-romain.naour@gmail.com>
Message-ID: <20170416104208.7c2fe25d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Apr 2017 19:41:59 +0200, Romain Naour wrote:
> Remove upstream patch 0001-testsuite-cyclictest.
> 
> Announce:
> http://xenomai.org/pipermail/xenomai/2017-April/037254.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Pawel Sikora <sikor6@gmail.com>
> ---
> Pawel, can you give a try to this new version?
> Thanks!
> ---
>  ...atch => 0001-arm-enable-armv5tej-support.patch} |  0
>  ...yclictest-silence-UMR-false-positive-with.patch | 56 ----------------------
>  package/xenomai/xenomai.hash                       |  2 +-
>  package/xenomai/xenomai.mk                         |  2 +-
>  4 files changed, 2 insertions(+), 58 deletions(-)
>  rename package/xenomai/{0002-arm-enable-armv5tej-support.patch => 0001-arm-enable-armv5tej-support.patch} (100%)
>  delete mode 100644 package/xenomai/0001-testsuite-cyclictest-silence-UMR-false-positive-with.patch

Series applied. As discussed on IRC, I've added your SoB on the patch
in PATCH 2/3.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
