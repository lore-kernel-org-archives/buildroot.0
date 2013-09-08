From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:27:33 +0200
Subject: [Buildroot] [PATCH 01/10] sysvinit: add support for SELinux
In-Reply-To: <1378429464-12546-2-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1378429464-12546-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130908182733.691b32a5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 5 Sep 2013 20:04:15 -0500, Ryan Barnett wrote:
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  .../sysvinit-0002-selinux_flag_addition_fix.patch  |   15 +++++++++++++++
>  package/sysvinit/sysvinit.mk                       |    6 ++++++
>  2 files changed, 21 insertions(+), 0 deletions(-)
>  create mode 100644 package/sysvinit/sysvinit-0002-selinux_flag_addition_fix.patch
> 
> diff --git a/package/sysvinit/sysvinit-0002-selinux_flag_addition_fix.patch b/package/sysvinit/sysvinit-0002-selinux_flag_addition_fix.patch
> new file mode 100644
> index 0000000..978f59b
> --- /dev/null
> +++ b/package/sysvinit/sysvinit-0002-selinux_flag_addition_fix.patch
> @@ -0,0 +1,15 @@

This patch lacks a description + Signed-off-by line. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
