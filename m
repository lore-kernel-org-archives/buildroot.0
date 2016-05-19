From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 May 2016 15:55:12 +0300
Subject: [Buildroot] [PATCH v3 1/2] igmpproxy: uclinux support merged
 upstream
In-Reply-To: <1463661925-56795-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463661925-56795-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160519125512.GA2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Thu, May 19, 2016 at 07:45:24AM -0500, Matt Weber wrote:
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> --
> v2 -> v3
>  - Upstream version bump now contains this feature

Then both patches should be squashed into one.

baruch

> ---
>  package/igmpproxy/0001-uclinux.patch | 16 ----------------
>  1 file changed, 16 deletions(-)
>  delete mode 100644 package/igmpproxy/0001-uclinux.patch
> 
> diff --git a/package/igmpproxy/0001-uclinux.patch b/package/igmpproxy/0001-uclinux.patch
> deleted file mode 100644
> index 7fa4a23..0000000
> --- a/package/igmpproxy/0001-uclinux.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -configure.ac: uclinux is also linux
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -diff -Nura igmpproxy-0.1.orig/configure.ac igmpproxy-0.1/configure.ac
> ---- igmpproxy-0.1.orig/configure.ac	2014-03-12 18:43:02.369323771 -0300
> -+++ igmpproxy-0.1/configure.ac	2014-03-12 18:43:22.129979179 -0300
> -@@ -7,7 +7,7 @@
> - 
> - AC_CANONICAL_HOST
> - case $host_os in
> --	linux*) os=linux;;
> -+	linux*|uclinux*) os=linux;;
> - 	freebsd*) os=freebsd;;
> - 	netbsd*) os=netbsd;;
> - 	openbsd*) os=openbsd;;

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
