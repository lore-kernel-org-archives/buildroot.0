From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Mar 2012 16:18:10 +0100
Subject: [Buildroot] [git commit] barebox: add 2012.03 release
In-Reply-To: <20120307113912.626ff962@eb-e6520> ("Eric =?utf-8?Q?B=C3=A9na?=
 =?utf-8?Q?rd=22's?= message of "Wed, 7 Mar 2012 11:39:12 +0100")
References: <20120306215605.34C7E90D15@busybox.osuosl.org>
 <20120307113912.626ff962@eb-e6520>
Message-ID: <8762egfnil.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric B?nard <eric@eukrea.com> writes:

 Eric> Hi Peter,
 Eric> Le Tue, 6 Mar 2012 22:55:30 +0100,
 Eric> Peter Korsgaard <jacmet@sunsite.dk> a ?crit :
 >> +config BR2_TARGET_BAREBOX_2012_03
 >> +	bool "2012.03"
 >> +
 >> config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 >> bool "Custom tarball"
 >> 
 >> @@ -42,6 +45,7 @@ config BR2_TARGET_BAREBOX_VERSION
 >> default "2011.12.0"	if BR2_TARGET_BAREBOX_2011_12
 >> default "2012.01.0"	if BR2_TARGET_BAREBOX_2012_01
 >> default "2012.02.0"	if BR2_TARGET_BAREBOX_2012_02
 >> +	default "2012.03.0"	if BR2_TARGET_BAREBOX_2012_02
 Eric> missing change here :                                      ^^

Argh, correct - Will fix.

Thanks.

-- 
Bye, Peter Korsgaard
