From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 16 Jan 2009 08:36:22 +0100
Subject: [Buildroot] libglibg2 fails
Message-ID: <1232091382.8094.40.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building libglib2 for both AVR32 and ARM I get the following:

...
gconvert.c:55:2: error: 
   #error GNU libiconv not in use but included iconv.h is from libiconv
make[5]: *** [gconvert.lo] Fel 1
...
make[1]: Leaving directory `<buildroot>/build_avr32/libglib2-2.19.4'
...


Is there anyone capable of building libglib2?

BR
Ulf Samuelsson
