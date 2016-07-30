From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 12:07:46 +0200
Subject: [Buildroot] [PATCH v2] squashfs: update site to git.kernel.org
In-Reply-To: <1469711608-322-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1469711608-322-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160730120746.3d91f47c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 08:13:28 -0500, Matt Weber wrote:

> +SQUASHFS_VERSION = 9c1db6d13a51a2e009f0027ef336ce03624eac0d
> +SQUASHFS_SITE = git://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git

I've changed to use https:// instead of git://, so that it works for
the people behind firewalls blocking the Git protocol.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
