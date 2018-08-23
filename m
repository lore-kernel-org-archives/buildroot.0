From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-22
Message-ID: <20180823060018.67F9820802@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   0 |  21 |
   2018.05.x |  12 |   1 |   0 |  13 |
      master | 156 |  21 |   2 | 179 |
        next |  34 |  24 |   1 |  59 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mplayer-1.3.0 | 1 
                     php-7.2.5 | 1 


Detail of failures
------------------

   powerpc64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e4fb1cdbdf440bc29f798e812ec0632ed65f143b |     
         arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/a103f7abc262bb2f494ae05ebb7424b20cfef247 | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

            qt5location-5.10.1 | 1 


Detail of failures
------------------

      x86_64 |             qt5location-5.10.1 | NOK | http://autobuild.buildroot.net/results/61051dbd0c77a3be2752908de0d96ca300384b83 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 9 
               aircrack-ng-1.3 | 1 
                host-libsodium | 1 
                 host-rauc-0.4 | 1 
                libmpeg2-0.5.1 | 1 
            micropython-v1.9.3 | 1 
               mono-5.12.0.226 | 1 
          openpowerlink-V2.7.0 | 1 
                    owfs-3.2p1 | 1 
           python-numpy-1.13.3 | 1 
                      qt-4.8.7 | 1 
                qt5base-5.11.1 | 1 
                        uhttpd | 1 
              webkitgtk-2.18.6 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/b7362b69435e9ef6fb2aedc50743e88dbd7a5c72 |     
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/f75a1fe41b75942bfb8fea1e8c77de373dd4a21c |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/5c8b07e5fc44ea2a32c4f0ec0156a462a6fbc864 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/ad4f1be6d0609ca23b75b8629631e0cebca9a1b7 | ORPH
         arc |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/9fc52ecce13e7a9ebb374a308ddc098e5db43a89 |     
      x86_64 |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/7b5dda59d2bb0a37075edda7a8b745f255ae9c98 |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/8fce53c8ee58b63472c944c6f5b0726b7248e4ba |     
      x86_64 |                     owfs-3.2p1 | NOK | http://autobuild.buildroot.net/results/bf893f1ecabb9ecadceb5d56eaa5e4869832e330 |     
microblazeel |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/2fdf44b6a69275797c9cedc528183d146d454c98 | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/01d8cc899e2747829f4cd9ab9bfb5f9b349f8249 | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/3751fda19010097a5ea06edaa42a8143b9feac46 | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/56b989d6efe522a12173d8cd1aecb0898f122fd3 | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/8bed8eecac2b98a0b75e3a29ebffeb59012fca5f | ORPH
         arc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/9a0651da5bc92e684506477fce6b129a48594f83 | ORPH
      xtensa |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/e80efaceaa936d37de45499bf8b696cdc89b06ef | ORPH
    mips64el |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/3d39ce0ae7df184673c8f4bb21b6bca538cb2306 | ORPH
 powerpc64le |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/d20c4fce931fe7773be6f93bac6aa18ac4e6a1c7 | ORPH
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/e7b564b5a4ab780fc6110e1780f8e447abc5072d |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a8c1175ae924b40577d665abc291db6660c10543 | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/3bc369d31a57e1dc27b2e9008f63326cf2810021 |     
    mips64el |                         uhttpd | TIM | http://autobuild.buildroot.net/results/d11e1c27ff02d14e49d721f233a6b3d34225a7e1 |     
      mipsel |               webkitgtk-2.18.6 | NOK | http://autobuild.buildroot.net/results/87912384185461d57a98f52d8e25628831ad77ad |     
     powerpc |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/7035fa8b906d13104dbcb99730e6caa9b701c942 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

            python-pyyaml-3.12 | 4 
                   botan-2.7.0 | 3 
             python-lxml-4.0.0 | 3 
                       unknown | 3 
                    ncmpc-0.30 | 2 
               target-finalize | 2 
               aircrack-ng-1.3 | 1 
               asterisk-14.7.6 | 1 
               azure-iot-sdk-c | 1 
                  boost-1.68.0 | 1 
       host-btrfs-progs-4.16.1 | 1 
                 lvm2-2.02.180 | 1 
           qt5serialbus-5.11.1 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/425a15e7a8adbf158ee483b90523b974a225a35b |     
     sparc64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/1c266acc0bb0518219979e8e9922f31150716118 |     
      x86_64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/8291f4633d03145365b69feabdab9d414140202a |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/f5e900e9b0368f9ba690e1f5851c047647d54078 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/b5c4d19e54f052803143a58755c7a556cf7a3564 |     
        m68k |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/3930f69e031c6b94f824954061280d4dd21fc492 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/0779a52c5090278975676cd5ff917c854f63b70c |     
         arm |        host-btrfs-progs-4.16.1 | NOK | http://autobuild.buildroot.net/results/802dd4d7eec058c2eb23e033ed3a093b110f4eda | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/cb34f35eb4267d0a9f7872232d6406b5d1f0eef0 | ORPH
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/3d79505d68d13e8d501ded2f9b8ac6bd88969698 |     
         arm |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/991273d2a919dd777e5dd1d609f8ac0be726fe6a |     
        i586 |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/9342987c0fe0b3e4fc69a6039e38a6aff4d7ddf5 |     
     powerpc |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/32f1f82815d08177195b5460a0f61ffc2c54be4c |     
     powerpc |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/5d7a31d5a72c89f26072e656692fe73150bf490d |     
         arm |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/4ad85a67b2a6f81344cbeaa53b3f4ab9b8d3b7dd |     
microblazeel |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/cbc77fc2ac8cca6de73304b9c7a40bf5198098aa |     
         arm |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/134de8ab9f42f0c93b988b719da1248f8334770e |     
     sparc64 |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/4c7a276c30842adcdee0bbd74e1537ac8a66e6f7 |     
    mips64el |            qt5serialbus-5.11.1 | NOK | http://autobuild.buildroot.net/results/163b24776baafe4282a23928bbd930b90fa748a5 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/77e23f621c9e06b3cb28782f8e94584b51150749 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/69573fa22ce337cbd2fb1677cfea167dbe2cd2f5 |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/798a15a9a064d476927bb49bf534c427e9119c4e |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/be43983767e94ab5c64c3cb3de467840fd6635d2 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/7244c23a0fbcf27547b5ea639d88033b5a7d9f39 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a42fdf0b990e38e49f423fb40708d158e823a8db |     


-- 
http://autobuild.buildroot.net
