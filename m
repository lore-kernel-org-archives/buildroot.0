From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 22:26:08 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/dosfstools: fix build
 with musl
In-Reply-To: <1439734181-1015-1-git-send-email-yann.morin.1998@free.fr>
References: <1439734181-1015-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150817222608.0c19853d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 16 Aug 2015 16:09:41 +0200, Yann E. MORIN wrote:
> Use correct and standard int types.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/a09/a0923d7f6d4dbae02eba4c5024bbdae3a52aa85a/
>     http://autobuild.buildroot.org/results/62b/62b1a71c4fedb6f9209663e7544d7a36fb42c580/
>     http://autobuild.buildroot.org/results/e80/e808e692220ced315d30d8ee9c93bdf4a5e32a03/
>     http://autobuild.buildroot.org/results/7b7/7b778b7a9ec8c91ec3cea6ee81c6f5c75f0b959a/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../0001-mkfs.fat-fix-incorrect-int-type.patch     | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch

Applied after updating the upstream status of the patch, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
