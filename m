From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Thu, 8 Dec 2011 23:30:21 +0200
Subject: [Buildroot] Device files and Buildroot
In-Reply-To: <20111203092553.0acf80a5@skate>
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
Message-ID: <CAMP44s0bpx_mJRG=4bz5yhewujwaAhC1tQqqWNyCCbtNZysRgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 3, 2011 at 10:25 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Sat, 3 Dec 2011 01:25:41 +0100,
> Aleksander Dutkowski <adutkowski@gmail.com> a ?crit :
>
>> "System configuration --> Custom script to run before creating
>> filesystem image" input is for specify a PATH to bash script.
>> You you must simply create script, fill with mknod commands (remember
>> - mknod can be ran only by root! so do 'sudo mknod')
>
> No, no, no and no ! I'm sorry but this is totally horrible and is
> definitely not the way of doing things with Buildroot.
>
> With Buildroot, you have four ways of managing the device files
> in /dev. The mechanism used to manage device files is configured from
> System configuration -> /dev management. The four ways are :

Why is this not described when one press '?' on the menu options?

Cheers.

-- 
Felipe Contreras
