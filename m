From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 11:02:32 +0100
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <EADA2943BAC14C4AB625A3550A3BE980096DF2C375@SI-MBX04.de.bosch.com>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
 <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C345@SI-MBX04.de.bosch.com>
 <CAAXf6LU3kQE2J+3zS-XCBYZ9SkxOSNyEAkV-E0_LQbhq3TP8Rw@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C375@SI-MBX04.de.bosch.com>
Message-ID: <CAAXf6LX6fVb+bm6UTzEpjDhitAYx3svJx1eTyoHYD85xEFXY7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 15, 2013 at 10:57 AM, Altunbas Sabri (DC-IA/EAH2)
<sabri.altunbas@boschrexroth.de> wrote:
> Hallo Thomas,
>> Could you provide more details?
>> Which buildroot version are you using, which toolchain, etc.?
>
> Following information stand in .config
>
> # Buildroot 2013.08.1 Configuration
> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209=y
>
>> Maybe a .config could be useful too.
>
> Attented
>
> My attention is to compile rootfs with gcc switches -mfmovd -mdalign enabling double floating point operation

Do you have the same error without those options?
