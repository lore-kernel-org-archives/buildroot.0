From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 24 Jul 2013 17:10:11 +0800
Subject: [Buildroot] Failed building DirectFB
Message-ID: <20130724091011.GB11352@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I enabled DirectFB in buildroot-2013.05.  My toolchain is the Sourcery
CodeBench selected from the buildroot toolchain menu.

Now I got a compile error:


make[5]: Leaving directory `/home/woody/src/buildroot-2013.05/output/build/directfb-1.6.3/interfaces/IDirectFBImageProvider/mpeg2'
make[5]: Entering directory `/home/woody/src/buildroot-2013.05/output/build/directfb-1.6.3/interfaces/IDirectFBImageProvider'
  CC     idirectfbimageprovider_dfiff.lo
  CC     idirectfbimageprovider_gif.lo
  CC     idirectfbimageprovider_jpeg.lo
  CC     idirectfbimageprovider_png.lo
  CC     idirectfbimageprovider_imlib2.lo
  CC     idirectfbimageprovider_pnm.lo
idirectfbimageprovider_imlib2.c:64:20: fatal error: Imlib2.h: No such file or directory
compilation terminated.

Do you have an idea about this? Or, what features I should disable to skip the problem?

Thanks in advance.


-- 
I can't go back to yesterday - because I was a different person then
