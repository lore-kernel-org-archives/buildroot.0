From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jan 2020 13:53:50 +0100
Subject: [Buildroot] [PATCH] package/tpm2-totp: bump version to 0.2.1
In-Reply-To: <20200113074352.20992-1-peter@korsgaard.com>
References: <20200113074352.20992-1-peter@korsgaard.com>
Message-ID: <20200113135350.303d13e4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jan 2020 08:43:51 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> And drop patch now upstream.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...-src-libtpm2-totp.c-include-endian.h.patch | 34 -------------------
>  package/tpm2-totp/tpm2-totp.hash              |  2 +-
>  package/tpm2-totp/tpm2-totp.mk                |  2 +-
>  3 files changed, 2 insertions(+), 36 deletions(-)
>  delete mode 100644 package/tpm2-totp/0001-src-libtpm2-totp.c-include-endian.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
