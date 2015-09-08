From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Sep 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-07
Message-ID: <20150908063019.593E81015AE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-07
===============================

        success : 237
       failures : 69 
       timeouts : 0  
          TOTAL : 306

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 17
                  mono-4.0.2.5 | 5 
                 mesa3d-10.6.6 | 4 
libyuv-1ebf86795cb213a37f06... | 4 
                busybox-1.23.2 | 3 
                coreutils-8.24 | 2 
                mongrel2-1.9.2 | 2 
                     gdb-7.9.1 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                directfb-1.6.3 | 2 
           qt5multimedia-5.5.0 | 2 
             lttng-tools-2.6.0 | 2 
                   nginx-1.8.0 | 1 
         conntrack-tools-1.4.2 | 1 
                     nut-2.7.2 | 1 
                 setools-3.3.8 | 1 
                   ntp-4.2.8p3 | 1 
                  autossh-1.4e | 1 
tvheadend-d9cf931f9f7242f07... | 1 
canfestival-7740ac6fdedc23e... | 1 
                   bdwgc-7.4.2 | 1 
                  guile-2.0.11 | 1 
                libnspr-4.10.8 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                   systemd-221 | 1 
            ibrdtn-tools-1.0.1 | 1 
                   zmqpp-3.2.0 | 1 
               polarssl-1.2.14 | 1 
                    ustr-1.0.4 | 1 
                   wget-1.16.3 | 1 
xdriver_xf86-video-siliconm... | 1 
             bluez_utils-4.101 | 1 
                 mplayer-1.1.1 | 1 
                libevas-1.7.10 | 1 

Detail of failures
===================

       nios2 |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/cb490d909aca90f859fe42679e467873553843eb/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/6792b6f2f8122a599f6d54f139e7546376a36bd2/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/1401065004fdde614a2d54ad6c6ec22901c1066e/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/269be446084152811b151cecbf15bdc6481b3eb4/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c2e7c60a3d9474ee2e662e89dc05a328be601af6/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/53a145abe2b4868b8f973780b9ca608eba552fc8/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/7d6e70cbfb58e4c8a503e20982d748c3752de9e2/
         arm |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/a50e9ed568b3ec5959e88568804af5eb9cb3736d/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/6dbf6396fe5fcc17160539f27fcd4c81f53e4404/
      xtensa |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/6527e8f04006410d9826e41e2c3bcec3546a2108/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/6b708d1a14a99bb3c484e2206bc76cdb4d11e86b/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/0b074528ed0808af29a16098158bb3c242a308ab/
    mips64el |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/dd50ed99abb2c8495def826866b184030953f90e/
        mips |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/95ca9072419088a005c9a73af7cbd353d6ff9328/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/9f6b9d2c244fcabb4dbd406817dd216532f7590e/
      mipsel |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/cfba82fde08ebf3822a82f816678f80efa46d2ee/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/8ae2b87b570cbc649b502633ea5ced7d482402bb/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1835ba61cbe135f91e8b11ae09b63fe055a82ebf/
        sh4a |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f56d1b42f102f8364220e5ad17cadbb6c1863c25/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/cccf2d02da56c7631ae74eacc3d8a1fc18b6a492/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/11d5256e9fc5406ca3605ecda3bf860b198d9f67/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/c1976a71fca4f5dbac572f43a8a7b84dfa43ba03/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/db68b69d877cf49ad5f7b92c7a2e338eba95b3f4/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/917ed544787cfa7ea66d0e64e08e249b5fa65e37/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e2d186a3a83d42a638673518d4c9d0c64e7ddd4c/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9a718db6aca474f61f820aca3b38c91901bfd3cb/
         sh4 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/23f08056f4a90ae327675e28fe560a84d529bf44/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/5c48953245c8b4cd8de85e737b74e360ab023323/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/88d3b675034b6fdf44ff5c5fd6e6b3b65466286f/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d7247c9b3e2952d4d040aa3ef502c2ab28ee9123/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/7bb80965587949433c835761ed5f68d8cae5d2ed/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/78239b196af3ab0b28beb5afc593966421c725b1/
     powerpc |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/5896a8a80e0fcee40c53c1432e820d148a450584/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/3bb867ebf25d1008af1dafebe248144f33507eee/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/f8190352696395d79d35596cc43a140569c64628/
    mips64el |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/7f2baef97c4ff3b9111becc1e0b79780c6e9db6f/
      x86_64 |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/979681ccecd38542d19b07a76f9a88850897e0a6/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/9917d7bb18305c6a6bcbd9fe2aa986d452f7d4a4/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/7f3a09157c4c385434458b6aafec202376e75706/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/ec23033c6bbbbfd8314bd55f514ad5fcb3542c17/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/c8d9bff33484b598ff85a26771ce51295bec550d/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/c4b2322d1ad9f48e5a88bbd808d3ce8f532522fe/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/87e169e31a12e0fcebffe4c9d47074d112f6a168/
        i686 |                  mesa3d-10.6.6 | NOK | http://autobuild.buildroot.net/results/5bed7f1a09fb76a9998b02067fc41783fc788525/
        i686 |                  mesa3d-10.6.6 | NOK | http://autobuild.buildroot.net/results/5ebb32c40a3bfb61d217b1facf992b75f2045076/
     powerpc |                  mesa3d-10.6.6 | NOK | http://autobuild.buildroot.net/results/080e979ab401543efee50499cd0063c875554490/
      x86_64 |                  mesa3d-10.6.6 | NOK | http://autobuild.buildroot.net/results/8085c9be955fd6cbc25ddcd6998244779d9e36e1/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/1e7ccaf75c5adf38ab9765977b8d899ac16bf163/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/166910e26c26d7d0065361076b1a2bf23b0f7c4e/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/8f61281f1d0d5b416127ee8a7fa015174e74896e/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/528d0889a65527d4380b9cda336bdc69b0bcc5c7/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/53e8a1a74133f82ee44f1ed977709891f3914695/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/86b09bd3f735ee155594b8afeb6ab63aba5da949/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/13158989f5c46cfaf4bfa91280f8b7dfd91ec3e9/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/13f9c227be6eece782426bf6e3acdb8aecaeaaca/
       sparc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/a2dc63e688a9847ed256965a99145463c30537d9/
         arc |                    ntp-4.2.8p3 | NOK | http://autobuild.buildroot.net/results/6f50869a0ad5c0912c779011d1f534d10c696142/
        i686 |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/656554d10dc67146c30361301edd7d3f9e74fa26/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/e10313336dfa621e30b6657420e0543031a25e5b/
         arc |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/98f5c9153095acd1d2798735efd5ef473d22cbb6/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/9ad50912c4614dd8e36fe6e3377843d1bc784b77/
     powerpc |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/da58b1afe4671084347d8262716aa0bbec2e706a/
    mips64el |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/1196ac448c77320b59b63b6133d2d1af1245bf69/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/a7f1de8d3bc080c286b6b0146495db218b4ce8d8/
       sparc | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/04d81dfd2617ec1a1820efc80f18bfff8931c0aa/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/72b181b14c6e03e9a05d4d2c357d7060158de908/
         arm |                    wget-1.16.3 | NOK | http://autobuild.buildroot.net/results/540b5f0a6e0d37f07647e927c3219c1f1b3fa2d2/
      xtensa | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/581de6541e9764957c760301c0b2f4dc90603e06/
         arc |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/591ce700b6c67d6442ec9261982a7893b00ae22f/


-- 
http://autobuild.buildroot.net
