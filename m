From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 15 Feb 2015 17:37:37 +0100
Subject: [Buildroot] [PATCH] httping: bump to version 2.4
In-Reply-To: <1424012539-15282-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424012539-15282-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54E0CB51.1010203@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture.

$ file output/target/usr/bin/httping
output/target/usr/bin/httping: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70403, stripped


Best regards,
--
Vincent
