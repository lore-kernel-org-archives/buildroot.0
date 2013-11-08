From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Nov 2013 08:30:25 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-07
Message-ID: <20131108073026.BD92F52C60D@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-07
===============================

        success : 72 
       failures : 34 
       timeouts : 1  
          TOTAL : 107

Classification of failures by reason
====================================

                 qt5base-5.1.1 | 5 
               libglib2-2.36.3 | 2 
                 binutils-2.22 | 2 
                  aespipe-2.4c | 1 
               w_scan-20130331 | 1 
                 cairo-1.12.10 | 1 
                  connman-1.12 | 1 
        gst1-plugins-bad-1.2.0 | 1 
              vim-699f8d8f096d | 1 
                openssl-1.0.1e | 1 
               alsa-lib-1.0.26 | 1 
                valgrind-3.8.1 | 1 
           argp-standalone-1.3 | 1 
                 webkit-1.11.5 | 1 
                  ltrace-0.7.3 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                bellagio-0.9.3 | 1 
               pcsc-lite-1.8.8 | 1 
                   attr-2.4.47 | 1 
              e2fsprogs-1.42.8 | 1 
                     gmp-5.1.3 | 1 
                     apr-1.4.8 | 1 
/home/test/test/3/output/ho... | 1 
                  tstools-1_11 | 1 
                  python-2.7.3 | 1 
                    fltk-1.3.2 | 1 
                      qt-4.8.5 | 1 
                 mplayer-1.1.1 | 1 
               libsigsegv-2.10 | 1 

Detail of failures
===================

  mips64el | /home/test/test/3/output/ho... | TIM | http://autobuild.buildroot.net/results/53f6223f982f2cca151dfc61e292783d2f87725d/
      mips |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/93955b54b4a3eba8b58a1a74c975e3d13321789c/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/86c6ad42eb428717b921063f374eb4d7060e1c9b/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/6a245f49e0bfd6a4ebb8654d1e95db7f7d158497/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/228c2136f0067ad0ac8abc73b2ec614eb2354458/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/4c65bd78132fa413940d1da748534cf380562cf3/
       arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/f6db9a9072e19d0632c8e6d64f67248e90f227ce/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/6a5f5cbf6e3f59f7563b6f7d0f59a56a2fdbe8dc/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/1bb18ff3037e5b73e7b504e14bfd396d42917c5b/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/c25ddecf01a13875071c5d711406cf48146089b3/
   powerpc |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/86ec312b465da319b69e57d8dce6ace9d79df578/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/31e260d7777638d2a0595e2db0b6519cda2cabe2/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/b606e4ce098a70c64a5e9cf0c6c21ad45315d6a4/
       arm |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/529b1ab8356530fd6aafc3bc046a62e563b4ebe9/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/25770c981f92270a6f1ce7afbcc7e35820d1ba65/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/fdb2e957f1eabd50f7bf18ab2da4179d8e4f308f/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6aee67e12917bc7ffec88a5e53cb3d184aec6b3a/
     nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/1fe2ed3a4ddf6ebee8c33634c1e62617952b8e16/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/002ae4a0e1732b25d5d5a7694c05fb88b8ea2177/
     nios2 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/9dadec304c44d21f6df95f0d1386e6bd7cf156d9/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/4bbea6e2fdbc1211242dde68c08611a5d5b6bc37/
   powerpc |                pcsc-lite-1.8.8 | NOK | http://autobuild.buildroot.net/results/22bdd63808a6b1d7475e68c535ce222192ea59d5/
    x86_64 |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/90541603f04b3cbdafd694abc5f8cbd02b6bc3f6/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/af21a37426856f3f4430df3a691ca96761bdb578/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/43e3fcc06ab9c969edda24daeb3ca78a596807dc/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/feb0c53ba42bb0b1da3b159e443bed94fe1924ac/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/1bcede76ff1c7374f4586290cf54deae15e402d2/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/2e4b83d40a49b8767727edd51396ddae30ada123/
    mipsel |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/039709dbdc09777408eea381bdbad552f6b9ead8/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/9b152dd712a7db4c7aa842f6c226747e5373353e/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/bd50e6cb4e023f09e10fca7203d738703c044f98/
    x86_64 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/388b1af93203d89c50ce93c99d50ba3129207daa/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6a870d855aff1e1e8430c467f9c865a699ba9819/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/f920768deb5f6c57396b93834f17b442481ea0f1/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/1eaa694263b74313b0c90c510abcb11d490a3773/


-- 
http://autobuild.buildroot.net
