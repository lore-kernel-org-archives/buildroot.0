From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jul 2017 08:31:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-16
Message-ID: <20170717063110.480D121D7F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-16
================================

      successes : 181
       failures : 61 
       timeouts : 2  
          TOTAL : 244

Classification of failures by reason
====================================

              host-expat-2.2.2 | 8 
      python-coherence-0.6.6.2 | 6 
     python-cryptography-1.7.2 | 6 
                  cppcms-1.0.5 | 5 
                   trinity-1.7 | 3 
                  cc-tool-0.26 | 2 
                   expat-2.2.2 | 2 
                     gpsd-3.16 | 2 
                   libcap-2.25 | 2 
                  lshw-B.02.18 | 2 
make: *** wait: No child pr... | 2 
          mediastreamer-2.14.0 | 2 
                      qt-4.8.7 | 2 
         alljoyn-tcl-16.04.00a | 1 
                   attr-2.4.47 | 1 
             bluez5_utils-5.46 | 1 
                busybox-1.26.2 | 1 
                    cups-2.2.3 | 1 
                dbus-cpp-0.9.0 | 1 
                    efl-1.19.1 | 1 
             freeswitch-1.6.19 | 1 
               gnuradio-3.7.11 | 1 
                libressl-2.5.5 | 1 
         libspatialindex-1.8.5 | 1 
                 libssh2-1.8.0 | 1 
make[1]: *** wait: No child... | 1 
                    mpv-0.25.0 | 1 
                  nginx-1.12.0 | 1 
               qt5webkit-5.8.0 | 1 
                 sngrep-v1.4.3 | 1 
             transmission-2.92 | 1 
                      x265-2.4 | 1 


Detail of failures
===================

    mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/5b23b15907e9494a1c7848effcb63ba2c5a1982d |     
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/550541fc47430dfb221734d23b1d520e2886a685 |     
      xtensa |              bluez5_utils-5.46 | NOK | http://autobuild.buildroot.net/results/1ea844d507767517318a577914423962a89dfa1f |     
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/9ac4fd5e97cca07297bb5923b1ace4be3899c828 | ORPH
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/3d90abb22585367eca1471205e2a09c036a72f47 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/813aef56e1c4062c9abd9a0f589d8d0d22858660 |     
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/4518bda663fa65fbebd40814d4dbe6438211dd41 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/6df6b391ebce68bdc038b440f2260d40db991c9c | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/cc58e00787f704622864ada5d2c91cbca8676212 | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/3c50fca71b0160fd4ea9760303696ea0a257762c | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/2e4bf53dc47e395fbce374e0ec909e4fee410f28 | ORPH
         arc |                     cups-2.2.3 | NOK | http://autobuild.buildroot.net/results/9db9bb8573858b71968e471b7588f1438ccc7bcb | ORPH
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/4f3876ca69a430020baeb5efbf30d80f808555e6 |     
      x86_64 |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/3b005e560d2b160d93ae909f3d1163b13d982ccf |     
         arm |                    expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/453e2b6fdf51710f4b6d418842f39c548b2fc8f9 | ORPH
         arm |                    expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/fa34ca8a1db06f1920a5359c83924866544c7990 | ORPH
         arm |              freeswitch-1.6.19 | NOK | http://autobuild.buildroot.net/results/f3cb98fd3dc023dedc8060d9dae4dd9b28681c8c |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/83037d04f97b0e751e6d8faca00e76f167e9dea5 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/69a3528a0ee83fcd1018f762534647f2fb4d926d |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/a1cd051ae041324fc46843008f977926ee540b16 |     
         arm |               host-expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/37d60c068a132c11cfa51c1031aeb496b976e8c1 | ORPH
     sparc64 |               host-expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/7756bb3fe45053c39738abdbe5db37ebfd781698 | ORPH
 powerpc64le |               host-expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/3268d278510ec3c415212839349a9aca48903da4 | ORPH
        i586 |               host-expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/82a5a6f736a33f3b07538b9f6ceb26b0c312ac77 | ORPH
      mipsel |               host-expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/0e9e29f2e0c813a34a3386074026307d7eb82175 | ORPH
      x86_64 |               host-expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/f38370526db2af1dbf2a35307427a851c2e85e1d | ORPH
    mips64el |               host-expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/2dd8e47b2f95d2b86010452c26878723ad5a4aeb | ORPH
      x86_64 |               host-expat-2.2.2 | NOK | http://autobuild.buildroot.net/results/e4f0318ff285c0ddfb78c8d61ed2f29d2cfad180 | ORPH
    mips64el |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/38dc5ebc285e24399e3e693514cdba8e091c3b5b |     
    mips64el |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/420056e984dc3c3c088409188e394b4f3541a32b |     
       nios2 |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/e6bb6f638468459d9b1f0ca0a613ed5b46f84263 |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/afc148b54914805658eb4e1df1f60458a75f7cd9 |     
         arm |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/d113fa20b1a3c39d88c2b4a095d83671290d1b79 | ORPH
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/c8f092cf80ab41b7dc02880117e4f664e024f736 |     
      mipsel |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/fd600dda9b9273947594209a12b6362ccca43020 |     
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/fec82e9c692eba19fc1d6ad82528e63e28eaedd6 |     
         arc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/131a45d8be3b955d02efdb68ac1acae762688e57 |     
      mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/25707eebd5cdcbcd0f4cad43d9f58aa0f40cc438 |     
   powerpc64 |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/5d74a411e9c2f7fe6fd3af69a11e18b1b0b9111c | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/4679a5e7554d3a6d60d70b10b42085ae0351ad38 | ORPH
      mipsel |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/824efbab091511d66fac7d8ddb947bd299aff733 |     
         arc |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/0d469622ecda2db1553e0087ab96da00ee2b42bf |     
        i586 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/cd99ac66af7a0cb24510bee78dd45884a8695776 |     
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/675721f773795987a2468daa33f299f7dc6ddb8a |     
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/b36441066d57e52a29ad262d0c8771556b641ca0 |     
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/61b8b7a05f671280bd6ff81782f697d7b5194b03 |     
    mips64el |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/c8b8983cc3d66adf866031dc9c68a3a13bf93c92 |     
    mips64el |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/acc4fc9a05b3a07e8cdb167cea0df4687e6a4c0f |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c63e27d93254c8a490e31a21a5550e17719e1876 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ad8092e11cd1432e254eaa430e1daba936488ff3 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/027ff1b36e6cba39cd1a94d104ec52816a865c7a |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a0197494707751052e01c0d897491edd95d12be8 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/867ed2c42882ba265743aaf20fc2bfd9c9cdf2a7 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a3729d672813afb952164d4ad4f056369b600839 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0efb6f87e34a178dc3436cf59eb7002ce6e4a640 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7c43a87bf171d31b6bb88f5db5961fd1c5bbb7cb | ORPH
      x86_64 |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/9a379960df3972846a6fa98c372b6a9a499aa0d4 |     
microblazeel |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/fee191cdce38a344bede1c232e60eb521e221121 |     
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/ed86c693872004f38f657f16f756331159209ce4 |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/512caeb32788aedbb38f807840c0a4f3227c7eb1 |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/4f6ba6d187de2e73bde70b9fe1865fff8a49ab40 |     
     powerpc |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/995c586d40c3534db23088217c958e7d6e1d6b2e |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/7b770c923505812fc63891db47f6182fb115e9cf |     

-- 
http://autobuild.buildroot.net
