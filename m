From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  2 Feb 2018 08:00:42 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-01
Message-ID: <20180202070042.19CE821A6B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-01
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 153 |  99 |   4 | 256 |
   2017.11.x |  17 |   2 |   0 |  19 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     gpsd-3.17 | 34
          bootstrap-legal-info | 9 
                     php-7.2.1 | 8 
              keepalived-1.3.5 | 6 
               lightning-2.1.0 | 6 
                  boost-1.66.0 | 4 
                 libv4l-1.14.1 | 3 
                   systemd-236 | 3 
             bluez5_utils-5.48 | 2 
                  ffmpeg-3.4.1 | 2 
                    mpv-0.27.0 | 2 
package/bootstrap/bootstrap... | 2 
                   pcre2-10.30 | 2 
                    sdl2-2.0.7 | 2 
                    chrony-3.2 | 1 
                   gconf-3.2.6 | 1 
               host-efl-1.20.6 | 1 
              host-erlang-20.0 | 1 
           host-mono-5.4.0.201 | 1 
        host-xlib_libX11-1.6.5 | 1 
         libcpprestsdk-v2.10.1 | 1 
            libmaxminddb-1.3.2 | 1 
 make[2]: *** [all] Terminated | 1 
                 mplayer-1.3.0 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.9.3 | 1 
            qt5webengine-5.9.3 | 1 
sunxi-mali-d343311efc8db166... | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
     xcb-util-renderutil-0.3.9 | 1 
                yaml-cpp-0.5.2 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/4c242c5b0b5b50401aabe7ccada9b7f622c114a0 |     
    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/aad64e6165372e494fc2d1e8a91ad6dc7855ac5b |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/93702b8196aa722b367133ac3c41c2fa90d43555 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/31f95b6bc2046f5d38fbf7747cca89c7ac60b6cb |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/823eca7d04abbf91ffac0f3fcfd09266a208c581 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a801fe34d657b89e3305b66b10f70e6dd675bdbe |     
         arc |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/fd002fb3cad829e3eaab1f479d02bbed0b31f325 |     
       nios2 |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/50cde12365fc439742b280ba2b6bac82ff19b352 |     
         arm |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/0c0852beced3b5956778b610eca2605c35cf2ec2 |     
      xtensa |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/5cfa71b6d6a813006818637d0d4b2bd60ea2007f |     
    mips64el |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/1015840cf0822ab4d2f688ccd863fca94b14b9ff |     
        m68k |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/1ce06d4ab15fadce48f65e894bbe9a1162899c36 |     
      mipsel |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/b554b2fb54785919a3a1780726761d35249613a6 |     
         arc |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/019c5a655e7f2906d369951b271f972f997eab63 |     
      xtensa |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/cc4c7c4d070e9cd9b06271072b50270d1726f101 |     
         arm |                     chrony-3.2 | NOK | http://autobuild.buildroot.net/results/9420da202d8c4ca250085f16843aeb09cfe7bb6d |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/6c79ffafcf3510c83e27aca7c9d1b4dd825d7956 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/26579a0d3857f756265bfd0577920351a7b7e6dc |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/e777dcb3b8f1e1adcd9d1aff5286e97f55adad11 |     
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/bab81a7b574b7ce610763e82ff2a9eb7f5746d78 | ORPH
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/db8dfab6f2a3a663b4f59c054f0a38eba44fba87 | ORPH
        i686 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/ec19d85a01eaaf48b1f98408a4c144d7fba8a755 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/abcc5d4a1c3293e0e0af56c2075f662c4829ed08 | ORPH
        i586 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/56665bf77d393067f4573562e2ceb82031b6756f | ORPH
        i686 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/6101e141cc79651f443d5f8f8f3022bac1899f61 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/2eb970e081df8fb0399c36b9915d43aff0add147 | ORPH
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/e48b357b82f9cb9c287a241a6dbad49087cb4f0d | ORPH
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/990afbb7977190ce92a782641340c6868eb7605f | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/0e41ce8452b46f95c9d68ab706e2c80325d9c574 | ORPH
        i586 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/8a1e84314a7fca861d5c88bf61dcf30a5b6f2e28 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/78865c53861bf2736665593474718f3cf6335c35 | ORPH
     powerpc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/f0e460d2ccc75b2c84d309a1f5bc01d1b6da40aa | ORPH
      x86_64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/4114717557e0ae88c7d0c33a370f8e95babdf242 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/3c35053fdad307f5901b8a6e46e88fbe5c14e79a | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/6825d5b6be1342dada6e155a94b1ebdc8ec74e99 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/39d1f95aea8bfac1743d80d69dda68415cef4f30 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/9e82eb703bb7c355fc3fc8d142fb8c2f41e02bb1 | ORPH
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/d2a21b7606265e1ba2768440ccde134d34ef6571 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/aff410ed54be0b87a26b04e6a7d6c3986ea18805 | ORPH
     powerpc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/59f0dcedaf810751b5dec41978103d0ba11904ee | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/9ab5cf8d1e63be3df51a732bf634be1573dc6431 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/2253150c9eb31dee0622b8d3ac1264e6d37bee52 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/3b05a7032b90d8578f729eb7edc6faed1cbba81f | ORPH
    mips64el |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/67781fd8d912da4e4a2147031f8a7579f0fcc888 | ORPH
        or1k |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/e6899917c1315fdba7226e523d46aed9711c9e2b | ORPH
      x86_64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/859e22e76f0e40e2bd299b544659aaf18824640a | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/8bd6fe236695d5367f39d9b15c8db7554fb8965f | ORPH
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/a578dbcc613e0b6cd02ee90755c3de244bf31540 | ORPH
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/84a0122f3dd8f975e38083dcd4723ea221f30ae3 | ORPH
       sparc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/9a64617d371e4a4c8e51c331d2e5de2dd0e6a109 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/a667a12dac7ce11b7f30577c71eeccc4caa299ff | ORPH
    mips64el |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/2f62a776cda2b7a252ee02595e1075c19576e7a8 | ORPH
      x86_64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/fda5c902b3c77b46aa8e24a215f75fe6fb326374 | ORPH
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/bc375f67af59d291d0a50481d939f46b0ffa13df |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/9a1dc462d8b63b9b9b7e7c7d3f959d3a584513bc |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/9713b9976c4aa3b9345609ef6fcdf663a994fb4d |     
     sparc64 |         host-xlib_libX11-1.6.5 | TIM | http://autobuild.buildroot.net/results/989bf618d355355baae8dae3a6ac61f5498a8deb |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/75770e6c14b61f83017cac717e0ab799644a311e |     
         arm |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/47dd08bb88d22a8363f99380d824ca437a188344 |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/4ab2d22fb4677fc8d175b738abf3c5e0a5af4374 |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/7784cd942a507c1b92a51a95586d9559677d5ef3 |     
