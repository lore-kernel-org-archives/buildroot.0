From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Oct 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-11
Message-ID: <20131012063005.54F0252C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-11
===============================

        success : 90 
       failures : 42 
       timeouts : 0  
          TOTAL : 132

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 9 
                  boost-1.54.0 | 3 
               libglib2-2.36.3 | 3 
                 libffi-3.0.13 | 2 
                 qt5base-5.0.2 | 2 
                 omniorb-4.1.6 | 2 
                    php-5.3.27 | 2 
                libiscsi-1.6.0 | 2 
                     m4-1.4.17 | 2 
              cryptsetup-1.6.2 | 2 
             gdk-pixbuf-2.28.2 | 1 
        gst1-plugins-bad-1.2.0 | 1 
                 rt-tests-0.83 | 1 
               alsa-lib-1.0.26 | 1 
                 binutils-2.22 | 1 
                      icu-51.2 | 1 
                 wayland-1.2.1 | 1 
                    ola-0.8.31 | 1 
               audiofile-0.3.6 | 1 
           heirloom-mailx-12.5 | 1 
                openssl-1.0.1e | 1 
                   chrony-1.29 | 1 
        liblog4c-localtime-1.0 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8f60e5b523609b0d2b5b178687f448104c58bf63/
  mips64el |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/afc321527bb66365ac84f6717d9c8a01c22e72da/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/6d5754d10af24d8e9528878548be1d4f25a1f730/
       arm |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/0e6fc229e7cdcf9f6294ee96e27c0e2fd6702a43/
  mips64el |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/2b4ca05efcbd795b598bc39b5a581642d6eba77d/
       sh4 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/495d72cecc7dbf8e6b90228998f77b73b18777f2/
       arm |                    chrony-1.29 | NOK | http://autobuild.buildroot.net/results/94a172a2f6d7e8cd5408c4e277f20b7666428709/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/edb8a5f55989e8b24d63f2faef548ddf8fce8ad6/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/d25d4366d62b4596b740452cd9db8563c91dbcce/
       arm |              gdk-pixbuf-2.28.2 | NOK | http://autobuild.buildroot.net/results/4a599eff5e32f45ed5ab6c4eb214e8a5b9e8fd29/
    x86_64 |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/485f6359d05e6fced108e63b1f5a7901b99e77c0/
       arm |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/fe28f0da7aaaab137e1edfd8d9e9b8048f90a794/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/288e95fcf794ed3ccacd9a45057f55170e94816c/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/4a7f53071ee433a2d691862ed04f0197728a792c/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/dbab1605f43b830575fabc6aadb97c595793fc1c/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/21e0fcafd8e6fa0f7d84d44cbf78b845a097a45e/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/96311e5464fe6da6055f9211a0d179d763e6e3c7/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/74bd032aacdead8d91cd173ac457d27bedea13ea/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/2fe3275665536efef8a2c3152c625b04aaafe1e6/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/d55e8324a858bfa7f1cd1985af2f82f8cbdba7b8/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/3aeecc08bc5f90d8520a17960b3fb9454da4161a/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/4a741b91c230029f3670467b83a6e7eb7a4302a6/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/e2a54a6b739b961da6819243f741b047e36d288f/
   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/3ccb693c8385dc906e1689fed1a86689f863ba88/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/e9b3e1a11ad8fb69dbb88978254de24dd3444151/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/fa97fa102c9ead0819ba639737cafe23c2aabe4c/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/a8148904bf3ad310424e13af0040097fcc533dc2/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/1169e4232077c1a7b447a774e70904e94fe8653e/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/41737e329e4675060b4ac5f7f7d852272aeefec3/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b6d018eb9f823a3c6a9aaac7f0077adc70be7ee7/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/5762d7037d2b8cdfe06e89eea2d2e95ec3bc1972/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/a5a63601cfd35386989fcc1a18b36b90900db79e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7f045202f6c95b94ad35c8e226358bf4f41e3162/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/de840455a4cf53d20f91ee8f2954fb326e66d1c9/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a733269a53d22da546fd5e99c6b821da6f92c6c8/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cd732a472b2b83f7f6fe1170ebeb223ee871440f/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/defbc4fbed2b629787bc964ad1131e4bd1fac514/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2d3d0e5272f5a7733cff9e9792b612838cce97d2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e5fa88e40616829ba0016841d7a6475358cff23a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/00fda71cc41638b2405cf0813d8f4c205650a06c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6dd8feb895acf3a57111a94cf0a288b9d474c76d/
       arm |                  wayland-1.2.1 | NOK | http://autobuild.buildroot.net/results/daffba2f273cba23fa693358c6becbcbea36c4eb/


-- 
http://autobuild.buildroot.net
