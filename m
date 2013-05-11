From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 May 2013 12:10:53 +0200
Subject: [Buildroot] [PATCH 1/1] Disable building of cups driver in
 host-gutenprint
In-Reply-To: <1368265366-24526-1-git-send-email-olivier.schonken@gmail.com>
References: <1368259049-27252-1-git-send-email-olivier.schonken@gmail.com>
 <1368265366-24526-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130511121053.53f32058@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sat, 11 May 2013 11:42:46 +0200, Olivier Schonken wrote:
> This should fix http://autobuild.buildroot.org/results/d2e386b50744aeda7257a0b78aafe90ba4da697c/
> Because there is no host-cups package, host-gutenprint cant build the
> host-cups drivers - missing includes and libs.  Host gutenprint only
> built to get the xml. Thus not a loss.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> 
> Corrected absent minded mistake. Thanks Thomas
> ---
>  package/gutenprint/gutenprint.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, but the "Corrected absent minded mistake..." sentence should be
below the "---" sign, otherwise, it will remain part of the commit
history forever.

Also, when you send a new version of a patch, please make sure to
change the title from PATCH 1/1 to PATCH v2 1/1. This can be achieved
by doing git format-patch --subject-prefix="PATCH v2". --subject-prefix
also works directly with git send-email.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
