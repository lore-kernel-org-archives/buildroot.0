From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 28 Apr 2011 09:30:32 +0200
Subject: [Buildroot] [PATCH v3] libnl: bump to version 3.0
In-Reply-To: <4DB8134E.1030503@visionsystems.de>
References: <4DB8134E.1030503@visionsystems.de>
Message-ID: <4DB91798.6050601@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I would leave AUTORECONF option. On my old build system  openSUSE 10.3 libnl-3.0 would compile only if reconfigured, otherwise it cannot find some header files. On my new Ubuntu 11.04 distro I don't have such problems. What do you think about this?

Best regards,
Yegor