microblazeel |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/18cd3741a6ea77425dbe2504a82b3c3c4e9ceec9 |     
         arm |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/09f3d8fbbd7e2276ebd29410f6f765462b929910 |     
      x86_64 |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/63dce76cccb872da83bb69b1ddb365e42b80f849 |     
         arm |             libmaxminddb-1.3.2 | NOK | http://autobuild.buildroot.net/results/38c41b4ec02bde3283a3abe741db6c3c7d38d446 |     
        i686 |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/8ba380471423bd2491e40103d7b1a45de1bd12ed | ORPH
        i686 |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/78fa7fd4428f1d71b156099a21625f5188f15252 | ORPH
        i686 |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/cc2dc091b8e306a788f22c04343c5bdd5758c004 | ORPH
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/714fbbc68f1d43409c3afd809cff1b405b41be95 |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/a6b1ef038a60f76d89a53630e24bb2d2c6ba2aa1 |     
      x86_64 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/69768341555a930cda7d64a380fc1eef622c6465 |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/5bcf9e448272e8ec570aac66313bb970dbaea599 |     
        mips |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/57603380d789a0600fed15b67b6ddea322ce3249 |     
        i586 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/ce6431190f26dbf465078f31ed0bd87c893466dc |     
     powerpc |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/a957b06c8738375de95288212e4f929b66fa9ea3 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/96ae46b55fe2fdb6c72e20a80fbc9948198f5482 |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/29359da7f029ba49586dcd8c752944b44a8a83ef |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/552ef31f51345da2fb92973819a3b516c9c0da9a |     
        mips | package/bootstrap/bootstrap... | NOK | http://autobuild.buildroot.net/results/29bbd52209fdbee0c30ba7b5b5f9e2bf28a77830 |     
 powerpc64le | package/bootstrap/bootstrap... | NOK | http://autobuild.buildroot.net/results/f1f8aab23c855781c64eb654308a0e7957a439fc |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/b7975f83f376d373c04b6311f61862831504c93c | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/8b89d6bb28b73c82c70e99043ac4106789b3e306 | ORPH
microblazeel |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/0091a94bd0a2f4579d4d2c1e7dbf8749f6670792 | ORPH
        bfin |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/34033f376b2bf0e2c2853e4d7e1379893fc08089 | ORPH
        i686 |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/1235fc0f7c9f24b03180ad539c68b7ec2332954c | ORPH
    mips64el |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/8e8bbf1f553c6c76d6533f738450c38f856a3229 | ORPH
        bfin |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/80c067e88bb6c563fa50f10de6e6e5b2e3835490 | ORPH
microblazeel |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/58932bf2deb7afe61d598382a8d4f9efd79e6bc9 | ORPH
         arc |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/b7353f47d0bd64f9c58ff07c325400c664253dd2 | ORPH
         arc |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/1646590e945594fe625451b0c98e1e44c1e71373 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0d94d9f9b799baae45cb6d58b079ac3939f0dfca | ORPH
      x86_64 |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/9e149bdc78274398baf25f04a4691877cf244612 |     
         arm |             qt5webengine-5.9.3 | NOK | http://autobuild.buildroot.net/results/d81537a8f67bb0a3625057560b2f16daf4828f98 |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/eb2f9d14bea8b1e0b91b486c82acb5bd9243340a |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/2225614889998110925bbc60e9d97eb89733290a |     
         arm | sunxi-mali-d343311efc8db166... | NOK | http://autobuild.buildroot.net/results/75c2f3f6edd2596ce79b1dbe41e97cf71abd9f73 |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/c9fbbe1a5864c5b8b80b8c4721f96693e7bc011b |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/bf85c7e1a044cd10ae700003ca6ca5a4d0185175 |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/068a80df6e2e6247f55e4ffae2d28e3f519b3cf9 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/707761d8ae5729b38989a900875f2a71a041788f |     
         arm |      xcb-util-renderutil-0.3.9 | TIM | http://autobuild.buildroot.net/results/9d9f7d4e032e5ad833d15c625b2ba6170b98d715 |     
    mips64el |                 yaml-cpp-0.5.2 | TIM | http://autobuild.buildroot.net/results/97f711403fd04589868c49027f25715d38d9247c |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/747b68d68b95efaa0acae8932fc5ba481b4040cb |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.5 | 1 
              host-erlang-19.3 | 1 


Detail of failures
------------------

         arm |                host-efl-1.20.5 | NOK | http://autobuild.buildroot.net/results/90b25fe6f81b57015b4f20e68fd2ac7969749aa1 |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/ca16a8f2bc6a56ef9bf30373a0b0db88578ddad8 |     


-- 
http://autobuild.buildroot.net
