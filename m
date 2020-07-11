From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:18:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcec: downgrade to version
 4.0.5
In-Reply-To: <20200710062102.531210-1-bernd.kuhls@t-online.de>
References: <20200710062102.531210-1-bernd.kuhls@t-online.de>
Message-ID: <20200711151811.22a605ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jul 2020 08:21:02 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> According to
> https://github.com/Pulse-Eight/libcec/releases/tag/libcec-5.0.0
> version 5.0.0 is "not compatible with Kodi 18.x. Please use libCEC
> 4.0.5 instead."
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libcec/libcec.hash | 2 +-
>  package/libcec/libcec.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
