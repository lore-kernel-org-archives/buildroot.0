From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 16:23:51 +0100
Subject: [Buildroot] [PATCH v4] New package: linux-firmware
In-Reply-To: <4F216E47.4070604@visionsystems.de> (Yegor Yefremov's message of
 "Thu, 26 Jan 2012 16:16:23 +0100")
References: <1327590802-17503-1-git-send-email-yegorslists@googlemail.com>
 <4F216E47.4070604@visionsystems.de>
Message-ID: <87k44e32t4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Am 26.01.2012 16:13, schrieb yegorslists at googlemail.com:

 Yegor> So here we have another issue: how can I define if files should
 Yegor> be copied to /lib/firmware or /lib/firmware/foo? ti-connectivity
 Yegor> firmware files should go direct to /lib/firmware. This is not
 Yegor> the case now.

Ahh, I thought there would be a 1-to-1 relation between the
linux-firmware.git location an /lib/firmware. How do other distributions
handle it?

-- 
Bye, Peter Korsgaard
