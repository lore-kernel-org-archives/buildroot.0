From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:38:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: fix json
 dependency
In-Reply-To: <20210115181529.611511-1-bernd.kuhls@t-online.de>
References: <20210115181529.611511-1-bernd.kuhls@t-online.de>
Message-ID: <20210116223822.1fe8e3f5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Jan 2021 19:15:29 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Package depends on rapidjson, not rapidxml:
> https://github.com/rbuehlma/pvr.zattoo/blob/Leia/CMakeLists.txt#L10
> 
> The bug was previously not noticed because kodi depends on rapidjson
> https://github.com/xbmc/xbmc/blob/Leia/CMakeLists.txt#L133
> and kodi-platform depends on kodi
> https://github.com/xbmc/kodi-platform/blob/master/CMakeLists.txt#L8
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-zattoo/Config.in          | 2 +-
>  package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
