From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Sep 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-05
Message-ID: <20150906063018.A789D10153E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-05
===============================

        success : 274
       failures : 82 
       timeouts : 0  
          TOTAL : 356

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 36
                     gdb-7.9.1 | 4 
                  libssh-0.7.1 | 3 
             alsa-utils-1.0.29 | 3 
                busybox-1.23.2 | 2 
                    ustr-1.0.4 | 2 
libsoundtouch-010a91a59071c... | 2 
glmark2-499aa81a68fb4c8aac1... | 1 
                   dhrystone-2 | 1 
               dvbsnoop-1.4.50 | 1 
              wireshark-1.12.7 | 1 
         conntrack-tools-1.4.2 | 1 
canfestival-7740ac6fdedc23e... | 1 
                openntpd-5.7p4 | 1 
              memcached-1.4.24 | 1 
             ebtables-2.0.10-4 | 1 
                  libsoc-0.6.4 | 1 
                   hostapd-2.4 | 1 
xdriver_xf86-video-siliconm... | 1 
           bcache-tools-v1.0.7 | 1 
                 qt5base-5.5.0 | 1 
              drbd-utils-8.9.1 | 1 
         qt5imageformats-5.5.0 | 1 
                minidlna-1.1.4 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
             bluez_utils-4.101 | 1 
                  udisks-1.0.4 | 1 
                      pv-1.5.7 | 1 
          modem-manager-1.4.10 | 1 
                  dos2unix-7.3 | 1 
                mongrel2-1.9.2 | 1 
libubox-e88d816d6e462180f03... | 1 
                   squid-3.5.7 | 1 
           libfreeimage-3.17.0 | 1 
                coreutils-8.24 | 1 
              lbreakout2-2.6.4 | 1 
                libldns-1.6.17 | 1 

Detail of failures
===================

         arm |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/7a5341c3cb12d89663208c5e07d7829484d28eed/
         arm |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/6e2185ec956a632b5a759105da20f61cfa909295/
     powerpc |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/e6bf495a4eabde73f75982f60bf73f437be45698/
         arm |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/5b65d711a4e70348b110d412a2e25b0f8726a953/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/63a0d19845c91f0632194732796ed9ee1fba85ff/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d83826c56ca3300740ab9bd5224ea1c635e4ede9/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9ecb3be0f46d61a1b9556ef69e196247717e526d/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/ccf81a80945e601968e1125dab49bc17ea29a6c8/
         arm |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/0d386cd612112ed121ad842f387a8025a3fc2acc/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/ffc0538f40508978e398de1ba28f3a10641c57e0/
      x86_64 |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/7230d38cc35b6a45cc3968f38afae39bc671631c/
      x86_64 |                   dos2unix-7.3 | NOK | http://autobuild.buildroot.net/results/92289b63ebdf133ab910f058ffca8ba34e574208/
      x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/353084621898e9e73e3fde62ec11863d2cf82443/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/7e7f63d65cd2d8b6f984dc25c4d8d5fd159d6bc6/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/9fcc45a090935e2f9ff67c2a31bb20a4cc27d28f/
     powerpc |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d814f16fa226474c071ecf6e3c67829225667a63/
        i686 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/4b35845b96a246264c96d32c37c05caf2948373c/
     aarch64 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d805bb7cabdb54ceba00413109025bc18a917a5b/
         arm |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/042027d63ccaebcf75f4aa67aafb8aa3eeff82a1/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/1f6853d5f7a83be60ccdf4f071a1df1491cf8137/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/317c1da5864b4cd288ca4106dd380a6f42deee08/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/2af5f2e10d51b619d8cc54d2a6d517cd6363d420/
        sh4a |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/37a76781624f37601f1075aa65b039204c36e95d/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9ab7c59e9d3ce4a680998efefaacf4ac9673c63d/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/aa4fc224009922948eb2b25a84eb8f2706f5fa88/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e040c3feb16634dbf9a57e0a5763be10ccc97998/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a92efce7a038577dd552e0cc1de81ad04d6cd0ad/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f32ef39fce5e43f3d963f747e92d0f89ad31967c/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9999cd7d77784ae090f0555c5a0c576d04645b91/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/577fe736f61d6e55574a291d87a97461349cdd51/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f7228c65c05e73b22ae19f41d1930e11b2f807f9/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/baeb70ce8796b85e33035ff43c7c6f7615445f87/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/dee1326baf26ad1eb6e12a7d033428eca50d00bc/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/fa5e386f66b749c60cab5edfd47c59eaa5ab83e7/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/cf9572244055eb645419f30569bae637f49b0984/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/c7855010854c68dc72608ad8b2054b509797a165/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/6bf2f52f3e54199c56848ea965faa651a3090779/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/5db1596a4e00217fb7a9db3b4c2538665b1e052d/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/43427eeea7bacf8f883cfd0ef7463b772d749c48/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b747faa4dd03a18565624755722549055238f36a/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/7818ce58f3f3f73151e4450151b07b4147e8df74/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/eaadd0aaa4ed282dbdf6caa290eeec9d4107321b/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/262634bd77af47f6626907d1eb3fd3c07806632b/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/16247d5232399184b3726d4e878b5a771ced82ed/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b22f823e1d288125b4f8eb1093bddc3ea19d1c4f/
      mipsel |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/db13cbae1c2c73985a9cf7247c74c048c7f4dc03/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f08a20b4742c434fc1ad2de025c48dcf28546030/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/49ce1d4aa81bace8b3d2edce1e0e2c696504cbe4/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1e8e45c45eb9bbf504ecc4972c030a9c3bdcc3b7/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a1fac659a62d87daeca7ca261f6aac5c2d9287ce/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/110625987505ce519ebfa1642a1eed4ddc5175c3/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/33fa2ba8cd8ff45967d3f2fe6002ac0b737f0070/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/3edae266cb564e26ad5404c0b7f1bb7f796ff812/
      mipsel |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/8bd80c038e93bb53ec75c845f44c960231b37c34/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/ce4b1f343fd492980ce2e02b864fb56a64d6aa98/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1bef833468fe3f11e2052cffc899eb44fa7e124d/
      x86_64 |                    hostapd-2.4 | NOK | http://autobuild.buildroot.net/results/37c2af0daf9ecdcb071d89911e41a92589c0235d/
         arm |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/e519a8357707c076ee022be22f70696c3cc8629f/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/c5ad738fcada067fb82f3a965f12c58cc63f3d45/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c63966ddb36fde6beb730672d77f53e5c321cc27/
         arc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/56065d572da580c9ecf664f9f5c195aeefb4ea56/
      x86_64 |                   libsoc-0.6.4 | NOK | http://autobuild.buildroot.net/results/9f907c4ca6d6d9ec410b4baa486fcb13f51b3140/
