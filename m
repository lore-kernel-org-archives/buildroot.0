From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 08:28:40 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-09
Message-ID: <20170510062840.A2A1320C5D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-09
================================

      successes : 259
       failures : 26 
       timeouts : 0  
          TOTAL : 285

Classification of failures by reason
====================================

                 mplayer-1.3.0 | 3 
                    radvd-2.12 | 3 
                  libcdio-0.94 | 2 
        ltp-testsuite-20170116 | 2 
                    mpir-3.0.0 | 2 
                 opencv3-3.2.0 | 2 
             rabbitmq-c-v0.8.0 | 2 
             util-linux-2.29.2 | 2 
                  boost-1.63.0 | 1 
                    mpv-0.25.0 | 1 
               opencv-2.4.13.2 | 1 
                protobuf-3.2.0 | 1 
                 sudo-1.8.19p2 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
               upmpdcli-1.2.12 | 1 
                     xen-4.8.1 | 1 


Detail of failures
===================

         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/2c55722d64e87686272985894126a5883da35568 |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/dae23319a691d44a82d4ae52898b2e718f0ed69c |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/63681cc183e336617ff92bf9aa3ca9168bc2bcd4 |     
         arm |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/e2b00cffc30620d26cba591c7393e1879420222a |     
       sparc |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/da7af3d99c6f05f3496ee5e8039ef8bdb593fe9c |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/f33cb1e0b49fe8aee68fb4b66ea4c304b71a6f8f |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/7ebaf7dc02475f654f4385990f3aa4ebc18f493a |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4e75a2cb261a064cd136356da99e9d45d4a0444c |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/633e9d59766304b8e5b32ddaa9a76c9f04ac93d8 |     
     powerpc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e2b172278eff7d80d581aa0884d74b8eeb666f1f |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/fa051518ac5997f404e3e3c7dc7a73502672a433 |     
        sh4a |                opencv-2.4.13.2 | NOK | http://autobuild.buildroot.net/results/b70946ae23861cd0fe9fd5f4746a880dffde9a29 |     
      x86_64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/7ca09e529b07057199c78e66311c01e75de9a36d |     
         arm |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/2a40913918fefdf0fa7c2c00e83181ec402e4c99 |     
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b766c31eaeaf065c952f56017753a0e45757f622 | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/798dbe5e5fd0463bb2066cb115656795144c327f |     
      x86_64 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/60d2206f4be8cde30a7a2f87230b9dfdd2ee25ee |     
microblazeel |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/d6a56bb40f25da281520e6324c42b47398c0aaf0 | ORPH
microblazeel |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/f9aaa9610327f3fbc2dcb86c85146b49c3da37db | ORPH
      xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/2d80c067cdfff7aeedf852459176d388c1e60214 | ORPH
         arm |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/58ee4fddea85f0c79b26582b04a573258e27eb47 | ORPH
       nios2 | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/3ddcf1731afd38d241c3b5bc1283164783b2c346 |     
         arm |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/1fde9c1471ba91109964bbf8765b995333c0e6c4 |     
         arc |              util-linux-2.29.2 | NOK | http://autobuild.buildroot.net/results/63430db3374840866f178fdbfe017ef68bc8701b |     
         arc |              util-linux-2.29.2 | NOK | http://autobuild.buildroot.net/results/a74c33540ed445bb99cc68d7ff5bfe43bf314915 |     
     aarch64 |                      xen-4.8.1 | NOK | http://autobuild.buildroot.net/results/a0ce0ec7f76392bdcfb1a752fa09e860484427da |     

-- 
http://autobuild.buildroot.net
