From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 May 2019 06:00:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-22
Message-ID: <20190523060054.82646864F4@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  17 |   1 |   0 |  18 |
      master | 200 |  20 |   1 | 221 |
        next |  47 |  26 |   2 |  75 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

             iputils-s20190515 | 9 
                    dhcp-4.4.1 | 7 
                cracklib-2.9.7 | 4 
                chocolate-doom | 1 
                   dvblast-3.4 | 1 
libubootenv-8a7d4030bcb106d... | 1 
                       lmbench | 1 
                   mimic-1.1.0 | 1 
       python-matplotlib-3.0.3 | 1 
              swupdate-2018.11 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/0c61891e17fc2c1ae99e0ac49a17277dda1cce37 |     
         sh4 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/b43fdca61fbab7efa3310b5f1f1f6233c192b65c |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/a3db392502cedc9c9044cd14152f109c305ac65b |     
        or1k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/933af138c06ccc729973f18da477fc8cfebfa301 |     
    mips64el |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/238f7a585ed3cfe7f0bbdeba6a7102d2fdc0b7a6 |     
        i586 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/596bc133f82743d28a18fc10748a8cf3b6308dc6 | ORPH
   powerpc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/fa11d5a0dcb2a0b5dcdb80401f192732b99c31e3 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/d05c83f4751993724de62ef1e034425caf8d628f | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f72eeba6972eaa0d3f276d01aad2bd40c4ec8414 | ORPH
   powerpc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/00c4de2db3004ecdc6e4a44b7ad0f9cdde210f6b | ORPH
        mips |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/37dfa41ad88249c982744a278c782638995ae576 | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/07ada40ad24ac419d45d84cc705a20196c834949 | ORPH
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/747d5e13880a4d27ce0255d54c726007177f5f3f |     
        i686 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/d5b439498df74f0190733721f9f3f134ebb8cc60 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/4088d576a1b47e3780f78985b092a592b5ac09f7 |     
       sparc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/e4625852557b12d82f1d950a0603ec2c3bc1970f |     
     riscv64 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/ce0f9e8b3d2825b9353221e0e0b3407201ab7224 |     
         arc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/020859b61b962f7da6680e9955cf5c2cdd2e330a |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/34afbc9926437845f80adba003bbcbf8647b2d5d |     
  aarch64_be |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/877aba3b1fdd41477dd5acf9a9a16fdeb3fa4720 |     
         arc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/302baf37346aa16b6d15e3885ce0f8469a210887 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/5a338abb80b9043a1713cb7750392365ac408095 |     
      x86_64 | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/1381f4d5cc8a1b0ab8a3084346acd5b1d5be1bc9 |     
     riscv32 |                        lmbench | TIM | http://autobuild.buildroot.net/results/aca73cd42a046e0a0720221832f383e81a2d65c8 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/1a16fcc443c1613f77b2f525574101242f9c5003 |     
microblazeel |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/1300b7beea9d327d1b738973ca99c2cdd006fd99 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/fec95ede1b21b632a33588a71995a9334e81f09e |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/cd9e436029ddc3458605130d30b90121678950eb |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 6 
              qt5enginio-1.6.3 | 2 
                suricata-4.1.3 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                  brotli-1.0.7 | 1 
                   dvblast-3.4 | 1 
                  grpc-v1.18.0 | 1 
                host-libsodium | 1 
                  monkey-1.6.9 | 1 
             openjdk-jdk-12+33 | 1 
                qt5base-5.12.2 | 1 
               qt5webkit-5.9.1 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/23e11b8e80d2b55cf11c4d3748ee80e69d61f37d |     
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/30c212c4f1ebb118c4b1f34db65cbf59a31d8dbb |     
      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/70297672c4f2a639496414dfcdfdd458a64286bc |     
       sparc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/43d6720b89fcefdedf743b1077f2329f31fa4f53 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/376048f6f997632cc4457fe190c75cf82db84bf7 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/3306485227c869b8b388a0d2ca68f814d7c3a025 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cc9fed4d497a1acee2b11648287ec8e1e6a3f64a |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ee4707b79200e478eb8b56ddeaade97c223b40dd |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e1e8da9e9a17cb703978d2ec6776bc6d7b3ee771 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f3627bcd379d70170056ea670b8d2762789bed0b |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f9d783fd84af5791cee099d7fcca47488d331dae |     
     aarch64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/17194e5b6bf455b210cd64ea4f4b2fe25c7de096 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/66098936bb82a3a9fff038e3c2c3e72d4b6c95d6 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/042c98834aa2a69acfc17bb18588338913f40901 |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/ed7875f99cb29c68fe4313c8461e37202f18a4ca |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/30d721918bb19dac763908c5d39c01a82d827b9c |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/ec74a0dcc034edab4d61d5968f180c1798f006db |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/64be608a6b06f956f5c8bb0bcaed56d19bea01db |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/b7fe8449b8e5b353a5595754d26e2f21ea086b12 |     
      mipsel |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/b9ac10345668da12a6d5a2b410f322ff96423029 |     
 powerpc64le |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/443fc4dff7cb182a41e895923dcc97d6ba678f50 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/8e6f63791f558720b0a03f161ef156dcd67e20a4 | ORPH


-- 
http://autobuild.buildroot.net
