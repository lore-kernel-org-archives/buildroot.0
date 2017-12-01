From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 17:33:42 +0100
Subject: [Buildroot] [PATCH 00/14] fs: cleanups and enhancements
In-Reply-To: <cover.1510508733.git.yann.morin.1998@free.fr>
References: <cover.1510508733.git.yann.morin.1998@free.fr>
Message-ID: <20171201173342.40eacec2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Nov 2017 18:45:47 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (14):
>       core: sort packages and eliminate duplicates in show-targets
>       linux: split overly-long dependency line for readability
>       linux: meddle not in the internals of filesystems
>       fs/initramfs: cleanups, enhance comments
>       fs/ext2: use a post-gen hook rather than a post-target rule
>       fs/cpio: use a post-gen hook rather than a post-target rule
>       fs/common: get rid of post-target rules
>       fs: remove TARGET_DIR_WARNING_FILE late
>       fs: don't pollute $(BUILD_DIR) with temp files
>       fs/iso9660: don't pollute $(BUILD_DIR) with temp dir
>       fs: don't remove intermediate files

I have applied the patch series up to this point to the next branch.
Besides minor typo fixes here and there, I didn't change anything.

>       fs: move actions common to all filesystems to their own rule
>       core: finalise target in its own location

I will continue to apply the remainder of this series soon. I need it
for the TLP work :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
