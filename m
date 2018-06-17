From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:04:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 version 8.11.3
In-Reply-To: <20180616224408.31434-1-martin@barkynet.com>
References: <20180616224408.31434-1-martin@barkynet.com>
Message-ID: <20180617140435.1844cf11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jun 2018 23:44:08 +0100, Martin Bark wrote:
> Fixes the following security issues:
> 
> - (CVE-2018-7167): Fixes Denial of Service vulnerability where calling
>   Buffer.fill() could hang
> 
> - (CVE-2018-7161): Fixes Denial of Service vulnerability by updating the
>   http2 implementation to not crash under certain circumstances during
>   cleanup
> 
> - (CVE-2018-1000168): Fixes Denial of Service vulnerability by upgrading
>   nghttp2 to 1.32.0
> 
> See https://nodejs.org/en/blog/release/v8.11.3/ for more details
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/nodejs/nodejs.hash | 4 ++--
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
