From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 07:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-11
Message-ID: <20190312070043.34D4186FD3@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  35 |   1 |   0 |  36 |
   2018.11.x |  21 |   0 |   0 |  21 |
      master | 222 |  41 |   3 | 266 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 


Detail of failures
------------------

     aarch64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/b6aa8e7c5f73efabbe3cb16b24d3e9edadae6303 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 13
           uboot-tools-2019.01 | 7 
      host-uboot-tools-2019.01 | 6 
            optee-client-3.4.0 | 5 
                   netsnmp-5.8 | 2 
                    stella-6.0 | 2 
                beecrypt-4.2.1 | 1 
                gerbera-v1.3.0 | 1 
                    gst1-shark | 1 
                  linuxptp-2.0 | 1 
                  monkey-1.6.9 | 1 
                       netsurf | 1 
                          opus | 1 
                qt5base-5.12.1 | 1 
 qt5virtualkeyboard-legal-info | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d69e97f2abf873ac5abad85d029a462dafe671b4 | ORPH
microblazeel |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/ae8100c61160391180db70d7f7950001efe2919c |     
       nios2 |                     gst1-shark | TIM | http://autobuild.buildroot.net/results/33a4e75cf23f6c687bd11052751655e6d7bbd06a |     
 powerpc64le |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e4e57a8c8246b2146d0e5d09f2d2842bbcc52b0d |     
        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4583c8e26b6adc4a54ecd62d7f5eb7e311b09f33 |     
      mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0a839303e257c139776b75eeafa6e740d186be0a |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3d730926e4ef327e0851647b05283b9d45585a91 |     
     aarch64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/85d7f3942a49ecdaf004e355feaf6ea744bc9b1d |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/560ec0030536b8523de1e550619e86677c2b839b |     
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/e574147ed4ec2c4108d192005aba33e6ec2c30e4 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/2e2769b7c7d580b1b8befcd72079d4a5b5c86b56 | ORPH
microblazeel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/1bdb3ccc2fdf4ee77106adc8049cf0f45761c4c5 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/f9fa5e638ba946476b2ae12f077898d95442f251 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/815e78ae00c5764c681efd8600a95142c2bbf565 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/68236ec49cead394d5438ebbb5464cced749c3d7 | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c0f6fd3c528107e96fe77dcdb5418ac778442018 | ORPH
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/fd717e22044e0b3559e262745527a7af0663e450 | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/4ac854e1c47d895864086d659990c9e26fbe73d7 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/1ffc3b9cfafe5516fbc680dc93f38291b4d4d5f4 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/ad7770da14ac65571ac7e8766088c15ff8a4885e | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/db40d276d395b51bfe6cbc873a62090b51057c67 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c42ca605449bbd90d07daa85af12671227640b42 | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/48b765cf2f7f4c9c3529cd0b4b91c96af3a183bd |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/a8741a8988662e25bd603ace3bce320da9702916 |     
         sh4 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/669565e1687741201a1cab670c222e7e041e07f3 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/292ceeca1e87ea24ed4e1ed03052186e8cd08fc6 | ORPH
microblazeel |                        netsurf | TIM | http://autobuild.buildroot.net/results/01d9eba8ab26ee08596bcd29e82f7fa2dcf4b09c |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/255be0ed1a3d8394a6a850cbaca47581bfee1653 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/3464d0859623e27c7f17a9bdf10ec7be6573ef0d |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/36175f584ae16e244a3c25aebdddf710cb142a6f |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/16db1b3b43ecc837e0d18ca56cc66625a53753a5 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7afb908527a218d59c9625c1bf236bf2f167b354 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/ed224654f86287b1db16ecdabfcbe5968a16f9d0 |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/e2a66850d9425b2a157c3389be1dbfb1790bdb66 |     
         arm |  qt5virtualkeyboard-legal-info | NOK | http://autobuild.buildroot.net/results/2c95321085a5423613c41def86899036653eb6ca |     
        i586 |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/86535dcbca84c2a9bbde12a67945875f4aac728b |     
        i586 |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/f53fde84e01ffdad62c824ba40a08535c5fd2ac6 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0a69891c9a000e29e9cc6cb1a2e9a2b250926863 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f5fafa4f3af13bf0aadcd6227decb582eb33f39a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/77a30374b1f68a7ac4f29efb383b8af2eca0ef2d |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1892c0361fe386254253288ee5a031d2b787c8d8 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f7cad2a43d710847aadfc3d58fe3ea4d6ac70e3e |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4ac516be77378f8735be251640b6630e4bce0920 |     
     aarch64 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1f59ce23112854b018e51c0091f31b549e8acbab |     


-- 
http://autobuild.buildroot.net
