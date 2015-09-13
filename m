From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 23:31:14 +0200
Subject: [Buildroot] [PATCH 1/1] wpa_supplicant: fix static link with
 readline
In-Reply-To: <1442178981-24635-1-git-send-email-0intro@gmail.com>
References: <1442178981-24635-1-git-send-email-0intro@gmail.com>
Message-ID: <20150913233114.327f1428@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

Thanks for this contribution!

On Sun, 13 Sep 2015 23:16:21 +0200, David du Colombier wrote:
> When linking statically, the order of libraries on the
> linker command matters, since readline depends on ncurses.
> 
> Signed-off-by: David du Colombier <0intro@gmail.com>
> ---
>  package/wpa_supplicant/0005-fix-readline-libs-ordering.patch | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 package/wpa_supplicant/0005-fix-readline-libs-ordering.patch
> 
> diff --git a/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch b/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch
> new file mode 100644
> index 0000000..b2439f0
> --- /dev/null
> +++ b/package/wpa_supplicant/0005-fix-readline-libs-ordering.patch

Thanks for the patch, but patches in Buildroot have to have a
description and a Signed-off-by line. See
http://buildroot.uclibc.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

Also, could you submit this patch to upstream wpa_supplicant?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
