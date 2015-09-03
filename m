From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  3 Sep 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-02
Message-ID: <20150903063018.7246810176C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-02
===============================

        success : 249
       failures : 85 
       timeouts : 1  
          TOTAL : 335

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 25
                  mono-4.0.2.5 | 4 
                 mesa3d-10.6.4 | 3 
                mongrel2-1.9.2 | 3 
                busybox-1.23.2 | 3 
                  apitrace-7.0 | 2 
           qt5multimedia-5.5.0 | 2 
                 qt5base-5.5.0 | 2 
libsoundtouch-010a91a59071c... | 2 
                     gdb-7.9.1 | 2 
               iptables-1.4.21 | 2 
                 fio-fio-2.1.4 | 2 
                libldns-1.6.17 | 2 
                 dropwatch-1.4 | 1 
                   systemd-221 | 1 
                 lvm2-2.02.125 | 1 
                moarvm-2015.05 | 1 
                  boost-1.58.0 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                   bdwgc-7.4.2 | 1 
                  libftdi-0.20 | 1 
 make[1]: *** [all] Terminated | 1 
                  c-icap-0.3.5 | 1 
                   slang-2.3.0 | 1 
         conntrack-tools-1.4.2 | 1 
          openpgm-5.1.118~dfsg | 1 
xdriver_xf86-input-vmmouse-... | 1 
            ibrdtn-tools-1.0.1 | 1 
                dbus-cpp-0.9.0 | 1 
                directfb-1.6.3 | 1 
                 libusb-1.0.19 | 1 
                   dhrystone-2 | 1 
ltrace-c22d359433b333937ee3... | 1 
                  libssh-0.7.1 | 1 
          sane-backends-1.0.24 | 1 
               ibrcommon-1.0.1 | 1 
libyuv-1ebf86795cb213a37f06... | 1 
             webkitgtk24-2.4.9 | 1 
          libedit-20150325-3.1 | 1 
              drbd-utils-8.9.1 | 1 
                nodejs-0.10.40 | 1 
                  guile-2.0.11 | 1 
                 setools-3.3.8 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
xdriver_xf86-video-r128-6.1... | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/dcdfb048f1888b9dbd242d65c08a7def46596ec3/
     powerpc |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/18ff44bcf7f644eaac0f122d75221693a02e3cec/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/942c8836d363c9b52b603865f2a529f5fb5961f4/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2ea46543f22bf7670d91b67cb17b8e6e4e5cf414/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4135eaf5a39ccce069c230a78c922b164ad27bc2/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/078ecb4f31fbadb88cb56057ecb3823b0502f034/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/cea9f317a2766f8f77de7075d5b8c68f2fa0ffe6/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/cf9f4cfd68b8aa750fbd24799f7bbcf735121cd5/
      x86_64 |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/4484477a47d95597982a0fb628969f7bb6a3861a/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/1a60a50af3010c386e1540f8b6ee0f38be9ac2a9/
      x86_64 |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/1db8550fe949fa94f915380a55fb098369df1b33/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/44a5749479ecb5a6dbbc0f420d45bb6f8cd355c4/
      x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/7887a228b039a202932f3f3b041152504cc6f6eb/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/8e518f80edc06f2a06bc771baa04600b78239bbf/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/dacf0f300638378a742b09d7c567e9df0e1ea437/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/76cff391a1a09fdb9410d2ba614711f379809954/
     powerpc |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/06be21a5736b355b76694bb4870f1758f29aebf6/
      x86_64 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/ffdb85dd1925b8d9c98e53edcf2e241e6cfc1b49/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/97aaaba3bbb39039221dff56de5b0b3dde2cfd8c/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/99d74e2916e5178e6ebffe579cdb095cb22e1521/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/3de03795ad8384a5408f3e8862527d509942c7b8/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a62f5c05bf8deb180b2acdb9e31c1547fd03665c/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/97fc68f90f03949f31641638f61e93abe56588e2/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d384554615c9a55e0183b0a40c23065becfd78a2/
       sparc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1c53e22d7f79238bd41244ea728085bd3980384f/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/112ac7f89f0ff2105a5a2cd5a3fbf83fe408c2fc/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/00811a3548b00b2267c7ed565002b82f66dcab02/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b521731039796b460d497fd8414be47dd1865f60/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/7d61cead6b264f1cfd375fb7417d372b6af0a7f3/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/0d8dd13afa8361ee89f31fcac5f70b99c2699cdb/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/4085110c1faec2b5b630450eee1dad09d8d98783/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1c6826eabf02c5085f8761894413c609e61199ff/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/63cdcefb86a8bdedcdb8706f3c524b4b7df8fb7d/
        sh4a |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/2e4c723383c6203414973173c18bf588e80eb523/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/67264e4c10ca7ea7405f58c86423e42da68e5227/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/7775b444006d83507dac572a2a8db0cfd2076716/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9d11eefe856bfae3048fd424fdf470af55080df1/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9f877053582ffb9053fbbc7e44fc10d5c039620e/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/3325494d26055503f6b8ca9a66102ca5cdefa0c3/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/4f7e7dead62f82bca8c82fd8af38a783b82dcc7c/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e2e99d991e93ed82cd38fd59b843b858fe713662/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/0a257088b1be07e4f93d951e1b5e414319bf667f/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/79a47f996fbfb3832e323d2175658914a6bb3b11/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/80cee910570e672f825657117abbeebb7fe10aae/
      x86_64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/789216b1a85765c245a9e71c2c06ef4b8fa12499/
      x86_64 |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/edee58f399d4edc0e2349df07e364c40953a1f7d/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/de3a3a9772f01727f093f7a5699d0952e526f1f4/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/dd8829c614bcb80811d67f16dda56461d51c4077/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/d944799a6ae0bc6bcd6ccff55369656001537c3a/
      x86_64 |           libedit-20150325-3.1 | NOK | http://autobuild.buildroot.net/results/a30bb1423cc92137a2deaec0a32c7df947384d49/
      x86_64 |                   libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/43c349d2546ccf35c123c45a73799aa66f128aa7/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/90893b2cdbbc02d75be5cbc09b8a244d5b05d386/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/2117de3dc3d1168bdba0c771b54b3d998e3d62ce/
