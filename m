From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 6 Sep 2013 16:08:10 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
	systemd or eudev.
In-Reply-To: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20130906140810.GA13754@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BTW, the changes introduced by this patch can be tested with images for QEMU
(arm and x86), using the configuration files
elebihan_demo_{eudev,systemd}_{arm,x86}_defconfig, available in the
udev-provider branch of https://github.com/elebihan/buildroot.
