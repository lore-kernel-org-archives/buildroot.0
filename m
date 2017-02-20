From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 21:36:17 +0100
Subject: [Buildroot] [PATCH] uclibc: add fix for ARM specific static
 linking issues
In-Reply-To: <20170217192404.GA13561@waldemar-brodkorb.de>
References: <20170217192404.GA13561@waldemar-brodkorb.de>
Message-ID: <20170220213617.3266eaf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Feb 2017 20:24:04 +0100, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/fb14e37aaf453874d1c33e5ed73b9c751ace5ae3
>   http://autobuild.buildroot.net/results/774a8dd489760bc213ac7cf3e8040cee6a4e2437
> 
> And hopefully all other static ARM issues with uClibc-ng.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> It would be nice if the autobuild ARM toolchains could be rebuild,
> if the patch is accepted and applied.
> ---
>  .../0002-arm-fix-static-linking-issues.patch       | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/uclibc/0002-arm-fix-static-linking-issues.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
