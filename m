From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 09:32:11 +0200
Subject: [Buildroot] [PATCH] Updating syslinux to v3.82.
In-Reply-To: <1253520895-27598-1-git-send-email-anders.darander@gmail.com>
	(Anders Darander's message of "Mon\,
	21 Sep 2009 10\:14\:55 +0200")
References: <1253520895-27598-1-git-send-email-anders.darander@gmail.com>
Message-ID: <87pr9iru9w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Anders" == Anders Darander <anders.darander@gmail.com> writes:

 Anders> From: Anders Darander <ad@datarespons.se>
 Anders> Signed-off-by: Anders Darander <ad@datarespons.se>
 Anders> ---
 Anders>  target/x86/syslinux/Config.in                    |    1 +
 Anders>  target/x86/syslinux/syslinux-3.61-makefile.patch |   11 -----------
 Anders>  target/x86/syslinux/syslinux-3.82-makefile.patch |   11 +++++++++++
 Anders>  target/x86/syslinux/syslinux.mk                  |    4 ++--
 Anders>  4 files changed, 14 insertions(+), 13 deletions(-)
 Anders>  delete mode 100644 target/x86/syslinux/syslinux-3.61-makefile.patch
 Anders>  create mode 100644 target/x86/syslinux/syslinux-3.82-makefile.patch

 Anders> diff --git a/target/x86/syslinux/Config.in b/target/x86/syslinux/Config.in
 Anders> index 6a946e4..59f1c99 100644
 Anders> --- a/target/x86/syslinux/Config.in
 Anders> +++ b/target/x86/syslinux/Config.in
 Anders> @@ -3,6 +3,7 @@ config BR2_TARGET_SYSLINUX
 Anders>  	depends on BR2_i386
 Anders>  	help
 Anders>  	  The syslinux bootloader for x86 systems.
 Anders> +          This includes: syslinux, pxelinux, extlinux.

Indentation of help text is <tab><space><space>text. Other than that it
looks fine - Committed, thanks.

-- 
Bye, Peter Korsgaard
