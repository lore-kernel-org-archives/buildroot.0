From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Oct 2009 22:54:33 +0200
Subject: [Buildroot] building toolchain fails - more details
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB67013CED64@WETMEX10.loepfe.com>
	(Noel Vellemans's message of "Wed\, 21 Oct 2009 16\:31\:19 +0200")
References: <mailman.7.1256126402.21246.buildroot@busybox.net>
	<1531E53627F1F749B4FE809BF2A4EB67013CED64@WETMEX10.loepfe.com>
Message-ID: <87ljj4piwm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Noel" == Vellemans, Noel <Noel.Vellemans@visionBMS.com> writes:

 Noel> How to simulate?Just type 

 Noel> A) 'make at91sam9g20dfc_defconfig' (press enter a couple of times....) {
 Noel> but at91sam9260dfc_defconfig has same problem)
 Noel> B) make menuconfig 
 -> kernel -> kernel binary format -> image format : zimage  (so
 Noel> you can uncheck uboot)
 -> Target Filesystem options -> de-select 'uboot'. (has nothing to
 Noel> do with this prob but has some other issue's)
 -> pakage selcetion - > de-select 'at'

FYI, the above builds for me with latest git.

-- 
Bye, Peter Korsgaard
