From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Apr 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-25
Message-ID: <20180426060013.EAB262079F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  31 |   3 |   0 |  34 |
      master | 170 |  54 |   3 | 227 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          usb_modeswitch-2.5.0 | 2 
                  cc-tool-0.26 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c5b34866d87c8f17f1da17d6c9afc33ed7989f91 |     
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/eec9624c715929261ac220256ae3d0fc71604f96 | ORPH
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/d32f9f5953503faae49f55f5793657e700bf2477 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 12
                   flann-1.9.1 | 7 
                  host-go-1.10 | 7 
                  zeromq-4.2.5 | 7 
                  udftools-2.0 | 4 
           libfreeimage-3.17.0 | 2 
              openblas-v0.2.20 | 2 
reaver-9bae55bd30b6d46b42da... | 2 
                   woff2-1.0.2 | 2 
                         boost | 1 
                  flare-engine | 1 
      gst1-plugins-ugly-1.12.4 | 1 
                host-libsodium | 1 
                   jamvm-2.0.0 | 1 
               libupnpp-0.16.1 | 1 
               log4cplus-1.1.2 | 1 
                 mplayer-1.3.0 | 1 
           python-numpy-1.13.3 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
                snort-2.9.11.1 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/b42d68c66d8ea035845a28c5530ef0682fd95713 |     
      xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/caef15a417169e614f6de47559b8ae6146bf6bcf |     
        m68k |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/a79434aad9db7f4cd2436c46de20cf5ea075cf04 |     
   powerpc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/d6180f4640e76d8a1d38ba5d1977b0d5e1215788 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/112c2bc6ae2b4853093b1b9fb077688138c72620 |     
        i586 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/699ab9455ffdc6e718f162e839514e0911387927 |     
        or1k |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/9ba53bce79770278c95382ee974b0c2a20998a69 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/9bb1e34fd2491d7c6a024c0d286276365af02154 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/af976a4805fb8b3f0c17a8e3a1f901b2255caa0b |     
         arm |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/228936de38627dbeaacbc1aaf98da974ea854dbf |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/7f036ae1c5f0938c6dbb05d847f9eb5d7aabaabb | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5b08178fd1b071ea514b58639cb3502c9e33f445 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e9183257f292616b850a33daf1ccef819b4743ce | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8df9f16619ea770ef55f2dda5712337c77637383 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/0712a1abbdc02d0fc51e675d41e76509f13a7bd8 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8719eddef0752a91afca34fdbcd84b90237466fc | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/1debfb6b8bc941a92db47f75daa061d722db85ea | ORPH
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/de76001f850a678d6a551cb89165339a67b5be89 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/adab6fcfece3a37eea5bb8986aec4304c31dfcb5 | ORPH
   powerpc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/d7f57101439f28c1e99b5f9fa6ae4388621c0736 |     
      mipsel |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/2591a6d6cc276a4c33bfdec959287fc7ec2f6c23 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/12a45080503d47130bfd92ed3d1f8356bf8855f5 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/32edf99ee1fe0ef7977b52472b746cb0c266be1d |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/06db5bcf840fba049e7067cf4d2a083ef0709ae5 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/cc5772e1bf7364f133c3b9f789400bd24070e866 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/0a4a3594dd683d18b6bf5fbda1a5ca232dacc7ce |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/85fd60e2b4c5d52fb835eed7697d4bd72fa92f41 |     
        or1k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c93394e9d0baf2f0b2373992ff19515401a59389 |     
microblazeel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/4dce80ca46db3d9bc12ff32db6d182fc9de07fb4 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2016593f236e6e2cbc6c3121892e7dae5427e06a |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/69ed60a4f4f08a15996f9bb010889443eb3b8b08 |     
microblazeel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a8319782842fedca4ae77e477a080f93bf029b95 |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f9f5258406c5312443cf9e765aef9096679b873e |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a8452d793937f4bc3a4aaecc8a4b23ec84fb5371 |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5dae4bc4dbcdbb8cd1199854bb6c518a628f59a6 |     
      x86_64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d91a988361fd6546f60841f9d541fdb94d83c1d8 |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/d408c86f6bcd502e7f7ce275c5d265ab1f82c980 |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/fc0f10e6b33c9623acfca85b267e39de6a9f0f4e |     
         arm |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/eb31a74adf3265030de30e86fa8738104b05733f |     
      x86_64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/30363a412b8c70f64680f1f169e488a6773541d1 |     
        m68k | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/c77292b2baef358695835d4c039c1650f8f26f87 |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/899fd633288d5cd5aa221413cded857e4f743194 |     
       sparc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/b5009c086fe734d75c61678a848a18a0becb2c85 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/020932aeaf9ffb6e723b819c2c2d76dc2d3032a4 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/eaa85d0f5481af39e91a482137225cc28a4bb45e |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/d231763aa218f46e0ea7f46f9032cac8bb8b0990 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/bd6f49aab55c33c64e1a0c34381cc32bf279c299 |     
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/36bf622ce19d42c5b628e263b987750ce7b3990b |     
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/6542a5cccf6a7cfbcf98b15ca61e6783f7ee8017 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ff5f7d3bcd713db9c9d92a746d6ad7134748fe16 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/9a743da1c3be673288c3482a9e7ddea12750206f |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/818b12387e6117569c4fab310b98c11fac80c047 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3bff1e562ab50069e0318ccc39e7c8ea46e30c63 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/1724fdd305b43af3200eb0aa3eb64e66fbfdcd30 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/99383b4686875ee108861e3dc5c63663bd5c4e88 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/05ade79df5fedca8127eead48b530909dcea808d |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/8a7a96b5abb0d1af126f30cecab9a7ad73ef2e81 |     


-- 
http://autobuild.buildroot.net
