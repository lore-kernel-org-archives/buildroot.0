From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 21:57:50 +0100
Subject: [Buildroot] [PATCH] uclibc: fix MIPS builds with disabled
 threads
In-Reply-To: <20160205063435.GA22677@waldemar-brodkorb.de>
References: <20160205063435.GA22677@waldemar-brodkorb.de>
Message-ID: <20160205215750.09748218@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 5 Feb 2016 07:34:35 +0100, Waldemar Brodkorb wrote:
> There was a regression found while building for MIPS
> with disabled threads. Upstream patch fixed it.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...02-mips-fix-build-if-threads-are-disabled.patch |   59 ++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/uclibc/0002-mips-fix-build-if-threads-are-disabled.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
