From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 27 Oct 2015 14:04:21 +0000
Subject: [Buildroot] [PATCH v2 1/1] gauche: new package
In-Reply-To: <201510240011.t9O0Bq58024545@ms-omx03.plus.so-net.ne.jp>
References: <201510240011.t9O0Bq58024545@ms-omx03.plus.so-net.ne.jp>
Message-ID: <562F8465.8090906@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

your patch looks good to me. The only thing I would have added is a
little comment in the patch saying that you are patching the configure
directly because it fails to autoreconf.

On 10/24/2015 01:11 AM, Hiroshi Kawashima wrote:
> Gauche is an R7RS Scheme implementation developed to be a handy script
> interpriter, which allows programmers and systemadministrators to write
> small to large scripts for their daily chores. Quick startup, built-in
> system interface, native multilingual support are some of my goals.
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/bin/gosh
output/target/usr/bin/gosh: ELF 32-bit LSB executable, MIPS, MIPS32 rel2
version 1, dynamically linked (uses shared libs), for GNU/Linux 2.6.32,
with unknown capability 0xf41 = 0x756e6700, with unknown capability
0x70100 = 0x1040000, not stripped

Regards,

Vincent.
