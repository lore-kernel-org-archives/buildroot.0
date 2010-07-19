From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 Jul 2010 09:43:08 +0200
Subject: [Buildroot] [PATCH] Fix default skeleton path
In-Reply-To: <1279520701-29156-1-git-send-email-m-starostik@versanet.de>
	(Malte Starostik's message of "Mon, 19 Jul 2010 08:25:01 +0200, Mon,
	19 Jul 2010 08:25:50 +0200")
References: <1279520701-29156-1-git-send-email-m-starostik@versanet.de>
Message-ID: <874ofvvrw3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Malte" == Malte Starostik <m-starostik@versanet.de> writes:

 Malte> Signed-off-by: Malte Starostik <m-starostik@versanet.de>
 Malte> ---
 Malte>  Makefile |    2 +-
 Malte>  1 files changed, 1 insertions(+), 1 deletions(-)

 Malte> diff --git a/Makefile b/Makefile
 Malte> index 744cae4..f6e02bc 100644
 Malte> --- a/Makefile
 Malte> +++ b/Makefile
 Malte> @@ -271,7 +271,7 @@ STAMP_DIR:=$(BASE_DIR)/stamps
 Malte>  BINARIES_DIR:=$(BASE_DIR)/images
 Malte>  TARGET_DIR:=$(BASE_DIR)/target
 Malte>  TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 Malte> -TARGET_SKELETON=$(BASE_DIR)/fs/skeleton
 Malte> +TARGET_SKELETON=$(TOPDIR)/fs/skeleton

Committed, thanks!

-- 
Bye, Peter Korsgaard
