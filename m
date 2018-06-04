From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 22:53:08 +0200
Subject: [Buildroot] [PATCH 1/3] libgit2: Do not use a bundled zlib.
In-Reply-To: <20180601154200.22088-1-nicolas.cavallari@green-communications.fr>
References: <20180601154200.22088-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20180604225308.33086727@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jun 2018 17:41:58 +0200, Nicolas Cavallari wrote:
> libgit2 depends on zlib.  If libgit2's build system does not find a
> system zlib, then it compiles a bundled version of it.
> 
> Force a dependency on zlib to avoid building this bundled version.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/libgit2/Config.in  | 1 +
>  package/libgit2/libgit2.mk | 7 ++-----
>  2 files changed, 3 insertions(+), 5 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
