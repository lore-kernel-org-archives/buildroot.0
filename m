From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jul 2010 08:29:06 +0200
Subject: [Buildroot] converting util-linux-ng to autotargets
In-Reply-To: <4C4C94EB.8010105@gmx.net>
References: <4C4C94EB.8010105@gmx.net>
Message-ID: <20100726082906.49146628@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Jul 2010 21:47:55 +0200
Ossy <ossy1980@gmx.net> wrote:

> My br-config includes the util-linux-ng package:
> ossy at debian-virtual:~/buildroot/buildroot-dev$ cat .config|grep 
> UTIL-LINUX-NG
> BR2_PACKAGE_UTIL-LINUX-NG=y

The configuration option should be BR2_PACKAGE_UTIL_LINUX_NG (with
underscores), even if the package is named util-linux-ng.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
