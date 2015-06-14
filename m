From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 22:44:31 +0200
Subject: [Buildroot] [PATCH/RFC v2 02/44] package/libplatform: new
 package
In-Reply-To: <1434292603-12052-3-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
 <1434292603-12052-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150614224431.00c71b0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 14 Jun 2015 16:36:01 +0200, Bernd Kuhls wrote:

> diff --git a/package/libplatform/Config.in b/package/libplatform/Config.in
> new file mode 100644
> index 0000000..7d275b1
> --- /dev/null
> +++ b/package/libplatform/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBPLATFORM
> +	bool

Any reason to not have a prompt?

Also, it probably needs C++ and threads support.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
