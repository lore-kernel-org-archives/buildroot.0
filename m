From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Tue, 27 Jul 2010 23:33:09 +0200
Subject: [Buildroot] Configuring host-lzo fails
Message-ID: <201007272333.09640.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've started a new thread, since it seems not related to avr32 in particular.

I'm using the atngw100_defconfig on my 64-bit gentoo system with a gcc 4.1.2

PH >> configure: loading cache /avr/buildroot/output/build/host-config.cache
PH >> configure: Configuring LZO 2.03
PH >> checking build system type... (cached) x86_64-unknown-linux-gnu
PH >> checking host system type... (cached) x86_64-unknown-linux-gnu
PH >> checking target system type... config.sub: missing argument
PH >> Try `config.sub --help' for more information.

TP > It sounds like the autoconf host-config.cache has been filled with an
TP > empty value for --target.
 
TP > Can you show the contents
TP > of /avr/buildroot/output/build/host-config.cache after the failure, and
TP> can you post the *full* build log somewhere ?

I've gzipped the whole build log (from a fresh git clone) and uploaded it to 
http://www.hs-augsburg.de/~phuewe/typescript2.gz (498K, unzipped 8,8Mb)

The contens of the host-config.cache can be found at
http://paste.pocoo.org/show/242433/


Thanks,
Peter
