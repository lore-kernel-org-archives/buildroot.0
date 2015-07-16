From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:28:23 +0200
Subject: [Buildroot] [PATCH] can-utils: fix musl build
In-Reply-To: <1437077485-28954-1-git-send-email-yegorslists@googlemail.com>
References: <1437077485-28954-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150716232823.7b5eaa5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Thu, 16 Jul 2015 22:11:25 +0200, Yegor Yefremov wrote:
> Include additional headers like <sys/time.h> and <linux/sockios.h>
> to resolve undefined symbols.
> 
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/0dd/0ddb5a70358bdbb491fbee670c7843c15217e78d/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .../0001-log2asc-include-sys-time.h.patch          | 28 +++++++++++++++
>  ...Include-linux-sockios.h-to-fix-musl-build.patch | 42 ++++++++++++++++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 package/can-utils/0001-log2asc-include-sys-time.h.patch
>  create mode 100644 package/can-utils/0002-Include-linux-sockios.h-to-fix-musl-build.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