microblazeel | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/48407da02451382a1cf7e0c16efa7db8a338ded0/
         arm | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/798f103e066f94314e5664b8bcad7337e40a3fd7/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/46ba6c915dbf9176ab900864202f5b136f31a015/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/40562b1b68bb7c57a37907eb16fcae88448f5bc6/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/7b01be4d3e708faff89574c77bcc41358d3479a7/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/0bf4f933a4654fcf6acddb6511dd429e08529e59/
      x86_64 |               memcached-1.4.24 | NOK | http://autobuild.buildroot.net/results/82ff71dcbcef17e4e274181f9f1db1a467df9783/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/3c8b5048f38d934f6b47f0860307247264722cd5/
         arm |           modem-manager-1.4.10 | NOK | http://autobuild.buildroot.net/results/d597a81271a082c8252e2333906815c437b6576d/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/d997f0404301e73ccc6ac05619e0829cde0f2a2c/
      mipsel |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/b120b6da87ae4eb355d06f2fd8f4fc8050410897/
       sparc |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/d7ed84e9ad37a7398716006c5e365dde55d7f80a/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/2245e3975f98e440de7a38e3176b806d134f1619/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/d8d5048d1d0abedde6ba78141c49351cb9f88dae/
         arm |                    squid-3.5.7 | NOK | http://autobuild.buildroot.net/results/77f81d7edcd4f29276fd01ab2dc45d7d231e9c67/
         arm |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/04ca04cc236195a48fcdada145d6b3e1a3965115/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/190c2dd8ca6d359788e843d9190c53e6caaa65bc/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/27dc58a8e2eef3a3e0351f739e9c4654cc9c3c37/
         arm |               wireshark-1.12.7 | NOK | http://autobuild.buildroot.net/results/92afadb0f176776243b23bca490a5265c643b1f2/
         arc | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/5072e6e90789b2f98ad7213469481b68468f6acb/


-- 
http://autobuild.buildroot.net
