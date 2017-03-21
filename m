From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 22:23:52 +0100
Subject: [Buildroot] [PATCH] package/dbus-cpp: fix cross-compilation
In-Reply-To: <1490130034-10602-1-git-send-email-yann.morin.1998@free.fr>
References: <1490130034-10602-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170321222352.440d6a4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 22:00:34 +0100, Yann E. MORIN wrote:

> diff --git a/package/dbus-cpp/0002-cross-compile-tools.patch b/package/dbus-cpp/0002-cross-compile-tools.patch
> new file mode 100644
> index 0000000..51a67e2
> --- /dev/null
> +++ b/package/dbus-cpp/0002-cross-compile-tools.patch
> @@ -0,0 +1,23 @@
> +diff -durN dbus-cpp-0.9.0.orig/tools/Makefile.am dbus-cpp-0.9.0/tools/Makefile.am
> +--- dbus-cpp-0.9.0.orig/tools/Makefile.am	2017-03-21 21:48:57.013409423 +0100
> ++++ dbus-cpp-0.9.0/tools/Makefile.am	2017-03-21 21:49:35.329979798 +0100

Missing description + SoB in the patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
