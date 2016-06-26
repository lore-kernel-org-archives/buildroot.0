From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 23:07:41 +0200
Subject: [Buildroot] [8/8 v5] setools: fix build with latest selinux
 libraries.
In-Reply-To: <1466971401-29360-9-git-send-email-Aduskett@gmail.com>
References: <1466971401-29360-1-git-send-email-Aduskett@gmail.com>
 <1466971401-29360-9-git-send-email-Aduskett@gmail.com>
Message-ID: <20160626230741.1655c107@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 16:03:21 -0400, Adam Duskett wrote:

> diff --git a/package/setools/0003-fix-build-with-latest-selinux-libs.patch b/package/setools/0003-fix-build-with-latest-selinux-libs.patch
> new file mode 100644
> index 0000000..78203c8
> --- /dev/null
> +++ b/package/setools/0003-fix-build-with-latest-selinux-libs.patch
> @@ -0,0 +1,89 @@
> +Fix compile errors against newer versions of selinux libraries.
> +Credit to: Joe MacDonald <joe_macdonald@mentor.com>
> +URL: https://github.com/flihp/meta-selinux/commit/e09eaef7a9acb552a4a5e1f90117154ae06b6fda
> +
> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>

It would be nicer to copy the
setools-Update-for-2015-02-02-Userspace-release.patch file as-is
(especially its description and the fact that it's a Git-formatted
patch) and just add your SoB line at the end of the patch description.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
