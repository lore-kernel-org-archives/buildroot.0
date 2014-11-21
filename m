From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 21 Nov 2014 19:43:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-19
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
Message-ID: <XnsA3ECC89C04661berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20141120094407.4b487379 at free-electrons.com: 

>>          arm |                 dovecot-2.2.15 | NOK |
>>          http://autobuild.buildroot.net/results/9b536926b3b2bf82c683b48e
>>          9697a220f1b4bf33/ 
> 
> /home/buildroot/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnue
> abi/sysroot/usr/lib/mysql/libmysqlclient.a(my_time.o): In function
> `str_to_time': my_time.c:(.text+0x9a8): multiple definition of
> `str_to_time' 
> ../../src/lib-dovecot/.libs/libdovecot.a(strnum.o):strnum.c:(.text+0x4f4)
> : first defined here 
> ../../src/lib-dovecot/.libs/libdovecot.a(file-dotlock.o): In function
> `dotlock_create': 
> 
> Symbol conflict between MySQL and Dovecot it seems, in static linking
> configuration. Bernd, can you have a look, since you contributed
> ClamAV ?

Hi,

fixed by http://patchwork.ozlabs.org/patch/413152/

Regards, Bernd
