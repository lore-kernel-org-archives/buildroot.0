From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 17 Nov 2006 16:59:14 +0100
Subject: [Buildroot] [PATCH] Various package additions and updates
In-Reply-To: <39d7ed000611160251v1c5e8e1fn7620bdcaa4394286@mail.gmail.com>
References: <39d7ed000611160251v1c5e8e1fn7620bdcaa4394286@mail.gmail.com>
Message-ID: <20061117155914.GB28121@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 16, 2006 at 12:51:39PM +0200, Gilad Rom wrote:
>Hello List,
>
>For my first post, I'd like to attach a patch which updates the following:
>
>1. Add alsa-lib, alsa-utils, iperf and samba.
>2. Fix and update dialog to version 20060221
>3. Fix and update directfb to version 1.0.0-rc2
>4. Update mpg123 to version 0.61, and add support for OSS/ALSA.
>5. Update strace to 4.5.14, and add a patch to fix ARM EABI.

Could you please respin your patch against r16565 (or later)?
Please add and use
FOO_CAT:=$(BZCAT)
resp.
FOO_CAT:=$(ZCAT)
so folks can choose an alternative for bzcat/bunzip2 -c/bzip2 -d -c


IIRC i already updated strace, but the ARM EABI fix is not in yet.

TIA,
Bernhard
>
>And now for the questions: Has anyone successfully built
>buildroot using uClibc-nptl from scratch? It seems to be
>that NPTL support on uClibc requires an existing cross
>toolchain in order to compile(?)
>
>Thanks,
>
>Gilad Rom
