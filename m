From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 22:03:16 +0100
Subject: [Buildroot] target/device/Atmel kernel patches
Message-ID: <87ab9d4w6j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We have a bunch of large kernel patches in target/device/Atmel for
fairly old kernel versions:

find -type f|xargs ls -shS|head -n 15
816K ./arch-arm/kernel-patches-2.6.24/linux-2.6.24-at91.patch
764K ./arch-arm/kernel-patches-2.6.20.4/linux-2.6.20.4-atmel.patch
744K ./arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-100-avr32-atmel.1.patch
516K ./arch-avr32/kernel-patches-2.6.23/linux-2.6.23-100-avr32-atmel.2.patch
452K ./arch-avr32/kernel-patches-2.6.22.10/linux-2.6.22.10-100-avr32-atmel.4.patch
448K ./arch-avr32/kernel-patches-2.6.24/linux-2.6.24-100-avr32-git.1.patch
412K ./arch-arm/kernel-patches-2.6.21.1/linux-2.6.21.1-at91.patch
412K ./arch-arm/kernel-patches-2.6.21.5/linux-2.6.21.5-at91.patch
272K ./arch-avr32/kernel-patches-2.6.25.10/linux-2.6.25.10.atmel.2.patch.bz2
136K ./arch-arm/kernel-patches-2.6.25/linux-2.6.25-at91.patch.gz
100K ./arch-arm/kernel-patches-2.6.26/2.6.26-at91.patch.gz
 96K ./arch-arm/kernel-patches-2.6.26-rc3/linux-2.6.26-rc3-at91.patch.gz
 96K ./arch-arm/kernel-patches-2.6.27.7/linux-2.6.27-at91.patch.gz
 84K ./arch-avr32/kernel-patches-2.6.24/linux-2.6.24-500-v4l-avr32-isi.patch.cond

Can I just delete anything older than 2.6.27?

-- 
Bye, Peter Korsgaard
