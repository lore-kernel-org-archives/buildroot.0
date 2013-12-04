From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Dec 2013 08:45:24 +0100
Subject: [Buildroot] [PATCH v3] package/tvheadend: unbreak
In-Reply-To: <1386115721-24113-1-git-send-email-yann.morin.1998@free.fr>
References: <1386115721-24113-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20131204084524.1227d22c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  4 Dec 2013 01:08:41 +0100, Yann E. MORIN wrote:

> diff --git a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
> new file mode 100644
> index 0000000..caa6e2a
> --- /dev/null
> +++ b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
> @@ -0,0 +1,21 @@
> +support: don't try to run compiled code
> +
> +When cross-compiling, we can't run the compiled code.
> +
> +Consider the compiler besing successfull as an indication
> +it is working.

What does "the compiler being successful" means?

And also:

 besing -> being
 successfull -> successful

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
