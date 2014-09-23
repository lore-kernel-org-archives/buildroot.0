From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 23 Sep 2014 17:23:33 +0100
Subject: [Buildroot] [PATCH 3/3] libgtk3: new package
In-Reply-To: <1411489271-26899-4-git-send-email-eric.le.bihan.dev@free.fr>
References: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1411489271-26899-4-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <54219E85.6020906@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/23/2014 05:21 PM, Eric Le Bihan wrote:
> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> new file mode 100644
> index 0000000..523d8f1
> --- /dev/null
> +++ b/package/libgtk3/libgtk3.mk
> @@ -0,0 +1,174 @@
> +################################################################################
> +#
> +# libgtk3
> +#
> +################################################################################
> +
> +LIBGTK3_VERSION_MAJOR = 3.12
> +LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).2

Since you are planing to add a new package, why not use the latests 
version of it? 3.14.0

-- 
Vincent
