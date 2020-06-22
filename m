From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 21:37:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/dash: drop patch
In-Reply-To: <20200622185206.66296-1-fontaine.fabrice@gmail.com>
References: <20200622185206.66296-1-fontaine.fabrice@gmail.com>
Message-ID: <20200622213702.7d779c66@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jun 2020 20:52:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patch is not needed since version 0.5.11 and
> https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=9000b48966335b0b3d7a3ec1ec8c15b045d59e9d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../dash/0001-no-config.h-for-helpers.patch   | 35 -------------------
>  1 file changed, 35 deletions(-)
>  delete mode 100644 package/dash/0001-no-config.h-for-helpers.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
