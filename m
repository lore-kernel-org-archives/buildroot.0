From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 03 Jul 2007 16:34:03 +0200
Subject: [Buildroot] Requirements for building OpenEmbedded
Message-ID: <1183473243.5568.23.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to Stelios at Digital Opsis, the AVR32 toolchain does not
support shared libraries, which means that it will not be possible
to build X-Windows, allowing a complete OpenEmbedded Angstrom Image
to be built.

Any comments?

Are we planning to make an AVR32 DSP library available as part of the
Buildroot?
They have been working with different DSP applications for PowerPC,
and think it might be poissible to run VoIP on the AVR32
if the right type of libraries are available.
G.729 and echo cancellation are key algorithm to handle.

Have we done any work on the Helix Audio player?

-- 
Best Regards,
Ulf Samuelsson          mail:   ulf at atmel.com
Atmel Nordic AB
Box 2033, 174 52 Sundbyberg
Kavalleriv?gen 24, 174 58 Sundbyberg
Sweden
Tel:    +46 8 441 54 22 GSM:    +46 706 224457
