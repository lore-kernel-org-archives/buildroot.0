From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:55:10 +0200
Subject: [Buildroot] [PATCH 1/1] cups-filters: fix avahi dependency
In-Reply-To: <20180510093500.15672-1-fontaine.fabrice@gmail.com>
References: <20180510093500.15672-1-fontaine.fabrice@gmail.com>
Message-ID: <20180513215510.7243d07f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 May 2018 11:35:00 +0200, Fabrice Fontaine wrote:
> avahi support requires avahi-client, which needs avahi-daemon and dbus
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5c326bb56199000eb0e53a4d0f3c6c13be71cda0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cups-filters/cups-filters.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
