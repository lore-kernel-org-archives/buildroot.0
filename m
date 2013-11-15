From: Altunbas Sabri (DC-IA/EAH2) <sabri.altunbas@boschrexroth.de>
Date: Fri, 15 Nov 2013 10:57:44 +0100
Subject: [Buildroot] buildroot: gcc options
In-Reply-To: <CAAXf6LU3kQE2J+3zS-XCBYZ9SkxOSNyEAkV-E0_LQbhq3TP8Rw@mail.gmail.com>
References: <EADA2943BAC14C4AB625A3550A3BE980096DF2C30B@SI-MBX04.de.bosch.com>
 <CAAXf6LU1bamXyxhjhB5rTTHM-iHRbKrsTF5m1MUJLZjOaNXmuQ@mail.gmail.com>
 <EADA2943BAC14C4AB625A3550A3BE980096DF2C345@SI-MBX04.de.bosch.com>
 <CAAXf6LU3kQE2J+3zS-XCBYZ9SkxOSNyEAkV-E0_LQbhq3TP8Rw@mail.gmail.com>
Message-ID: <EADA2943BAC14C4AB625A3550A3BE980096DF2C375@SI-MBX04.de.bosch.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo Thomas,
> Could you provide more details?
> Which buildroot version are you using, which toolchain, etc.?

Following information stand in .config

# Buildroot 2013.08.1 Configuration
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209=y

> Maybe a .config could be useful too.

Attented

My attention is to compile rootfs with gcc switches -mfmovd -mdalign enabling double floating point operation

Best regards,
Sabri


-------------- next part --------------
A non-text attachment was scrubbed...
Name: ATT12405.config
Type: application/octet-stream
Size: 27937 bytes
Desc: ATT12405.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131115/8d618bd2/attachment-0001.obj>
