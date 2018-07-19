From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 08:00:40 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-18
Message-ID: <20180719060040.547CF207B4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   1 |   0 |  28 |
   2018.05.x |  25 |   0 |   0 |  25 |
      master | 148 |  51 |   1 | 200 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

         libcpprestsdk-v2.10.1 | 1 


Detail of failures
------------------

     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/234066d900effe992c3cfdac4c83a94f4540b802 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   bind-9.11.4 | 23
             gnuradio-3.7.13.3 | 7 
                  boost-1.67.0 | 3 
            perl-net-ssh2-0.69 | 3 
                qt5base-5.11.1 | 3 
                cutelyst-2.5.1 | 2 
                   libnss-3.38 | 2 
               aircrack-ng-1.3 | 1 
               domoticz-4.9700 | 1 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
linuxptp-303b08cbf55096aba5... | 1 
              mjpegtools-2.1.0 | 1 
                 opencv3-3.3.0 | 1 
               qt5webkit-5.9.1 | 1 
                  samba4-4.8.3 | 1 


Detail of failures
------------------

         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/e684f8967a7c8cb14db1afa90e379a6d335ca0db |     
         arm |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/b8c45a254896f52275c28eeedf1d0b24eb82e097 | ORPH
       nios2 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/d1522cfc2c03f7bda8fa3a1f58c417611ed97949 | ORPH
         arm |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/7126f6494bcce7c048fe95e6264af58a49fb52cb | ORPH
        i686 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/002a5842dcaacce93bde7ff368737e6b78fa923f | ORPH
microblazeel |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/f5d4c0b57b18f4e33293dec86820270ca997370f | ORPH
     aarch64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/29043ef68d65bc8d81cff381c258b897e17bed45 | ORPH
     aarch64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/d1f1f04eb38499219c441e5b975c210d2cd8cadd | ORPH
      x86_64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/df78615c222bf92dff294c835b1bd939f8d35672 | ORPH
         arc |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/cf74a509a751242e07c3bd40c81f66a2e94be2fc | ORPH
      xtensa |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/c703c1c2795c43caeeb97bb68fc49d51138171c2 | ORPH
      x86_64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/3774cea4fee0bf690e8931911ef013d7344d356b | ORPH
microblazeel |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/0a51c7bc5e2cb7384a54a63a598870a47adb9f4d | ORPH
   powerpc64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/e6b3536735a131aaafce2cc6e356e4798e2fbc87 | ORPH
     sparc64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/1cc3f5ebcaebb3677103adcc48a8918d1ed990ea | ORPH
     powerpc |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/7250564e780e43e793ae6c8c526985e5519681f4 | ORPH
     powerpc |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/025e377b51b39ba34647636ad0d0661a3cb95572 | ORPH
microblazeel |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/3edb1659954b00401b68ffc7e1c8b3c29581c0e4 | ORPH
      x86_64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/b6d41e1303f0292e16458710d5af99b011688253 | ORPH
      xtensa |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/b3c44223ff09135b58b410ac5dd63959fe3c7599 | ORPH
        or1k |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/9108b2876212bfd00300802353bb3a1a2a6b05ea | ORPH
        or1k |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/13a6b5059375d4ff031b2533517c363aa94b0c7a | ORPH
         arm |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/dba53a20d64664aad7417211f1bd26dcd4f2de84 | ORPH
  aarch64_be |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/869bb522eabbcb951de2f2a2cab32342846e75e9 | ORPH
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/249c6409f1fbfea88f32956178dd2c52009138fa |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/828e35a9d13afb409a9d9096b381561b1b609339 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4b169150e61a152d47d3343e5bfbe41d222b0582 |     
      mipsel |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/d8467cdf9d12e606db39de45a19a3f62fdaf8ecc |     
         arm |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/a092cad61f3d104520c3a2811158e76df464dc19 |     
        mips |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/12a731f76b723e94685ae5140375afeccd5ae2be |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/2823b38b4a0b75e8901ba9734b36a26357dfd2f9 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/22d3ad52208bdd062d97ddc1f9deb38bbeb80264 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/7b02fdc9ae72ecbbc924bfa30464743d55bc2b72 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/baad84df5f4ac06a2c015d660bdce041b3c12d61 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/1283664da4cdb0649867884e8a146fcc9bc722bf |     
  aarch64_be |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/42a1436a0d1bae9161d2ff423861b1abeae2e4b5 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/7d28b9209b01c7ec5718060ee4f0ea220163e49c |     
microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/caf475843779ff2fab28547d1a70db91cd76066e |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/7fb6ca9a037937454034f7e79d982327b2fc1066 | ORPH
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/4d4aa853bceec431dd72db85ade8a45ecd3baa06 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/cf393a3ec8088e99396de2675dce2ba07056ac34 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/39ae1f65dc6167723dc9bf4b256f1908ef4d03cb |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/2ffbee5eb56a6f2d48cad2700caa9764df575cb8 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/241895590f84c8c496017c966cac0a7a7cd2fba7 |     
         arm |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/d90e312542fcbef9aceb583ac38976f7d0149c60 |     
         arm |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/8a25a656978195390d432ebaa612ecac6dd95586 |     
         arm |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/031a20b2918f52d8ff202b90966ec2cfd72552eb |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/cd6cc18857180f82002a57bfc1aa6526f1ce3e9b |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/1650a30b43551f99a7fea913588eeb0ec65dc3bc |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/e777d09a3edcdc84beb350b26ba8ca04847f0e21 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/414fc74763b47a30e706150f4777af286cef800e |     
     powerpc |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/62894d464000d457e1f68442c48dd4e9929c28bd |     


-- 
http://autobuild.buildroot.net
