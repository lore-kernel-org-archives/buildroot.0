From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 04 Jun 2021 05:47:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-03
Message-ID: <20210604054805.05D646F935@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 64  | 20  |  0  | 84  |
    master   | 56  | 17  |  0  | 73  |
     next    | 21  | 75  |  0  | 96  |

Classification of failures by reason for master
-----------------------------------------------

                  lvm2-2.03.12 | 5 
        host-sentry-cli-1.57.0 | 3 
             host-lvm2-2.03.12 | 2 
                 pixman-0.40.0 | 2 
                   gvfs-1.44.1 | 1 
                host-odb-2.4.0 | 1 
                 mesa3d-21.0.3 | 1 
                qt5base-5.15.2 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/ee41d08b0da1a85f361dc00c59963c5ed4b8afc5 | ORPH
   mipsel    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/76bcf4fae96f66f5101e59891b9ae2b738bdb975 | ORPH
   sparc     |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/42cf0b36aab8287fae9ae5fb5454aba5a3996eb1 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9cbb8be7a1d8ac5913fbc5e2a78c4c45b5daf8e2 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d9e7cb8d40b2f086ddd5aab91d0fac40b988b415 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/42621d7faee3ff4a4fd307e405e74dd0cff552a6 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4a38a2f97a8f1ba534c3205023ec880904a4ce64 |     
  aarch64    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/14f15fa800344e1c71319d9fc458a5878fb13043 | ORPH
    i586     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/47bce36bf5c2fcf03f1cdf71661a70ccbcbe2e26 | ORPH
 powerpc64   |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/d4f37038768d33774160d4aef0b42e75377633cd | ORPH
  riscv64    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/02c4ca92f33c71fecac5b73f4facd245f5124b1e | ORPH
  mips64el   |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/7afd87d5f71486c4dd84d680efb4a9cf3f96ce8c | ORPH
  aarch64    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/1e708115ab1c316516c2f8cb478500739a7fd942 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2be3e9fc884981520e677d0a12ae9d2c3e53b55b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/47fef9e6ce677f31d50eb57f432b9669e1974053 |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f0ed2697a0b7093473b7f132975784405119dd44 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/1f2b08627afefa63bb55f7662c66b031b0a7c3a0 |     


Classification of failures by reason for next
---------------------------------------------

               aircrack-ng-1.6 | 5 
                bitcoin-0.21.0 | 5 
                  daemon-0.7.1 | 5 
             libsndfile-1.0.31 | 5 
             libtorrent-0.13.8 | 5 
                  botan-2.17.3 | 4 
casync-4ad9bcb94bc83ff36cfc... | 3 
filemq-8940f34e0f1c8f25c1c6... | 3 
                  gnutls-3.7.1 | 3 
                   gconf-3.2.6 | 2 
           heirloom-mailx-12.5 | 2 
                libselinux-3.2 | 2 
                   rhash-1.4.1 | 2 
                 rpcbind-1.3.2 | 2 
          sane-backends-1.0.32 | 2 
               apcupsd-3.14.14 | 1 
               belle-sip-4.4.8 | 1 
                   bullet-3.09 | 1 
            docker-cli-20.10.6 | 1 
                 freerdp-2.3.1 | 1 
                 gerbera-1.8.1 | 1 
  gobject-introspection-1.68.0 | 1 
           host-libselinux-3.2 | 1 
                libcurl-7.76.1 | 1 
             libfreefare-0.4.0 | 1 
                librsvg-2.50.2 | 1 
                libsoup-2.72.0 | 1 
                 libssh2-1.9.0 | 1 
           libvncserver-0.9.13 | 1 
               memcached-1.6.9 | 1 
                     mtd-2.1.2 | 1 
                   netsnmp-5.9 | 1 
                      pdbg-3.2 | 1 
   perl-crypt-openssl-rsa-0.31 | 1 
                    qemu-6.0.0 | 1 
                   seatd-0.5.0 | 1 
             transmission-3.00 | 1 
                       unknown | 1 
                    xen-4.14.2 | 1 
                     znc-1.8.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/d10fec8378c334e896d9e38afe00193ef747192f |     
microblazeel |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/9bd808faf969d7b56ecc81e8bf00f02bd831b0b5 |     
   mipsel    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/27608efb9c6b2ed975a17df0471f90b0f252e7ca |     
