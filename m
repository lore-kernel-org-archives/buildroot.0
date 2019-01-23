From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Jan 2019 08:00:32 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-22
Message-ID: <20190123070032.326C120A0E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   0 |   0 |  27 |
   2018.11.x |  23 |   0 |   0 |  23 |
      master | 188 |  54 |   0 | 242 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

zbar-b3b4e32b55f570372fc3af... | 7 
             host-grpc-v1.16.1 | 5 
                  libssh-0.8.6 | 5 
                  ffmpeg-3.4.5 | 4 
                   netsurf-3.8 | 4 
             libva-utils-2.3.0 | 3 
                  gnutls-3.6.5 | 2 
                     gpsd-3.18 | 2 
                 haproxy-1.9.1 | 2 
                     lua-5.3.5 | 2 
                     squid-4.4 | 2 
               curlftpfs-0.9.2 | 1 
                  daemon-0.6.4 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
               mono-5.14.0.177 | 1 
   openvmtools-10.3.5-10430147 | 1 
                p11-kit-0.23.2 | 1 
                     php-7.3.1 | 1 
               skalibs-2.6.4.0 | 1 
                   strace-4.26 | 1 
             stress-ng-0.09.47 | 1 
                   systemd-240 | 1 
tvheadend-17dff3e5ffbd67174... | 1 
                upmpdcli-1.4.0 | 1 
                wavemon-v0.9.0 | 1 
                   wget-1.20.1 | 1 
               xapp_luit-1.1.1 | 1 


Detail of failures
------------------

     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/935730c8295c3a80383a774c919b21aba9eb20cf |     
     riscv32 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/ffd03bb65383139fe8a3ade529bdaf1f2f00816c |     
        i586 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/a25ee6309af88c274fe424a53c283cf4631431eb |     
     riscv32 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/44b3181794d1d75bd164e6dc909530a6f7788967 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ebd7ae8a5c415366f3de4357c7b646105263a6c9 |     
      x86_64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/2718102f8e97a4da6dddcff839097d487a48c306 |     
       sparc |                   gnutls-3.6.5 | NOK | http://autobuild.buildroot.net/results/1d9389115dcbdd81b41447720d65b425be5e6cac |     
         arm |                   gnutls-3.6.5 | NOK | http://autobuild.buildroot.net/results/2c45089453e1c9dc53fad43e53544dd363acb829 |     
     riscv32 |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/8b21d7e1ded65c8ccda7843aa7d1abf88888074f | ORPH
     riscv32 |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/7605a10f59806011a627076a6ec929d3ec73c251 | ORPH
         sh4 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/527d7b6479b84c273e33e160310c0c9db8e52d91 |     
         sh4 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/993528dcc4f4404bd00b0b0fa7bd19454e79c4c2 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/5704c20a3a4eccdd68fd451e29d73d60bc42a075 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/f4e6baf788240e3453978b49d526bddf3c834b8c |     
      xtensa |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/99c66187034c2347184016a0e933ee8d8e97961d |     
   powerpc64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/f930429ebeefcde505f27bb5bb6628341c081fca |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/be26a25275f1f9bec6cc5aab8ff11f2acc85889f |     
     aarch64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/2d0a8a567571c50095d993667443a68cf58f889b |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/496ab9ac238990a24afc1278c453d9cf68573bff |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/7d093dacd539229d58e00128f37d72eecf7cb4f8 |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/7c8068208b5c2d94028e4fbacd030b2bf766818c |     
      xtensa |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/9239f230629ca4e381af5e8f43989997d9bfde99 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/9a3bf4b411c418ea78d59e35d23ba865dd453890 |     
      x86_64 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/ffcc8ef54c114dfd813bc4d8e3dd96a7aabe2641 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/b33af520d5ffeee194d1887897e76b27d647d482 |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/416426fc9692353109ab181e9b7f13e3e4b81875 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/24ab698bc9cfe6ba583388d57e18592acde03370 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/35f47068de4376d6deef93f0d64cfc5188392e9b |     
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/ebb6a1b75d7520baabb38e6958440e48a783acaa |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9cf4fd4b3e69e4b18ab780ab9e1a9b4275514a03 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/24266e4149a68b423f1a2083f485928bb8221e53 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ed433d82ccdb895e4fa2b4008290b729ad49cb9c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/70bc4abd2266726c9375e8182119f7a292e3cf99 |     
      x86_64 |    openvmtools-10.3.5-10430147 | NOK | http://autobuild.buildroot.net/results/92f7c88917066b1d3e15ee0d1baafe01c0cb29c8 |     
     riscv32 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/f563a7698d19a8db6b079d0493895c3d2b5c6e31 | ORPH
     aarch64 |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/a407238ed91130d9fcb85feb1f6cd7d8b4d57603 | ORPH
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/3ab6a3a745abd8f1b22afb8147117dd13765c03d |     
         sh4 |                      squid-4.4 | NOK | http://autobuild.buildroot.net/results/adc3c0e986f4333266c345ca685a32c6563e0c28 | ORPH
         sh4 |                      squid-4.4 | NOK | http://autobuild.buildroot.net/results/7d20b846ba24196422754a310f16b0fcc9f61cb7 | ORPH
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/212173e72374dce65748e4344ceaaccc126a5996 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/033f081e0eb0fc4f03eebc950496294cfeeff4b1 |     
        mips |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/e484bc976266633029b26c8e21959ae4e9137da3 |     
    mips64el | tvheadend-17dff3e5ffbd67174... | NOK | http://autobuild.buildroot.net/results/2d2d40a578ccd60e0a573bde94fcc4928e48fa4a |     
      x86_64 |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/f482a695b9a3e8acfca5c83bad7b6065cd1c8cd8 |     
         arm |                 wavemon-v0.9.0 | NOK | http://autobuild.buildroot.net/results/114958ac3d10d1bcdfa095b78dfe42be24321e5a |     
       sparc |                    wget-1.20.1 | NOK | http://autobuild.buildroot.net/results/d7dafe5737e3cde706b086e8e9f1b14e139e091f | ORPH
     riscv32 |                xapp_luit-1.1.1 | NOK | http://autobuild.buildroot.net/results/9a0fda72bb614ec41b3ebb4702f07a8d4180f34e |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/f6c2207145b420329ed0ee282ce148f40d40c3a1 |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/ca5c9d2b21f713b08187f9eedfb91f7bd597538d |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/7f85387d99b58e3bb151ae546738da1b04493931 |     
      x86_64 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/9dc852c61e34c024d1ed782c42febb05364d9aba |     
      x86_64 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/6f8aaaf3cc18cfcfdeff6da82186b8bdb7e99619 |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/36f5d1cb9b92d8e607454a6cf7d3a8b599735f1c |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/60bd7035388617a5440b9fc37ffd324a1986ef2b |     


-- 
http://autobuild.buildroot.net
