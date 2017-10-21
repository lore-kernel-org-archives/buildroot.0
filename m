From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sat, 21 Oct 2017 23:49:09 +0300
Subject: [Buildroot] [PATCH 0/2] Make Etnaviv drivers
	architecture-independent
Message-ID: <1508618951-24632-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivante GPU could be a part of SoC along with any CPU architecture
thus get rid of nonsense dependency.

Alexey Brodkin (2):
  mesa3d: Make Etnaviv arch-independent
  libdrm: Make Etnaviv arch-independent

 package/libdrm/Config.in | 1 -
 package/mesa3d/Config.in | 1 -
 2 files changed, 2 deletions(-)

-- 
2.7.5
