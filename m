From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:41:59 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/ltp-testsuite: introduce
 BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
In-Reply-To: <20170509205929.8394-2-romain.naour@gmail.com>
References: <20170509205929.8394-1-romain.naour@gmail.com>
 <20170509205929.8394-2-romain.naour@gmail.com>
Message-ID: <20170510234159.13af13af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 May 2017 22:59:28 +0200, Romain Naour wrote:
> ltp-testsuite needs __sync*() built-ins for 4-byte data, except on a few
> architectures for which a specific implementation is provided in
> ltp-testsuite source code.
> 
> To prepare for the introduction of this dependency, add
> BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/ltp-testsuite/Config.in | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Thanks, I've applied patches 2 and 3, after changing a bit how the
ARCH_SUPPORTS option is defined, as I suggested in my review of patch 3.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
