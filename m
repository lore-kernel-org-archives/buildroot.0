From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 22:01:29 +0100
Subject: [Buildroot] Pre-built toolchains updated on autobuild.b.o
Message-ID: <20170213220129.78a53e19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have rebuilt all the pre-built Buildroot toolchains used in the
autobuilders with Buildroot 2017.02-rc1:

  https://git.buildroot.org/buildroot-test/commit/?id=a9f8da44ef8375d877dff01b3ad17dbdc32a84a8

The majority of them now use 4.9 kernel headers (the default in
Buildroot). A few others that were using 3.14 kernel headers, now
deprecated, have been changed to use other kernel header versions, such
as 3.10, 3.18 and 4.4.

In addition, I've added an OpenRISC uClibc to our list of pre-built
toolchains:

  https://git.buildroot.org/buildroot-test/commit/?id=0fd3cbdfb5a4d14dd8a204d5d1ee97514f7bafc9

Please watch the autobuilders in the next days! :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
