From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:06:44 +0200
Subject: [Buildroot] [PATCH] uclibc: fix tests building in uClibc
 0.9.33.2
In-Reply-To: <1404069506-13826-1-git-send-email-abrodkin@synopsys.com>
References: <1404069506-13826-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140715230644.2ca6b302@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Sun, 29 Jun 2014 23:18:26 +0400, Alexey Brodkin wrote:
> Following patches are required for successful bulding of uClibc built-int tests
> (BR2_UCLIBC_INSTALL_TEST_SUITE=y):
> 
> 1.
> uclibc-0059-test-cater-for-config.patch
> http://git.uclibc.org/uClibc/commit/test?id=7598eeaa1defa2884adaa890bb115c493d69cc35
> 
> 2.
> uclibc-0058-test-tls-fix-build-with-newer-binutils.patch
> http://git.uclibc.org/uClibc/commit/test?id=931e8391565323ed2e589c83b83a7345813a5514
> 
> 3.
> uclibc-0060-test-Fix-math-c-dependency.patch
> http://git.uclibc.org/uClibc/commit/test/math?id=a20a91ad7c042c46e4a2adee6d03315f857f9985
> 
> All mentioned patches must be removed as obsolete on bumping uClibc to the next
> release.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
