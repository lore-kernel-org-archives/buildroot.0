From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:46:11 +0200
Subject: [Buildroot] [PATCH 1/1] Added extra patch to qt5base package
 for fixing ccache related compile error with new QT 5.5
In-Reply-To: <1437907778-3734-1-git-send-email-jaap@jcz.nl>
References: <1437907778-3734-1-git-send-email-jaap@jcz.nl>
Message-ID: <20150728234611.7f837bb7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jaap Crezee,

On Sun, 26 Jul 2015 12:49:38 +0200, Jaap Crezee wrote:
> Signed-off-by: Jaap Crezee <jaap@jcz.nl>
> Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

An empty commit log is not acceptable. Also the commit title is too
long, and should follow the form:

	qt5base: <description>

> diff --git a/package/qt5/qt5base/0008-ccache_buildroot_fix.patch b/package/qt5/qt5base/0008-ccache_buildroot_fix.patch
> new file mode 100644
> index 0000000..62aa57b
> --- /dev/null
> +++ b/package/qt5/qt5base/0008-ccache_buildroot_fix.patch
> @@ -0,0 +1,16 @@
> +Author: Jaap Crezee <jaap@jcz.nl>

All patches should have a description + Signed-off-by (and not
Author:). See the Buildroot manual.

Also, did you file a bug in Qt's bug tracker for this issue?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
