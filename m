From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Feb 2015 16:15:39 +0100
Subject: [Buildroot] [PATCH] mono: add patch to fix MIPS build issue
In-Reply-To: <1423233944-1722-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423233944-1722-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <54D4DA9B.60306@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I did a build test for MIPS and I confirm this patch fixes the problem.

$ file output/target/usr/bin/mono-sgen
output/target/usr/bin/mono-sgen: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70403, stripped

Thanks.
--
Vincent
