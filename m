From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 23:30:30 +0200
Subject: [Buildroot] [PATCH 4/5] Add KF5 package modemmanager-qt
In-Reply-To: <20180215204815.14707-4-pinaraf@pinaraf.info>
References: <20180215204815.14707-1-pinaraf@pinaraf.info>
 <20180215204815.14707-4-pinaraf@pinaraf.info>
Message-ID: <20180702233030.78b40b44@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Feb 2018 21:48:14 +0100, Pierre Ducroquet wrote:
> modemmanager-qt is a simple Qt wrapper on the ModemManager API.
> 
> Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
> ---
>  package/kf5/Config.in                                    |  1 +
>  package/kf5/kf5-modemmanager-qt/Config.in                | 13 +++++++++++++
>  package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash |  2 ++
>  package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk   | 16 ++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/kf5/kf5-modemmanager-qt/Config.in
>  create mode 100644 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
>  create mode 100644 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk

I've applied, with the following changes:

    [Thomas:
     - fix commit title
     - update to 5.47
     - add hash for license file
     - add missing dependency on qt5base
     - add missing dependency on Qt5 DBus module
     - use "depends on" instead of "select" for modemmanager dependency]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
