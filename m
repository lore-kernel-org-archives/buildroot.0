From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 21:52:08 +0200
Subject: [Buildroot] [PATCH] package/libnss: fix build failure due to
 patch not applicable
In-Reply-To: <20200405171144.90701-1-giulio.benetti@benettiengineering.com>
References: <20200405171144.90701-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200406215208.0993560a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Apr 2020 19:11:44 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Current 0001 patch has been committed into buildroot before being
> upstreamed. Now that it's been upstreamed it changed a little, so this
> makes patch 0002(based on upstream version of patch 0001) impossible to
> apply causing build failure while applying patches. So let's update
> patch 0001 with upstream one.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c8a/c8a6776a3e9cec1dc67862e4972e3ca8f4562a50/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...roduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch} | 61 ++++++++++---------
>  package/libnss/libnss.mk                      |  4 +-
>  2 files changed, 35 insertions(+), 30 deletions(-)
>  rename package/libnss/{0001-Bug-1620799-Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch => 0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch} (71%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
