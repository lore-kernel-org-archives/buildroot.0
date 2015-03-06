From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 17:34:44 +0100
Subject: [Buildroot] [PATCH] valgrind: rename ptrcheck to sgcheck like
 upstream
In-Reply-To: <1425652337-25911-1-git-send-email-mike@mikebwilliams.com>
References: <1425652337-25911-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <20150306173444.05bec8e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Fri,  6 Mar 2015 09:32:17 -0500, Mike Williams wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ---
>  package/valgrind/Config.in   | 6 +++---
>  package/valgrind/valgrind.mk | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
> index 558d5f0..d9116dd 100644
> --- a/package/valgrind/Config.in
> +++ b/package/valgrind/Config.in
> @@ -53,10 +53,10 @@ config BR2_PACKAGE_VALGRIND_DHAT
>  	help
>  	  This option allows to install the DHAT tool
>  
> -config BR2_PACKAGE_VALGRIND_PTRCHECK
> -	bool "Ptrcheck: an experimental head, stack and global array overrun detector"
> +config BR2_PACKAGE_VALGRIND_SGCHECK

When renaming config options, we want to add the corresponding
Config.in.legacy handling. See the file named Config.in.legacy in the
top-level directory of Buildroot sources for details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
