From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 12:32:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: enable optional vaapi
 support also for OpenGLES
In-Reply-To: <20210620090900.205406-1-bernd.kuhls@t-online.de>
References: <20210620090900.205406-1-bernd.kuhls@t-online.de>
Message-ID: <20210718123237.68cd6596@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 20 Jun 2021 11:09:00 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream commit
> https://github.com/xbmc/xbmc/commit/c638987dd8181765f975763cb643d6869a3f661b
> 
> removed the dependency to x11 support in libva keeping only libdrm as
> dependency. This commit will enable the usage of libva with Kodi's
> OpenGLES render system.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy       |  8 ++++++++
>  package/kodi/Config.in | 18 ------------------
>  package/kodi/kodi.mk   |  5 ++---
>  3 files changed, 10 insertions(+), 21 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
