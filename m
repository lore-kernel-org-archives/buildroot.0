From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 15 Feb 2015 17:33:42 +0100
Subject: [Buildroot] [PATCH] autossh: bump to version 1.4e
In-Reply-To: <1424012500-15196-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424012500-15196-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54E0CA66.7080806@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture.

$ file output/target/usr/bin/autossh
output/target/usr/bin/autossh: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70403, stripped

Best regards,
--
Vincent
