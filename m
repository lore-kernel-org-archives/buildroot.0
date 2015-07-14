From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 10:07:07 +0200
Subject: [Buildroot] [PATCH 1/2] at: bump version 3.1.16
In-Reply-To: <55A45D00.9030909@gmail.com>
References: <f3aa3efc49568ce60fa774f02c3f031ccbf40da2.1432332802.git.alex.suykov@gmail.com>
 <55A45D00.9030909@gmail.com>
Message-ID: <20150714100707.01cd130d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Aur?lien Chabot,

On Tue, 14 Jul 2015 02:51:12 +0200, Aur?lien Chabot wrote:
> Patch refreshed :
> 	0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
> 	0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
> 	0005-Makefile.in-make-install-fix.patch
> 	0006-getloadavg.c-fix.patch
> 	0007-parsetime.l-include-config-h.patch
> 	0008-remove-glibc-__isleap-assumption.patch
> 
> Patch removed (merge upstream) :
> 	0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
> 	0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
> 
> Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>

Your patches have been wrapped by your e-mail client. Please use git
send-email.

Also, when you resend new version of patches, please use something like
[PATCH v2] in the subject, and indicate in a cover letter or inside the
patches what are the changes with the previous version. Do use [PATCH
v2] in the subject, generate your patches with:

	git format-patch --subject-prefix "PATCHv2"

Also, you probably don't need to send them as replies to the old
systemd support thread.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
