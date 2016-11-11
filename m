From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 21:30:07 +0100
Subject: [Buildroot] [PATCH for-master] package/kvmtool: fix a musl
 build issue on ARM
In-Reply-To: <1478883719-5506-1-git-send-email-romain.naour@gmail.com>
References: <1478883719-5506-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161111213007.31375107@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 18:01:59 +0100, Romain Naour wrote:
> We simply bump the version rather than backport the patch, as there has
> been only very few, minor commits in-between.
> 
> The kvmtool build with musl still produce some warning but they are
> fixed with the current master 0093df80 (kvmtool: Makefile: disable PIE
> build for bios and pre_init). So the next version bump should fixes
> them.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8e8/8e81354e82a8c0495e2ca465eb79cb8cf4c9b153
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/kvmtool/kvmtool.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
