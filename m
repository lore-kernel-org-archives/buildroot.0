From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-20
Message-ID: <20180821060020.69804207B3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   0 |   0 |  20 |
   2018.05.x |  17 |   1 |   0 |  18 |
      master | 173 |  17 |   2 | 192 |
        next |  29 |  30 |   0 |  59 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 1 


Detail of failures
------------------

        i586 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/bfc741526f119a38b49bb086e1140fd7180fac1d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 4 
                     php-7.2.9 | 4 
                    brltty-5.5 | 2 
               aircrack-ng-1.3 | 1 
               azure-iot-sdk-c | 1 
               domoticz-4.9700 | 1 
                    f2fs-tools | 1 
                 host-rauc-0.4 | 1 
                  mender-1.4.0 | 1 
                qt5base-5.11.1 | 1 
              wireshark-2.2.16 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/e3f34b7cdf532f662d09a5f6d70fa5b8c6b189b0 |     
      mipsel |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/77ed9b0cfda0ca3a9ebb49dbbbb2511c37a57cfa |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/130d531e94b885726ce703745e4b506713ce6e35 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5b1ae3fe3641ee6252e31913cb5e6c9fff9cf266 |     
        mips |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/99f1a255b78a973faeb8bf3b94d78efc54426a8b |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/63fe462cbabae6f5508b5066a58bf1f95a73026b |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/e4ea1f8f85e37bdccdc4393d74d390a6fa78ccf1 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/97edc6a47d2140968e84b409cdc960604e5896f2 |     
    mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/00bc66447dc154e2da3c840d37034ab23364c24d |     
     aarch64 |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/95e7a9a240446f81b81c36c5b5809d69af9c1c1d |     
      x86_64 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/6fb8dc9771cbb6ce845e9f1aa7904e101c4d8107 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/bd4c5baf6f977076a7a20548b85f551f8d10a035 |     
    mips64el |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/a4cc2e45dd5161a013eed084f4bb382c34c5669c | ORPH
     sparc64 |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/6020a28a205f5d3ffddf103287c82ed63c1772f5 | ORPH
         arc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/6ef5681db4c4da2314bb94ff868b65e08a890916 | ORPH
         arc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/9a3351df625f07dc22f1a66778497e5efe1d1e6e | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/01344ced741ed227d910b78fe900c62269bf18c2 |     
       nios2 |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/9a68a2e56063f80f4724b37d146b1935b7603ef9 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/dad241acbe59b1c5a24a0a2f3da6b12a553aec84 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

             host-meson-0.47.1 | 7 
            host-lvm2-2.02.180 | 5 
                  boost-1.67.0 | 4 
host-python-vcversioner-2.1... | 4 
                    ncmpc-0.30 | 3 
               asterisk-14.7.6 | 1 
           host-libselinux-2.7 | 1 
        host-python-lxml-4.0.0 | 1 
                 host-rauc-0.4 | 1 
                       kmod-24 | 1 
package/libsrtp/libsrtp.mk:... | 1 
           uboot-tools-2018.07 | 1 


Detail of failures
------------------

      mipsel |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/4e3b0fd7c31814a8605c00f69cbd45d11800d9e3 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/e18c3b276b659115ca88d0ac329ad503b3027dcb |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c0f24d920986687139d1b609878275919f025d9f |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/89589ef07d9f9c26f9e20fbdff0c2889d7c7914d |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/e19ec7a52a8de56da98b74f1131ead064f28a44a |     
     powerpc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/cff33fa007f6757b6fb2e93e0e0bb1156363b32c |     
         arm |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/74fb2f17c1c883efd48ea93cb6446af6953b1b94 | ORPH
         arc |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/3d124898c263ced775be717b7c58178a5b123dba | ORPH
  aarch64_be |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/d1912960218ffd8da40108522121341e77a1a457 | ORPH
      mipsel |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/70516f5025567e382213297e7ecaf6d7324eb1d9 | ORPH
    mips64el |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/05c698e0995b53bb81ce7991f8151470e13a5685 | ORPH
         arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/636da0febe02f991095965d52cc4a8b2da644777 |     
     powerpc |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/e6aa3d98203d3ac1788671bda3041b2563e5a411 |     
         arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/af709ccc027b0a9bea0228001572084c19d4c710 |     
         arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/12af6e626c1ad4b5c9f4c612b64027213923c4d7 |     
       nios2 |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/9b837f60cbd15e2a3c11e3453e543ca27ec28498 |     
         arc |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/78f4ec7d8bbb94aa5ea1bcc91a56aad664ab8835 |     
        i686 |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/ded8c3a72e97c6e7481062ff601f1f03adab6976 |     
       sparc |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/87b1d0d29b9e99ce97556d5585fb848094ff6852 |     
         arc | host-python-vcversioner-2.1... | NOK | http://autobuild.buildroot.net/results/def007fb5f6f78b8ef98a31ec3092b459d4d878e |     
         arm | host-python-vcversioner-2.1... | NOK | http://autobuild.buildroot.net/results/04372b290b623ad0b18b8f1a5fc88e9a2b46a7af |     
         arc | host-python-vcversioner-2.1... | NOK | http://autobuild.buildroot.net/results/f3bae385664e770a770b24754631d7ea84497507 |     
        m68k | host-python-vcversioner-2.1... | NOK | http://autobuild.buildroot.net/results/5f659130a6a32a4c43d6ed2c3b559df77ae18249 |     
      x86_64 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/3afccade7b789d2c49ff38040dbad87edd5b03f3 |     
      x86_64 |                        kmod-24 | NOK | http://autobuild.buildroot.net/results/5ba7f2e9d0802890e275f7da160ad0aad87b6f56 |     
         arm |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/0ca556419abc04d2e7ba7c6e1df6b3539cc643eb |     
        mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/b54e58bb06fe13048a430a94df4efdd5c2e9b5de |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/86b10e93db94ee7a3b17a46cc0383bc8d072983d |     
         arm | package/libsrtp/libsrtp.mk:... | NOK | http://autobuild.buildroot.net/results/2d8344bab5b87d20156814b96cbbab1d5fc89586 |     
         arm |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/8629959a84f77c32d216143aa69723e24857d7c9 |     


-- 
http://autobuild.buildroot.net
