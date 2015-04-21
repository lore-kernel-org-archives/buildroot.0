From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-20
Message-ID: <20150421063016.F02F1101A1C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-20
===============================

        success : 165
       failures : 51 
       timeouts : 5  
          TOTAL : 221

Classification of failures by reason
====================================

libubox-5a0bbefc8fa44044625... | 6 
                     vlc-2.2.0 | 5 
freerdp-770c67d340d5f0a7b48... | 5 
            python-pyqt-4.11.3 | 4 
                  dhcpcd-6.7.1 | 3 
                libtirpc-0.2.4 | 3 
                 leveldb-v1.18 | 3 
make: *** [perl-libwww-lega... | 2 
                 rsyslog-8.9.0 | 2 
                libevdev-1.4.1 | 2 
           libfreeimage-3.17.0 | 2 
                 qt5base-5.4.1 | 1 
                   dhrystone-2 | 1 
                       kmod-20 | 1 
               libecore-1.7.10 | 1 
            host-heimdal-1.5.3 | 1 
                  guile-2.0.11 | 1 
libnfc-7b7f5061427b5456835d... | 1 
                       unknown | 1 
                  snmppp-3.3.4 | 1 
                  dhcpdump-1.8 | 1 
    trace-cmd-trace-cmd-v2.3.2 | 1 
              postgresql-9.4.1 | 1 
               libsigsegv-2.10 | 1 
                 webkit-1.11.5 | 1 
              lirc-tools-0.9.2 | 1 
                  boost-1.57.0 | 1 
                      qt-4.8.6 | 1 
       gst-plugins-bad-0.10.23 | 1 
                elfutils-0.161 | 1 

Detail of failures
===================

     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/7df54a905f22621a12d21ad395928b70bed8745a/
microblazeel |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/38856c1b17c943df2bfe5bb64abe9dd15da91e79/
     aarch64 |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/fe30a1eff913c36695a0bec85ac049ad7bea1dbf/
     aarch64 |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/20dda0735e6291f813def50efe2a60df69faed53/
         arm |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/e5bd9a80ac8d91649240b29ec974d26f65ba9c7a/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/f53cc03431ea7d1a673be507310f8d13a3bd25d1/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/1c68d47fc1c30117aa28926354e98cfcc54ccd90/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/0035ab3a2ddcd1d806b65072a80c137f94d58ddd/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/c0c33893c69075a671578a3183e3affb68ec9a82/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/461b57129b76f0d09a73ee1e0f7cde26a603e797/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/cc842d338efcbc7ae2faaed173d74620b78c4e39/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/2399e78ad713dc64b962b03de63d5fae7259f5da/
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/93d1794bd6dd68441ef6999a1833be6bef173697/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c0dcef6cf21c9621de53fa3f1f570828ac29bb43/
         arm |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/9136457201a6cdc30635ee15ab2358e898e19958/
         arc |                        kmod-20 | NOK | http://autobuild.buildroot.net/results/9c553f46e969dcc50964341bf144f58de3a8f346/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/f8f48ac83914b39c2778cd8749801961480f09d6/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/bf5cac594e0ecc7c69a9ad22bf1605e83988f553/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/261b9b1b30eb0a38d7cd53ff0c78fa182e11db46/
     aarch64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/dc09c1a15f7d2766d7ae6077bb6991f165259649/
         arc |                 libevdev-1.4.1 | NOK | http://autobuild.buildroot.net/results/36fc0ab7aebe3516b6201914b6cf5bad12644686/
         arc |                 libevdev-1.4.1 | NOK | http://autobuild.buildroot.net/results/3f6157a233fdba5e2e1849ee1280d4014cdbb97a/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/be9cbe86f6baff9ac1b7d07b7e1d0142621f0733/
        bfin |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/17ff04d484a670bc63873b4a3d74075fea6c255c/
         arm | libnfc-7b7f5061427b5456835d... | TIM | http://autobuild.buildroot.net/results/e369f8b3da83e4be93f1ad6109cb11292195bf3c/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a92ec12d7b9f0e49a1c3ddccae4f41f27a252a93/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/c064327ea3b0aca4db38b985a48add5fb7767994/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/47e046b488e63e9be5c0ff83ec7806a13f8adc88/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/6d470703b8bf8c8f62b6122e3cfe73a5c69a9639/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/11cf4419cfb2d23f3201c99e47dd282ef03579d2/
        i486 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/d9ab52a4c1836518496aa512efbe764d47c5ae6d/
      mipsel | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/d651e6bed7a2b805acf7e17b28b9b8ceaee4a3b3/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/4dccdc11962f262150045822adf6c678f763cc42/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/c6f0d74582edf88fa13e4881a196d11835d251d1/
        i686 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/83b7d6d294a7baf90f4bf486c0b36ed55e0e00a4/
        i486 |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/422d153a34a2fe9c708f015c5a4da4d151b849a6/
     aarch64 | make: *** [perl-libwww-lega... | NOK | http://autobuild.buildroot.net/results/56d42e7691d4eb1a682c49c0fa6c951d0e3069ec/
        mips | make: *** [perl-libwww-lega... | NOK | http://autobuild.buildroot.net/results/6c6fb6001101ff528176b887ed8c95ef49313afb/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/f658609b363106964fdb3798da86b19f40016176/
    mips64el |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/d1d516cd5465cad02a2a697fa530da92c40a4979/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/fa9189b2c03815bed84232af492a59e9e8bc9431/
      x86_64 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/b977d8e595eb32c610a4c347e838ee6995c28fdb/
      x86_64 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/9086c9c8451f63853257948ee7b1bc1fd060566a/
      xtensa |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/0f8aad3caa77a93efac5efff336af9d16b3855c8/
        i686 |                  qt5base-5.4.1 | TIM | http://autobuild.buildroot.net/results/2dbdcfb8ea72e438cbbdeef322b3c18f8dc101df/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/7a7108c2f1b5e15dd833d510b09203d9713c3afe/
        i686 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/33194be127c97cf95245d093b4cfe56a82b2d461/
      x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/245b6bfb271b8c95f3c072af68623ad5ccecf505/
     powerpc |     trace-cmd-trace-cmd-v2.3.2 | TIM | http://autobuild.buildroot.net/results/8a34ba0d9f507265e9e116fffef7bc870e7c7390/
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/20ee3b1266018ec786620ee8012bbd9ec0227f5c/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/b6350eb9ee809921a7aea064454f309633f9a718/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/89872c540864958e5deb71fea31e77a06a61de42/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/89d9997fc76ad334ff7b7f2a28294c78c424a120/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/8fe16f2c1190539ff81a66735829d62ec9834e14/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/4976f5e9dc53e6f9f29d9d45f0fb9bd42c7ab1ea/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/d8133645b1bad7dff9e832a482c413775aeeb483/


-- 
http://autobuild.buildroot.net
