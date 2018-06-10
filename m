From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 14:12:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.0.7-38
In-Reply-To: <20180610102156.29718-1-bernd.kuhls@t-online.de>
References: <20180610102156.29718-1-bernd.kuhls@t-online.de>
Message-ID: <20180610141236.6688ae79@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 12:21:56 +0200, Bernd Kuhls wrote:
> Fixes CVE-2018-11625, CVE-2018-11624 & CVE-2018-10177.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
