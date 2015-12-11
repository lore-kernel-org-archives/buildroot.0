From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Dec 2015 14:45:22 +0000
Subject: [Buildroot] [PATCH 1/3] package/boost: bump to version 1.59.0
In-Reply-To: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
References: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <566AE182.6080103@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On 11/12/15 13:57, J?rg Krause wrote:
> Also:
> * remove patch "gcc.jam compiler options fix" - merged upstream
> * renumber patch "fix uclibc eventfd".
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/lib/libboost_atomic.so.1.59.0
output/target/usr/lib/libboost_atomic.so.1.59.0: ELF 32-bit LSB shared
object, MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, stripped

Regards,

Vincent.
