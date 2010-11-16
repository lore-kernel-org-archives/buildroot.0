From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Nov 2010 15:41:02 +0100
Subject: [Buildroot] [PATCH] linux: update paths to compiled cpio files
In-Reply-To: <1289918350-17559-1-git-send-email-vapier@gentoo.org>
References: <1289918350-17559-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101116154102.0166f3e0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Nov 2010 09:39:10 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> Linux has been using "usr/initramfs_data.cpio" for a few releases as the
> generated cpio name, so the buildroot match of "...cpio.*" won't actually
> clean out the previous result.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
