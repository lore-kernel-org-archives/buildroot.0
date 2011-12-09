From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Dec 2011 19:49:21 +0100
Subject: [Buildroot] Device files and Buildroot
In-Reply-To: <CAMP44s0bpx_mJRG=4bz5yhewujwaAhC1tQqqWNyCCbtNZysRgg@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com>
 <201112020734.00122.minimod@morethan.org>
 <001201ccb10b$22c23010$0400a8c0@dspcgrnzks9p98>
 <CAAu5YTas_VmvbHEkwOZqVZ3iD+sy4nYdmykMKZAagtAEYViYHA@mail.gmail.com>
 <001601ccb112$a16043b0$0400a8c0@dspcgrnzks9p98>
 <1322847199.55324.YahooMailNeo@web161204.mail.bf1.yahoo.com>
 <002f01ccb11c$9a835280$0400a8c0@dspcgrnzks9p98>
 <CABkKHSbDDD8rFU5UhYpR7tCcJWNXtbUNNNbmHU2yfjt23zzgWg@mail.gmail.com>
 <003e01ccb120$6f8f16a0$0400a8c0@dspcgrnzks9p98>
 <CABkKHSacRwGaT0ajXySqPeV0aFzGthxLykC7LXOsut4SPjNsmA@mail.gmail.com>
 <20111203092553.0acf80a5@skate>
 <CAMP44s0bpx_mJRG=4bz5yhewujwaAhC1tQqqWNyCCbtNZysRgg@mail.gmail.com>
Message-ID: <20111209194921.2770b54b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 8 Dec 2011 23:30:21 +0200,
Felipe Contreras <felipe.contreras@gmail.com> a ?crit :

> Why is this not described when one press '?' on the menu options?

Yeah, that's possible, but help options on kconfig "choices" is a bit
non-user friendly. There is no way to specify a global help for the
choice, it is only possible to provide a per-choice help.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
