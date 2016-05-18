From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Thu, 19 May 2016 09:42:22 +1000
Subject: [Buildroot] [PATCH 0/6] Makefile: Support merged and nested
 defconfigs.
In-Reply-To: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
References: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <20160518234222.GA2602@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 18, 2016 at 02:25:24PM -0500, Patrick Williams wrote:
> This is a combination and cleanup of the previous efforts by
> Sam Bobroff and Elizabeth Liner to introduce merged defconfigs
> and nested defconfig directories respectively.
> 
> Merged defconfigs allow us to create defconfig snippets for aspects
> that are common across multiple machines and create a combined defconfig
> from the snippets.  The support scripts for merged kernel defconfigs is
> reused.
> 
> Nested defconfig directories allow us to organize the defconfig
> directory into sub-directories.  A likely use for this is to place
> defconfigs into architecture-specific subdirectories.
> 
> Elizabeth Liner (1):
>   Makefile: Support nested config directories
> 
> Patrick Williams (4):
>   Makefile: Generate %_defconfig recipes from macro.
>   Makefile: Add nested config dirs to list-defconfigs
>   Makefile: Add merged defconfigs to list-defconfigs.
>   Makefile: Fix merge defconfig clobber of .config.old
> 
> Sam Bobroff (1):
>   Makefile: Support merged defconfigs
> 
>  Makefile | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)

Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

> 
> -- 
> 2.6.3
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
