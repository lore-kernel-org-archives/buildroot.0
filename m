From: mike <wtf62@rovoreed.com>
Date: Sun, 17 Dec 2006 10:35:46 +0000
Subject: [Buildroot] Command not found error
Message-ID: <1166351746.5253.11.camel@glynys>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I've recently upgraded my buildroot using "svn update". When I now try
to rebuild the toolchain it ends with the following error...

make[3]: i386-linux-uclibc-ar: Command not found
make[3]: *** [libgcc.a] Error 127
make[3]: Leaving directory `/home/mike/buildroot/toolchain
make[2]: *** [libgcc.a] Error 2
make[2]: Leaving directory `/home/mike/buildroot/toolchain
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory `/home/mike/buildroot/toolchain
make: *** [/home/mike/buildroot/toolchain_build_i386/gcc-4
[mike at glynys buildroot]$ 

I'm guessing that this is something to do with a new feature in "Build
Options". I'm using the default setting of "linux-uclibc" for GNU target
suffix. Not sure where the "i386" is coming from but I don't have
anything called *uclibc-ar* on my system.

Can anyone give me a clue how to fix this problem. Thanks
