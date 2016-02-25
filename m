From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:14:07 +0100
Subject: [Buildroot] [PATCH] ofono: depends on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1456143938-21594-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456143938-21594-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160225221407.099a0c35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 22 Feb 2016 09:25:38 -0300, Gustavo Zacarias wrote:
> It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
> http://autobuild.buildroot.net/results/7ec/7ec4142d0f41234309a226a21a7da7acbece90e9/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/connman/Config.in | 1 +
>  package/ofono/Config.in   | 2 ++
>  2 files changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
