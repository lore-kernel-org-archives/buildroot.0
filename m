From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:35:05 +0200
Subject: [Buildroot] [PATCH] package/i2c-tools: update download location
In-Reply-To: <1466950823-647-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1466950823-647-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160626213505.687e934f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 16:20:23 +0200, Angelo Compagnucci wrote:
> Since the sutting down of www.lm-sensors.org we do not
> have a package download location anymore, updating
> to use the current git hosted at kernel.org.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/i2c-tools/i2c-tools.hash | 2 --
>  package/i2c-tools/i2c-tools.mk   | 5 ++---
>  2 files changed, 2 insertions(+), 5 deletions(-)
>  delete mode 100644 package/i2c-tools/i2c-tools.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
