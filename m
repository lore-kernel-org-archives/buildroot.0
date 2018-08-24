From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:25:38 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/mosquitto: bump version to
 1.5.1
In-Reply-To: <20180824155032.9851-1-bernd.kuhls@t-online.de>
References: <20180824155032.9851-1-bernd.kuhls@t-online.de>
Message-ID: <20180824232538.566669fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 17:50:32 +0200, Bernd Kuhls wrote:
> Removed patch 0001, applied upstream.
> Replaced patch 0002 with a more generic solution as patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-Fix-subs-memory-issue.patch          | 151 ------------------
>  ...GNU_SOURCE-needed-for-EAI_INPROGRESS.patch |  46 ++++++
>  ...-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch |  34 ----
>  package/mosquitto/mosquitto.hash              |   2 +-
>  package/mosquitto/mosquitto.mk                |   2 +-
>  5 files changed, 48 insertions(+), 187 deletions(-)
>  delete mode 100644 package/mosquitto/0001-Fix-subs-memory-issue.patch
>  create mode 100644 package/mosquitto/0001-_GNU_SOURCE-needed-for-EAI_INPROGRESS.patch
>  delete mode 100644 package/mosquitto/0002-websockets-_GNU_SOURCE-needed-for-S_IF-DIR-REG.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
