From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Dec 2015 16:23:41 +0000
Subject: [Buildroot] [PATCH] mc: bump to 4.8.15
In-Reply-To: <1449676826-26630-1-git-send-email-yegorslists@googlemail.com>
References: <1449676826-26630-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <5668558D.4080702@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On 09/12/15 16:00, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep -E ^MC_VERSION package/mc/mc.mk
MC_VERSION = 4.8.15

$ file output/target/usr/bin/mc
output/target/usr/bin/mc: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
version 1 (SYSV), dynamically linked, interpreter /lib/ld.so.1, for
GNU/Linux 2.6.32, stripped

Regards,

Vincent.
