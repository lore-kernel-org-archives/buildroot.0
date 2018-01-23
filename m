From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Jan 2018 08:00:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-22
Message-ID: <20180123070007.E56D620788@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-22
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 224 |  39 |   3 | 266 |
   2017.11.x |  23 |   2 |   0 |  25 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

open-lldp-036e314bd93602f73... | 6 
               host-efl-1.20.6 | 4 
         libcpprestsdk-v2.10.1 | 3 
     toolchain-external-custom | 3 
                  boost-1.66.0 | 2 
                   gconf-3.2.6 | 2 
                  samba4-4.7.4 | 2 
                       unknown | 2 
             bluez5_utils-5.48 | 1 
                 clamav-0.99.2 | 1 
           cups-filters-1.17.9 | 1 
                     gpsd-3.16 | 1 
              host-erlang-20.0 | 1 
        host-util-linux-2.31.1 | 1 
                   jamvm-2.0.0 | 1 
              lynx-2.8.9dev.16 | 1 
                 mplayer-1.3.0 | 1 
            nilfs-utils-v2.2.7 | 1 
                  physfs-3.0.1 | 1 
           policycoreutils-2.7 | 1 
            python-pyqt-4.11.3 | 1 
                      qt-4.8.7 | 1 
                    sdl2-2.0.7 | 1 
                    tekui-1.12 | 1 
              wireshark-2.2.11 | 1 
                      x265-2.5 | 1 


Detail of failures
------------------

     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/d3c64c9e092bd6747f7da2cfcfd8e15bc629f846 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4eb54d0f9bf4f899726ceb9bce3f287392c69188 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/27d927a352b673eb0ba567aeccf4911ef692aa9d |     
     powerpc |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/50b10c64a90f93ef8daff8818892bbd8d7964434 |     
        i686 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/582bc23556cb50e3c1f0b71930c6004f613326f3 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/202a4313776a4387a83e772f7af45ecdfdc79396 |     
    mips64el |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/24878ccc5434c11debdbc2e1fdaff4f1c28b0ad1 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/7334351587ea52b1e861a49af16a0e0e6ebec8fa | ORPH
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/51f3b06f9a29f97ed9ff48ebcb4a2f32c190a408 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/fd75fc1b5339786219bf9761790aed447af4a394 |     
        i686 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/8788934bdf436ba66ac9eb095916c4803ad0225d |     
     powerpc |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/6fb0229ed746736ff76fa73872f99d551c14b49e |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/966407343deb1f7eb3f25749c60e6936d4a42848 |     
         arc |         host-util-linux-2.31.1 | NOK | http://autobuild.buildroot.net/results/fb2205703ee0f4be3dde95a4efc29ec8231e34bf |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/6b25c85d27fa4c38ecfb0ad1b21e145941b39c5d | ORPH
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/7524398d555908860b2264a721950233b58383b0 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/3d665c4a6b645516d3b128132a879607eb2602c7 |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/ad926f9f8d96abe1f774ab7bcf536d1dc3b7ec0e |     
         arc |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/3ba844108f0117af7472b43c4bad3b56755cdad6 |     
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/baaaede6e63bfaa48790413ba6af6901235ce912 |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/ffc627e350b65a5e70df0596d4b7dc7431383cdf |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/231476108f8e128c6282531577f69437f4c9ba29 |     
        m68k | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/8e628d9cf35cdee8eb006fa9116e3230dedaffd7 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/c18969411e7b2aa12e283831042d75427d2cebd9 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/3c6c075820bd1d1757af00dbc470aa27fc2c9187 |     
        m68k | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/9f0eeb55824e12660f0d4e13d3dd8e2de7f0dd6c |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/f9a08731a9773dca2d4b9fab619afd2670597b71 |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/58c0b69ee5c9ad2b127d5e9ee984aab2ad53f048 |     
         arm |            policycoreutils-2.7 | TIM | http://autobuild.buildroot.net/results/674b8364fc017d450d2757e4d39684c26316af9d |     
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/2e28eafb1da78285b1dc68ae1341c3fdf52d370d |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/40c20b7ad162181e4bfd51c2b38a37bcc3207bea | ORPH
    mips64el |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/64bcc17885259a6cb6ece86e586e507a00b6e9fc | ORPH
         arc |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/2612c9a3512692b9df6c6d9a3628ec2109923fce | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/7f5f88773477a11cb741b806e9094ec29a94b36f |     
      xtensa |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/e82d7d5b7c33e8ba5b69e14e33f8a0a48c971aae |     
   powerpc64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/6d434dafb001f64e8cd84b4a2cde67504829508c |     
        m68k |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/69eb1976f504b6079f8cefaaf9e234269f8ac5dc |     
        m68k |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/4facf53a0e40e818d3fb79838a5f0fb557c171ee |     
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/56afca7820c8c67de385ca0e42f6c0f29069ea24 |     
        mips |                        unknown | TIM | http://autobuild.buildroot.net/results/e249bde8551cc9d28780ef416f7880ec5f2c52d3 |     
         arm |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/86c9822dd400dc92de2e2059dd91b9f554c31f7b | ORPH
         arm |                       x265-2.5 | NOK | http://autobuild.buildroot.net/results/3bd91a5694936650ce936a408ddd50338f65f8b0 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.88 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/c4ad1390c5e8b6868146b8e9ef3941b807150c04 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/672954cf1a65dd84f7409c716da4ea6244e19742 | ORPH


-- 
http://autobuild.buildroot.net
