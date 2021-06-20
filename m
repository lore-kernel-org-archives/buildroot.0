From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jun 2021 15:57:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/pdbg: fix build with -DNDEBUG
In-Reply-To: <20210611063921.212274-1-fontaine.fabrice@gmail.com>
References: <20210611063921.212274-1-fontaine.fabrice@gmail.com>
Message-ID: <0588351d-443c-6354-7d74-ac836201a8ee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/06/2021 08:39, Fabrice Fontaine wrote:
> Fix build failure with -DNDEBUG raised since commit
> 5a8c50fe05afacc3cbe8e7347e238da9f242fab0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9d90ede1ff7425cbb25b95aed3bf8d27ced865a4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

[snip]
> diff --git a/package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch b/package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch
> new file mode 100644
> index 0000000000..323a87d779
> --- /dev/null
> +++ b/package/pdbg/0002-build-Fix-build-with-DNDEBUG.patch
> @@ -0,0 +1,71 @@
> +From cd1a44bac413e8a6bc2572720153cc5e703762e1 Mon Sep 17 00:00:00 2001
> +From: Amitay Isaacs <amitay@ozlabs.org>
> +Date: Fri, 11 Jun 2021 15:27:29 +1000
> +Subject: [PATCH] build: Fix build with -DNDEBUG
> +
> +Signed-off-by: Amitay Isaacs <amitay@ozlabs.org>
> +[Retrieved from:
> +https://github.com/open-power/pdbg/commit/cd1a44bac413e8a6bc2572720153cc5e703762e1]

 I took the liberty of adding your signoff here.

 Regards,
 Arnout
