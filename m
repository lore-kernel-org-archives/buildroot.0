From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:29:15 +0100
Subject: [Buildroot] [PATCH 1/1] spi-tools: bump to version 0.8.1
In-Reply-To: <1453165804-11840-1-git-send-email-nunes.erico@gmail.com>
References: <1453165804-11840-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20160119212915.0c8c4b65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Erico Nunes,

On Mon, 18 Jan 2016 23:10:04 -0200, Erico Nunes wrote:
> This version doesn't use GIT_VERSION anymore, so the sed hook is no
> longer necessary.
> 
> Fixes http://autobuild.buildroot.net/results/ed89fae4a722b5d2adff9826bb88e55e58af77f6
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  package/spi-tools/spi-tools.hash |  2 +-
>  package/spi-tools/spi-tools.mk   | 12 +-----------
>  2 files changed, 2 insertions(+), 12 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
