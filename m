From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Oct 2013 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-25
Message-ID: <20131026063008.7174752C609@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-25
===============================

        success : 42 
       failures : 81 
       timeouts : 0  
          TOTAL : 123

Classification of failures by reason
====================================

                    mpd-0.17.6 | 10
    trace-cmd-trace-cmd-v2.2.1 | 9 
make: *** [uboot-tools-lega... | 6 
           uboot-tools-2013.10 | 5 
      host-uboot-tools-2013.10 | 4 
               alsa-lib-1.0.26 | 4 
                libiscsi-1.6.0 | 3 
                 binutils-2.22 | 3 
               libglib2-2.36.3 | 2 
                valgrind-3.8.1 | 2 
                  gnupg-1.4.15 | 2 
                   attr-2.4.47 | 2 
                  tstools-1_11 | 1 
                beecrypt-4.2.1 | 1 
          host-protobuf-c-0.15 | 1 
                sqlite-3080002 | 1 
                 cairo-1.12.10 | 1 
                 ffmpeg-0.8.15 | 1 
                  bustle-0.4.2 | 1 
               qt5webkit-5.0.2 | 1 
                 libnspr-4.9.6 | 1 
                    php-5.3.27 | 1 
                  connman-1.12 | 1 
     xlib_libpthread-stubs-0.3 | 1 
        liblog4c-localtime-1.0 | 1 
                  udisks-1.0.4 | 1 
             alsa-utils-1.0.26 | 1 
                 fdk-aac-0.1.2 | 1 
             tinymembench-v0.2 | 1 
                  ne10-88c18f0 | 1 
                 libffi-3.0.13 | 1 
                   cvs-1.12.13 | 1 
             make: write error | 1 
               w_scan-20130331 | 1 
               uclibc-0.9.33.2 | 1 
                 rt-tests-0.83 | 1 
               audiofile-0.3.6 | 1 
                     m4-1.4.17 | 1 
               czmq-cb9839cf90 | 1 
                  libnl-3.2.21 | 1 
                sdl_ttf-2.0.11 | 1 

Detail of failures
===================

       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f96950ccf77873dbce7a73bc2e15e275699ff257/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/d140fca741693b0f93d10aa24973c01e8b2b2f2d/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a15917c47325f875ea23953e81905680f3f03739/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ed164866a3d02a66017f63756d6b6fdc9d761bb9/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/ce92bd5ac77728c43ae0dac302d45d6de67970a8/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/dd7084df68dd41b515ab5cacfa07a58038e189aa/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/03c103adf42217908994397daa3737d519c4531c/
      sh4a |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/bce1b3a2a99d0dddeddff98af39342c1476ebf2d/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/4a4709dfa46cc15b0e2890078481e31f4328f4ae/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/f3f9fedfc92b125fa2dbe10c5e3f72db3fdfb7a9/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/d232d06b5ab9a7b1c5a4d76a79b3794cde8e2274/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/687a233c574de8c95ddb9187b8fdd72be0d07902/
   powerpc |                   bustle-0.4.2 | NOK | http://autobuild.buildroot.net/results/b34408340292b60596d127dd83741d2bbe11eac7/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/488955661999b6564afe1ce5759daae5980b6532/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/a8269a379eae7e75884ceec79a815ca9503d171d/
  mips64el |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/5b70534de7e6138e95227417887bb68fb4b92745/
       arm |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/367b135b6d79983d45cb87ebfc841949bfeff29c/
    mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/de8968ebf6496d568808c3892de6f35fae76c034/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/70cdb7fabde52bc2337b626d93f60cdc1e8bd485/
       arc |                   gnupg-1.4.15 | NOK | http://autobuild.buildroot.net/results/e933c3bf643779439a3264d2165fedd25415cc12/
       arc |                   gnupg-1.4.15 | NOK | http://autobuild.buildroot.net/results/124c1193f4ba333818a86542cb97024764d35c0b/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/d4029dd430a52f8c68e4859f380f36ec0b519ea5/
       arm |       host-uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/07c56f2f9ff17cd2f72bcad87446cef88e4428af/
   powerpc |       host-uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/fb0bafdabb4cd0dc9648cb5468b09a5215fde2db/
   powerpc |       host-uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/409ac94817a55b19fb810dd2322075b2c2840d5e/
       arm |       host-uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/fd5b0837d4e8754baa714e3ad33decd9908bea94/
       arm |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/0039c8fa62dcef54353161a0351a21e62686cda4/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b40161e2ce5d75e5ffdac7e96040c11c144412a5/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/43208b15f70bec9b3125b711a2d6e71eb22e5299/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/e727e88e818365fa451b46476b8173dbf4fcf4b4/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/da5ab6903f235e2e7bfe93183b46f7a496631f5b/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/58b2b6ad150dad63d739ff117b94671ab37d85d3/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/2f16f7e88e21ccd6a0c4373cc90d1eaa9e45798a/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/54d552576cdce201be3ef0d51cd84bcc6d397425/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/ed1343116e305284e724323a91cded628a635b4e/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/58277501b5483e9f0a373a353231f59a2e874496/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/ecb6301f5c8b927344ee1146b35d15f07a3c2e49/
    mipsel | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/0699b804d8e3016025f791868aa9f44b54f0cecc/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/51e9b2d68d31a62b54cb54397fe7a393c45ce28a/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/6fce6c431c70130d9bea1dd80243a32392e5539d/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/e5cd258fe3f48b7c64dec7beef4d27a8169ec7a7/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/756e3be973bc4fdba36a3f150130b275163ce248/
       arm |              make: write error | NOK | http://autobuild.buildroot.net/results/41543962d6fc7f7fe16532e59647189f782d8915/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/657b947554ef44b845fad871e9cc7ab384eec47b/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/6ddcf6569d2830a3312da0365a3cda8c8556ddc5/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/83852fe3d3c6b494a17f17b1ca89d99df555dd29/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/94596b24477c7ec9bfa0c010938f9af3ac183563/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/27e0d334449d7023e5aee5b61b667d0fc995fba1/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/d562718663888b8f08fa4dc6b192397dbb261a6e/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/e5030f7da0f86e0a66142192f2d4858d76e727f9/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/e15f12893c829db694084e7965d5c450b314831b/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/9730cf7f47bf83cd62068ecfc2f208afec08e8bc/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/c4ae4ab3364165c1deac38f7b8c08565c719669a/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/297fac06c0481719e4a6571d08aeaecd3bc30bb7/
       arm |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/4c341263ccd59ec09c3818040c48490cbbae40ea/
      sh4a |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/ad4d07efaf76c5146eeb711b4d2d9937a8b86835/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/51030f76b4e609693f184a26ccfa2453d294e7d4/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/6313fafd1c01b180acbceb9d166aa9cd8abf4b64/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/2af97c4a0f0176d9c173db764d6d0205546f9a08/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/268bdaf121fe4621f840e042afa86b88e863e5ac/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/baa563238871cd8d4a5ec6b75f7ef8f9ffa57fc0/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/27b0e698b37d8cfc40a3b2c31f410a92367e2697/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/fb640e768a5c7ab0fa5fe71618f27cee8716ccec/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cb84119b5164bd09d1779d7d38b21bae659edf51/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/30a4b60a70288d0b84ca90be726096b76dddcaa3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ccae9e2d06164ba9a09c921df22f7844449e58f3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d8c1219e786d998c4822ef93b13cb283f574c068/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1cdd9438548d840b49b36793231930f4f1b31e30/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8e87939d7bb376f623b03276a4f13d24ccc4354d/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/34c9eb0544ea483001f61ea1b5124674e9872ae9/
   powerpc |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/18986401a53de5e170b71eb5f552b429a0c0a311/
   powerpc |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/41ce71daf8432a1c414fcad1b9a69f1a93de3761/
       arm |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/8c87009cd0230930e29836db69050d0dcb916bfc/
       arm |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/bd878285dcb1e68bfc464edaa957592394c02896/
       arm |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/1b0d7dc6a68d1449709fe441aa8950428e7d7501/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/902fd34ebb41619bcd61d498ec2b22fcbab3c53e/
   powerpc |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/bbece0b0ebac3909b956a1867514a8e6c3fb3bd4/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/21eaadeb0af07ee343e8a5add7c918e62f57ac4d/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/c39fceb4be5d422a7453f14d89e824ca0a1105f7/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/c3326143d3f6425b7a72e598b3384f42e2e42129/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/a793d701d43fce1316697e21b592f50468724811/


-- 
http://autobuild.buildroot.net
