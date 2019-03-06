From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 06 Mar 2019 07:00:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-05
Message-ID: <20190306070049.182FE8624A@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  28 |   0 |   0 |  28 |
   2018.11.x |  11 |   0 |   0 |  11 |
      master | 148 |  33 |   5 | 186 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

host-imx-mkimage-rel_imx_4.... | 5 
          imagemagick-7.0.8-27 | 5 
   host-imx-mkimage-legal-info | 4 
                       netsurf | 4 
      host-uboot-tools-2019.01 | 2 
                    ncmpc-0.33 | 2 
package/imx-mkimage/imx-mki... | 2 
                qt5base-5.11.3 | 2 
                    efl-1.21.1 | 1 
                  flashrom-1.0 | 1 
                   glm-0.9.8.4 | 1 
                     host-llvm | 1 
                  linuxptp-2.0 | 1 
                   netsnmp-5.8 | 1 
               openldap-2.4.46 | 1 
            optee-client-3.4.0 | 1 
              qt5enginio-1.6.3 | 1 
               qt5webkit-5.9.1 | 1 
               wireshark-2.6.6 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

        i686 |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/50eae730c7c9777439a7683d197502d723d5d519 |     
      xtensa |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/0160bf80ed8f15ec39101cb4a48e820dbb423050 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/ab8305a78b11c3faed2df8f0ac283c87b8240095 | ORPH
     aarch64 |    host-imx-mkimage-legal-info | NOK | http://autobuild.buildroot.net/results/0622ed515ebc510164141e97beaa65077a82bc61 |     
         arm |    host-imx-mkimage-legal-info | NOK | http://autobuild.buildroot.net/results/7f2e949e314bc2644483f775eb4a19777f38a4ed |     
      mipsel |    host-imx-mkimage-legal-info | NOK | http://autobuild.buildroot.net/results/eb231f72c3600118e8641677878b10f39bb6df77 |     
        m68k |    host-imx-mkimage-legal-info | NOK | http://autobuild.buildroot.net/results/03cffcf6959d5a6efa05b6e3c71d95d096cc942a |     
  aarch64_be | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/a9080665286e990331567f95e4cce5fced03de6b |     
     aarch64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/7d11e55c1b6cba8abca5567a87e0f32a84c8a81c |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/6b398fba5cc1438387753ed2bb8fe0ec3e14817a |     
     aarch64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/3571860a4720fc1b479bbcc3d4c0cd9d733e232c |     
     riscv32 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/4c31d97a9aaf9ef887e68d64efe468c81f8cf7bc |     
         arm |                      host-llvm | TIM | http://autobuild.buildroot.net/results/acdb554753de824817898fa1761fe9239a766d6f |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/32f5a733c1a58cf8d461a215182b641276d8f1a0 |     
        mips |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/cf777f9a645dc432d0aeee6f2b55f2ebc186daab |     
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/5bfdb7ce89b8b2e1b3266153280a78507e90b2b7 | ORPH
        i686 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/b366354b493bf9c63df4ef40bd7113f4db6668b4 | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/63c59f2d2b9eb94c229a8550e77fa26ae700c501 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/097d1142a875ba4526be82fbc65c7380094cb9d8 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/27f9534a82df35fff77b07d37300303450f846b3 | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/0a02cba0cfd95fcd4ef1e36541e637add9495b8c |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/8b6a606c07a0b8b1d04b74d2503af378b00e6e8e |     
        mips |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/853345260ca3e68e382ad54ab1e96d1cc2186b39 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/33c31e29a5570271c69686612f9d1d418f47995a | ORPH
     sparc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/5c14444ab0e5a866c0d4a39a4bce1f09de9b8962 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/b710e7321ea7388484c587e5f2136236feadcbe4 |     
  aarch64_be |                        netsurf | TIM | http://autobuild.buildroot.net/results/c14feac71727ed9d50d415cd052ab126b2032280 |     
       nios2 |                        netsurf | TIM | http://autobuild.buildroot.net/results/7d9366d21f3e403461766cbb2dacc23b11fa493a |     
         arm |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/3798379d77f20c8b7e403c8862ac3009d6c0ab3a |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ed6ffe2197da4f3a970bd3c5522291236396cc8e |     
        i586 | package/imx-mkimage/imx-mki... | NOK | http://autobuild.buildroot.net/results/c83ca4e1d0e1435b26c01b82aab2bab3c8028117 |     
         arc | package/imx-mkimage/imx-mki... | NOK | http://autobuild.buildroot.net/results/a465a0258b60c5b9193a1380b95dbeb4490172f9 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/f2f2f12c1f7912f6224de276575836979939f335 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/2fae17db32edbeaa9f3f4a8a9f106654d7325db0 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/ae1a5d41409b36b3dea9f65afd8de36596a44a2c |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/3a280ed5d0b4989316cc2e2bb05b8324334372ed |     
        i686 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/c41d42fe3489bc63c42e7ce7a9eccb1b4ca7b9b2 | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/24ca76974d9147359d744391a1202a127464a8b0 |     


-- 
http://autobuild.buildroot.net
