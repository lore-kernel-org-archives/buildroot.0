From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 22:26:53 +0200
Subject: [Buildroot] [PATCH] linux: add support for ZSTD compression
In-Reply-To: <20200901134849.1139704-1-paul@crapouillou.net>
References: <20200901134849.1139704-1-paul@crapouillou.net>
Message-ID: <20200903222653.32a46291@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Sep 2020 15:48:49 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Add support for creating self-extractible kernels compressed with ZSTD.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  linux/Config.in | 3 +++
>  linux/linux.mk  | 3 +++
>  2 files changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
