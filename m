From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 30 Jun 2011 17:05:24 +0100
Subject: [Buildroot] Library search paths and ld.so.conf
Message-ID: <1309449926.14232.10.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is it possible to dynamically add a library search path on the target?
I'm aware that it's possible to add to the ld.so library search path by
adding an entry into "/etc/ld.so.conf" and running ldconfig as well as
using LD_LIBRARY_PATH as is done in target-finalize but I don't want to
run ldconfig and take the time penalty it entails to generate the cache.
Can't I just tell ld.so to look in an extra directory or two if the
normal ones fail?
