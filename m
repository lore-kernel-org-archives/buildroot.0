From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:22:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix build with
 glibc 2.30
In-Reply-To: <20190904213256.20303-1-fontaine.fabrice@gmail.com>
References: <20190904213256.20303-1-fontaine.fabrice@gmail.com>
Message-ID: <20190915222202.172611b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Sep 2019 23:32:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/e8b72f5d93d3565d41364a52c0024a0292a06b41
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0002-net-multicast-Remove-mc_gethost.patch | 187 ++++++++++++++++++
>  ...otools-check-for-getdents-getdents64.patch |  80 ++++++++
>  package/ltp-testsuite/ltp-testsuite.mk        |   2 +
>  3 files changed, 269 insertions(+)
>  create mode 100644 package/ltp-testsuite/0002-net-multicast-Remove-mc_gethost.patch
>  create mode 100644 package/ltp-testsuite/0003-syscalls-getdents-Add-autotools-check-for-getdents-getdents64.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