microblazeel | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/32b9512de01af6417d2db668dc2d75953119f8ab/
microblazeel | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/be1b69d0394de37615d3a3d2d4c4e25125b71ec2/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/718fdc0e5c67fd5cb1bceaec97f39285c159fbda/
       nios2 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/990188699171aabae522f95180f8d07953df2d41/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/73a026644179708692c43166a8ffba3ce0e19d95/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/3afdabaf34387bd2ae7bdac8373e6a661bff8c16/
         arm |                  lvm2-2.02.125 | NOK | http://autobuild.buildroot.net/results/621b3b6d2330fe41f5f890c349d13a8ff79e9f7a/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/168693724d47251297207829dae9f43d75b87de5/
       sparc |                  mesa3d-10.6.4 | NOK | http://autobuild.buildroot.net/results/d23b12a8866d4cecdceaf2d77ad220b617497bd4/
        i686 |                  mesa3d-10.6.4 | NOK | http://autobuild.buildroot.net/results/199490e237da972006b04f137150c551709e3ccf/
         arm |                  mesa3d-10.6.4 | NOK | http://autobuild.buildroot.net/results/6a66d0e6adf74a653167b536b957a496fecaabfc/
       sparc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/ce94a28d2706a4bb4b5d389c41edd069a3e14bf5/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/a4c6343f94bbbbba6da65f05a55b57a3858ff1e6/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/14c8579b0f7a5be6afdd1b8b2fd2f035868f0325/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/73c87b4e6f074b5cc6653e37cd3e6bd4813c833e/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/1db5cdbcb3bb8565e616f2a8d1646a480b69582c/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/6a7bab951b37c8940a93966f0bf6a1daf5738307/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/631c93022382d21929f6be3a942db1fbb1fd4248/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/ff0465a3917249c17469757fbf2c1083bd12b1b1/
         arm |                 nodejs-0.10.40 | NOK | http://autobuild.buildroot.net/results/a3076e07607d2fc8061d8d6e89be1d7aa6e8cb9c/
      x86_64 |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/909070e5ee210bae09bbac6a6ee7559f88160094/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/65ac79fe0d23acebf41b75b8245edb217de24c92/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/95d704ea893eb74b855857682f4a601509061a38/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/2bbaf922e54e104a566d814c32ff8502c8325586/
        i686 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/821bdf4183711ed295a8c00f34bda4e2e6234373/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/fb6fbb370467319ef3b9da91c2f1024f27701b24/
       nios2 |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/b7878359f49a6b6ad80255318045a0d85c1b502b/
     aarch64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/21561c57ec9c79f34cba1967784a3387fe86bb3a/
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/5fa80cc08e674b848df59c60ae9a70f9888a2ccc/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/1bc6d55179b5f866df21bec6c894a182c85cbc8b/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/47b9df27b74f72f51f2261d80a87453c91887879/
        i686 | xdriver_xf86-input-vmmouse-... | NOK | http://autobuild.buildroot.net/results/7f79ca6a35f405b56aa2d619a649ffb367da7790/
         arm | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/5bc88b06f77189da6c24c12c3403c88863d438cd/


-- 
http://autobuild.buildroot.net
