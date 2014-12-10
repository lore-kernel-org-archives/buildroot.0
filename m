From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 17:16:50 +0000
Subject: [Buildroot] [PATCH] netsnmp: bump to version 5.7.3
In-Reply-To: <1418154513-21366-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418154513-21366-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54888002.4070001@imgtec.com>
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

net-snmp-5.7.3.tar.gz: OK (md5: d4a3459e1577d0efa8d96ca70a885e53)
net-snmp-5.7.3.tar.gz: OK (sha1: 97dc25077257680815de44e34128d365c76bd839)

$ file output/target/usr/lib/libnetsnmp.so.30.0.3
output/target/usr/lib/libnetsnmp.so.30.0.3: ELF 32-bit MSB shared
object, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, with
unknown capability 0x41000000 = 0xf676e75, with unknown capability
0x10000 = 0x70403, stripped

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
