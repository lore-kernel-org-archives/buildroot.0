From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 10:22:29 +0100
Subject: [Buildroot] [PATCH] wolfssl: install into staging
In-Reply-To: <20181030102300.10254-1-peter@korsgaard.com>
References: <20181030102300.10254-1-peter@korsgaard.com>
Message-ID: <20181031102229.36fd1a7d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Oct 2018 11:23:00 +0100, Peter Korsgaard wrote:
> wolfssl is a library, so it should be installed into staging so other
> packages can find the header files / library.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/wolfssl/wolfssl.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
