From: Stephan Raue <stephan.raue@gmx.net>
Date: Tue, 11 Mar 2008 03:31:24 +0100
Subject: [Buildroot] problem building mjpegtools
Message-ID: <47D5EEFC.4090703@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i have write a Makefile for mjpegtools 1.9.0.rc3. I become follow error, 
can you help me?:

 /home/stephan/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-g++ 
-Os -pipe -I/home/stephan/buildroot/build_i686/staging_dir/usr/include 
-I/home/stephan/buildroot/build_i686/staging_dir/include 
--sysroot=/home/stephan/buildroot/build_i686/staging_dir/ -isysroot 
/home/stephan/buildroot/build_i686/staging_dir -mtune=i686 -march=i686 
-DHAVE_CONFIG_H -I. -I. -I.. -I.. -I../utils -march=i686 -mcpu=i686 -g 
-O2 -pthread -MT rate_complexity_model.lo -MD -MP -MF 
.deps/rate_complexity_model.Tpo -c rate_complexity_model.cc  -fPIC -DPIC 
-o .libs/rate_complexity_model.o
In file included from 
/home/stephan/buildroot/build_i686/staging_dir/usr/include/math.h:72,
                 from rate_complexity_model.cc:19:
/home/stephan/buildroot/build_i686/staging_dir/usr/include/bits/mathcalls.h:339: 
error: declaration of 'double fmax(double, double) throw ()' throws 
different exceptions
../utils/cpu_accel.h:47: error: from previous declaration 'double 
fmax(double, double)'
/home/stephan/buildroot/build_i686/staging_dir/usr/include/bits/mathcalls.h:342: 
error: declaration of 'double fmin(double, double) throw ()' throws 
different exceptions
../utils/cpu_accel.h:50: error: from previous declaration 'double 
fmin(double, double)'
make[3]: *** [rate_complexity_model.lo] Fehler 1
make[3]: Leaving directory 
`/home/stephan/buildroot/build_i686/mjpegtools-1.9.0rc3/mpeg2enc'
make[2]: *** [all-recursive] Fehler 1
make[2]: Leaving directory 
`/home/stephan/buildroot/build_i686/mjpegtools-1.9.0rc3'
make[1]: *** [all] Fehler 2
make[1]: Leaving directory 
`/home/stephan/buildroot/build_i686/mjpegtools-1.9.0rc3'
make: *** [/home/stephan/buildroot/build_i686/mjpegtools-1.9.0rc3/.make] 
Fehler 2
