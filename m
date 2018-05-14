From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 May 2018 09:27:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/asterisk: Fix issues building
 without SSL
In-Reply-To: <20180514062519.655-1-bernd.kuhls@t-online.de>
References: <20180514062519.655-1-bernd.kuhls@t-online.de>
Message-ID: <20180514092711.3207c6f8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 May 2018 08:25:19 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/7d0/7d069dd5629e406cecd17bacfa818e7c8e6b2064/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...006-build-fix-issues-building-without-ssl.patch | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/asterisk/0006-build-fix-issues-building-without-ssl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
