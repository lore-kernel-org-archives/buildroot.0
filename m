From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Feb 2019 08:42:34 +0100
Subject: [Buildroot] [PATCH v2] configs/qemu: Update defconfigs to Linux
 4.19.16
In-Reply-To: <20190212222413.8524-1-romain.naour@smile.fr> (Romain Naour's
 message of "Tue, 12 Feb 2019 23:24:13 +0100")
References: <20190212222413.8524-1-romain.naour@smile.fr>
Message-ID: <87mun0rv6d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > From: Gerome Burlats <gerome.burlats@smile.fr>
 > Linux version are changed to 4.19.16 (LTS) for all qemu defconfigs,
 > except for riscv. riscv defconfigs are left unchanged because they have
 > a custom Linux repository causing more difficulties when upgrading to
 > 4.19 for riscv32. And for the riscv64, it has been updated recently to
 > Linux 4.20 by another contributor.

 > Patch for arm-versatile-nommu is changed into a git format

 > Add cache attributes for xtensa-lx60-nommu config because the commit
 > https://github.com/torvalds/linux/commit/7bb516ca5424e12b42124fab2906b6da9c81ba9c
 > added a new config variable for memory cache attribute:
 > CONFIG_MEMMAP_CACHEATTR

 > All these updated configs have been built successfully.

 > Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
 > Cc: Romain Naour <romain.naour@smile.fr>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 > v2: fix git log
 >     fix Waldemar's authorship in versatile-nommu.patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
