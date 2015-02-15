From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 15 Feb 2015 17:38:50 +0100
Subject: [Buildroot] [PATCH] mpd: bump to version 0.19.9
In-Reply-To: <1424013388-3489-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424013388-3489-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54E0CB9A.50102@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture.

$ file output/target/usr/bin/mpd
output/target/usr/bin/mpd: ELF 32-bit MSB executable, MIPS, MIPS32 rel2
version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
2.6.32, with unknown capability 0x41000000 = 0xf676e75, with unknown
capability 0x10000 = 0x70403, stripped

Best regards,
--
Vincent
