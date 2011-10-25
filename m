From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 25 Oct 2011 11:20:26 +0200
Subject: [Buildroot] [PATCH 3 of 3 resend] uclibc: rename uclibc-update
	to uclibc-update-config
In-Reply-To: <e4abed4517b5f7e865f6.1318604218@localhost6.localdomain6>
References: <patchbomb.1318604215@localhost6.localdomain6>
 <e4abed4517b5f7e865f6.1318604218@localhost6.localdomain6>
Message-ID: <CAAXf6LU+0ZLQWkq5kijYGE6BiwmnOLbcCcn5DM7_UY0f1trSdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 14, 2011 at 4:56 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> The original name uclibc-update is confusing as it only updates a
> configuration file.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> ---
> ?toolchain/uClibc/uclibc.mk | ?2 +-
> ?1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
> --- a/toolchain/uClibc/uclibc.mk
> +++ b/toolchain/uClibc/uclibc.mk
> @@ -500,7 +500,7 @@
>
> ?uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
>
> -uclibc-update: uclibc-config
> +uclibc-update-config: uclibc-config
> ? ? ? ?cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
>
> ?uclibc-configured: gcc_initial kernel-headers $(UCLIBC_DIR)/.configured
>

bump
