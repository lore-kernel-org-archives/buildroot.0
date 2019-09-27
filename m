From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:22:29 +0200
Subject: [Buildroot] [PATCH] package/cryptodev-linux: bump to version
 a1e738a
In-Reply-To: <1569265269-12741-1-git-send-email-pjtexier@koncepto.io>
References: <1569265269-12741-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190927232229.1f23afad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 21:01:09 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> This includes the following changes:
> 
> a1e738a tests: cipher-aead-srtp: Fix cao->dst alignment
> f971e0c Fix module loading with Linux v5.0-rc5
> fd8b15e Release version 1.10
> 6b0a81c add CIOCCPHASH to copy hash state between sessions
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/cryptodev-linux/cryptodev-linux.hash | 2 +-
>  package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
