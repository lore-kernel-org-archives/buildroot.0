From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jun 2021 09:22:51 +0200
Subject: [Buildroot] [PATCH] configs/stm32f469_disco: add host {dosfs,
 m}tools
In-Reply-To: <87sg193vf9.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 23 Jun 2021 09:13:46 +0200")
References: <20210622084243.27905-1-peter@korsgaard.com>
 <87sg193vf9.fsf@dell.be.48ers.dk>
Message-ID: <87k0mj4th0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> Commit 04a0094f0ef077 (configs/stm32f469_disco: fix kernel bootup) changed
 >> the defconfig to build a vfat image, but forgot to add dosfstools/mtools
 >> host utilities needed for this.

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
