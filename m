From: Neil Wilson <NWilson@Airspan.com>
Date: Tue, 20 Feb 2007 14:27:24 -0000
Subject: [Buildroot] openssl
Message-ID: <31FE7326559B534EA6C03ACF19B25A315FFCEA@fs5.airspan.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

First post, hello.

I am having a slight problem building openssl as shown below:

/opt/tools/bin/powerpc-linux-uclibc-gcc -I. -I.. -I../include
-mfloat-abi=soft  -fPIC -DDSO_DLFCN -DHAVE_DLFCN_H -DOPENSSL_NO_KRB5
-I/opt/tools/include -DOPENSSL_NO_IDEA -DOPENSSL_NO_MDC2
-DOPENSSL_NO_RC5 -DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall -Os
-pipe    -c -o cryptlib.o cryptlib.c
cc1: error: unrecognized command line option "-mfloat-abi=soft"

This is configured to build gcc 4.1.2 etc for a powerpc system so I have
enabled the "use soft floating point" configuration item and the
buildroot make is being hosted on a Kubuntu system.

Before I start digging into it a bit more has anyone else seen this ?
Thanks.

Neil

--
Neil Wilson
Principal Engineer, Embedded Software
Airspan Communications Ltd
Cambridge House, Oxford Road
Uxbridge, Middlesex, UB8 1UN, UK.
+44(0)1895-467265
neilwilson at airspan.com
