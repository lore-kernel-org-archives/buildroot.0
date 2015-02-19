From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 19 Feb 2015 12:26:31 +0100
Subject: [Buildroot] [PATCH] squid: bump to version 3.5.2
In-Reply-To: <1424342530-5827-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424342530-5827-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54E5C867.4010209@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture.

$ file output/target/usr/sbin/squid
output/target/usr/sbin/squid: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70403, stripped

Best regards,
--
Vincent
