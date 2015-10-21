From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-20
Message-ID: <20151021063018.E2499101FB3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-20
===============================

        success : 145
       failures : 78 
       timeouts : 0  
          TOTAL : 223

Classification of failures by reason
====================================

                   mplayer-1.2 | 10
               syslog-ng-3.7.1 | 6 
                 sudo-1.8.14p3 | 6 
                    ruby-2.2.3 | 5 
                  ffmpeg-2.8.1 | 4 
                   dvblast-3.0 | 3 
zxing-cpp-fa34227d26e0b388e... | 3 
                  libv4l-1.8.0 | 2 
                directfb-1.7.7 | 2 
                  connman-1.30 | 2 
                   nginx-1.8.0 | 2 
               util-linux-2.27 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                  qemu-2.4.0.1 | 1 
                   mp4v2-2.0.0 | 1 
             sofia-sip-1.12.11 | 1 
             lttng-tools-2.6.0 | 1 
                 mpg123-1.22.4 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 mesa3d-11.0.3 | 1 
rpi-userland-b864a841e5a459... | 1 
             host-nodejs-4.1.2 | 1 
          host-libglib2-2.46.1 | 1 
           qt5multimedia-5.5.0 | 1 
                 dropwatch-1.4 | 1 
             python-spidev-3.0 | 1 
                 fio-fio-2.1.4 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                   slang-2.3.0 | 1 
                  c-icap-0.3.5 | 1 
                  mono-4.0.2.5 | 1 
                openssl-1.0.2d | 1 
                  xl2tp-v1.3.6 | 1 
                      icu-56.1 | 1 
           host-openssl-1.0.2d | 1 
                 setools-3.3.8 | 1 
                   mpd-0.19.10 | 1 
                     aumix-2.8 | 1 
                openntpd-5.7p4 | 1 
                ipmiutil-2.9.5 | 1 
                   zmqpp-3.2.0 | 1 
                libnspr-4.10.9 | 1 

