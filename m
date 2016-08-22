From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 08:30:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-21
Message-ID: <20160822063025.5AB4D1028EA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-21
===============================

        success : 176
       failures : 42 
       timeouts : 2  
          TOTAL : 220

Classification of failures by reason
====================================

                 jack2-v1.9.10 | 2 
                       unknown | 2 
                    qemu-2.6.0 | 2 
                  ffmpeg-2.8.7 | 2 
                 mono-4.4.2.11 | 2 
               binutils-2.25.1 | 2 
                oprofile-1.1.0 | 2 
                   lldpd-0.9.4 | 1 
                    ustr-1.0.4 | 1 
                      qt-4.8.7 | 1 
           qt5location-5.6.1-1 | 1 
tstools-08f6be304040e7b8476... | 1 
          sane-backends-1.0.25 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                   mpd-0.19.17 | 1 
                  thrift-0.9.2 | 1 
                libaio-0.3.110 | 1 
                    norm-1.5r6 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
               wireshark-2.0.5 | 1 
               libepoxy-v1.3.1 | 1 
              lbreakout2-2.6.4 | 1 
                   ntp-4.2.8p8 | 1 
make[1]: *** wait: No child... | 1 
make[2]: *** [utils/CMakeFi... | 1 
                  lshw-B.02.18 | 1 
           libfreeimage-3.17.0 | 1 
             python-xlrd-1.0.0 | 1 
           musl-compat-headers | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
                   luvi-v2.7.5 | 1 
                coreutils-8.25 | 1 
               libglib2-2.48.1 | 1 
               trousers-0.3.13 | 1 
                 ibrdtnd-1.0.1 | 1 
                collectd-5.5.2 | 1 
libamcodec-6f9b99182f94be14... | 1 

Detail of failures
===================

        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/b4311512cf08cd922fad46cbaad245c45a5de271/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/f733e47490979283a590f812f883e3a162474577/
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/c0fa3f88bfae33f99882b8cad681c346bd9652b6/
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/8f53936c6240500501d527afa4d27591b02c4154/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/dcab3bc59c7d9fef16312b5de51a90d13b6700ad/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/395ea669f5f70d6081762dd589f16d976cbe342b/
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/bc8c7be9cb41cb4e5f5fed5c375c1fcf355b6902/
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/369ce208ffea43dad75ba0a13469159b341e3bf5/
        sh4a |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8871251ad5154ed9f9e5a583ab889c13391f86a6/
         arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/ca13b95d024f79d816ed5f8959855638d92e6246/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/2768ed28a85f93fa5a7e854d4e90e44c712358ae/
         arm |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/a7b48e7946f499dccb9a19304c4ea3dd96004b63/
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/1d3dc2f3a3c93e5143a6ff8dc27c56653fe0a2e1/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/af8c0f91360413bdffc81868cade784fcaf57083/
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/372f34e6e011fa23c1fa04599b935a0745a9d8e7/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/12e24b24bf2a63f9c7b92156339e7eec755ee650/
microblazeel |                libglib2-2.48.1 | NOK | http://autobuild.buildroot.net/results/616dfaf72477a6b398fe208d06b09e0e06b7262f/
    mips64el |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/f204c0f92fad7bdd603a182e857a4cc8a633de12/
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/befd420eba3427c02ecbd692cfb60c912be5c686/
      mipsel |                    luvi-v2.7.5 | NOK | http://autobuild.buildroot.net/results/35f558453c45a27367e80e9b8cbe3bd2dccbfd54/
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/9a647b16cc5a3fbcd020b03f2092cfafdf4f97d4/
microblazeel | make[2]: *** [utils/CMakeFi... | TIM | http://autobuild.buildroot.net/results/c51d5d7054289493b86cef7350d2a2525901122b/
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/d6d359f11dd034e6c76aafa6ffcdd5189b721ba0/
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/5c42109954b15278a6e7b29986f38db15b1350c5/
         arm |                    mpd-0.19.17 | NOK | http://autobuild.buildroot.net/results/03b98b313dd6ed2909607cdc0c4f6fb87be3ccfe/
        i586 |            musl-compat-headers | NOK | http://autobuild.buildroot.net/results/9b20bff1926adc7e3149cb813220089c79e26c7a/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/ea0027d3ca442472e9f0befc62e8b0d9af3ac1bc/
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/e6a038e9b9ea558895dfaa7dfa6fbdf6640573c9/
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/8758a2931975580e535877ad06e9dfc17052e947/
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/3a0ebf3ee44760797d4127338efc0d8bc1fe45e2/
        i686 |              python-xlrd-1.0.0 | TIM | http://autobuild.buildroot.net/results/aa8a652b5b990b2100ac35f3a3dd5267bb9372d8/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/aa22732ee25154f6e6d51183c70e03b574ac3556/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/54c39875b0d5bef24a6189c642a8e5c95f61c529/
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d0651e085fb9d9946ad58653dccb8dfba79a7f2b/
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/27327f9a22e63861028a57d3b10cdf9562533530/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/5953fcc3a95d319b4a880163b222979cd4960268/
      x86_64 |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/bdd5503603811609f69068ef2b8af8eff3d032a5/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/78ca1819cdecce81336cadca17762fde8276d13a/
      x86_64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f71edcf08f31029ef642415b8351ed14767c8e0e/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/20830bccab8508aab215c5fc8010e180cc68af51/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/c1200f2b244fff91449cd60b3d0ce62fcf743528/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/4911fa85714262c0662d8fc5e0713578af1ed7a2/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/7b12f00612da4ad8dffe0c8010b95db881630b17/
    mips64el |                wireshark-2.0.5 | NOK | http://autobuild.buildroot.net/results/ef50939b89373aad04275cbdeeff4c0e2807c0d5/


-- 
http://autobuild.buildroot.net
