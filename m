From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Jul 2017 08:30:52 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-22
Message-ID: <20170723063052.1CB8521DBF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-22
================================

      successes : 207
       failures : 27 
       timeouts : 0  
          TOTAL : 234

Classification of failures by reason
====================================

                  nginx-1.12.1 | 3 
                busybox-1.26.2 | 2 
                  cppcms-1.0.5 | 2 
                  dnsmasq-2.76 | 2 
         libspatialindex-1.8.5 | 2 
                paxtest-0.9.15 | 2 
     python-cryptography-1.7.2 | 2 
                  cc-tool-0.26 | 1 
              dieharder-3.31.1 | 1 
                 efibootmgr-14 | 1 
                    ficl-4.1.0 | 1 
                libressl-2.5.5 | 1 
                 libssh2-1.8.0 | 1 
                    norm-1.5r6 | 1 
       python-smbus-cffi-0.5.1 | 1 
             qt5location-5.9.1 | 1 
          shairport-sync-3.0.2 | 1 
                      x265-2.4 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/dc5fac8d4f5b640d165d1dc4946ccac381626164 | ORPH
     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/f7fb709184680ed2d58945cb38deb34744fa0026 | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4bfe62a6ddcfbe7a0b8175348820fdcfff3101e9 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/9d0d62d94a80c416b4c5f563e874eb796c2d506c | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f05d9999f1f3248b6a50f14de476108028ed047e | ORPH
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/e1309fd2eea5daf854f4314b92ec441092239cd5 |     
       nios2 |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/0116c85b4c62bd8f44960619fe07ae3554cbe284 | ORPH
        bfin |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/d5dd98c4b190d119daabf11b2b83fdec764e5af6 | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/e9507acc323d8d007516f8fd7099034e2b1e61b7 |     
         arm |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/6f47e6e3c08ba2ccaeec77d65ee2467b64b7bc4b |     
     powerpc |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/f421297cfe4b11e2ea90399a37c637e38ccc9e12 |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/a9e647353b52e9a16c0e3844735e1d303214e7c6 |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/eaef86bd8cfd82c22ab5cc9b9354bf11d04ed8aa |     
      x86_64 |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/bb303267caf132595d3beb00a25eacd80bac4664 | ORPH
      xtensa |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/a09a4449beae2f78ea47585f4dfeb0b8b8b9853e |     
 powerpc64le |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/d853a1eb3d03b63825331dc899a61356dfae1a33 |     
    mips64el |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/1b98300088335056d9c409070bcc87435a42eeef |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/63346588077005f1e3a82e9bdc11125aaaf02990 |     
    mips64el |                 paxtest-0.9.15 | NOK | http://autobuild.buildroot.net/results/450c5388aa26d81eccb462014bee520b6e42b06b |     
    mips64el |                 paxtest-0.9.15 | NOK | http://autobuild.buildroot.net/results/635a988e61f5820ad8fd94bda0615b9436e6ae83 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/16a3adbeef83ccf5aa397ca306f66c66a1816565 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/09bc4917d6c2e9da74dca735cf88b6722677dd29 |     
      x86_64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/327f3bbed1c903d30c64bf0a6de64a90f39f7690 |     
         arm |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/41bbdf908ac1c425aa583533c1ef6fa87b8e1363 |     
     powerpc |           shairport-sync-3.0.2 | NOK | http://autobuild.buildroot.net/results/a8a33356a52ecfc9c0ad6404dfdeff59feab3983 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/0bac0049d48cc452a2887b38ff582f418789ab39 |     
       sparc |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/382a3dd55608a591de8c6e2b707a6a88df471c7b |     

-- 
http://autobuild.buildroot.net
