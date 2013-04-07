From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 22:04:39 +0200
Subject: [Buildroot] [PATCH] libsigsegv: new package
In-Reply-To: <1364913738-13306-1-git-send-email-spdawson@gmail.com>
References: <1364913738-13306-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130407220439.5484fefb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Tue,  2 Apr 2013 15:42:18 +0100, spdawson at gmail.com wrote:

> +LIBSIGSEGV_VERSION = 2.6
> +LIBSIGSEGV_SITE = http://ftp.gnu.org/gnu/libsigsegv

$(BR2_GNU_MIRROR)

Other than that:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
