From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 15:48:55 +0200
Subject: [Buildroot] [PATCH 4/4] package/transmission: remove
 BR2_PACKAGE_TRANSMISSION_REMOTE
In-Reply-To: <20180502060540.11628-4-bernd.kuhls@t-online.de>
References: <20180502060540.11628-1-bernd.kuhls@t-online.de>
 <20180502060540.11628-4-bernd.kuhls@t-online.de>
Message-ID: <20180520154855.16767c32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 08:05:40 +0200, Bernd Kuhls wrote:
> Upstream does not provide a configure option --enable-remote.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy                     | 7 +++++++
>  package/transmission/Config.in       | 5 -----
>  package/transmission/transmission.mk | 6 ------
>  3 files changed, 7 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
