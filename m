From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 03 Jul 2017 23:04:40 +0200
Subject: [Buildroot] [PATCH] package/libunwind: fix build failure due
	to	asm()
References: <20170703125038.4097-1-romain.naour@smile.fr>
Message-ID: <84oq2exms8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 03 Jul 2017 14:50:38 +0200 schrieb Romain Naour:

> The gcc documentation [1] suggest to use __asm__ instead of asm.
> 
> Fixes:
> http://autobuild.buildroot.net/
results/3ef/3efe156b6494e4392b6c31de447ee2c72acc1a53
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Alternate-
Keywords.html#Alternate-Keywords
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(build-tested using http://autobuild.buildroot.net/
results/608/608846674e070c991f65f65076da09802252478a/defconfig )
