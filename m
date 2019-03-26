From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 12:58:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/uftp: Fix compilation with
 openssl
In-Reply-To: <20190325234237.11349-1-vadim4j@gmail.com>
References: <20190325234237.11349-1-vadim4j@gmail.com>
Message-ID: <20190326125815.1831dea7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Mar 2019 01:42:37 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> Build fails with -lssl but succeeds with -lcrypto, also thats how it is
> linked by default in 'makefile'.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/01a455ddcbc16cd2111352d22bf6603842df4ab2
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/uftp/uftp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
