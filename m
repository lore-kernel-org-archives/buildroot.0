From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Oct 2014 01:04:02 +0200
Subject: [Buildroot] [PATCH v3] 2/2] imx6sabresd/create-boot-sd.sh:
	allow usage for i.MX53
In-Reply-To: <1413809176-5063-2-git-send-email-eric@eukrea.com> ("Eric
 =?utf-8?Q?B=C3=A9nard=22's?= message of "Mon, 20 Oct 2014 14:46:16 +0200")
References: <1413809176-5063-1-git-send-email-eric@eukrea.com>
 <1413809176-5063-2-git-send-email-eric@eukrea.com>
Message-ID: <87ppdh83z1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric B?nard <eric@eukrea.com> writes:

 > this script permits the generation of an sdcard that will boot on
 > and i.MX53 QSB with a recent bootloader (now supported by buildroot).

 > Tested on an i.MX53 QSB and an i.MX53 QSB-R

The extra ']' in the PATCH header screws up the commit message a bit,
but I've fixed that up here.

Committed, thanks.


-- 
Bye, Peter Korsgaard
