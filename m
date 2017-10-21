From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:22:01 +0200
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: add upstream patch
 for openjpeg2.3
In-Reply-To: <20171021190841.8636-1-olivier.schonken@gmail.com>
References: <20171021190841.8636-1-olivier.schonken@gmail.com>
Message-ID: <20171021212201.112d9b84@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 21:08:41 +0200, Olivier Schonken wrote:
> This patch has been merged in the upstream repository,
> thus it can be removed for subsequent releases
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  .../0001-support-building-with-openjpeg-2.3.patch  | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 package/gstreamer1/gst1-plugins-bad/0001-support-building-with-openjpeg-2.3.patch
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/0001-support-building-with-openjpeg-2.3.patch b/package/gstreamer1/gst1-plugins-bad/0001-support-building-with-openjpeg-2.3.patch
> new file mode 100644
> index 0000000000..7faee45a63
> --- /dev/null
> +++ b/package/gstreamer1/gst1-plugins-bad/0001-support-building-with-openjpeg-2.3.patch
> @@ -0,0 +1,81 @@
> +From bff2d834a4a38f64e555cee3d0144fde6c515acd Mon Sep 17 00:00:00 2001
> +From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
> +Date: Thu, 19 Oct 2017 16:36:17 +0200
> +Subject: openjpeg: Support building with openjpeg 2.3, simpler
> +
> +OpenJPEG 2.3 installs its headers to /usr/include/openjpeg-2.3. However,
> +since libopenjp2.pc seems to provide the right includedir CFLAGS at
> +least since version 2.1, instead of adding yet another version check,
> +just remove the subdir and the check for 2.2.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=788703

We need your Signed-off-by here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
