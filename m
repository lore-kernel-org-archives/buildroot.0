From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 22 Dec 2015 16:06:54 +0100
Subject: [Buildroot] [PATCH 0/2] Fixing xdriver_xf86-video-ati building
References: <1450790990-28939-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <eh5okcx2hb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 22 Dec 2015 16:29:48 +0300 schrieb Lada Trimasova:

> xdriver_xf86-video-ati depends on the radeon driver from libdrm and DRI
> support in xserver_xorg-server, to achieve this we select the Radeon
> mesa3d DRI driver which needs to be enabled for all architectures.

Hi,

please have a look at my patch and join the discussion about whether this 
driver can be used outside the Intel world or not ;)

http://patchwork.ozlabs.org/patch/523146/

Regards, Bernd
