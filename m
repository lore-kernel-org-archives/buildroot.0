From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Dec 2009 16:49:55 +0100
Subject: [Buildroot] Problems connecting to AT91SAM9260
In-Reply-To: <20091203154314.237790@gmx.net> (Jens Kleinhans's message of
	"Thu, 03 Dec 2009 16:43:14 +0100")
References: <20091203154314.237790@gmx.net>
Message-ID: <87eincrra4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jens" == Jens Kleinhans <Jens.Kleinhans@gmx.de> writes:

Hi,

 Jens> I want to connect to the ARM board mentioned in the subject with
 Jens> minicom.
 Jens> So I connected the board with the RS232 interface and the USB_D
 Jens> interface to my host PC and configured minicom with the following
 Jens> parameters:
 Jens> 115200, 8bits, 1stop, no parity, no flow
 Jens> Then I powered up the board. It started sending some datas to minicom
 Jens> about the boot process. Then it ended up with the lines:
 Jens> Uncompressing Linux...RomBOOT
 >> RomBOOT

Why are you sending this to the buildroot and rtai lists? An atmel list /
support seems like a better option.

-- 
Bye, Peter Korsgaard
