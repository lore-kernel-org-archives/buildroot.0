From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jan 2017 22:44:06 +0100
Subject: [Buildroot] [PATCH 1/4] board: raspberrypi: use regular kernel
	image
In-Reply-To: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 26 Jan 2017 07:36:05 +0200")
References: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
Message-ID: <87inp1cx95.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Since release 4.4 a kernel without a trailer is assumed to be device tree
 > capable. Since our Raspberry Pi defconfigs all use the newer firmware we can
 > just use the regular kernel image.

 > https://www.raspberrypi.org/documentation/configuration/device-tree.md

 > Tested on Raspberry Pi 3.

Committed all 4, thanks.

-- 
Bye, Peter Korsgaard
