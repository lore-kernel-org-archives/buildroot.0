From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Sep 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-01
Message-ID: <20130902063008.2CC6752C1CC@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-01
===============================

        success : 62 
       failures : 65 
       timeouts : 0  
          TOTAL : 127

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 12
                   neon-0.29.6 | 12
                      icu-51.2 | 3 
              cryptsetup-1.6.2 | 3 
           libcec-libcec-2.1.1 | 2 
               uclibc-0.9.33.2 | 2 
                   dbus-1.4.26 | 2 
               qt5webkit-5.0.2 | 2 
                 dropwatch-1.4 | 2 
make: *** [orbit-legal-info... | 2 
               libglib2-2.36.3 | 2 
               libsigsegv-2.10 | 2 
                 qt5base-5.0.2 | 2 
               alsa-lib-1.0.26 | 1 
    host-xproto_fixesproto-5.0 | 1 
               binutils-2.21.1 | 1 
                   cups-1.3.11 | 1 
                 binutils-2.21 | 1 
                      bash-4.2 | 1 
                      qt-4.8.5 | 1 
                  libusb-1.0.9 | 1 
                  prboom-2.5.0 | 1 
               libevent-2.0.14 | 1 
               pcsc-lite-1.8.6 | 1 
             util-linux-2.22.2 | 1 
                  zeromq-3.2.3 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                libiscsi-1.6.0 | 1 
                 libnspr-4.9.6 | 1 
                  tstools-1_11 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1f1d9ff614faefe16d41e8d7d9cd85e75b2c2d57/
    mipsel |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/a99f0ebd8a54a0238d0ba40685db467aafa02a32/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/e735e594423a3de1f52c312ca757881113011443/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/a9d7724f380ef7751601cba01878a01ac39bcec1/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/1f5ff2ff83dec861df05cc6d62827d4224914bc0/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/f3dc250e725adbd6aae9e0bae915ce5f151b2b9e/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/04f5c19339151174b3c85316cfd62eb334d912dd/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/52d96ff596237828dee31981fdad484bd6b1436f/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/77388ee1532355567221c05f03367184883a9499/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/7c56b646c7585eeaf86c3b43ddb1d08921a2aa1f/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/339358b271b5421e06ee7f20cbde25a8acdda6d6/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/9ea4ce11ba6c2e829f0675e2b5218a233e3d4b6d/
   powerpc |     host-xproto_fixesproto-5.0 | NOK | http://autobuild.buildroot.net/results/15e8d8dbb76d6b59c57e37c628746a6153aa18a9/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/24cceb0e2fb9bb1d77d1ac2f461a05660283fce7/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/4defcc305a487fc759f81c3749e70ad2aa02e50f/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/6190fdbf19209de12180b1af36b55611d376d5cb/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/dae6ec4f75b2aeb793b88567f48d94b07a6a59da/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/16414cf47c0998f8bbdce7a7bb9b5661f4c5ed43/
       arc |                libevent-2.0.14 | NOK | http://autobuild.buildroot.net/results/b8822996c710c390c797389c3332c2742355b8c9/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c45183265655e7212df64f72fa1df85ec1f5f998/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/885018a865de2d3a11d21b5f8149690f1b47430f/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/ce66313dad3daa04913dd656abbbb96a3ab8d5bc/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/fbbd4abd5bd85ff1553a6227843f35b0881742ef/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/8c8e98787821a49fb217f19b53c5a1485f9c991d/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/8c18837ebac1166d9a356c91cab96fbaa8f76665/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/3a9d04ed19a48c2ea5ee72c794cb801bf9ada373/
    x86_64 | make: *** [orbit-legal-info... | NOK | http://autobuild.buildroot.net/results/33e4e65301679e46cd80a1a123f45647376e60ce/
    x86_64 | make: *** [orbit-legal-info... | NOK | http://autobuild.buildroot.net/results/5670ca8c889fe16b61ea14ca7ae0ff35792062a3/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/ddda00aa439c466d7c9c08033cc82a62c4188c0b/
    xtensa |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/ce020b59170c59a5b36823cb8a163288f174e557/
       arm |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/85baa1f7985236fb84c6d17c5984adbeba1f6d65/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/268d7d2dbe7c1d6efb11fe3fa8f7c0fe292501a2/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/a348dc7f52e42dabeaeaf4856f940223f833dd58/
      i686 |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/8d9a191d8fe5480902bc562e5656301ec2c1aa8f/
   powerpc |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/7ed657570d83b28389dd8c01ffdd895d2e8d145f/
   powerpc |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/24e7730fabecfc7747f82bfa859a7c7c4064a517/
    x86_64 |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/096d99bfb4f2cb6a3b68c7e32f1b0d681c528d97/
       arm |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/8bcbb59c43a476bbf47916575195761e6874e649/
    xtensa |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/884f61a0274519b48fa9ec3aca5f3f35c1273a53/
   powerpc |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/ef6908b26dc2ea398d19e7c2da7bb5aa41af457b/
       arm |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/24b8c02c0c5bd422454d81c25193a11c783b47ed/
       arm |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/e77d12d2f0dfed3c39931d69c387ab67a1737b5a/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/731ef78a4b0a85081f866b94d0cc49687d461029/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/f21a24fc61aacb7ebc0ec317bb61149e949f3fa7/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/643f94f45fb32cdd4cbf881288e68e75b29ff95d/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/51500db48fa02c2eef2591595efd520d93419318/
      i686 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/39100b0abc46db2d312b05199adb05832afa1a31/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/daa0795f16ae7318eb4a09a7a16c7fa509d1022c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7b453c1807f1fce923ebd4182f954edb6367c390/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/23d5a91484b77b4071cdc1262cfbc14c9c39363c/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ce0415418aefab27951d75d65cad98a23f5a3bd5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a919fedcbc03c4747d87754d9a83c84bdb009ba2/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8f5c0ec69868451c68417cf285665844ea66033c/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4a0687bd4e98189e86838cc7e260df6f9711fd40/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c63121131d1ebbe1d1224df5c9a33b328497278b/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4c20368dbc6c2cfbd4fb450a2392a394111ca055/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d04081100930c80903ae5c4225a4029f39fb767b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c808711d32b16629125e2bcd3be0cba467177eba/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d0855ea4c63a0b93a40fda197e99754d18f27913/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0edf03c0692a4bdf317e4bf5b208910d4c634365/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/17179b2744291a3f8e725b34661ae3f580b56702/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/f3c99359f4c1c628693fc901557f271cf71c1309/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/671c1a2aecaa103700f25a16ca0f716d085d8450/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/392e9ea091fc5236b94863a055a617ff8e628a8a/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/8a474ec0ff68915d319c23e2b78101cc424bccd1/


-- 
http://autobuild.buildroot.net
