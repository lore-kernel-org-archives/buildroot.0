From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:49:42 +0200
Subject: [Buildroot] [PATCH 1/3] libwebsockets: add patch to fix musl
 build
In-Reply-To: <1459369358-794-1-git-send-email-joerg.krause@embedded.rocks>
References: <1459369358-794-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160331034942.6715bbbe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 22:22:36 +0200, J?rg Krause wrote:
> Add patch from upstream [1] to fix musl build:
> fatal error: sys/cdefs.h: No such file or directory
> 
> Fixes:
> http://autobuild.buildroot.net/results/564/564675be0d4fbfa113a0f2e52874e0dce2d5ba5e/
> http://autobuild.buildroot.net/results/c41/c41d87c0cf22f3b88e5f80ad6bf5e81900603c1d/
> 
> Backported from: 9eec5e4470397632af035c429295a41b74bd0585
> 
> [1] https://github.com/warmcat/libwebsockets/commit/9eec5e4470397632af035c429295a41b74bd0585
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libwebsockets/libwebsockets.hash | 1 +
>  package/libwebsockets/libwebsockets.mk   | 1 +
>  2 files changed, 2 insertions(+)

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
