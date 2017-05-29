From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:17:13 +0200
Subject: [Buildroot] [PATCH] package/firejail: remove broken package
In-Reply-To: <20170529195811.12354-1-romain.naour@gmail.com>
References: <20170529195811.12354-1-romain.naour@gmail.com>
Message-ID: <20170529221713.55dc157d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 21:58:11 +0200, Romain Naour wrote:
> firejail has been marked as broken since 3ad100fdcbf6e2bf850b4b2f528c87c74f7c93ff
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Chris Frederick <chrisf@cdf123.net>
> ---
> We don't need legacy handling since this package was added
> after the last release (2017.02)
> ---
>  DEVELOPERS                     |  3 ---
>  package/Config.in              |  1 -
>  package/firejail/Config.in     | 21 ---------------------
>  package/firejail/firejail.hash |  3 ---
>  package/firejail/firejail.mk   | 28 ----------------------------
>  5 files changed, 56 deletions(-)
>  delete mode 100644 package/firejail/Config.in
>  delete mode 100644 package/firejail/firejail.hash
>  delete mode 100644 package/firejail/firejail.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
