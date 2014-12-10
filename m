From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 15:36:13 +0000
Subject: [Buildroot] [PATCH] squid: bump to version 3.4.10
In-Reply-To: <1418205975-7390-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418205975-7390-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5488686D.9030305@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

- Built fine for MIPS
- Hash checking OK
- Files installed in the right place and built for the right
  architecture

squid-3.4.10.tar.xz: OK (md5: 3136edfe9bc2458e725671b0d2455702)
squid-3.4.10.tar.xz: OK (sha1: 52fb374fd6293978f8002ae994353fbe75d28a98)

$ file output/target/usr/bin/squidclient
output/target/usr/bin/squidclient: ELF 32-bit MSB executable, MIPS,
MIPS32 rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70403, stripped

$ file output/target/usr/sbin/squid
output/target/usr/sbin/squid: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70403, stripped

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
