From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 08:00:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-10
Message-ID: <20180411060023.C45B82075D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   4 |   0 |  27 |
      master | 194 |  78 |   0 | 272 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 1 
         libcpprestsdk-v2.10.1 | 1 
                    links-2.14 | 1 
             qt5location-5.9.4 | 1 


Detail of failures
------------------

         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/3da1802e62439bca7b335a7c8eff730de6034a5f |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/3882800dd1d5f15bd4154b3c0b13f20bbe1794a9 |     
      x86_64 |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/9d64c88f2a95f15f7c18486c5d76a5b5cb2fa193 | ORPH
         arm |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/186b7facda62824776c77e1cd4a583a996d11242 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  zeromq-4.2.5 | 21
                     lxc-3.0.0 | 9 
                   flann-1.9.1 | 5 
host-imx-mkimage-imx_4.9.51... | 5 
             expect-2014-05-02 | 4 
gst1-interpipe-10dba89eecc2... | 4 
               libglib2-2.56.1 | 4 
                  host-go-1.10 | 3 
           libfreeimage-3.17.0 | 3 
                 mplayer-1.3.0 | 2 
              tpm2-abrmd-1.3.0 | 2 
          usb_modeswitch-2.5.2 | 2 
             amd-catalyst-15.9 | 1 
             bluez5_utils-5.49 | 1 
                  boost-1.66.0 | 1 
            btrfs-progs-4.15.1 | 1 
                  cc-tool-0.26 | 1 
                    efl-1.20.7 | 1 
                git-legal-info | 1 
       kompexsqlite-v1.10.12-1 | 1 
               libcap-ng-0.7.9 | 1 
                  libkrb5-1.16 | 1 
               libupnpp-0.16.1 | 1 
                 mesa3d-18.0.0 | 1 
     toolchain-external-custom | 1 
                   wmctrl-1.07 | 1 


Detail of failures
------------------

        i686 |              amd-catalyst-15.9 | NOK | http://autobuild.buildroot.net/results/de818f6e4c8e63d5e8a49c445d10c34eccc40410 | ORPH
    mips64el |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/fdf6ef557b0e08a6933461de153516c649cec3b0 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/063cd7c2f08606be8899bc705ab102945f37c99f |     
        mips |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/976b6b54e1e10df0dfda39505c72b4c0f402991f | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fe9a2361c3e017efe7e4aac693f4e2e81988d9c4 |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/5d9489d2c9c6afcc98f177169c65339bc82faf61 |     
      xtensa |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/fcee0e3d7eeeb373313b1794092c729b1b052348 | ORPH
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/70adaf9629b3d1efdefbd060b24c40db9699291d | ORPH
         arc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/15c7344ef0d931fd22a5ed24433ad18f169238b5 | ORPH
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/b144d79879ca68d8eb7a45d1f24a172cbcfb8698 | ORPH
    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/e287749fd8c990919a51bc15027b67b7cace25b0 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/c49d1bd402b29c4160935441a9ffd3a2664cd7ba |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/02211003c634325c1306f667dbde8e137db976f3 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/1246e867c86b85049681a66eb4cba8bf0424ccc1 |     
        bfin |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/8b0f4bf0859a4df98d50ed18e0789c5c577cd78b |     
        i686 |                 git-legal-info | NOK | http://autobuild.buildroot.net/results/b3e6d28307ef6283d76fdc90cfed6bd16e79cc45 |     
         arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/2c5b3fb4ddd4cde5f41df01c3ae9f66189f024c3 |     
         arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/04c79c01516d465802af1952530efe187e0eceaf |     
      x86_64 | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/6f6ce571b81375e5c6b2b31a6ce8f8324e25e75c |     
        mips | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/ef25cf8e08936160da889ce574011a523e578967 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8daa380be9956da1dcc53108dc4c25505d3466b3 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5538a36c590c09614f28fb0f47b80bc1d615d0cd | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/476ddf260b693361f663ac5a7488badf4cc5fd36 | ORPH
     powerpc | host-imx-mkimage-imx_4.9.51... | NOK | http://autobuild.buildroot.net/results/85b4ab23bbc38c7081d5244cba4061a4ecb2948e |     
         sh4 | host-imx-mkimage-imx_4.9.51... | NOK | http://autobuild.buildroot.net/results/847a6f3c2800e2ef85909454eb987b72eac55ae0 |     
