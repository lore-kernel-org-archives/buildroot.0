From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 08:31:37 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-28
Message-ID: <20170729063137.2FB8721F34@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-28
================================

      successes : 167
       failures : 23 
       timeouts : 0  
          TOTAL : 190

Classification of failures by reason
====================================

python-libconfig-b271c3d9da... | 6 
                     gpsd-3.16 | 3 
     python-cryptography-1.7.2 | 3 
                 qt5base-5.9.1 | 3 
                  cc-tool-0.26 | 1 
                dbus-cpp-0.9.0 | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
        ltp-testsuite-20170516 | 1 
          mediastreamer-2.14.0 | 1 
                      qt-4.8.7 | 1 
              webkitgtk-2.16.6 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4f62662609eeaf849513f609b0095ffff7f4e804 |     
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/fb9b9d5b88ac1165a3ffff8d2d29ecc6329a0a26 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/9a78e039f2a07d425845216a7a65a790f6471b03 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/a2ae5e79c21bd73a2ab80d32894a2aa9426ffcce |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/0b29afa63dc7302c6f328f776c0a0885cd857c17 |     
      x86_64 | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/b750d95b9de5c4483e71b69fd837a531dd077499 |     
         arm |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/341eb311e41d8afb1ccabb424d9e9d2dcfe6fc3c |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/8fbe355d9e2105946648abde3e7d26841d8fd349 | ORPH
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8f3c5f049d417526332cbf0ef7dfba3c29a58667 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6829f788b79490d8ab254879c2eaefbd6ca57176 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9c70fa75d5266ea1983f3b20cd2c8b50159acf33 |     
   powerpc64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/0916e18c13cd04ccacffeccc22520065aca5edef |     
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/875872997bb585d149e66b6ea90d9a6f552013d5 |     
      mipsel | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/d92b4e6eff0ce069bc54934df6da0edc079584a2 |     
     powerpc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/844fbe5f0da7361f8f9f7c46a920d98afe2a414f |     
        or1k | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/720d3b332e91842f0d5ca4ea9c5be8489358f1cf |     
      xtensa | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/2307b3bbd7b1a38c4205b557890b1efedc420126 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b71750865c7f42f96c1f7ad4506f35e4c163cb3c | ORPH
         arm |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/e5760b7c678aeafa4f687cf1a152d497d901e1d9 |     
         sh4 |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/2a117b5aeb7b8c046c30f37c6521398b7e1f901d |     
    mips64el |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/18c99dff9119b569a1cd23e85f3b737ed5f7bec2 |     
      x86_64 |               webkitgtk-2.16.6 | NOK | http://autobuild.buildroot.net/results/31052ca9341e67a027ca736509a9e3a00e8ceeee |     
      x86_64 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/2d998ac64fa43683e27d87e65a116080c4f036a9 |     

-- 
http://autobuild.buildroot.net
