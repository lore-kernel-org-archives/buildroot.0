From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Apr 2013 16:19:54 +0200
Subject: [Buildroot] [PATCH 1/2] at: rename patches version in the
 filename
In-Reply-To: <1365782482-7417-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1365782482-7417-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20130413161954.081e4c90@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

Thanks Jerzy for your patch.

On Fri, 12 Apr 2013 18:01:21 +0200, Jerzy Grzegorek wrote:
> at: rename patches version in the filename regarding - 
> bump to version 3.1.13
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  ...-remove-manual-compiler-check-with-AC_TR.patch} |    0
>  ...-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} |    0
>  ...Makefile.in-add-LDFLAGS-to-linking-stage.patch} |    0
>  ...005-Makefile.in-replace-IROOT-by-DESTDIR.patch} |    0
>  ...3.1.13-0006-Makefile.in-make-install-fix.patch} |    0
>  ...x.patch => at-3.1.13-0007-getloadavg-fix.patch} |    0
>  ...patch => at-3.1.13-0007-include-config-h.patch} |    0
>  7 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/at/{at-3.1.12-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch => at-3.1.13-0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch} (100%)
>  rename package/at/{at-3.1.12-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch => at-3.1.13-0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch} (100%)

Nowadays, we want the patches to not have any version number in their
name. So please rename the patches to
at-0001-configure.ac-blabla.patch, etc.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
