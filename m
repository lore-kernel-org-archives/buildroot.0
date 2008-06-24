From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Jun 2008 11:56:24 +0200
Subject: [Buildroot] [PATCH] I2C-TOOLS: Added support for lm-sensors's
	i2c related tools
In-Reply-To: <200804142155.19978.buildroot.atmel.com@pollet.net> (Michel's
	message of "Mon\, 14 Apr 2008 21\:55\:19 +0100")
References: <200804142155.19978.buildroot.atmel.com@pollet.net>
Message-ID: <87bq1r2m2f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michel" == Michel (BusError) <buildroot.atmel.com@pollet.net> writes:

 Michel>     This package contains a heterogeneous set of I2C tools
 Michel> for Linux: a bus probing tool, a chip dumper, register-level
 Michel> access helpers, EEPROM decoding scripts, and more.

Better late than never ;)

I committed a slightly cleaned up version as r22487.

Thanks!

-- 
Bye, Peter Korsgaard
