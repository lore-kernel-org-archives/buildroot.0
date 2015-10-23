From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 23 Oct 2015 12:19:53 +0100
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.27
In-Reply-To: <1445595354-27866-1-git-send-email-gustavo@zacarias.com.ar>
References: <1445595354-27866-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <562A17D9.8040603@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/23/2015 11:15 AM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep -E ^LIBNL_VERSION package/libnl/libnl.mk
LIBNL_VERSION = 3.2.27

$ file output/target/usr/lib/libnl-3.so.200.22.0
output/target/usr/lib/libnl-3.so.200.22.0: ELF 32-bit LSB shared object,
MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, with unknown
capability 0xf41 = 0x756e6700, with unknown capability 0x70100 =
0x1040000, stripped

Regards,

Vincent.
