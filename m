From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 8 Apr 2007 10:01:56 +0200
Subject: [Buildroot] Building GCC/C++ compilers using Buildroot
Message-ID: <01d901c779b6$221ca5a0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tried to upgrade my ARM gcc-3.4.6 compiler in buildroot
My host compiler is gcc-4.1.2 running on OpenSuse 10.2.

First tried gcc-4.2 and latest supported binutils    - Failed
Then tried gcc-4.2 and binutils-2.17    failed.
Looked into the error messages and found that the problem
seems to occur when building the C++ compilers.

Now trying gcc-4.1.2 and binutils-2.17 without C++ compilers.

Whats is a recommended combination of gcc and binutils 
if you want to have a c++ cross compiler?





Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
AVR32 Applications Group        mailto:avr32 at atmel.com
http://www.avrfreaks.net/;            http://avr32linux.org/
http://www.at91.com/ ;                ftp://at91dist:distrib at 81.80.104.162/
