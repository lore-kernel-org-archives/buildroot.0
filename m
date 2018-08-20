From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 15:23:13 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/luvi: bump version to 2.8.0
In-Reply-To: <20180819120219.28721-1-bernd.kuhls@t-online.de>
References: <20180819120219.28721-1-bernd.kuhls@t-online.de>
Message-ID: <20180820152313.076445f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 14:02:19 +0200, Bernd Kuhls wrote:
> Upstream does not provide a tarball including all submodules so we need
> to checkout the git repo including the submodules ourselves.

Could you file an issue an upstream so that they upload a tarball ?

> 
> Added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/luvi/luvi.hash | 3 ++-
>  package/luvi/luvi.mk   | 7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
