From: Karoly Pados <kp@tec4data.at>
Date: Sat, 25 Mar 2017 23:08:14 +0000
Subject: [Buildroot] [PATCH 1/1] linux-firmware: Add missing firmware
 for the carl9170 driver.
In-Reply-To: <20170325153616.6fc536f9@free-electrons.com>
References: <20170325153616.6fc536f9@free-electrons.com>
 <20170322123641.19482-1-kp@tec4data.at>
Message-ID: <a182ac4e792af9f91cb7733bb0d5a250@webmail.pados.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> Firmware files are not "built by Buildroot", since they are only
> provided as binary-only files. Buildroot merely installs them, so I've
> fixed up the commit log before applying.

Ahh you're right, thank you.

> So you're using the LTS branch for some projects?
> 

Yes, at least that's what we're working on. Up until now we've used Debian as our base system, but because we'd like to push out software updates over mobile data, we're making a new firmware that is built by buildroot to keep our image small. We're targeting said branch (2017.02.x), but not because it is 'LTS', but because it seems to be the latest released (and/or stable) branch that is not a moving target like master.

Thank you,
Karoly
