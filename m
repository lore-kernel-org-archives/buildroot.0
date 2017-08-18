From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Aug 2017 16:50:40 +0200
Subject: [Buildroot] mips: nan2008 require kernel headers 4.5.x
References: <2f4c0a2a-ffeb-9a1c-ebe4-d5eaf50f3154@gmail.com>
 <38121FAB319C3344930C920E7B518313888D0F57@hhmail02.hh.imgtec.org>
 <837cf48e-f422-30c8-8115-6988eb865906@gmail.com>
 <20170818141858.75c78acb@windsurf>
Message-ID: <0fbj6ex70a.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 18 Aug 2017 14:18:58 +0200 schrieb Thomas Petazzoni:

>> aarch64: kernel headers >= 3.7 (already handled in Buildroot)
>> sysdeps/unix/sysv/linux/aarch64/configure.ac:arch_minimum_kernel=3.7.0
> 
> Where do you see that this is already handled in Buildroot ?

Hi Thomas,

https://git.buildroot.net/buildroot/commit/package/linux-headers?
id=1291528bde602120ab4b60d23d1a362d44cc5e04

Regards, Bernd
