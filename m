From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-03
Message-ID: <20160704063029.9407F1017FC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-03
===============================

        success : 167
       failures : 68 
       timeouts : 1  
          TOTAL : 236

Classification of failures by reason
====================================

                   audit-2.6.2 | 8 
               target-finalize | 4 
           qt5location-5.6.1-1 | 3 
                  libsepol-2.5 | 3 
                liboping-1.9.0 | 3 
                     php-7.0.8 | 3 
           host-luarocks-2.3.0 | 3 
                flannel-v0.5.5 | 3 
                directfb-1.7.7 | 2 
                 lvm2-2.02.158 | 2 
               libdvdnav-5.0.3 | 2 
                   efivar-0.23 | 2 
                mono-4.4.0.182 | 2 
              libarchive-3.2.1 | 2 
                pulseaudio-9.0 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                  boost-1.61.0 | 1 
             iprutils-2.4.10.1 | 1 
                   dvblast-3.0 | 1 
                upmpdcli-1.1.3 | 1 
            host-libtool-2.4.6 | 1 
           linux-zigbee-v0.3.1 | 1 
make[1]: *** [libleveldb.so... | 1 
                 mplayer-1.3.0 | 1 
                openmpi-1.10.2 | 1 
             transmission-2.92 | 1 
                  babeld-1.7.1 | 1 
   webrtc-audio-processing-0.3 | 1 
                 gadgetfs-test | 1 
host-gdb-6be65fb56ea6694a92... | 1 
               libsigsegv-2.10 | 1 
                 jack2-v1.9.10 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                       unknown | 1 
tvheadend-8e637f9f903f6d820... | 1 
          libmicrohttpd-0.9.50 | 1 
               wireshark-2.0.4 | 1 
sunxi-mali-d343311efc8db166... | 1 
                  gnupg-1.4.20 | 1 
                cifs-utils-6.5 | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/1038cb983b055b5598ab51189326562ac83e270e/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/a5b0b7ad4544d4a1d7f074cf88332cf0a8f486ad/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/993800332df1253cdb8645783d17fa4b9073ba56/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/0f10b622597a96b63a77b0dab13472ce45d3eab2/
      x86_64 |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/0d773bc7020699f849f05a5a91a95257cd48bee1/
      x86_64 |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/894d72eb80785b4c9dc07ebf0e2e47ded76292b3/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/264ce15c6d3fe6ff284e1ed79beaa4508883f5da/
      x86_64 |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/d05ac7db1560f480ab1ba89111e1dff52f88588c/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/a35c3412a390db1768c1659477a9852b0be2bd8f/
        m68k |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/986953a9bb49cd68338dc15e1a2f96045e44bf02/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/a7e638660a33f459bfc129cae3c450fe0e352537/
        m68k |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/a35dede8f532671e94dc57d301a7b3a77beb10a0/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/f9999f573fb133482fe399d9ca6184e81a232e85/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/e813c4051af3a435486b1213968639d737e72f71/
        m68k |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/32bee5071f46b86de61db7f35a2cd04e270bc73c/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/9eed46ef4093b5e877e59917a637b612b7004d75/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ac1335adec976e235f53952dea31cc817795ec70/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/2aa8954311f009988880d27b6e48af91bc74c346/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5301b7388c2c01777cd7efea141a01130d25a37c/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/7678550a4b4a18dd995ac4e3dbb5b592f429d12c/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/b5cbe67db4fc901dfefb23e192777b7e0151d996/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/1628b32086ad48ca066c72f03dccd050c3b69fc5/
        m68k |                   gnupg-1.4.20 | NOK | http://autobuild.buildroot.net/results/9edfbeaaf9040332d65daf09720e16d606b5a776/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/80e63edc009d23cb939880a6f5ae2f220f07a96a/
      x86_64 |             host-libtool-2.4.6 | NOK | http://autobuild.buildroot.net/results/b80d93cd8896a2da5b5b072796623294c3f55aa0/
microblazeel |            host-luarocks-2.3.0 | NOK | http://autobuild.buildroot.net/results/59ac0fe84e5c76a590c698a1483b2a3ae26e1dcf/
microblazeel |            host-luarocks-2.3.0 | NOK | http://autobuild.buildroot.net/results/d8baf44b1e2f8e0e32c86558fc3e0694235b512a/
     powerpc |            host-luarocks-2.3.0 | NOK | http://autobuild.buildroot.net/results/2039f24731d8e14cde24c613b487b3db530dd238/
         arm |              iprutils-2.4.10.1 | NOK | http://autobuild.buildroot.net/results/6ee89f9a4e05c89375a96ac7085747afc301b896/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/78c128d8f5d2af0609fb276779f6a3d275157189/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/8c9f8c95cf35ad47ba924d59ef2fda42966b65ba/
      x86_64 |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/d8bd7c288eeb003a2312e4b646eaee604474c51e/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/aa19809332584d0f2f85782ead4a32ba13edeadf/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/3e12ab54d304d85b71424868dbef7998242e5034/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/eef20038b9bbbdb3d2efe77ce54dae0cb692c1f7/
        sh4a |                 liboping-1.9.0 | NOK | http://autobuild.buildroot.net/results/72ab07d0fc9c4ab0b8a4a8dea29efab12c4abd9d/
        sh4a |                 liboping-1.9.0 | NOK | http://autobuild.buildroot.net/results/e671a339783177bf8f4cfeececf6ea24698d8af2/
        i686 |                 liboping-1.9.0 | NOK | http://autobuild.buildroot.net/results/f9523770afaf5907debf40e8c6a70bc05e06abca/
        m68k |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/8eb5822f3fc92682e162f931d2b36d9d441ad4a1/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/e1573bda080a952f10e7d65f4d94d82229f78dcd/
        m68k |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/453c7db4e48d0f3e9e62b517b2b8aac94b416930/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/24d3d43680fad2bac78a4e35209409e1b0469c23/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/61d5811f1668a9af5106102a3edf24279731960d/
      x86_64 |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/32c5476dfb51cea7e6d1500be6c658af590fb68b/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/12928f27e108839e58fecb11e953a13634659d89/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/9908bd5a2058752eab2f2ccd7d2991b8c975cabd/
      x86_64 |                 mono-4.4.0.182 | NOK | http://autobuild.buildroot.net/results/5ea8d58c020f72a6d6e25049f73353f6a1494e7d/
      x86_64 |                 mono-4.4.0.182 | NOK | http://autobuild.buildroot.net/results/9ef049dba3ff2192e4dc2f30c704628851723d1f/
       sparc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d3760d7571a616513e56534e15361a1fcf1b4c15/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/3db2676465caf1c810710173315f9845d115195e/
         arm |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/d67704e8479eac4eea063db738502bb186103c3a/
        m68k |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/95863ccd05029d3a9de5fcf790b30592d8a1c13f/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/247fd26b3f7b53eb36497e3ce2de91084efa4229/
        i686 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/d897a94a8b6a52eba03d04c24536f554a7643000/
        sh4a |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/02ec6d21d6204d51eb96550b8b80f2da0985c1da/
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/f144dfc701e78a2e87f313193b5bcc5eec24e5bd/
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/735c65c283a92ea95b1a128153c669efc5b4265b/
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/ec8a39461ea13a8ad6a80153f6d16d7c66556e52/
         arm | sunxi-mali-d343311efc8db166... | NOK | http://autobuild.buildroot.net/results/5a50be9feeb5da7694e9a42f615f0b7276319aeb/
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/b012ac40aad7d437476987c96019f1b1adc2c367/
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/79850ca774b470290e7ac9a120b8305fefcc1f3c/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/0d5c5f20677ae846ce0e1bef4bfff1f8cfd4f288/
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/b46b119c224c7c155a0e841c4a3708f0e3a3256d/
     aarch64 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/18341ccddf1dafd4366457a7405279459bb079dc/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/de0bf9113847b66507fff1080981ff8d6e7261d1/
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/4d91521378402f3f5b6402ea453df4c14c391bdc/
         arm |                 upmpdcli-1.1.3 | NOK | http://autobuild.buildroot.net/results/9b82f6b68b09918dd926692f7c5aea874793d294/
      x86_64 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/b2baff023c3295bb3211bcdbde58ca93234506ab/
     powerpc |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/c88f3bc188aea40776b8673cb6bbd04817624bd1/


-- 
http://autobuild.buildroot.net
