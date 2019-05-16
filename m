From: muhammet <mk61@hotmail.com>
Date: Wed, 15 May 2019 23:35:19 -0500 (CDT)
Subject: [Buildroot] Orange pi zero:  i2c is not under /dev
Message-ID: <1557981319043-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi I am working with Orange pi zero. Although I enable i2c-tools under make
menuconfig and i2c support under make linux-menuconfig when I use i2cdetect
-y 0 I get the error below.I am stuck at that point. I want to use i2c bus
to use my imu sensor. Please help me.

Error: Could not open file `/dev/i2c-0' or `/dev/i2c/0': No such file or
directory



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
