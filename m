From: Altunbas Sabri (DC-IA/EAH2) <sabri.altunbas@boschrexroth.de>
Date: Wed, 20 Nov 2013 13:10:17 +0100
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <528B59FE.6070205@zacarias.com.ar>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
 <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C345@SI-MBX04.de.bosch.com>
 <CAAXf6LU3kQE2J+3zS-XCBYZ9SkxOSNyEAkV-E0_LQbhq3TP8Rw@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C375@SI-MBX04.de.bosch.com>
 <CAAXf6LX6fVb+bm6UTzEpjDhitAYx3svJx1eTyoHYD85xEFXY7g@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C37F@SI-MBX04.de.bosch.com>
 <CAAXf6LV9Wzjr1P+n-Mxw8FqnqsAdOMr3Wfaam48uHQPcVxu73A@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C3BA@SI-MBX04.de.bosch.com>
 <CAAXf6LUiwy9Fmm5sNBTc3H4XvpsDhmRNeYj6in=HiZsepQ8xRQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DFE7183@SI-MBX04.de.bosch.com>
 <528B59FE.6070205@zacarias.com.ar>
Message-ID: <EADA2943BAC14C4AB625A3550A3BE980096DFE778E@SI-MBX04.de.bosch.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Thanks, it works with
make GLIBC_EXTRA_CFLAGS="-mdalign -mfmovd"

But I had to make "make clean" and this moves all the things what I created i.g.toolchain,...
Is this a possibility that only compiled files are moved and not toolchain ?

Best regards,
Sabri
