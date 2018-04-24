From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Apr 2018 08:00:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-23
Message-ID: <20180424060012.0E321206FB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   1 |   0 |  27 |
      master | 248 |  61 |   0 | 309 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 1 


Detail of failures
------------------

     aarch64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/183eb9139ef7f6bc1d0d3d33ec6ad3f0e9872ec4 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 15
                   flann-1.9.1 | 8 
           libfreeimage-3.17.0 | 8 
reaver-9bae55bd30b6d46b42da... | 5 
      gst1-plugins-ugly-1.12.4 | 4 
               log4cplus-1.1.2 | 4 
                  udftools-2.0 | 4 
                  zeromq-4.2.5 | 3 
                cifs-utils-6.7 | 1 
gst1-interpipe-10dba89eecc2... | 1 
                  host-go-1.10 | 1 
                 host-icu-60.2 | 1 
               libupnpp-0.16.1 | 1 
                moarvm-2017.05 | 1 
                 mplayer-1.3.0 | 1 
                      qt-4.8.7 | 1 
triggerhappy-b8228880661293... | 1 
           uboot-tools-2018.03 | 1 


Detail of failures
------------------

       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/bf31a155b1d32371a23dae543eebb25c290a19f2 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/67600bb52fea56c351f4ce90206ab140c50e0473 |     
      xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/2fcaa36eb25674b3d877a82aa4d1c5fa3d493a6c |     
      xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/a1762cc7edd5ef8355de607597561ca8003d6fe0 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/6fb745a6e25d52bacc9123a0dfd0abc8a76d4697 |     
      xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/f2266e28634653832df9fd9434dae53c239f4df9 |     
      x86_64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/eb4244c7b52c2a26a8d1ae69fa18f20edf384de5 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/87f681001439164fd9f49b6adbde57c5ef3dd2cf |     
   powerpc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/2ecf95dcb81c2c25efce82151114644a48e1a740 |     
    mips64el | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/98e9ae05c53fcef1a4abb55038bc5c4ef85bdf2e |     
        or1k |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/9b9b06a22041a100ac23bbfc447d0dadac43da8e |     
      mipsel |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/9954c5a400c14fd2b18f2bfd1d2fc5d4dd39e4e1 |     
         arc |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/4b47002fada5d73920ae64cf35f1b16f34e31336 |     
      x86_64 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/3342bde8ecb37d1a0d623f5b1761a63f22341083 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/4c2fcb4397bb40709a318bd7e305c4b622608a3e | ORPH
         arm |                  host-icu-60.2 | NOK | http://autobuild.buildroot.net/results/b91f5231d0d6f396842a9b298f71fe4280ed1ae8 | ORPH
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/153a2dbfda99b22a02b15844a27c88bf54b255a4 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/388b1af0031c3d82b461f1f07c5b9a9e8f2a13dc |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/4c60c382aa0445303c3b91e1c24f953e7f053107 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c7d39a9fed6c60ec854ee85167a2e0006e21d86d |     
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/66ef0e6cab0824ccb7c6e625a3fe5e527bacd507 |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/85b8b5c8a8b94125659f689d16c005faf4c35196 |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/2894e130e6a9ea2fc042c6516fc7f32190301c24 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/7a30103cdf76e2994d90a32b39535079497f6eae |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/60c03f9d1d35fcf22ededeafe7e97788479ad45f |     
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/11a8a02bf1d77ad7a8289b629f7de11838f57802 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/89187b635d097a9044b43426fe19f25248ab6d8f |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/5bd7c625886f7a08574233d3343f385f5c8e391c |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/baa2637473870af7772606dcf99f282644ac1d1a |     
        i586 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c2e275ab193243c995d9646ba9fee07216bc3968 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b9be312b583904a2aba1ec2bfcc501893398b885 |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/4db6dbb2daf90b9c7ad481bdf10e6d4ea0620cc1 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/67446228d478a5517ec4a58ba2c2e47349f9c6b9 |     
   powerpc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6d6a7cfeff9268d2edcd51fa87398b04beadd80e |     
       sparc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/8572eec0ae6bea644cf423c27a6d6d5b5236f2e6 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d3010c7f822e7981ac737262285814674198048e |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/76e30423dc1825a8a566611ec3ccb5c104f4647b |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/df41c861f63c219acc011d8fa95c6cc371c3fa88 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/bae546cfc722066975fea540df9c2090b7cbec0f |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a88ab974ab563a18b2f473968ca7afdc48db600b |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/84ac553b749b5e11462e64d6c0ae2715820b3455 |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/4ea0be9148ccc54221b2eae3f3c70ec47cb3b4df |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/edea2e66a72e5ebc91aa0b2b2fa5bb48c2c7dde2 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/4f3d69a73e9ce0cac031497ca098ccd65c1fb96f |     
 powerpc64le |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/5af71be0574690b9352c813bcfc59e5d99147f95 |     
      mipsel |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/31426e20bbf2ed7e6b311c6070270d26ba4646db |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ef8b492c243dcbfaf32ad96503a0ea9c3f497227 | ORPH
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/4ca3f16092158a87fbc6225c5c1f3df9772b4bc0 |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/72964060c390fe932e84aa771074f33a5b93ffb0 |     
        m68k | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/70e46e463ebff2d04bcc8cad86e66bf6e93fd978 |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/1a10c5670ed9864c12668193370203df89f6c81c |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/08bd14b0a4fccf14aa2a38329b9e5e84513d725f |     
         arm | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/53c0ec5e2b9235585a88b15ba4ccd489c3ade820 |     
         arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/7143b629eee8655692c206dae35ea714c52947e3 |     
         arc |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/8cefed60ea91e6b6887b51eaf30412f37892aa9f |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/1a6280550d410667a8a4b6cbc7c057c39f5a0d5c |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/9e27d8a14513f13c0698d35c81a091074fb92d59 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/996063560fee552df5308be7207377de2ad89a90 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2171b440e90180cf33d5f597bdd889d6c4a7fae2 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/adea798fe3ad4940f4d8f98bf798e7daf9dbde0a |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3f899b124148c0467d4621847ec49a06471e28e3 |     


-- 
http://autobuild.buildroot.net