Detail of failures
===================

         arm |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/9420442a159f76c5005f03ca001a5df17c9f4e8f/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/3a8e5d8df6e3025cdc317461cbac9a502d62d665/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/c992b79bc52f91ae78ebe2e6e49139794fdf8bfa/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/52411607b02270ce343b0c0133b653b0584cae0b/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/0e13d38b10e98f5eeeed1af8a89f0648cd420177/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/8df53234251f1444363483a77d47dc2bf885a08c/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/f7032fccbdc9a64fadd4ca9e6b6c7f1ea39bb14a/
      x86_64 |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/a1fd34eedfbfce71d3d4015a671682146326d553/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/01913e98c4e8d2bed9c7ced890e32523e4baab36/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/2676fdf2e95dc2a13ffbb8e7370deeff31dd7b3c/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/2c879c4d735e6f3572727d767a6501504cd97097/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9b3d6742bcb392bf353c0cb181c3bd38d6b8e9b8/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/37100449d2146bd1d60b62f4678ad263ff8038de/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5b03de55154db7e3a02503f3aa1c47c2af6fd2ae/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/5d2bee0c4906a1c8d9fbd7f63ef93c719fcde54a/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/99f550fb03276e85398736c6c01e25feadb3dfc7/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/7cd7ce165627747e429325ae5ee2e0c63860c5a7/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/29f398b32b92382a76f5ffd007773de167e6c795/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/e02f52b3731acf76d4d5aa1ad5ac8fa4d5b77f50/
         arm |           host-libglib2-2.46.1 | NOK | http://autobuild.buildroot.net/results/0f881e322b7f9d244b8dd2440ba0afd3a8418027/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/3e9a09297bfc43e77e309df3507a39349715594f/
         arc |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/d27250228c35b99ea38f905552c8a179cde7a691/
        bfin |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/54e68c068f65777df9552df2366810ff2ac1ac7e/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/822877e9f864b7d616e43b30f099f28ae377313d/
      x86_64 |                 libnspr-4.10.9 | NOK | http://autobuild.buildroot.net/results/cb59c1eade7eb96073d1670b61b227ff26c65d95/
     powerpc |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/b7a9d3531b62c4e2a8b173015b3c67a264039cc5/
    mips64el |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/a03899fea65b9f6d5600e6718d38e13d9906e76e/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/ecd81eae950eed2455799672c74666d7c0c289b1/
      x86_64 |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/938f5fad9e9c8e37764fc08c7a1d72f687c33bb7/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/28221f6fcf7abb55820e53256cffa9f35cd050a9/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/893985181bc8c43c9a2a08c13d909be1d6cc45a0/
       sparc |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/ddc0d9abd9baba5b16a60d580295551571f1df88/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/788bf842048d4966d4ff2e2a3515f99019bd26dc/
         sh4 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/122c1a72c237d3b10f3bd936a73019ae120f0d3e/
        mips |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e0d9a825288fd3ba4b888003ef5b7e3d74e0e2e4/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3207fc80d826b9154fa579e54f3fa741d2fe39c8/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e63cea4a82d8a69f8d5ddd7474f7f1933db81102/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7ee94193c118277e997f018cac8e690651b7d1b6/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3963e0672a34a26315f832fbcb0a28ae1881d591/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/031b64f65c6487e91eb4bb02111572fb80ab71e4/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a80d270a8a0def09f7fc5e95041ce418068134b6/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ad468d7a91c8864dbb4b9f9fa6e2da4425427a06/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4e0fb1a4c30f924c51544ebcaddc22366099cd69/
         arm |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/cf46377a53a45c10ddca412c31730c647a9168e8/
       sparc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/48bbd5370f7abc182fb09867543ef76ca3119d3a/
      xtensa |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/c5bbcbf0dd6f454fc2e3ee1fe9f2944f3d0449ac/
         arm |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/31fa1cca34fdcc79f2e530c3443408d288132a5c/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/72adf91836f41d9d69e91d1e304e302eeb8621bf/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/bdd27be3520776ce156cafed7017e0db3e2531e3/
    mips64el |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/773d9996bd3da283eed6b75083b8bab6469d0423/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/38197d234d1dbd3614695a8ec8ed76629283c339/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/e38bfc848af5069d1510534b75206e8488979d7e/
        i686 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/fa23f5388bf315704beca84f758145be89066200/
      x86_64 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/c7093dee4aa352ab2a4010dd940d39799818620f/
         sh4 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/3877d0966446ceca6887e6973c65f8231ab2d2db/
      x86_64 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/01d3b3cd850391e454e0930999d9524a21ce9d6f/
         arm |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/30e776d098a34e70947582820aeaa6a4cd8420a3/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/a5ba33ee8bb68d76f8e38ccc0aaf8daa74887aba/
         arc |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/02912e82b76cf71d20a4e9c013546ef064f3472a/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/4dae780f9275810e0c76f6c0a63bcdcaffc2cef2/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/72206f6fd0f861fe01a9ec4cd10c0c3fceb8edde/
      mipsel |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/05e731d7f53e5ed68ccf9f09d48e09e880790cf8/
        i686 |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/486f36684fd22b17ae9924ae5abefed20ae34d99/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/79d52e9369e20b2854e87d697931c59d7ab5cd11/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/42b2b9a9d061b35256b41699e8cdda2fe58462ee/
        mips |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/ab8ec583d1836d0c246ac792391549bfe277ce76/
    mips64el |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/8bfb199bda2218252bc21b228066d41af37e2753/
         arm |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/4a04c60df89eb019f40626ed6855a7fb729bc094/
      x86_64 |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/0589387b77903b4b35446ad582070cd0f8303886/
         arm |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/3d342ed47a59b352071e32e98973178efd5d9de1/
     powerpc |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/137c6d5ef82f3a92f87bc2b3e285df548ca68654/
         sh4 |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/93fda38d078a40f5c533992d63ddfb95631a09a3/
     powerpc |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/b7b54c5f19a72652f1990f0ff597de83614ed13d/
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/b7e42137e2a7379ea8acb76b2d4faece86ab488a/
         arm |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/345771eb488c60585e388fbbf4490df936e88e19/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/e17b661ceaf7bd64ff9358751acf48a9b0ccf0c2/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/b0662941cf21e84ae7e36f751493406b412165f7/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/129257cbde1b25601d4983f753c34f861cbb33eb/


-- 
http://autobuild.buildroot.net
