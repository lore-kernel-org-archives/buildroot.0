From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 15:51:41 +0200
Subject: [Buildroot] [PATCH 49/49] linux: fix dependency on mkimage
In-Reply-To: <8e73aeb69e20635f7e7832e6694967adb3cb58eb.1276352309.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
	<8e73aeb69e20635f7e7832e6694967adb3cb58eb.1276352309.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20100613155141.7d32f971@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Jun 2010 16:22:23 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> -LINUX26_MKIMAGE_DIR:=$(BUILD_DIR)/u-boot-tools

I've pushed a modified version of this commit that gets rid of
LINUX26_MKIMAGE_DIR. This was a comment from Peter that I forgot to fix
before reposting the big patchset.

Unless explictly asked to do so, I will not resend the full set of
patches just for this change.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
