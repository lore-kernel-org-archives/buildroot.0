From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 07:00:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-14
Message-ID: <20190315070048.8253587C03@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   0 |   0 |  29 |
   2018.11.x |  20 |   2 |   0 |  22 |
      master | 199 |  48 |   5 | 252 |
   2019.02.x |  18 |   1 |   0 |  19 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

       gst-plugins-bad-0.10.23 | 1 
               runc-v1.0.0-rc6 | 1 


Detail of failures
------------------

     sparc64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/8350fcd3a28a72ab2fd75c98832a8b2124eb1101 | ORPH
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/01d4a26bf90492d2868c656e0303d2c1779cbae0 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 17
            optee-client-3.4.0 | 8 
           uboot-tools-2019.01 | 6 
      host-uboot-tools-2019.01 | 5 
                   glm-0.9.8.4 | 2 
                    stella-6.0 | 2 
                      ddrescue | 1 
                      gzip-1.9 | 1 
                host-libsodium | 1 
                  linuxptp-2.0 | 1 
                 mesa3d-18.3.3 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
                          opus | 1 
                    postgresql | 1 
                qt5base-5.12.1 | 1 
              qt5enginio-1.6.3 | 1 
      qt5webkit-examples-5.9.1 | 1 
               wireshark-2.6.7 | 1 


Detail of failures
------------------

microblazeel |                       ddrescue | TIM | http://autobuild.buildroot.net/results/60c0746a83bf64ab7c15dc22fcf9fb446f31a5c5 |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/e4c9dd0b372d2d76e4343cdaec547dea70450b83 | ORPH
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/07366974d710f4c2dde39d77d07484a91c766811 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/2d6a8bf27d6c2e7106548afccdda5e38b54feb10 | ORPH
microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/af95ed5517d40c65a82a61e653df165831a95fb8 |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c9043ca6bd2b5fd4ee0b67de318502bf576f415a |     
     aarch64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4cca257b6456e99327136eef64b62dd7e6722625 |     
      mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e2d1e459fce2995e3f09840b3cf84be94578b35c |     
   powerpc64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3683e3115e0bfd492a093668690dde1dbb5db1f7 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e38f847f52ecdec18763b29fa3f17b2cfe26adb7 |     
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/18686fdc4bea9a6f10e978af2ce987ecac59d54b | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/5f012f1057e25e5a76226bf5a404f2c866868522 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/243c8c983d93c7ef64d2cbbb660403824d290548 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/0f9bef2ef6dfeafc00d94b8a1befe99770325c36 | ORPH
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/f30a70c36378724a2a671d0a8db4f4146dd54e7a | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/82415737e32f3dbe700e02f623ab9c54aea93722 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/cd02726a2a7061cecc5524718a1ba87da8abb269 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/093abfb92bbd33074dba76617b906bf81359a862 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/6f7272ab037dcaa76a693e63798fe9a383721955 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/98008f66db0c98cc314af45225bc6c6cdfeab726 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/295163b6d0a147e8031e9bfb198805edc5e85306 | ORPH
      x86_64 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/0afacd7d77d3153e20c18096f6ee3723f4cedd22 | ORPH
      x86_64 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/618561eac9da6c990d0610b5b2f3d4339541e506 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/4c70a023469b1ea2da4e8de7877c1c34ac0ce9a4 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/8f5eb2b61c17c00accb559c20749ca0217d5ac58 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/77d11e713f5e8cb50e28b75c44ee98328a85b5b9 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/92d845530d5fa32e7b3735e16e1cfba6544c2d88 | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/aacc4851b7e4e89b48afa3e47a69d0bd9d3ca6a9 |     
         sh4 |                  mesa3d-18.3.3 | NOK | http://autobuild.buildroot.net/results/7e965afd6adac3a1209df4e33d7316fc9ade770c |     
    mips64el |                        netsurf | TIM | http://autobuild.buildroot.net/results/fa6f9db3ae4a95a256a132a7856b4bb2df539636 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c38c36fd88f5fb72832a1c44f003fa0ce00a2937 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/92ac18afc4842ceaca07eedaba6363f1ddc1dfc5 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e3d8293fc41fd0986e11974f18104551736c9495 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ffe4d31a8d70a97edcf82f4a8854dc703fc05380 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/a3fde8c6993202810f28001ca698b812495e5216 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/9d0e022116603934b6c7822dfc2c249711ef2a80 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ba80acc4b0244997b7215fb1b3c9f1b38b399e07 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/2068fa115a2260bdc2f48c1635c2b5de127eb7d6 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/5bd883cfc6310125e6f866e54e5a500b9b95acc0 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/9d6215fec20a7cd394acd30a0e5eaab8dcff8671 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/027283df1ec1356e5ff93a68855a7d21b8581162 |     
     aarch64 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/1b4bbb2714922c060f3cf7619c1c95c18b9143e5 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/165ca7d958354830cec5f5267cc651e6d7a4722c |     
         arm |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/8b6fa4c8a3aa26cb5774e5422dfb27ebb383b679 |     
        i586 |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/64e8ce2d09ee365cec8aa6dfe411631991f17081 |     
      x86_64 |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/29447cb15e8ce9d71a0e0a066e5d83811006d77f |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/641524298fa56403134c6af9d19a3a64d1503d11 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f6866ec23a8287a66ba633d1415c598cc6075af7 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/58ffd574b5976ef2f73181c05e2c4e57700dc1a9 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5fee67ee4f312fe83140b6029ba6be1cefbbf38d |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d64af9201b10cdef9846c985ad08c08031cd496a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/13325faf997fb95938bb19b0e53344cd7d3fc34a |     
         arm |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/7119dcb90e9b62449c396207be9ace4c8b8c23c7 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/4e38154f3ac7ab775daf921c14376f2536338a63 |     


-- 
http://autobuild.buildroot.net
