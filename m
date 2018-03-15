From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 15 Mar 2018 18:48:31 +0100
Subject: [Buildroot] amd-gpu-bin-mx51 cannot be fetched
Message-ID: <20180315174831.GA24143@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Today a customer of ours wanted to build a rootfs for i.MX51 and
reported that amd-gpu-bin-mx51 binary cannot be fetched.

Indeed it seems that Freescale/NXP removed it from their server.

Fortunately, some people mirrored it:
http://support.garz-fricke.com/mirror/amd-gpu-bin-mx51-11.09.01.bin

What would be your preferred approach? Adding that binary to
http://sources.buildroot.net/?

FYI, I checked that the mirrored version has the same hash as before and
installs properly.

Note that interestingly enough, the x11 version of the package is
already saved in buildroot sources.
http://sources.buildroot.net/amd-gpu-x11-bin-mx51-11.09.01.bin

Regards,
Gary
