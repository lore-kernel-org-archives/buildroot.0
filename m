From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:25:15 +0200
Subject: [Buildroot] [PATCH v7 01/31]
 package/kodi-visualisation-fountain: remove package
In-Reply-To: <20170429083751.19625-2-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-2-bernd.kuhls@t-online.de>
Message-ID: <20170429112515.4ca2bdf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 10:37:21 +0200, Bernd Kuhls wrote:
> Remove broken package:
> https://github.com/notspiff/visualization.fountain/issues/1#issuecomment-166156021
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy                                              |  7 +++++++
>  package/kodi-visualisation-fountain/Config.in                 | 11 -----------
>  .../kodi-visualisation-fountain.hash                          |  2 --
>  .../kodi-visualisation-fountain.mk                            | 11 -----------
>  package/kodi/Config.in                                        |  1 -
>  5 files changed, 7 insertions(+), 25 deletions(-)
>  delete mode 100644 package/kodi-visualisation-fountain/Config.in
>  delete mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
>  delete mode 100644 package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