microblazeel | host-imx-mkimage-imx_4.9.51... | NOK | http://autobuild.buildroot.net/results/12344d940498be329e19a35f1a90350c8a430e8e |     
         arm | host-imx-mkimage-imx_4.9.51... | NOK | http://autobuild.buildroot.net/results/cca71b404da70453e57b1c365b686b262dfc4b64 |     
         arm | host-imx-mkimage-imx_4.9.51... | NOK | http://autobuild.buildroot.net/results/f5c032613834a0d579808ea180711557901ec413 |     
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/3af5fca3320be9247ea2858d8468f079b6904cee | ORPH
         arm |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/6132f33fb282fda3c39deb292784b9006c9e7872 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/effc49285fff049c79369be63d74384950ac43a2 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/25276b9e49fb765f060d5f666b44f92696da3d3b |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/974833cb6d5fba0bf0bfbb277d3e2ce451ea05c0 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/690ad3caf307e0d842e30f7ae85e409e40dddf8d |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/b041201b990408e335bc267e15baf4526336a1c8 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/75a458236979960f3ea23405034b2835da5d05dc |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/caa31198e8ec0f0861959bbd115631b8014f73d8 |     
microblazeel |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/3111ee83b06f4dfb82eea23244dbba5444c13fe7 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/b00026cc8f91e14947b7306a2414d9ff6eafba19 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/38a87451ece86b5ae3e40dd7bdd2805919475d64 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/670a8a9fcadccb4bcd01e116f07d13fe006b31e9 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/792ac6acdb1c3eca74f8d235dd1b990bdf7f9a3a |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/4e78617bac6f99bd16f8c483aac1b86e25015612 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/94c0908e00be903debf322f2e8f782dc5c559350 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/52bd3e8d4431af6497385a0f985581fd8219819c |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/445196a1301b1536295611d7cdcba7e01829194a |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3112bf4170ca8ef29e5888341ed488cbddf0a490 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/e87b60c3575b9c7f5a96cdb09d871a6b8346b84e |     
      x86_64 |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/8845ff0f28d3273ebe884126b85cd7c4a905d81b |     
 powerpc64le |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9bfebf6e85f7747374d383439866d635a9e30383 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/46850808e830c25e468cb5f2a07342724dca18f2 |     
        m68k |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/04592a1b09bde11c6351343e5fcb563490ee6aa9 |     
     powerpc |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/8c9441e73ec49741efb90ba6a0a451c5d46cd419 |     
     powerpc |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/51b70cb900969aca93d604282a0d28a915d25c0a |     
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/41149c1ed203e83873477ddbf02e9815007c8591 | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/17d906ac66f2a23c6da4502155dd9b3655ed999a | ORPH
    mips64el |                    wmctrl-1.07 | NOK | http://autobuild.buildroot.net/results/f692cd048e1596cf96a1edb3a55126c170fde1b3 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c505229a13a63c97d22ddce2d493717bb92e96be | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a14aeae37c4af76a29d5c9fb6ea3c2c4829234b8 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b1f7e7e9d5850409b153e9824d34b531a7cc4126 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a4ed3c98a68a9d61975369a3784b7246cd2350b0 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2ec073c449550fa7e7395f185760722127d23064 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/590ac1d77320b0c526420be8545a3b2c35bf083c | ORPH
     powerpc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/734597e3ddb84ae6cc3b26c85f07905e297723b1 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3841ce5fecf6fcdc52048123094ad61a14287c52 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/5b99ca1bd656261671c51c1c6f6f2237623ea148 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/5a949b4304ef970bb8081520f332571b90c17676 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8fd749744451df7d72a907b456f2ee7c5e029ded | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/015a58ce722e0aadc9de73bdcd2dd94e8d6eefd9 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e4af0a1b47aacd3ec8fe678641fb8abae84aa4b6 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/fe63df9347855748ba425ae6b137f517910c894b | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/04f6878678594569b63084ce5cec2f4b571946b2 | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2bbf6183493878106e26edaf6981179a109ade53 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/1fd78a4fe9f5fe7b4f582f61eb10dd73de5eb34b | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3003698dcf17608ef54c46b989c76949d4d657cb | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4fc5f9359ae82e9cc43a5f8226de91a340f8cf3f | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/9b88478b988879ef20ba54af932a5b215895befa | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/471a2a0a81af0b4a4079401cfb51139da5261492 | ORPH


-- 
http://autobuild.buildroot.net
