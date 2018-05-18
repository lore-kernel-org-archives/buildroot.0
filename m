From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 May 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-17
Message-ID: <20180518060019.6D04C207AC@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   3 |   0 |  30 |
      master | 266 |  49 |   3 | 318 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 2 
          host-faketime-v0.9.6 | 1 


Detail of failures
------------------

        mips |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/c1847b4b4ab528f0d3f9e6e5693da299356fc3c0 |     
         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/c761c3fd24ab0cc4f0c74668f87617455ffa5674 |     
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/09a20176219813a1e05b8524e012e36c10022e60 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 11
               host-llvm-5.0.1 | 7 
                  autofs-5.1.4 | 6 
                   libnss-3.35 | 6 
                   exim-4.89.1 | 3 
                    quota-4.01 | 3 
               host-llvm-5.0.2 | 2 
                libkcapi-1.1.0 | 2 
                        libnss | 2 
                      qt-4.8.7 | 2 
                         boost | 1 
               log4cplus-2.0.0 | 1 
                     php-7.2.5 | 1 
             qt5location-5.6.3 | 1 
             qt5wayland-5.10.1 | 1 
                  samba4-4.8.1 | 1 
                   zmqpp-4.1.2 | 1 
                     znc-1.7.0 | 1 


Detail of failures
------------------

     sparc64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/1106f7a0c7e5104eb4e85a5fb8a8c86ce556b562 |     
     powerpc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/b42dd9ac401ff99ef95dd71439346fbbb9540d0a |     
     aarch64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/897fc71b6f70d897524438650b8924eaa62591b3 |     
        i686 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/926ee05827b54724e51a15502bb3a1a552f14e7f |     
       nios2 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/2ec5235abe5a433ba42651847da8fc1e7baaa5a0 |     
        mips |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/7f505c3e83c8f3815a7706898ec4bf298edd68f1 |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/385a82b4398b58cb1db8470062ddb0964204f01a |     
     aarch64 |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/26fe831e891fd8b5cbdb4d8705910d2ffe94fb7e |     
       nios2 |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/7c45bdaca8bf0a3375e0b78a36030ac142212cc5 |     
      mipsel |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/ac78fe18657558b3c12c03c08bf1081d7c06ca85 |     
        m68k |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/bd223dfa1c4baa68e427d4941bd2e9917e22da84 | ORPH
         sh4 |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/ad094ba34e1458a2f8c4be1826f410f417bee8ef | ORPH
        or1k |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/7707fadb1b8a58f3efe6cfd4a966c9904db713bc | ORPH
         arc |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/8f93c8c7c36f20dab0fc478ec67c7086641ca0d9 | ORPH
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/976bda8bb44c5eb6a2eb30a29dcfa69b09e39c2b | ORPH
         sh4 |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/e4702c2cffe6831aa01d2626e375634768bd0ed9 | ORPH
        m68k |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/a9c2e527f5c0a7fb0d1151047b5029b6a33fc38c | ORPH
    mips64el |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/5ccc23440dd1dc1bb23af68bc73c2ea319e2f3fd | ORPH
     sparc64 |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/b29e9ed00e68f647f2ed1155d8c7c3eef3bc3c0c | ORPH
         arc |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/fb2f35388ad51ffbb9a8d2ed4ea9338b467794a7 | ORPH
         arc |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/c6315a771db3adbf1164d6abe86017f7d6b2e9ae | ORPH
         arm |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/5ada461a0ced7dd729917a047f4b3a9c9a1c5c42 |     
     aarch64 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/8c7a251d61ad3bdbaf3c35da1e8e17504667edd2 |     
         arm |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/578934ab1fd078929111b3c1b947df8024bdaa42 |     
        i686 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/533ec0b80cee33043de6f0083e08a2229ed0b1c6 |     
        i686 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/2b52a326a4fe146a1e04d03df989d295a077b5c9 |     
         arm |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/f4bef3cd459980f8f760ddc0784e35a6066f1276 |     
        i586 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/24b450b29bc567db727d0c29c4bcb195cfa89f63 |     
      x86_64 |                host-llvm-5.0.2 | NOK | http://autobuild.buildroot.net/results/d4d367036e3d79b9f86bbbafc971ffa990b6617d |     
         arm |                host-llvm-5.0.2 | NOK | http://autobuild.buildroot.net/results/3b83d20a80e65ad611b9144ff1ce498e995e6f1f |     
       sparc |                 libkcapi-1.1.0 | NOK | http://autobuild.buildroot.net/results/da12b441eba2fd8e841c0a35f0f8e57c09e6ea2f |     
       sparc |                 libkcapi-1.1.0 | NOK | http://autobuild.buildroot.net/results/402a53200ef031a69e992a17acf7ddf9b71b9156 |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/7d2a7bc38f96049f31bc1a12b1909b6e6a4782dd |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/545ea29ebae72e80b9463bf057bdbc2fc6fe1d3b |     
         arm |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/8a17506d73f55288ea3d543bbe02c3be9d13a8cb | ORPH
    mips64el |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/0a97aefa3157bd0e93a7a47e081958c15c184feb | ORPH
    mips64el |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/a28e911cd0c8a1eed78a734ba25070163be27102 | ORPH
     aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/6cc1bd08387ae411ee2856016bd804a477046e2e | ORPH
     sparc64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/9d6c86990282889c595f4e5e55249d630e6fbf5e | ORPH
       nios2 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/1ca35171200286fa032b24606aaa50de6a2d449e | ORPH
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/61de5206016437174cbd269eb74aafaf0446862f |     
microblazeel |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/3c1d23966e2833142b165fc24021ef5de8117fc5 | ORPH
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e4e7b2a78bfba6d1418b87a960ef295a950952f0 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fde347c4765a95643eafa68c8bcc8aff95ee4696 | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/d10faeb56b1644c85c7a85c28fd03626f70acf8c |     
         arm |              qt5wayland-5.10.1 | NOK | http://autobuild.buildroot.net/results/9bcc76ed9e23c0d525f20b4da7f3bb5efe3083d4 |     
      mipsel |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/2bda3538018f95871232a73d6cc66a77d3c813b3 |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/1b7dccf7b9742d1b9cb57bffe55eac5cfc66b15c |     
     aarch64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d8c7a284bee28c4323c9885a953da285e8d66142 |     
     aarch64 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/489be441abd19fba2b0c39357e64a6adcf773b60 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/a494e2603557b4402fde5c3e4297d23c1552e24e |     
         arm |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/02b0603395f9ae0849369e20ad1e1b6322411275 |     


-- 
http://autobuild.buildroot.net
