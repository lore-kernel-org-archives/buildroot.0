From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 13:58:03 +0100
Subject: [Buildroot] [PATCH] package/moarvm: resolve libtommath name
 collision
In-Reply-To: <1549371272-5485-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549371272-5485-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20190205135803.07660a5f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Feb 2019 06:54:32 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Fixes
> http://autobuild.buildroot.net/results/02f/02ff68698603ebdce5d13d3130a15b5a1ecc14d2/build-end.log
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  ...-Fix-Name-Collision-With-LibTomMath-Funcs.patch | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch
> 
> diff --git a/package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch b/package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch
> new file mode 100644
> index 0000000..621a4b3
> --- /dev/null
> +++ b/package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch
> @@ -0,0 +1,63 @@
> +From 588d4805097d01865538a2d5c52d59c99a1015e7 Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>

Please preserve the original authorship. Create a Git branch that
starts with the tag we're using in Buildroot, cherry-pick the upstream
commit, fix the conflicts and then git format-patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
