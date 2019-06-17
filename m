From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 06:00:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-16
Message-ID: <20190617060103.D60A187397@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  15 |   0 |   0 |  15 |
   2019.05.x |  21 |   2 |   0 |  23 |
      master | 179 |  39 |   2 | 220 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-cargo-0.26.0 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

     riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/dcc13af687d8a1d6eaa9f61a0b03bd3ca39c281b |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/ddd50bde717c0e5d95501baf95038a38f17d9ae0 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 17
          modem-manager-1.10.0 | 8 
                   cups-2.2.10 | 3 
           host-mfgtools-v0.02 | 2 
                qt5base-5.12.2 | 2 
/home/br-user/autobuild/run... | 1 
/home/peko/autobuild/instan... | 1 
              domoticz-4.10717 | 1 
                      gzip-1.9 | 1 
                host-libsodium | 1 
               libsigsegv-2.12 | 1 
                        prboom | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

       nios2 | /home/br-user/autobuild/run... | NOK | http://autobuild.buildroot.net/results/fe378bca29c86a681ba9ad40386cb89248195c50 |     
microblazeel | /home/peko/autobuild/instan... | NOK | http://autobuild.buildroot.net/results/c9bdde0e4834e8264c906c1645f62cbe208d3668 |     
         arc |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/2a4ce16748f2052c5348ae8958b78fe23d7d5339 |     
         arm |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/d139392208e444f76b1e701a01206dabcf455530 |     
     sparc64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/f4f2586d3d5d728b233fbf06985587ba4e25e52d |     
    mips64el |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/d9baf8f7c614f82d4c8c019e7dc29a2055398483 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/c6c52f08a77752049c242d1dcec3d6dc0d52e6d8 | ORPH
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/16b44e1d6ecd0d5ef99efa66c70c46cd6deb5dd6 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/5fa83a95f29859961ddf700e0e8d43e19a0bca42 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/7718444cd0f21a80f9f798fb6aeeec4d09fa6723 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/e7fde15a72b83c3f3ced6759e0492bb3f63f9ca5 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/5cf0045dde46d74f7b3f4e53124bc984e3be4e3b |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/2bc993d8c0eb0d7e1e616c9ba6930907c62c30c4 |     
microblazeel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/38e45d0dc3a8ae6dbdfb6b0aaacf1ca2f955b900 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4727cd32a70156f9e58561ed94cb029cefce65b0 |     
       sparc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/0f5084a95a4230a9a9b9bba48b0847b37ded5c76 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6fa3ac4b3bfded1d71df2f349df60e38e682991e |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/1e1b28f51b5ab2e90ddf9b6fe95b79a7487d233e |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/e26b33b54f1d4e07f95b41b177d4f759c1a59a26 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/fc3b77e37306291de7f3de551df6809869fc47d0 |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9f60cbc55f58b429998d43c251a5c3e64e8686db |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/b395d0ead98badf4a7a394fb14f61ad39ecf63fd |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/ceb34dfe7de11dd1abc343a387d4b72fb44005ab |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/13d862325b6d9a9c7a54df9398c42ee8a0799f4a |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/66678ea3c798d61db6ac4e3e58c2e54019b4e988 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/7b161ddd569f30c995d4d41aebd6d770ae4bc84e |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/b68b94f31343785480cde3069aa3614e6f6c7344 |     
     nds32le |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/9ef252db3145967bbe8031a62f32d2c62976fc37 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/761f5d696372aa97531ef7bb699a5458f61ab181 |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/5b057fdaa0882eb26a7603944e7f4c23bd418f77 |     
   powerpc64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/863da315f5c9c0aa76ede7e917929b038977bdbc |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/eaf04379e8c1e5d229ad00bbf3b2b46905b2bcf4 |     
        i686 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/5b8e8ce9a90309692064c62036351d69fb6fd04b |     
      mipsel |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/e352cd0de06c423b3403c174d768a2b989528043 |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/9bc21c1950809c9f3f38fcbe6dd3803658cee8d2 |     
    mips64el |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/04c02d62acf016ffa39aca13689d868243b5cde8 |     
microblazeel |                         prboom | TIM | http://autobuild.buildroot.net/results/91433ab30cdfb996edc76eb0fcc0734cf1d38491 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/8a2390b863efa50726f67c31133018d7805470c7 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/5bc448911c96ddd0f2675a259c7713b3dc938fff |     
  aarch64_be |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/11d440d004476f1b1a8a8409a4165409e7cb0936 |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/3515e18f2a54a4c8d19c326206a2ab08a1ac0dcc | ORPH


-- 
http://autobuild.buildroot.net
