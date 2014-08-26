From: Malte Forkel <malte.forkel@berlin.de>
Date: Tue, 26 Aug 2014 19:52:59 +0200
Subject: [Buildroot] Building RPi toolchain with 2014.05
In-Reply-To: <20140826082338.GA3925@free.fr>
References: <lthbud$oba$1@ger.gmane.org> <20140826082338.GA3925@free.fr>
Message-ID: <53FCC97B.30002@berlin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 26.08.2014 um 10:23 schrieb Yann E. MORIN:
> 
> I just tested the master branch, and it does build the toolchain
> sucessfully.
> 
> But the toolchain does not end up in output/toolchain/. It is located in
> output/host/  and can be called with, for example:
>     /path/to/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
> 

Yann,

thanks for your help! That's were the toolchain is in 2014.05, too.
Should have found it myself...

Regards,
Malte
