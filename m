From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 16:17:37 +0100
Subject: [Buildroot] Cant type anything into Serial Console login
In-Reply-To: <4F0D9D1E.7090406@labri.fr> (Jigar SOLANKI's message of "Wed, 11
 Jan 2012 15:30:54 +0100")
References: <4F0D76AB.7000508@labri.fr> <8739bmbb3o.fsf@macbook.be.48ers.dk>
 <4F0D9B42.2070604@labri.fr> <87y5te9uxy.fsf@macbook.be.48ers.dk>
 <4F0D9D1E.7090406@labri.fr>
Message-ID: <87lipe9sku.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jigar" == Jigar SOLANKI <jigar.solanki@labri.fr> writes:

Hi,

 Jigar> Yes I did keep this ^^.
 Jigar> Here's the complete command line :

 Jigar> LB_MKLI_CMDLINE="console=ttyS2,38400 init=/bin/sh"

That doesn't seem to match your first mail:

# Put a getty on the serial port
ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

-- 
Bye, Peter Korsgaard