microblazeel |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/01d1219464d562bc5aefd05eead6b7619f25c0f3 |     
    or1k     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/00187e5a803f9d3cc336351881435c8cb959aab4 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b06839f184f861e4f4c5bf256bdf265464f5521a |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/6f7cfc0c0e0b14a72728e669d60299d1b886808f |     
microblazeel |         bitcoin-0.21.0         | NOK | http://autobuild.buildroot.net/results/326f94776243cfe5a61b2c686f6bb36ecb38743b |     
    i686     |         bitcoin-0.21.0         | NOK | http://autobuild.buildroot.net/results/c9eef4b6caf8cd216dc8b5b501fccfd0f9881d40 |     
    or1k     |         bitcoin-0.21.0         | NOK | http://autobuild.buildroot.net/results/375581f102b3a13bec15f049d00e5ccd0a04e082 |     
    arc      |         bitcoin-0.21.0         | NOK | http://autobuild.buildroot.net/results/b0830241500b6aa84925d895fdb373b906ca68ac |     
  sparc64    |         bitcoin-0.21.0         | NOK | http://autobuild.buildroot.net/results/014f1179e23c98d7cb728147137dba69ab0314b8 |     
    sh4      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/d6f11d33c6e7fe0731fc5368ee8d02e700811f1b | ORPH
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/741b3048e53f186c32088cb19499488f54dbd9b6 | ORPH
 powerpc64   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/49cff355e0df7768b7b4db9338af04fdb71346ac | ORPH
   s390x     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/7660461fb8fbf8db3ca6038c4d50657bd31bf65a | ORPH
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/fada2795130b07dcd719820faf9176e708510beb |     
powerpc64le  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/dea6226b22ebe5ecdf191545fb0f2629dbf6a2d6 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/15014162af2e01916ed87950c5a11c22cbe3a935 |     
  riscv64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/d63087b57be30a3a03e667c114cdb7ced0210290 |     
  riscv64    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/995ef1b5d9fce05881b2a41025916fa45b68a9bc |     
   sparc     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/2cb14e797dfb32e61b9ec0844659d45d7447de53 |     
   sparc     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/aba4c5058eb98891d385160f06e13c06517a6e20 |     
  mips64el   |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/98cd9fb348d6cfe676667205b1f79ec2cd1490de |     
  powerpc    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/a7c51e6f59656d8c1e1c82a7129a670a68eb8a62 |     
   x86_64    |       docker-cli-20.10.6       | NOK | http://autobuild.buildroot.net/results/fdb1f5986b0c2e9782b2247e961f7e728f2cf046 |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/b72206c4e571be12597cdbf25162cb8088800b4c |     
 aarch64_be  | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/01fde8571566873fa8c0b6d856309d8093052ce2 |     
 powerpc64   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/e3166cd21e637fed078709bab7e2fbf459dae33d |     
    arc      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/327c6278f161753628e427bff62d27a112511d0e |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/3050560af31c9290dce9b4273731021d52752b6c |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/f5e2924fabf1b29c449d3cf8eedbd58aec1d9b0f |     
  riscv64    |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/7ff99c59b964ccc52eabc7c3599ff291bfb0fb19 |     
   s390x     |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/9ec31793484a69c14a66b7338d795089c07b9937 |     
    sh4      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/37760de7f31492cf589d76b1c9e42697c8d3891e |     
   mipsel    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/6ef8f1534237f2df4cff0a0bc0364fe9a46a5343 |     
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/04d53de1b10da920336053607207c43725b413b5 | ORPH
   xtensa    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/433d444672bb1ee1af8982ed64c78c61a6e32078 |     
   nios2     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/65d6a47d60f1cbdc9f376d924a3649b7520775cf |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/8a21206b034dcbbd617a474da621abd3a933c9e3 |     
    i586     |         libcurl-7.76.1         | NOK | http://autobuild.buildroot.net/results/5328ddb2dd47924ca72a58863afbd04e68874b87 |     
  nds32le    |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/2db73624b7f8379a7df9a526eea5cccca0b04b6e |     
    mips     |         librsvg-2.50.2         | NOK | http://autobuild.buildroot.net/results/426ba4d49a5df68ef55d392d405c37bc7c4b8c16 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/b1412a5264043328a763a255f10e486605ebbaf9 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/d1dd67645fdef5cb29d7bb195cad6e4c70c0f010 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/255ca553ff87bd0a603a01022ad70a6708444dc7 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/607a008aefd97273e24c84d4daa397f8e73c7893 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/3c24313b035f156965301edc4464651a0eabe655 |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/a9036252dc960d05c35e3fb3da92486abec6091a |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/24c1a7d0fbb0c9bf68eb7c9a8f0b9da17e064fbb |     
   nios2     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/3e83a80d921dcccb8b753024ba4a767e247b3f37 |     
   xtensa    |         libssh2-1.9.0          | NOK | http://autobuild.buildroot.net/results/c6e031fca123865138d18c96d895778c03b639be |     
    sh4      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/0e37f43079a7b3a5c11534a1c772fba3270492ed | ORPH
    arc      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/2b45601688ef26ec381dcbe6d4754635381a57e4 | ORPH
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/7235a9043c51a2826dc455fc71b48e896fe3d033 | ORPH
  aarch64    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/f0b6df7d58624d0bc565b11c83c28a5b8c9b6c5a | ORPH
    i686     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/6ce1ee2285c690bb78b1ee75ed26e340c7da53c3 | ORPH
 aarch64_be  |      libvncserver-0.9.13       | NOK | http://autobuild.buildroot.net/results/01a3bf23a4c025b208657be4df0da5fa48a23cbf | ORPH
  sparc64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/0de19710ced3fd7834a220ff61a78773e352b719 | ORPH
