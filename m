From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:32:22 +0200
Subject: [Buildroot] [PATCH 04/10] util-linux: add suport for SELinux
In-Reply-To: <1378429464-12546-5-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1378429464-12546-5-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130908183222.33b24fbf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 5 Sep 2013 20:04:18 -0500, Ryan Barnett wrote:
> Added patch to fix the LDFLAGS for libmount to support SELinux.
> 
> Cleaning up the naming of the util-linux patches.
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  ...-linux-002-program-invocation-short-name.patch} |    0
>  .../util-linux-003-libmount-libselinux-fix.patch   |   21 ++++++++++++++++++++
>  package/util-linux/util-linux.mk                   |   21 ++++++++++++++++++++
>  3 files changed, 42 insertions(+), 0 deletions(-)
>  rename package/util-linux/{util-linux-003-program-invocation-short-name.patch => util-linux-002-program-invocation-short-name.patch} (100%)
>  create mode 100644 package/util-linux/util-linux-003-libmount-libselinux-fix.patch
> 
> diff --git a/package/util-linux/util-linux-003-program-invocation-short-name.patch b/package/util-linux/util-linux-002-program-invocation-short-name.patch
> similarity index 100%
> rename from package/util-linux/util-linux-003-program-invocation-short-name.patch
> rename to package/util-linux/util-linux-002-program-invocation-short-name.patch
> diff --git a/package/util-linux/util-linux-003-libmount-libselinux-fix.patch b/package/util-linux/util-linux-003-libmount-libselinux-fix.patch
> new file mode 100644
> index 0000000..2c925bf
> --- /dev/null
> +++ b/package/util-linux/util-linux-003-libmount-libselinux-fix.patch
> @@ -0,0 +1,21 @@

Description of the patch + Signed-off-by, see
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

Also, it would be nice if you could submit those patches upstream, so
that hopefully in a later release of util-linux, they are integrated
and we can get rid of them at the Buildroot level.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
