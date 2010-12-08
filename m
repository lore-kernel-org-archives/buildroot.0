From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Dec 2010 20:12:19 +0100
Subject: [Buildroot] [PATCH 08/17] busybox: move udhcp script from
 skeleton to package
In-Reply-To: <1291802049-18764-9-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
	<1291802049-18764-9-git-send-email-llandwerlin@gmail.com>
Message-ID: <20101208201219.52cbfc37@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Dec 2010 10:54:00 +0100
llandwerlin at gmail.com wrote:

> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> ---
>  fs/skeleton/usr/share/udhcpc/default.script |   39 ---------------------------
>  package/busybox/busybox.mk                  |    2 +-
>  package/busybox/udhcpc.script               |   39 +++++++++++++++++++++++++++

Why is this needed ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
