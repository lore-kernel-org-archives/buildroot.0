From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Aug 2013 21:29:14 +0200
Subject: [Buildroot] [PATCH] Fix ARM uclibc build with
 !BR2_UCLIBC_ARM_BX.
In-Reply-To: <1375829638-7603-1-git-send-email-jmaggard10@gmail.com>
References: <1375829638-7603-1-git-send-email-jmaggard10@gmail.com>
Message-ID: <20130810212914.60fce023@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Justin Maggard,

On Tue,  6 Aug 2013 15:53:58 -0700, Justin Maggard wrote:
> When BR2_UCLIBC_ARM_BX is not set, UCLIBC_OPT_UNSET gets called with an extra
> argument.  Remove it.
> 
> Signed-off-by: Justin Maggard <jmaggard10@gmail.com>

Committed, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
