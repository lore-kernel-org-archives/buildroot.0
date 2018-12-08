From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Dec 2018 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-07
Message-ID: <20181208070027.9CDB9207F0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   0 |   0 |  30 |
   2018.08.x |  20 |   1 |   0 |  21 |
      master | 155 |  33 |   3 | 191 |

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/f52534d185d1ba5f7855dbda19694143291b9ea4 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   strace-4.25 | 5 
             host-grpc-v1.16.1 | 4 
                  linuxptp-2.0 | 4 
             stress-ng-0.09.47 | 4 
                  libssh-0.8.4 | 3 
   libtorrent-rasterbar-1.1.11 | 3 
     intel-microcode-20180807a | 2 
                  dhcpdump-1.8 | 1 
                        glibmm | 1 
                  grpc-v1.16.1 | 1 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
                   mpd-0.20.23 | 1 
                openzwave-V1.5 | 1 
                          opus | 1 
                 python3-3.7.1 | 1 
                 qt5base-5.6.3 | 1 
               skalibs-2.6.4.0 | 1 


Detail of failures
------------------

    mips64el |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/112ec65249dbd9ab1d8194aa7b58b665897dc8ac | ORPH
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/882adb394dc1e2402a450c3ff0045f4d9d945811 |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/100663247038324f609f1a7b7155ae2bcee07720 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/6ed3672dd4dada62472b62a41478a1ca53c6efe2 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/3dcbc557ad3e888f8fde1a2c17e346b4a038c3f2 |     
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/702f3f18224d337ae6d875d671f47eb7da68f720 |     
microblazeel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a3a9c270210d45c59dfb121cf064f6dadafbf73b |     
      x86_64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/da0e893e6ecb8f2727d0f7018bead532a682b51b |     
      x86_64 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/a744831d1a34366e6dd7e3fa5b10a0407ae5ee57 |     
      x86_64 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/94140592e610d9e64b147e0960141cb1a4bf4686 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/faaa48aa2965791c2160167f0f4fca4a0310047c | ORPH
     powerpc |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/4aa0a20a409f44a3ddb56dfe88d76c1196fac9cd |     
        or1k |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/96b33c14946b17a3402ac5b10304bdeea77f9957 |     
   powerpc64 |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/2144db482b63eccb10e628dc95975efb2253037c |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/5595ca72b10bafb4a228427ff3976af9673b4468 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/ffc0ed103c665c3d7a07307f803e98b4c2fe2e34 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/1cb810fe1bd8952f90bf9aa353b473da94f3586b |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/db6cf91799ddf2ca6ae4fcc67d6a02914801f360 |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/70a455bf804f2545a4aff2a69aeada62f6944ab7 |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/f769b9604fd450d942dd8bfc40a206133466524c |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e6bdb4346cd6bcf8f504dd62e398198ee38dd6b9 |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/51d28ae4cd19b41a018ed8aa409709d08978a76e |     
     aarch64 |                 openzwave-V1.5 | NOK | http://autobuild.buildroot.net/results/2a8d2c67bcd1a7c228e9196d3bdb7f608c44c856 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/8c32a3482df5bfc4dd957ac297ef341395790800 |     
      x86_64 |                  python3-3.7.1 | NOK | http://autobuild.buildroot.net/results/013c6ad9f597bc9089521e69d84c6444d9b62fa5 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/e9e1626e7d8df99c871c04773d1f59c80392a233 |     
       sparc |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/a0fbedb5fe657285047e87aa72e213202a22e281 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/86a28ae43479a7235cd3dc226f3ddf97c2916357 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/2e13058e29c1e1aca07d018375d5a18b0dec5231 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/d74cec875dce67407808bf2c16354583c881b1b9 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/641f81a9b581b499c6d1b929f0ca849d141a6d12 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/2f50ee9e89c53d8b8841dde37292d7e8e3b3b11c |     
      xtensa |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/1503935b4f03be2f08f08f227dd341de9aad11e3 |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/760d36d74d303bba9155fb50e5deb9dc47377794 |     
      xtensa |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/c1bbf8c38598be80cdd74874b5e495bc75d7b9d2 |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/4ec4fb381139a7e68ff5fb5a4de9a9d329d2e74f |     


-- 
http://autobuild.buildroot.net
