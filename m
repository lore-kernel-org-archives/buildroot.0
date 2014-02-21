From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Fri, 21 Feb 2014 22:17:25 +0100
Subject: [Buildroot] udev 182: scsi/scsi.h not found
In-Reply-To: <87fvncuqmu.fsf@dell.be.48ers.dk>
References: <5307AB0F.30602@gmail.com> <87fvncuqmu.fsf@dell.be.48ers.dk>
Message-ID: <5307C265.8020004@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 21/02/2014 22:01, Peter Korsgaard ha scritto:
> What toolchain / .config are you using? uClibc (default for the internal
> toolchain) provides scsi/scsi.h


I'm using eglibc because I need the eglfs support. Currently I'm trying 
to use the internal toolchain just to see if it builds successfully. 
Likely the next shot will be the linaro toolchain (it's for a imx6 board).

Best regards
Marco
