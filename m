From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 25 Apr 2012 16:26:43 +0200
Subject: [Buildroot] [PATCH] util-linux: disable installing binaries by
 default
In-Reply-To: <1335359709-26898-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335359709-26898-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335364003.2428.14.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2012-04-25 at 10:15 -0300, Gustavo Zacarias wrote:
> +config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +       select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +       bool "libblkid and blkid utilities"
> +       default y
> 
Actually it only installs libblkid. If you want the blkid utility you
also need to select BR2_PACKAGE_UTIL_LINUX_BINARIES.


Regards,
Sven
