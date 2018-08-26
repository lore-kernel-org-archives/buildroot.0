From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Aug 2018 08:00:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-25
Message-ID: <20180826060017.3041320794@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.05.x |  17 |   0 |   0 |  17 |
      master | 206 |  17 |   0 | 223 |
        next |  32 |  33 |   0 |  65 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

            lua-flu-20150331-1 | 1 


Detail of failures
------------------

         arm |             lua-flu-20150331-1 | NOK | http://autobuild.buildroot.net/results/078868fb3de4b170f39636e15528d3368f761178 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 5 
                  boost-1.67.0 | 2 
                cutelyst-2.5.2 | 2 
          openpowerlink-V2.7.0 | 2 
                    brltty-5.5 | 1 
     docker-engine-v17.05.0-ce | 1 
                  mender-1.4.0 | 1 
            mesa3d-demos-8.4.0 | 1 
                      qt-4.8.7 | 1 
            qt5location-5.11.1 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/df9f506298c5ade75c0dc64ea9b3c71f8d2f2214 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/83be90158f343a62cc5b5a9aaa219c869993ed8a |     
         arc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1265058419f328c2d22cf6a9673cd3782b59ae60 |     
       sparc |                 cutelyst-2.5.2 | NOK | http://autobuild.buildroot.net/results/9e307ab9c7067b26d7b33a572204394808e25772 |     
       sparc |                 cutelyst-2.5.2 | NOK | http://autobuild.buildroot.net/results/701e511e0902e3b213e83233eb0733dde3a90ef2 |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/158d4ad0dc6e02f6535755204385d938754e61c8 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/c22d5d096d96d262f405265da5f7881559cb8528 |     
     aarch64 |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/41ab87b35feaa8087ea9f8abf4657a29d952d3e1 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/8aff5f6d7bcab616129368c1fb22026bb164e454 |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/3566d00c0abbff9ff7629e73b682e6eac401e687 |     
         arc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/0b2e77417cbf6884e5b68617bc49e79028becf3e | ORPH
    mips64el |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/8e8684e32359bf1d43e3a21a98c6434008c28278 | ORPH
 powerpc64le |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/b26db003e902b4c65aa57c6ff8cd02801b9c41e7 | ORPH
         arc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/2fb5be0a46ad9a19097ad320bc9f18d6005fe213 | ORPH
        i586 |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/76c8de8fd3f4a2da54b086868bb925e5eaf3796b | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a982c7e540c1f6cbef620e9415e57d7bafca146b | ORPH
         arm |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/84fe1c84e3537167ee3791e83c9fe2cc2805ccb5 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

         host-e2fsprogs-1.44.2 | 6 
             python-lxml-4.0.0 | 4 
                  boost-1.68.0 | 3 
        host-python-lxml-4.0.0 | 3 
                   botan-2.7.0 | 2 
              ptpd2-ptpd-2.3.1 | 2 
                rtorrent-0.9.6 | 2 
                     squid-4.2 | 2 
                blktrace-1.1.0 | 1 
                 gadgetfs-test | 1 
              glibc-glibc-2.28 | 1 
                libmpeg2-0.5.1 | 1 
            python-pyyaml-3.12 | 1 
squashfs-e38956b92f738518c2... | 1 
               target-finalize | 1 
             util-linux-2.32.1 | 1 
              wireshark-2.2.15 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/879ed9530709d74265be55ad10cda8c152b70c3e | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/caa76b2bb53c29e8763cc7391b43df9468be9455 |     
        m68k |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/da16c7fa34e07f69bfbb76047a52933af47baeae |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/3c0cd780aa54ac6fee71add752f8256c88a9c32d |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/bc463c818830cf963f3ea8cd00fa6a2365a117a6 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/cb90f4ed4d130a2ab6f6d085708a482a51d7dc91 |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/0c9b024ced53c23ef964348e94b0272ca66309cc |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/86987459673949443dd02e0baee57bd1342b6eba | ORPH
      x86_64 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/cbf15c9a4d3b10e9e19af054f55352e84e0e3eec | ORPH
        or1k |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/92a358ee39c69a9ad691f9845de0c18f5fcd8bd6 | ORPH
      x86_64 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/09e1908a5005ca32ef24c082543286b53a555ade | ORPH
     powerpc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/ccd16908da0f1ef98a1762238b610be04a24ae8c | ORPH
         sh4 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/cc33760f4be6d819ff9573bd6c094c9c87fd9171 | ORPH
     powerpc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/a7b4b7a904c7534187b065e6bbe83c65df1229cc | ORPH
      mipsel |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/ee4b9eb451a86e2b7e50f142e98fe734c01338a5 |     
        mips |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/52a31cebeca6ea86ff216d77c562a2a2e6d651e3 |     
     powerpc |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/32a7f8d1d41004b16f135c90af361f439ab02451 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/54b763bbdde84c7deabe189c1b1ee60ae722fe95 | ORPH
 powerpc64le |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6d1b7e191f573334115684b85165f2bc27d75d8f | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/2ed79d01635c9a5e1018229dc6f4b7240a995b87 | ORPH
        m68k |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/d8e3a9aae0e84fb1b3b8093986ec3a4ce7ca0663 |     
         arc |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/9d69f7f35d908476bb074fe1932d2c8feb02be28 |     
      xtensa |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/3886ce12d68e9f1901abdb4f5d6f886163dae33e |     
      x86_64 |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/4cdae8527b252ed6378cddb5fa45fe094a2319dd |     
       nios2 |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/e715a7dc8b6856b4aba0b9b4568d61420c52a5c8 |     
     aarch64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/0f678e78d624d9d83d28236efaa8b19d0df99f31 | ORPH
         sh4 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/0d096f811eaa9033c59a538ca2a2a8b7db525c77 | ORPH
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/92d8b6bc751d3f4fb44e4e47efb116cacaba7e83 |     
       nios2 |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/a71db790ae3a3ea1836760edad504a92ea005cf7 | ORPH
         arm |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/9d2cde8494f69fedf0afc460d8e540d769a79212 | ORPH
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/94b190ab1c2928d84232926e1a4cf5fd1a4e2c69 |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/fc184c69e5b98948fa6fc2e245b889b720d39a4b |     
         arm |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/d42b64e92cbf64353166af7451670e7f25a13f15 | ORPH


-- 
http://autobuild.buildroot.net
