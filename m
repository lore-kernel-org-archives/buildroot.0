From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:49:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/brltty: bump version to 6.1
In-Reply-To: <20200414160636.249823-1-bernd.kuhls@t-online.de>
References: <20200414160636.249823-1-bernd.kuhls@t-online.de>
Message-ID: <20200415214950.0225b4bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 18:06:36 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://brltty.app/doc/ChangeLog.txt
> 
> Removed patches committed upstream:
> https://github.com/brltty/brltty/commit/0414ad2b4e8978a14343d920a5a1f11da892eaf3
> https://github.com/brltty/brltty/commit/a2e3aa25e8ef5044422aeeaa65968f97550b5e8d
> 
> Updated hash of README due to non-license related commits:
> https://github.com/brltty/brltty/commits/master/README
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...how-the-_FOR_BUILD-variables-are-pas.patch | 53 -------------------
>  ...ss-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch | 38 -------------
>  package/brltty/brltty.hash                    |  5 +-
>  package/brltty/brltty.mk                      |  2 +-
>  4 files changed, 4 insertions(+), 94 deletions(-)
>  delete mode 100644 package/brltty/0002-mk4build-change-how-the-_FOR_BUILD-variables-are-pas.patch
>  delete mode 100644 package/brltty/0003-mk4build-also-pass-PKG_CONFIG_FOR_BUILD-to-the-nativ.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
