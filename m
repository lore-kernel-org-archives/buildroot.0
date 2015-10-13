From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 Oct 2015 17:46:43 +0100
Subject: [Buildroot] [PATCH] icu: bump to version 56.1
In-Reply-To: <1444740300-11451-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1444740300-11451-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <561D3573.6010208@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/13/2015 01:45 PM, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep ^ICU_VERSION package/icu/icu.mk
ICU_VERSION = 56.1

$ file output/target/usr/lib/libicudata.so.56.1
output/target/usr/lib/libicudata.so.56.1: ELF 32-bit MSB shared object,
MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, with unknown
capability 0x41000000 = 0xf676e75, with unknown capability 0x10000 =
0x70401, stripped

Regards,

Vincent.
