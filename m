From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:41:58 +0200
Subject: [Buildroot] [PATCH] package/tpm2-tss: bump version to 2.1.3
In-Reply-To: <20190416201404.908-1-peter@korsgaard.com>
References: <20190416201404.908-1-peter@korsgaard.com>
Message-ID: <20190417084158.0fda927f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Apr 2019 22:14:04 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes a number of issues discovered post-2.1.2. For details, see:
> https://github.com/tpm2-software/tpm2-tss/releases/tag/2.1.3
> 
> Drop 002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch as this
> issue is now fixed upstream.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...c-switch-default-ESAPI-crypto-backend-to-.patch | 32 ----------------------
>  package/tpm2-tss/tpm2-tss.hash                     |  2 +-
>  package/tpm2-tss/tpm2-tss.mk                       |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/tpm2-tss/0002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
