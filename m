From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 22:03:04 +0200
Subject: [Buildroot] [PATCH] package/llvm: fix host-llvm build with GCC8
In-Reply-To: <20180516152635.19330-1-valentin.korenblit@smile.fr>
References: <20180516152635.19330-1-valentin.korenblit@smile.fr>
Message-ID: <20180517220304.71f7ab40@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 May 2018 17:26:35 +0200, Valentin Korenblit wrote:
> This patch fixes the build of lli for host-llvm when using GCC 8.
> 
> It was taken from llvm-5.0 package for Fedora 28.
> 
> Link to bug: https://bugzilla.redhat.com/show_bug.cgi?id=1540620
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/824c70e982d8ec7e518cf4db058767df42db6b04/
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  ...turn-type-in-ORC-readMem-client-interface.patch | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
