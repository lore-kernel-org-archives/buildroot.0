From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 24 Mar 2019 00:23:28 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-23
In-Reply-To: <20190324070053.10948878B8@hemlock.osuosl.org>
References: <20190324070053.10948878B8@hemlock.osuosl.org>
Message-ID: <CAMo8BfL-nXFNUMCgQ2Ffyakjt_0tpAexexv7KmToddRPWOa3Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 24, 2019 at 12:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>       xtensa |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/90e2bf9b85d9c7ef60b904800ca5b24f75ff5f50 |

Bug in xtensa linker:
/home/buildroot/autobuild/instance-3/output/host/lib/gcc/xtensa-buildroot-linux-uclibc/7.4.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
BFD (GNU Binutils) 2.31.1 internal error, aborting at
elf32-xtensa.c:3283 in elf_xtensa_finish_dynamic_sections
I'll take a look.

-- 
Thanks.
-- Max
