From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 04 May 2019 06:00:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-03
Message-ID: <20190504060039.742CE2309D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   2 |   0 |  20 |
      master | 211 |  43 |   2 | 256 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 11
                     vlc-3.0.6 | 5 
                cracklib-2.9.7 | 4 
      gst1-plugins-good-1.14.4 | 4 
                   netsurf-3.8 | 4 
  vdr-plugin-vnsiserver-v1.8.0 | 4 
                    strace-5.0 | 3 
                gnuchess-6.2.5 | 1 
                      gzip-1.9 | 1 
           host-cryptopp-8.1.0 | 1 
   host-xapp_mkfontscale-1.1.3 | 1 
                        jasper | 1 
                       netsurf | 1 
              qt5enginio-1.6.3 | 1 
       shadowsocks-libev-3.2.4 | 1 
                supertux-0.6.0 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

       sparc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/78abb5233c1e235762861167bd7c1610178288ee |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/25df78f1eafdb44fce96210ed448b42d1028f93e |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/e46330334e81aed405a15f2a7b58da17952aa6b7 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/f2b2bc3ab7585eae283cacd56f91c786fe341e45 |     
     nds32le |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/21dcf051e78a061b56e1af7cf7b22e75b9345c2f | ORPH
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/29819ee0c94195757533385e1363466ff803d483 | ORPH
     powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/1089d08578de78b809fc9def0fa215cb7ff98878 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f33c5ae38de78f7808914d184ccfaebd0749cdc3 | ORPH
        i586 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6aff5054c71c12e9dbc4899445f2509689f59573 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/3e5054b6515a9cd8344a4d47c3b2d96b875fb7b0 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0e4288236c2dbe3902843370860681ba03e5fd83 | ORPH
         sh4 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/35f2ae55834ff6aa89dea73473db3d6bb986595b | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/221ffcf0150a4fdf8aa7e6df9313acf9ff705aa3 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/2ca311c591a155e4eef60af74c46b5d4535433dd | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/cbe963e4a3f8eaa131ea06385e02455b5057bc0e | ORPH
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/9cd30730c6f780d670133bdccbd3044772e498d6 | ORPH
     aarch64 |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/fd746bfd2ed26b3d34eda0dd8b18da90bd18da10 |     
    mips64el |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/c8c0d3591838d065c5864e46ab8c7d95e913b736 |     
     sparc64 |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/2d0aaa842ad7058a11a472c29b56102977680e28 |     
    mips64el |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/21443511acf75dc0facd9baf5db7f9da3013d28b |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/2ab1b26655bfa8b23fafcd32dc67b12366cf9a30 | ORPH
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/9e08b32e177e994b6d339fe6a98d7e95ccf9bbb0 |     
 powerpc64le |    host-xapp_mkfontscale-1.1.3 | NOK | http://autobuild.buildroot.net/results/a21ac861c766de6ccf013f79a7f17b1498ec18d7 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/5546087cdf684099525dc5824ed428cd0fd74283 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/2c23ced22aafacba8504dfebe59b83fb0db44133 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/11b5338219e871cb2298eb3392a1c4bf77a4843b |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0b4d1328f02041f79385c65040d97af72efaa102 |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ea4b64620b885dea253bf47eb729e5b1f9e1388b |     
         sh4 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4a9e035070e1376460f3e31ef966f47cf6f194e8 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/644abae6861bc76470a3b65aaab45fbff8049e7a |     
     nds32le |        shadowsocks-libev-3.2.4 | NOK | http://autobuild.buildroot.net/results/b922e19151cc5d530c158c5cf0e677179f15baed |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/0b288d7e60dc9dd60b9b6112015b2d6ba706a877 |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/af3a5b82044aca566a2a02c96b9a67ad03f9d217 |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/9b4d312afefb81509e174c5088304abcbdd47765 |     
         arc |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/48ebf96d9a02aa8e7e36ab988576581a32106dc0 |     
         arc |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/40182b3e5d52444baef8605f4e37b0e9074e9020 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/9af0bd972161a1f55db4453caec50166273d3592 |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/bb0df8d75b7fb66cb0a7c5072f2609c9fc7307a4 |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/0841c8bfb266ebef9d1a3cbeb9f00aac473d0450 |     
     riscv32 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/810fc40fdc8291957c3be08bf39355fe25d317bf |     
      x86_64 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/e44d5ca85be9e0dafa4a3d8b0187c54cff6e2d55 |     
     aarch64 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/1a34e1efec696ff6ce940e6fb2a009656616d1b1 |     
      xtensa |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/ea172da7414ac5176c733ca0d0e648188642b08e |     
     powerpc |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/1650aaf2474e832304a4f292ee7eec3db63fb88c |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/6318ada22d2408073e8ca078a4fc740e49dae2d8 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  brotli-1.0.7 | 1 
                  weston-5.0.0 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/610c62249c6d6d8eb5be0f5761a65ddb7a0c3dcf |     
      xtensa |                   weston-5.0.0 | NOK | http://autobuild.buildroot.net/results/b16610516a8514cf45860a48d693dd0db275e8d9 |     


-- 
http://autobuild.buildroot.net
