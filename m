From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 22:42:06 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/kodi-visualisation-goom: new
 package
In-Reply-To: <1446239247-6651-1-git-send-email-bernd.kuhls@t-online.de>
References: <1446239247-6651-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151102224206.47160d9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Fri, 30 Oct 2015 22:07:26 +0100, Bernd Kuhls wrote:

> diff --git a/package/kodi-visualisation-goom/0001-cross-compile.patch b/package/kodi-visualisation-goom/0001-cross-compile.patch
> new file mode 100644
> index 0000000..8dd0fe9
> --- /dev/null
> +++ b/package/kodi-visualisation-goom/0001-cross-compile.patch
> @@ -0,0 +1,32 @@
> +Fix cross-compilation
> +
> +Use the cross-compiler and not the host version.
> +
> +Patch sent upstream:
> +https://github.com/notspiff/visualization.goom/pull/4

Seems like upstream feedback wasn't very good on this, and with some
good reason I believe since it's quite hackish, no?

Don't you think we can find a better solution to pass down the --host
value ? Maybe an explicit CMakeLists.txt option ?

This packaging is really weird :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
