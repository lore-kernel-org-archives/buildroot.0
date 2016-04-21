From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:54:08 +0200
Subject: [Buildroot] Autobuilder script update
Message-ID: <20160421225408.2699f85a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

The format of the toolchain-configs.csv file has slightly changed, in
order to properly announce whether the pre-built toolchain are built
for x86 or x86_64. In order for this to work, please update your
autobuilder scripts.

If you don't update your autobuilder scripts, nothing should break, it
is just that you will not be testing with all possible toolchain
configurations that your autobuilder machine could test.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
