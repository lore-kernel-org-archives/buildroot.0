From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 14:29:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: bump version to
 2.10.5
In-Reply-To: <20180801061447.28214-1-bernd.kuhls@t-online.de>
References: <20180801061447.28214-1-bernd.kuhls@t-online.de>
Message-ID: <20180801142909.27deaa87@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Aug 2018 08:14:47 +0200, Bernd Kuhls wrote:
> Added sha256 and license hashes, switched _SITE to https.
> 
> This bump includes
> https://github.com/lttng/lttng-tools/commit/b4cf0332cc1164684bbc708b6c46c1d69a15b847
> which fixes a musl build error:
> http://autobuild.buildroot.net/results/09d/09d6d5e2d1c50dbd6c026e12aa245fc90687eb19/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/lttng-tools/lttng-tools.hash | 11 ++++++++---
>  package/lttng-tools/lttng-tools.mk   |  4 ++--
>  2 files changed, 10 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
