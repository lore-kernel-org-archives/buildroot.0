From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 6 Nov 2013 16:42:31 +0100
Subject: [Buildroot] [PATCH v3 0/5] udev is now provided by systemd or
 eudev
In-Reply-To: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20131106154231.GA11795@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Configuration files to build kernel and file system (for QEMU x86 and ARM)
with support for systemd or eudev are available in the 'systemd-eudev-v2'
branch of https://github.com/elebihan/buildroot/:

- elebihan_demo_systemd_{arm,x86}_defconfig
- elebihan_demo_eudev_{arm,x86}_defconfig.

Best Regards,
ELB
