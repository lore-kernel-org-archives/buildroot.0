From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 14:44:55 +0000
Subject: [Buildroot] [PATCH] dhcpcd; bump to version 6.6.5
In-Reply-To: <1418205993-7649-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418205993-7649-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54885C67.1070408@imgtec.com>
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

dhcpcd-6.6.5.tar.bz2: OK (sha256:
62efd1c7fa162f7277b8a09089065f726e5d4dd45f426bb5db06e879e068bbe0)

$ file output/target/sbin/dhcpcd
output/target/sbin/dhcpcd: ELF 32-bit MSB executable, MIPS, MIPS32 rel2
version 1, dynamically linked (uses shared libs), for GNU/Linux 2.6.32,
with unknown capability 0x41000000 = 0xf676e75, with unknown capability
0x10000 = 0x70403, not stripped

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
