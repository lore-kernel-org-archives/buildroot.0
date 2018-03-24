From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-23
Message-ID: <20180324070008.92728208A8@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   2 |   0 |  29 |
      master | 268 |  58 |   0 | 326 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             expect-2014-05-02 | 1 
               host-efl-1.20.6 | 1 


Detail of failures
------------------

        i586 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/4546c1504480411cac5f2b6cf430c3b9b2ec6248 | ORPH
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/82933fc209b480cb81ff888d67bb01ea49df0117 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               xfsprogs-4.15.1 | 13
                    liblo-0.29 | 6 
                tpm2-tss-1.4.0 | 5 
              keepalived-1.4.1 | 4 
            safeclib-v03032018 | 4 
                  cc-tool-0.26 | 3 
                  udftools-2.0 | 3 
                  host-go-1.10 | 2 
                     php-7.2.3 | 2 
              tpm2-abrmd-1.3.0 | 2 
              tpm2-tools-3.0.3 | 2 
             bluez5_utils-5.49 | 1 
                   dbus-1.12.6 | 1 
                    efl-1.20.7 | 1 
                  flashrom-1.0 | 1 
           libfreeimage-3.17.0 | 1 
             libmpdclient-2.14 | 1 
                 mesa3d-17.3.7 | 1 
                 mplayer-1.3.0 | 1 
open-plc-utils-1be781d1ea81... | 1 
                   qemu-2.10.2 | 1 
             qt5location-5.9.4 | 1 
                   ympd-v1.3.0 | 1 


Detail of failures
------------------

        or1k |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/855884fbd1b45f1c8819c998adbcbe8f47a5e6dd |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c8accc692d27ffb3c10f5d11fd53d7ceff8abe0f |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1046616ad96ba676e33c9913f0f183d41bb5163e |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/cd1ddba3f696e009b16ddebef8ce7cfe2e01249b |     
    mips64el |                    dbus-1.12.6 | NOK | http://autobuild.buildroot.net/results/b24125efeceebc54f35ef18428f73460b0be9e4c | ORPH
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/98c95f027eb595e1234958a496c53bbebcd4e621 |     
      x86_64 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/2f48b50932aac9e01c570d17dee249c5122b599e |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/da6e299fe7b6b36973b418e633200cc9a11b1d42 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/1540ac4e0bde168cb4d49ce07cddfa23946dea36 | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/724c7c756a3202475fa7efe7af6bb993bebc7c1e |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b9460515dd8a06aa62bc45fa2f1a863c9406fe3f |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/adb356ffbd68481d30b452b0ae571647c536c851 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/0bf20e02da77741ebf10435566f8cb19929c948c |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/439bef45c4a899d80aaaad09128bf24cecf0ca79 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/91dd06f3d847250beb34240a5ec3d945ca4bdb82 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/4c36fac0011c5af87fd7cedc3c583c2daf1ac6a4 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/8579847632db4cd80ec2151d92c437495c315bce | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/5a579bcc0203daa6bf9729e2499394727ca61a3f | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/8fa7b8ab309f10880b5988270ab26ad7dbbcfe54 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/4e520dd26790024d50658a132a60c5102714c039 | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/91102b8ef3e308e27188057fd023d0fe786efc8d |     
    mips64el |                  mesa3d-17.3.7 | NOK | http://autobuild.buildroot.net/results/d2659307ee6aff2a78376eab555075f7d67804c5 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8d17e296ab4717e61b54292de438b4c20ef3f1f5 |     
         arm | open-plc-utils-1be781d1ea81... | NOK | http://autobuild.buildroot.net/results/d1570aac4b2e1031fb4fea368fd5872f1713683f |     
         arc |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/65ab35adcb1bea1f3978552efdec3ad932e60034 | ORPH
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/444555921d8d976ae6ec852b541b432cb6dceb28 | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/589fd0e5163318705a38343cc7d4082384c33d3c |     
        mips |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/02aab8e088397499e8b7a982df5dae1feac71603 |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/811d2816758491b3181d26f985893ba2cdcd32c0 |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/799209871511f41c05fa0f97237960779aae38b4 |     
         arm |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/db4b6ecf5d16b788523611dbf06220e9dad2f57d |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/d822e88e6b68a63eb947d9fb1111105d1d40f4f1 |     
       nios2 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/ce8fe8ac9cf0db01ae15d476ea714ff176965cfb |     
       nios2 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/22c473e36e1d45b33403182384fe738a9cb08dc5 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/ae1e151576b365380ab711a1b8ffcd92ad0050e2 |     
        i686 |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/ee80c2fe54c89589532efd47eb93bd27637c690f |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/09ce8f05e28c0219f499ce55130e896cae0c8b45 |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/21bc376184989162a219d0db8973bc58a0866696 |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/016d251fcdc02e2638d8e084540b0f97ea595615 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/c35fb61315730e26b1a019fe1a4f41fac50fa0ed |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/33e60b96ec23fe0f2a8f4150cbba3b4ab1e8d3ba |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/a2e8d0dc40088a33721b15785f208f26e6b6469b |     
      xtensa |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/95a076eaf5a464bab4dbca1cb605135e6d3f5ff4 |     
microblazeel |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/fa01a2d87c7b0d35b2165221c0151c95ec8d999e |     
        or1k |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/e1c79c5de5cfa0066b955ce339e94bd1d07f09cb | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/645293bd1de4b58df2bba88628092437829151e7 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/d6ca192933820b4d858256c29695c0bb53098bfd | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/6b1545d6cb8d9967b333c1343712874d04460b34 | ORPH
        mips |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/0acf738291956651c098f7b528a4bae3a9c4ece9 | ORPH
     powerpc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/bc3897692a76bd48d2fb0435e6ae5b583793a626 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/551b13845d3ad9ef1f58b9b23b143d897ca34d5d | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/25e017163bfe4fc446b757a5034c55fedba797a8 | ORPH
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/06192c2238f4172360094a3993d4eb9910032725 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/35b8653bb59794ff37e67fe55a3663beb9380d75 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/aedae1d983f108f9921051a23acf311f39e0a249 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/ad74ac985cd3aac348721f1ad50006f811f52558 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/d6601bb7609548ca5f05db249472affe01ecee1a | ORPH
         arc |                    ympd-v1.3.0 | NOK | http://autobuild.buildroot.net/results/88b2ba3e7a1bd6cff601776c8eebeb405aea65fa |     


-- 
http://autobuild.buildroot.net