microblazeel |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/f1ffcaae43ffde323d22b40cd22668918a53bc0e |     
   mipsel    |          netsnmp-5.9           | NOK | http://autobuild.buildroot.net/results/2f8c1eff3c2b870edc21721c71ca603d19d5d356 | ORPH
    sh4      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/c9483176bc344a0dd9f678fb9cbbef9ecf6eda9f |     
microblazeel |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/c58edcdca6e853db0caf6ede06fb6282b3ac32ab |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/86acc563e274a662b2f5431f94558712175ea238 |     
  sparc64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/6ad690bc4326a6be5e4730c16f3c89d118dc2fb3 | ORPH
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/689dca09471c8c85a63903c650c405f475cc2da9 | ORPH
  mips64el   |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/62b7525fa4cff58f6c2e12edff5c3fa0db8eb60a |     
    arm      |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/98d42ee100d56cc80e709c22b20aa31cd86b7670 |     
  mips64el   |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/f4d15713f437d2f71fa86a6f5e9be3a1c1fb01fa |     
  sparc64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/c2d424b683af5afdd51897b9aee93283ed7ba7c9 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/0cb91122b3f117dd27cf4f7dd571ffc91a97ab22 |     
  mips64el   |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/498c7510afe79b327ee9c3ec4e986b8116ecb83f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/146a3328d44437197e8eaecc54c53003e202e469 |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/4bd2a2c84034fa758a437bb2f17e8ec976fa7dfc |     
  riscv64    |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/bb252e16a3b9972048a855fd81ca79fedfb36824 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 2 
        host-sentry-cli-1.57.0 | 2 
              asterisk-16.14.1 | 1 
               belle-sip-4.4.8 | 1 
                 dc3dd-7.2.641 | 1 
            docker-cli-20.10.6 | 1 
                  gensio-2.2.3 | 1 
           host-libcutl-1.10.0 | 1 
               host-llvm-9.0.1 | 1 
             libopenh264-2.1.1 | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
           python-pybind-2.6.1 | 1 
                qt5base-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                   strace-5.10 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/ea0fc4e8d707c79e94efeae517f55bdde06588b2 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/5718965e5e6d45e91e8318e130f671400e0c1ff5 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/616bc126883ee8441f25950d22f26cb86597de4e | ORPH
    i586     |       docker-cli-20.10.6       | NOK | http://autobuild.buildroot.net/results/1d4ba575352a5e57d23e2634e6179122419c34ff |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/545370ebda1ba6444a2a041aa8009e1aa045a8ea |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/3b9ba0678a327f20cc6cbb53bd42c1f5945257fc | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/eec4bf91c608a1eec162abffcb6be2c40b6f7289 | ORPH
   nios2     |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/37da4bd48cfce9c4b427d9c872d062a1b1914dee | ORPH
   x86_64    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/20e24a6c8f9b831fd3fc59f8d74e88ac648a6ee7 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3d6e62107b26a73e9f9d97016161f6e5eda4a286 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ed7eefb272c2d4a7644eb2b4f766b3328e0d0b75 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/0f41973c263861818e4a93a8f2741161a2dd02e3 |     
    mips     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/4127ed3d7e57bd53744839e19cc3b7b540c6ca24 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/243a2205eabad70c8b69f935e63f9fa5778acf93 | ORPH
   x86_64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/43ebfb3f4ccfba9b9481a1dcf91025a4e515c6ba |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/77b72e03f523ead37306fcfa9c46051ea5edd44f |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/44d3238bed870bf32c149929f6e56a4dbc6d78a8 |     
   xtensa    |          strace-5.10           | NOK | http://autobuild.buildroot.net/results/2fe8253f88e958f8ee1925589d6d13bb0ed84484 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/74280b758501eee9fb0259f9bc861847fd329d5c |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d3bceb2f7e369d54846d28822e6fdaeb9770ae68 |     


