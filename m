From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 08 Mar 2016 20:35:14 -0300
Subject: [Buildroot] [PATCH v2] toolchain: improve SSP logic
References: <1457457919-20121-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <56df61b2b3a4f_1592192b8cc4262b@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
  Unrelated to this patch, but...
  I think my mail client is now correctly configured to send comments to
  patchwork. I will check there. If the comment does not show again, please
  forgive me. I will switch to another mail client if this does not work.

Vicente,

On Tue, Mar 08, 2016 at 02:25 PM, Vicente Olivert Riera <Vincent.Riera@imgtec.com> wrote:

> from: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> date: Tue, Mar 08 05:25 PM +00:00 2016
> to: buildroot at buildroot.org
> cc: thomas.petazzoni at free-electrons.com
> subject: [Buildroot] [PATCH v2] toolchain: improve SSP logic
> 
[snip]
> @@ -372,6 +390,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
>  	$(UCLIBC_ENDIAN_CONFIG)
>  	$(UCLIBC_LARGEFILE_CONFIG)
>  	$(UCLIBC_IPV6_CONFIG)
> +	$(UCLIBC_SSP_CONFIG)
>  	$(UCLIBC_RPC_CONFIG)
>  	$(UCLIBC_FLOAT_CONFIG)
>  	$(UCLIBC_SSP_CONFIG)
[snip]

Please notice (in the diff context lines) that the symbol UCLIBC_SSP_CONFIG is
already in use.

Regards,
Ricardo
