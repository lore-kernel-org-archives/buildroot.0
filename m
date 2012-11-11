From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Nov 2012 21:08:59 +0100
Subject: [Buildroot] [PATCH] lcdproc: bump version to 0.5.6
In-Reply-To: <1352207698-3407-1-git-send-email-spdawson@gmail.com>
References: <1352207698-3407-1-git-send-email-spdawson@gmail.com>
Message-ID: <20121111210859.5c6f7510@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

On Tue,  6 Nov 2012 13:14:58 +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  .../lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch   |   19 -------------------
>  package/lcdproc/lcdproc.mk                          |    2 +-
>  2 files changed, 1 insertion(+), 20 deletions(-)
>  delete mode 100644 package/lcdproc/lcdproc-0.5.5-fix-menu-segfault.patch

There are apparently build issues with lcdproc 0.5.6. Not sure if they
are new or if they were present in older versions. See
http://autobuild.buildroot.org/results/9967bc20a6094e836c4c18ff2cd30edef143bb8e/build-end.log.
Basically, lcdproc uses -I<foo>/host/usr/include -L<foo>/host/usr/lib
to build things for the target.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