Gitlab CI results for 2021-06-03
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301140  |      
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301141  | ORPH 
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301142  | ORPH 
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301143  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301144  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301145  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301146  |      
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301147  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301148  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301149  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301150  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301152  |      
                 arm_foundationv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301153  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301154  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301155  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301156  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301157  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301158  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301160  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301162  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301163  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301164  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301165  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301166  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301167  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301168  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301169  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301170  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301171  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301172  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301173  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301174  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301175  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301176  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301177  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301179  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301180  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301183  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301184  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301187  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301189  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301190  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301193  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301195  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301197  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301198  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301200  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301201  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301203  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301205  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301206  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301210  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301211  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301213  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301214  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301215  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301217  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301218  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301220  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301222  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301223  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301225  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301226  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301227  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301228  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301229  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301231  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301232  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301234  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301235  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301237  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301239  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301240  | ORPH 
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301242  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301243  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301245  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301246  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301248  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301249  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301251  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301252  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301254  |      
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301257  |      
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301259  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301264  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301261  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301263  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301266  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301268  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301270  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301273  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301274  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301276  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301278  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301279  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301281  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301283  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301284  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301286  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301288  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301289  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301291  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301293  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301294  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301296  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301298  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301299  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301301  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301302  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301304  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301306  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301308  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301310  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301313  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301314  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301317  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301320  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301324  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301321  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301325  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301327  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301328  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301329  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301331  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301333  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301334  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301336  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301337  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301339  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301341  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301343  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301344  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301361  | ORPH 
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301363  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301365  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301366  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301368  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301371  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301369  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301372  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301375  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301376  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301377  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301380  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301379  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301381  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301384  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301383  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301386  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301387  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301390  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301389  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301391  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301393  |      
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301394  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301395  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301397  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301398  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301400  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301403  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301401  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301405  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301406  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301408  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301409  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301410  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301412  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301413  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301414  |      
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301416  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301417  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301419  |      
                qemu_csky610_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301420  |      
                qemu_csky807_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301422  |      
                qemu_csky810_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301423  |      
                qemu_csky860_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301425  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301427  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301428  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301430  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301431  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301433  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301434  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301437  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301439  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301440  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301442  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301443  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301445  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301446  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301447  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301449  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301450  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301452  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301453  | ORPH 
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301455  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301456  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301458  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301460  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301462  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301463  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301465  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301466  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301468  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301469  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301472  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301471  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301474  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301475  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301489  |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301477  |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301478  |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301480  |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301483  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301481  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301484  |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301487  |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301486  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301490  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301492  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301493  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301495  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301496  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301498  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301499  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301501  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301502  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301504  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301506  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301508  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301509  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301511  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301513  |      
                 snps_archs38_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301515  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301516  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301518  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301520  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301521  | ORPH 
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301523  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301524  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301526  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301528  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301529  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301531  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301533  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301535  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301538  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301540  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301541  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301543  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301545  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301548  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301550  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1314301551  |      



-- 
http://autobuild.buildroot.net
