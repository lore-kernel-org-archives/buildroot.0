From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Apr 2019 06:00:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-24
Message-ID: <20190425060040.0FC5D8512E@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  31 |   2 |   0 |  33 |
      master | 268 |  47 |   2 | 317 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 14
        libcpprestsdk-v2.10.12 | 6 
                cracklib-2.9.7 | 5 
                   netsurf-3.8 | 3 
           host-cryptopp-8.1.0 | 2 
libcamera-d5ca33f6c7b0cd1ca... | 2 
                       netsurf | 2 
                suricata-4.1.3 | 2 
                   bullet-2.88 | 1 
                      gzip-1.9 | 1 
     intel-mediasdk-legal-info | 1 
        kf5-kcoreaddons-5.47.0 | 1 
               libinput-1.12.6 | 1 
             openjdk-jdk-12+33 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.2 | 1 
           uboot-tools-2019.01 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.1 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

         arm |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/de33b09dd00f3ce11db59ac992ed9bf6aa16f378 |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/9703c29aeab1c1b52a8542540746933562ccb6e9 |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/35311dc13b55a884593eda3c943aad1a91369a46 |     
    mips64el |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/77bc982d9bae586fd58a72a5cc23278885f58c5b |     
    mips64el |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/0751f0059cda28f475f8f5800b2fdb71ad163c91 |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/a57cd19d81abf41073468cdef028f16e1773845e |     
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/d5f5a5b9ef23e0568a6f14399ca2a485a9fb7455 | ORPH
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/852539c71a605e33a144829c8410fff0c74d9cea | ORPH
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/9f6a57b3c11e29f2e0ffa131f0591c6775c71f45 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/77cd1ae52ad46ec5f01d49eb46a8bb0af9208e8b | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/1cf013670f77d379badd5726be11b977bd05b6df | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/41d1d57e0a63d7f81fce60512795c58d7f4145e0 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/40b7f3b8c74ae5f59e406de245c705666d3b25b5 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/11f4222ad79174cdfa1b7b8ee40587071566a40b | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/873b335081019be5461585ed06dc3d32f0195b7d | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/29f3d4cf93b0ec4f76ee6055d0181eaab87fd8fa | ORPH
     sparc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/d293cb52f6942a6fb28a53724291b3a146e609cc | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/90a9fbf14089804cc088f7ba39697132e9108bb1 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0d8254c66afa5504a9b1421095bdbad158fa53e8 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e458d218f0d68a8d21daf78be65c6114230083ed | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/2688599c5ef39270fa515a398f2fed1ac6b2597a | ORPH
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/8e8dcb13c6e6dab0a7957c505c62693336fc81f4 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/4175695237a8d12926b748a10b9f0651184996d7 |     
      x86_64 |      intel-mediasdk-legal-info | NOK | http://autobuild.buildroot.net/results/53cff41f24e2fc69344f5d09f2fd1ade9b132ca5 |     
microblazeel |         kf5-kcoreaddons-5.47.0 | NOK | http://autobuild.buildroot.net/results/7ac2931ef5cb6b0185e952f28270a5fe25882526 |     
     powerpc | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/72505e74c9e26493d6cacc5b29336b10fe6ca9d3 |     
      x86_64 | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/4c0d795380a5f55bfcad102c67cb04b3a847253b |     
     sparc64 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/841084eb3ec08176fda15251cbda2c476ee462ce |     
         arc |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/d9d21cd0db4ba7e33e8fa97dc2d1c3edd4d7d4a6 |     
         arm |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/87596cd96fe779ec42698b9d55abd9b1059e6ec5 |     
  aarch64_be |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/c196fb29e370c1a7f8ab46e96c74679a70320da0 |     
      x86_64 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/2f32d5eac754f7a18a22ece67506739ede526a5d |     
       sparc |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/faff0f539cc653960823994191990cf19e43d3e6 |     
        or1k |                libinput-1.12.6 | NOK | http://autobuild.buildroot.net/results/642198150906c2b4b2d732c6922a576a5f2ac1a5 |     
        m68k |                        netsurf | TIM | http://autobuild.buildroot.net/results/71b143eb4c8b55f09845507d3716e8cc84c37da8 |     
 powerpc64le |                        netsurf | TIM | http://autobuild.buildroot.net/results/7e5d958c549ad33d1a41e5f0fec61f5b440484d8 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/eef2dbd3e713542360d20f9a0c11d9d4e35c0af4 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9746f55948747e90c5c3cae5baa426ba8737211c |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/69040fa4fe6651c780b7d79ff29115d1b9e86452 |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/6d68b9a735380b782f7153cfb6cb53c2b04599b6 |     
         arm |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/b1bbae82df2902a35674e8200325beb2541c0b1e |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/7123cc9fe6311581441f14178bb42e3c6c591d65 |     
         arm |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/f8b47eeb562730e84eb437da88d5bda2bfef937a |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/7e4968c43493b9fe3bfec6af7e8d72b231645736 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/ed923bcc1454ce90444b8dac7c064b5f4ea4a0a5 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/35d7e42b618763466a7eb7837915aed904931191 |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/dbce7e520edfa7cc2d7cbe2f3ba737403d5ced2e |     
    mips64el |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/533c75836ba6281000b89a648fc653b9ff4685ee | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/26612e904714a8ede30f23203ca7a62b38ad5120 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
            qt5location-5.11.3 | 1 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/1ba19b85860d9dd8866662682c9339d66e3001bb | ORPH
         arm |             qt5location-5.11.3 | NOK | http://autobuild.buildroot.net/results/91cf34b7d2057dd1a2d4fa69890b5f6d536da8d4 |     


-- 
http://autobuild.buildroot.net
