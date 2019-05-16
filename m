From: muhammet <mk61@hotmail.com>
Date: Thu, 16 May 2019 06:13:10 -0500 (CDT)
Subject: [Buildroot] Orange pi zero:  i2c is not under /dev
In-Reply-To: <20190516085647.7a861d60@windsurf>
References: <1557981319043-0.post@n4.nabble.com>
 <20190516080159.6d844d12@windsurf> <1557988831153-0.post@n4.nabble.com>
 <20190516085647.7a861d60@windsurf>
Message-ID: <1558005190987-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

There are
/sys/bus/platform/drivers/i2c-sunxi-pwi
/sys/bus/platform/drivers/mv64xxx_i2c
/sys/bus/i2c
/sys/bus/i2c/drivers/axp20x-i2c

but no
/sys/bus/i2c/devices/

what am i missing?




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
