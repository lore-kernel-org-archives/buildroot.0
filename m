From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 19 May 2016 06:35:42 -0500
Subject: [Buildroot] [PATCH v2] igmpproxy: Use standard unsigned integer
	types
In-Reply-To: <1463630579-26758-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463630579-26758-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpbrDN3Ls2NpR3kbHALaESHNXDa-x1q2c3VRnFL-_PQS3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, May 18, 2016 at 11:02 PM, Matt Weber <
matthew.weber@rockwellcollins.com> wrote:

> Fixes
>
> http://autobuild.buildroot.net/results/c6a/c6a6eec34cffb2c7876595b36fb8a01f475583f9/
>
> http://autobuild.buildroot.net/results/943/9432748bf7b1e24db9fcb0a8cce6942fcdf6be5b/
>
> http://autobuild.buildroot.net/results/083/083c61f43c2f1f0dec69d44583b447a0520933b7/
> ...
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Matt Weber <matt@thewebers.ws>
>
> --
> v1 -> v2
> (Suggested by Thomas)
>  - Updated patch comment to correctly represent the origin
>    and latest issue tracking
>  - Updated title to reflect patch purpose
> ---
>  .../0002-Use-standard-unsigned-integer-types.patch | 209
> +++++++++++++++++++++
>  1 file changed, 209 insertions(+)
>  create mode 100644
> package/igmpproxy/0002-Use-standard-unsigned-integer-types.patch
>
> diff --git
> a/package/igmpproxy/0002-Use-standard-unsigned-integer-types.patch
> b/package/igmpproxy/0002-Use-standard-unsigned-integer-types.patch
> new file mode 100644
> index 0000000..5167739
> --- /dev/null
> +++ b/package/igmpproxy/0002-Use-standard-unsigned-integer-types.patch
> @@ -0,0 +1,209 @@
> +From ed3dff27f360239910310be6706fd54572398992 Mon Sep 17 00:00:00 2001
> +From: Natanael Copa <ncopa@alpinelinux.org>
> +Date: Mon, 3 Mar 2014 12:11:26 +0000
> +Subject: [PATCH] Use standard unsigned integer types
> +
> +Use the stanard unsigned integer types instead of the non-standard
> +u_char, u_short and u_int.
> +(This fixes build with musl libc)
> +
> +Based on:
> +
> https://github.com/alpinelinux/aports/blob/master/main/igmpproxy/0001-Use-standard-unsigned-integer-types.patch
> +
> +Patch was reported upstream:
> +(old)http://sourceforge.net/p/igmpproxy/bugs/22/
> +(active)https://github.com/pali/igmpproxy/issues/5


Got feedback from maintainer and started to work through a pull request to
have these changes merged, so hopefully this turns into a version bump.

Thanks,
Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160519/34107eda/attachment.html>
