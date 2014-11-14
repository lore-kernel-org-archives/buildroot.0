From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 14 Nov 2014 11:57:37 +0000
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.19
In-Reply-To: <1415928498-6083-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415928498-6083-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5465EE31.1070600@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

build for MIPS architecture with both "CGI and CLI" and "FPM and CLI"
interfaces, plus all the options under the "Extensions" and "External
php extensions" menus enabled.

$ file output/target/usr/bin/php
output/target/usr/bin/php: ELF 32-bit MSB executable, MIPS, MIPS32 rel2
version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
2.6.16, with unknown capability 0x41000000 = 0xf676e75, with unknown
capability 0x10000 = 0x70403, stripped

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
