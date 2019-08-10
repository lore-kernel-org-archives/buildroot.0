From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 15:13:19 +0200
Subject: [Buildroot] Buildroot acmesystems_* fail to build
Message-ID: <20190810151319.5b216b72@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Biagio,

The various acmesystems_* defconfigs you have contributed to Buildroot fail to build:

  acmesystems_aria_g25_256mb_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139082

  acmesystems_aria_g25_128mb_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139081

  acmesystems_arietta_g25_256mb_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139084

  acmesystems_arietta_g25_128mb_defconfig
  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139083

In all cases, the build failure is due to the kernel being too old, and
it doesn't build properly with gcc 8.x.

Could you send a patch updating those defconfigs ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
