From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:26:55 +0200
Subject: [Buildroot] [PATCH 3/3] php: add opcache option
In-Reply-To: <1428507569-28044-3-git-send-email-gustavo@zacarias.com.ar>
References: <1428507569-28044-1-git-send-email-gustavo@zacarias.com.ar>
 <1428507569-28044-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150408212655.2a4fe0cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  8 Apr 2015 12:39:29 -0300, Gustavo Zacarias wrote:

> diff --git a/package/php/0004-flock-type-linux.patch b/package/php/0004-flock-type-linux.patch
> new file mode 100644
> index 0000000..a03c262
> --- /dev/null
> +++ b/package/php/0004-flock-type-linux.patch
> @@ -0,0 +1,48 @@
> +OPcache: flock mechanism is obviously linux so force it.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Would have been a nicer (and potentially upstreamable) solution to have
a AC_CACHE_VAL that allows to prefeed the result of the tests from the
configure environment.

Applied anyway, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
