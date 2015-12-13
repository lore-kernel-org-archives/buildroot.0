From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:24:02 +0100
Subject: [Buildroot] [PATCH v2] package/libfreeglut: new package
In-Reply-To: <1450024301-24083-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450024301-24083-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213222402.311e1895@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

Thanks for the new version.

On Sun, 13 Dec 2015 17:31:41 +0100, Bernd Kuhls wrote:

> diff --git a/package/libfreeglut/Config.in b/package/libfreeglut/Config.in
> new file mode 100644
> index 0000000..e09e7ef
> --- /dev/null
> +++ b/package/libfreeglut/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_LIBFREEGLUT
> +	bool "libfreeglut"
> +	select BR2_PACKAGE_LIBGLU
> +	select BR2_PACKAGE_XLIB_LIBXI

Where is this libXi dependency coming from? (It was already a question
from my previous review).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
