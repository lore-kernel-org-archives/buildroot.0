From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 18:41:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/gli: new package
In-Reply-To: <20190410175746.32756-1-bernd.kuhls@t-online.de>
References: <20190410175746.32756-1-bernd.kuhls@t-online.de>
Message-ID: <20190411184156.6ac1c235@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Apr 2019 19:57:46 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for Kodi 18.x-compatible version of kodi-screensaver-rsxs.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  DEVELOPERS            |  1 +
>  package/Config.in     |  1 +
>  package/gli/Config.in | 10 ++++++++++
>  package/gli/gli.hash  |  3 +++
>  package/gli/gli.mk    | 17 +++++++++++++++++
>  5 files changed, 32 insertions(+)
>  create mode 100644 package/gli/Config.in
>  create mode 100644 package/gli/gli.hash
>  create mode 100644 package/gli/gli.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
