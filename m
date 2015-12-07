From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Dec 2015 13:53:35 +0000
Subject: [Buildroot] [PATCH] gdb: bump 7.10 series to 7.10.1
In-Reply-To: <1449489748-18741-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449489748-18741-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56658F5F.8010504@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 07/12/15 12:02, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/build/gdb-7.10.1/gdb/gdb
output/build/gdb-7.10.1/gdb/gdb: ELF 32-bit LSB executable, MIPS, MIPS32
rel2 version 1, dynamically linked, interpreter /lib/ld.so.1, for
GNU/Linux 2.6.32, not stripped

Regards,

Vincent.
