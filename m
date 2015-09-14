From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Sep 2015 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-13
Message-ID: <20150914063011.E3322101A91@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-13
===============================

        success : 225
       failures : 50 
       timeouts : 0  
          TOTAL : 275

Classification of failures by reason
====================================

                      qt-4.8.7 | 3 
                    ruby-2.2.3 | 3 
libbroadvoice-f65b0f50c8c76... | 3 
libyuv-1ebf86795cb213a37f06... | 3 
canfestival-7740ac6fdedc23e... | 2 
                   erlang-17.5 | 2 
             lttng-tools-2.6.0 | 2 
           libfreeimage-3.17.0 | 2 
             stress-ng-0.04.16 | 2 
                busybox-1.23.2 | 2 
             bluez_utils-4.101 | 2 
                 mpg123-1.22.2 | 1 
                directfb-1.7.7 | 1 
                openntpd-5.7p4 | 1 
           qt5multimedia-5.5.0 | 1 
             webkitgtk24-2.4.9 | 1 
                  mono-4.0.2.5 | 1 
kodi-pvr-argustv-96c8026793... | 1 
              drbd-utils-8.9.1 | 1 
               libcap-ng-0.7.4 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                  libssh-0.7.1 | 1 
               ibrcommon-1.0.1 | 1 
                 cdrkit-1.1.11 | 1 
              strongswan-5.3.3 | 1 
                 opencv-2.4.10 | 1 
                  guile-2.0.11 | 1 
                dbus-cpp-0.9.0 | 1 
                   tinc-1.0.24 | 1 
                flashrom-0.9.8 | 1 
              wireshark-1.12.7 | 1 
                  samba4-4.2.3 | 1 
           host-openssl-1.0.2d | 1 
       directfb-examples-1.7.0 | 1 
                   dhrystone-2 | 1 

Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/369d1c8f80a5f1904ed2438f3b50a0a419b9c5aa/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/a5422daec9af0e4e0276d038fdab0fc163eebdaf/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2998334900d6fbd035a0d233496267e6c9871125/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/150dc9ccd660d3ef01afacb3dd99aff524e7d57a/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/bf446be3f7f22f70aa297a031a1ff11cd173f2df/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/8d47d2c1e37f78bb2d80918a496699587b4e9c15/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/6dfc835efe2d64e3742daea21ffed84ac14cdf4d/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/ec106294da4d5b6ad5b1d3e8f7e1597b076ff072/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/d94b2234debebb0eacb2e60ff76775983ac31c54/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/017ceb26df26c1103f0592ddcad76c33113be6b1/
     powerpc |        directfb-examples-1.7.0 | NOK | http://autobuild.buildroot.net/results/fe6594a06b5306e779937ac80b9b62e42f325469/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/4d02ae5058b0646ae4d98b52a00ef49bb8028534/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/a82ede3ea01a54cca272fa069a48e26b433f9a18/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/1ea7372cd93e982b084ed1a3d18eb73789bb2846/
       nios2 | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/b19920388e5ff4f67d0e173846e26356850251c3/
      x86_64 |                 flashrom-0.9.8 | NOK | http://autobuild.buildroot.net/results/e1ff5a7d38ce1154baf2f99945666cb391ce5ce1/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d2832a227afb3fc401b226ec30116a2c07a47c2c/
        i686 |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/85e36cc387f372f106686c83c83badef937a127e/
      x86_64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/9c3889fe80e58b7a35c242332f993992044d2f6b/
         arm | kodi-pvr-argustv-96c8026793... | NOK | http://autobuild.buildroot.net/results/aff74e8915963ecc0e3d83c43ea2eb52618f07fb/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/d3c19d17bffe7ebfc84733cc7d126a4a6f808973/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/35568a4723a928342b6b562d44fea5b5bf314492/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/2db027e38bee3693973eeb6448b20915268594cb/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/aac461fdfeb7a1a411fe41a2a0eea2d7fda180cf/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/94a1029a8845fe2301048a074fcf61e765535467/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/0d6eda197dd4f2ff1dafaecc3df8f71088ea9372/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/fc3d39bb8cf0a3d7ebef5903a32bef8c651cef1e/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/7a20eac1260c5bd276b72be1b92ba9d3adc1d5c3/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/229736ad2db39c0a49037b8574c9ccf33eda4bc1/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/45091cdb160ffe563f199e4f8c304f36ee7a1799/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/62c9d716a6ecf70b1b83637d0da264c4afb2bdb6/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/cc6bcac0d2ff7e403c04f5665da7398405e78382/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a7cbbc54a76f64e0a92410f6899c26500c5a4395/
         arm |                  mpg123-1.22.2 | NOK | http://autobuild.buildroot.net/results/50dbf2da7c5f6884d551782524b7845da0cd315d/
      x86_64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/a18176887ad4e18de9d4d9b89aab0c2dd52fc981/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/78ae85a17c0a0243ded78cf0a6db5846afc5979f/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c90f8a7ee1c636a01a18188019f1768ccec242a2/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/05ba3ef2f071005dc87b1f69eed93964bd66ce9e/
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9c6ab01cf9256919ccfe33302e1b943e1f51957e/
         arc |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/19425313f0f15f0b737d9e99e78a56d4cb5e3869/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/19390bd9f51106b8f2e4ece16e359c05e0732ac2/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/eeee1b6730ce4d6da780cf3dd390c2751dca7ed4/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/a42cc9bbc5e6f6734ad9549c3fe985a5b9d7bb52/
         arm |                   samba4-4.2.3 | NOK | http://autobuild.buildroot.net/results/76af0a404508ed94d275419d533aaa863f42a1d4/
         arm |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/dac6a85fdd721b959175caf5629b91dee717c3c6/
         arm |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/88909b118dc927f31ed5c3b5f3513734a88085a9/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/2d1e1b7400a0189a6ff68c2b7affda14d3aeb5d8/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/ad4b90a8572015f52d449433f3e661f12d8a24b7/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/d21b90ed3a70eb257145848ac05f45eb8a86fcc2/
      x86_64 |               wireshark-1.12.7 | NOK | http://autobuild.buildroot.net/results/83fd654b303c23be5991145731b4a059491b59f5/


-- 
http://autobuild.buildroot.net
