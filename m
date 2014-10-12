From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Oct 2014 00:05:00 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix build failure
In-Reply-To: <1413144879-26661-1-git-send-email-s.martin49@gmail.com>
References: <1413144879-26661-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20141013000500.10452497@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 12 Oct 2014 22:14:39 +0200, Samuel Martin wrote:
> Correctly set NGX_SYS_NERR, even when it is 0.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/666/666d780bf61e10c9f89f765bb04ddc1afc11d0d1/
>   http://autobuild.buildroot.org/?reason=nginx-1.6.2&&arch=powerpc
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  .../nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
> index 4c00755..d02de68 100644
> --- a/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
> +++ b/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch

Description + SoB in the patch ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
