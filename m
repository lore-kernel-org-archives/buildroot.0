From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 22:46:06 +0200
Subject: [Buildroot] [PATCH 08/23] kernel-headers: migrate to the
	package infrastructure
In-Reply-To: <1372620553-11416-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:28:58 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vc4rpe29.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  ...tall-fix-__packed-in-exported-kernel-head.patch |  0
 Thomas>  .../linux-headers/3.3.8/linux-fix-umode_t.patch    |  0
 Thomas>  .../linux-headers/Config.in.host                   |  5 +-
 Thomas>  package/linux-headers/linux-headers.mk             | 31 ++++++++
 Thomas>  toolchain/kernel-headers/kernel-headers.mk         | 87 ----------------------
 Thomas>  toolchain/toolchain-buildroot.mk                   |  1 -
 Thomas>  toolchain/toolchain-buildroot/Config.in            |  2 +-
 Thomas>  toolchain/toolchain-external.mk                    |  1 -
 Thomas>  toolchain/uClibc/uclibc.mk                         | 13 +---
 Thomas>  9 files changed, 38 insertions(+), 102 deletions(-)

 Thomas> +++ b/package/linux-headers/linux-headers.mk
 Thomas> @@ -0,0 +1,31 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# linux-headers
 Thomas> +#
 Thomas> +#############################################################

These should be 80 chars.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
