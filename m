From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Apr 2017 10:59:46 +0200
Subject: [Buildroot] [PATCH] trinity: fix ipv6 headers detection
In-Reply-To: <b001e893520a68d07aab6c91c5ddbbab1bc5aed7.1492147657.git.baruch@tkos.co.il>
References: <b001e893520a68d07aab6c91c5ddbbab1bc5aed7.1492147657.git.baruch@tkos.co.il>
Message-ID: <20170414105946.17120c9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Apr 2017 08:27:37 +0300, Baruch Siach wrote:
> The trinity configure script looks into a host header to check for libc/kernel
> headers conflict resolution. This is not compatible with cross compilation.
> Add a patch that does direct compilation test instead.
> 
> This issue was not caught by the autobuilder yet.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...ix-cross-compile-detection-of-broken-ipv6.patch | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/trinity/0001-configure-fix-cross-compile-detection-of-broken-ipv6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
