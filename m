From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:59:55 +0200
Subject: [Buildroot] [PATCH 1/2] blktrace: add missing dependency on
 Config.in comment
In-Reply-To: <1470521474-16710-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470521474-16710-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807225955.0711c406@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 00:11:13 +0200, Thomas Petazzoni wrote:
> The BR2_PACKAGE_BLKTRACE option "depends on
> BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS", but this architecture dependency was
> not replicated in the Config.in comment. This commit fixes this
> inconsistency.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/blktrace/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Both applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
