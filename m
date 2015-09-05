From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Sep 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-04
Message-ID: <20150905063017.01FAA10139B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-04
===============================

        success : 269
       failures : 66 
       timeouts : 1  
          TOTAL : 336

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 17
                libldns-1.6.17 | 5 
                busybox-1.23.2 | 3 
                     gdb-7.9.1 | 3 
                      qt-4.8.7 | 3 
                  libssh-0.7.1 | 2 
                 mesa3d-10.6.4 | 2 
                  ltris-1.0.19 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                mongrel2-1.9.2 | 2 
                    php-5.6.12 | 2 
             bluez_utils-4.101 | 2 
                directfb-1.6.3 | 2 
          modem-manager-1.4.10 | 1 
xdriver_xf86-video-r128-6.1... | 1 
                   nginx-1.8.0 | 1 
                 igmpproxy-0.1 | 1 
                    ofono-1.16 | 1 
                 cdrkit-1.1.11 | 1 
               libupnpp-0.11.0 | 1 
          openpgm-5.1.118~dfsg | 1 
libsoundtouch-010a91a59071c... | 1 
libyuv-1ebf86795cb213a37f06... | 1 
 make[1]: *** [all] Terminated | 1 
                   bdwgc-7.4.2 | 1 
         conntrack-tools-1.4.2 | 1 
      host-gdb-arc-2015.06-gdb | 1 
                 libhid-0.2.16 | 1 
             bluez5_utils-5.27 | 1 
           libfreeimage-3.17.0 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
         perl-html-parser-3.71 | 1 
           qt5multimedia-5.5.0 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/28d792d2c273666a23c4959515d174a6bd6f469f/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/a24e278b38ed6898df3b9c951d61ebcd92720f8a/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8044a8de1d288ed193044f11a77bac377f20d4e0/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/39115e37ef5af11b1b27f665ad83de14daa57273/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9081815828eaf16707c31aef437d7d2d665e88d2/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/88ac094b8ca20146c01bf0aaf67683c3ece34474/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c2e66458731f3104baca11df47275688a9b9875e/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/51030b23b3084625e76919061f7ec8a398c5d3c2/
         arm |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/ef176ebec5ddda7db026d654d75809271184c70e/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/6294881283528f6873efb26693dcd3f5c5818cee/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/d51cd33ee3d823f9e7a2d7965052b81c18e5d6f2/
       sparc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/79880ec5211c9d4065bd3b6e51b5bc8dfe16a5ee/
        i686 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/4b4845c618f7a465203a88c67911c5d87c469c37/
        mips |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/32d04dd2cc365b1eb76e7267128f7ac9897ec14a/
     aarch64 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/ee61c483cf8cc5c54a8b61b05fa9c45cf0554d90/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e21d84ef58475fbf82007880fbeb37cfaaf690b6/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/301a800b664ac59a95caabc914cf31f7c5df4086/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/090d774f6162a920d64d670a627457b81f3e7d45/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9407639ace8dc22d6938b4a51a4a70bda2608170/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/c09fcce914b013cf598f6d96ea215f7284289375/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/08220d8da8afc1d98fd4495c78d216d735f7cac6/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/55fa40d9899b96ba27601a977c86beab4baef22b/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/af37def3a9e95304c27a776087db91f2cec26188/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/dd830277a5dd09607a4f4a5583751ec60d800fe9/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9b1ddfb901d697fbfc813595afeda26999c74096/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b6813b261b184ff5cf019cad8309b5731567fadc/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b524222d520aa4a0d81cd95d7624c8c17a383a7c/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e9b73ccd4c633cde0cbe688920ea487f463c0a51/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/5073110e31ac4b2d3edac2149aea2f0c6aafd954/
      mipsel |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e838d99ed0933e515c57a608016aa52dd3d9bff8/
         sh4 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/3cde2a7657bd2d1a919e63a3806a670e8e5b436a/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/cbeafeed2d70d9bdeb280ee5eb5bb363fb91a0ec/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/99a53b27f507118c28d7bd1252eef6cd946d31d5/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/544b214768c8ee0514d99a8c1a5f22fde8170093/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/2772bd0e16933ccbd7cf2209475b52accea53081/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/41cb4b114a981435e62db0f0b05546f57a12ad78/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a141e4056d18706064614aa9232ac4f7d9c9b78f/
         arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/17648123c72a6aa3e6df63e08d4a584d4f60b252/
        bfin |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/bad1c0590868c1e97f647172f85b112ff2604994/
        bfin |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/7dba36ae44560e65a00daf912abe8b43fa8a060d/
         arc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/0f229b6806b5cf18d5b56f80088bba7dc3c6eb28/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/a0e686cbe5104f48c9ab05aef7b2989abdb23821/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/527b6167fcade1333d8bedffca21e32e410ed8c9/
microblazeel | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/4a0ac131884c0bc231c9f1dfd356cb533fbe5f0b/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/51c4237ff14cf3ebcbc92758201d84cc72e2a962/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/194ee885dd195706bded3ed524ff1685f4f6d4b5/
         arm |                libupnpp-0.11.0 | NOK | http://autobuild.buildroot.net/results/c22c5b55edeab59cf4778cc16a8b03e54b9c4e3e/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/bf324985e9bbcd61196304de1d0313a0e216a0a8/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/7a7126d76fe4abf21fdac6321dc36dad321760e1/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/178555beb058e2f0fcc8a03273f036982c39b9bd/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/5e98a2c612d61e5003bb3930e0b6de11b650b275/
         arc |                  mesa3d-10.6.4 | NOK | http://autobuild.buildroot.net/results/1e977bf5b0616701f8d2f30a0dbe493ed41b80a9/
        i686 |                  mesa3d-10.6.4 | NOK | http://autobuild.buildroot.net/results/0d1945635121dd5de6df081aadd4a517e30e462a/
         arm |           modem-manager-1.4.10 | NOK | http://autobuild.buildroot.net/results/34e2d9881f84b770d499730f8dfb782a35d00764/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/a19af6ff0b853e6d32293a6deb6469e99bf33084/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/2a070797e90d6beb1c959f9e8a83c977f34c16ff/
         arc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/a544ff8af87cd0465fffb6ccbb6fc76f346caba6/
       sparc |                     ofono-1.16 | NOK | http://autobuild.buildroot.net/results/eede06045594c8b8d4e6e93a480eeabe3a7a9957/
         arm |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/9ea705ffa566691362f4924048d6bedd1a7ab126/
      mipsel |          perl-html-parser-3.71 | NOK | http://autobuild.buildroot.net/results/128671dfa23d843698a63220c2fac1f44e1d5845/
         arm |                     php-5.6.12 | NOK | http://autobuild.buildroot.net/results/2e2914ef163f220ab795c00626a6279a0067e2d2/
         arm |                     php-5.6.12 | NOK | http://autobuild.buildroot.net/results/487fe3bedde7d2b2c4dd65a52d30f3939349f032/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8230a7433fc38c6d68ee11a6a1e7741d73e05358/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8c69165a961729dfd0aa1d1a6b39e06efdbae5ac/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/970380766a0ec0ba075acfcb62ee726cd273a9b7/
      x86_64 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/ebfff14f6e895dcabc8ec38bb0a9ec0f9f2ac96f/
    mips64el | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/34fbb7434d94b32de82f7094facbe57abef2573f/


-- 
http://autobuild.buildroot.net
