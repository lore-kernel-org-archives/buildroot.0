From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 12:46:22 +0200
Subject: [Buildroot] [PATCH] empty: fix compile with toolchain w/o
 threads
In-Reply-To: <20150709093140.GA8600@waldemar-brodkorb.de>
References: <20150709093140.GA8600@waldemar-brodkorb.de>
Message-ID: <20150808124622.7837de9c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Thu, 9 Jul 2015 11:31:40 +0200, Waldemar Brodkorb wrote:
> As found via autobuilders and discussed on the list, the
> ifdef is wrong, as empty uses SysV semaphores and not POSIX
> semaphores.
> 
> Tested with glibc/uclibc-ng builds. And with uclibc-ng without
> threads.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/empty/0002-fix-non-thread-build.patch |   49 +++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/empty/0002-fix-non-thread-build.patch

Applied, thanks. Could you submit the patch upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
