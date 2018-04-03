From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  3 Apr 2018 08:00:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-02
Message-ID: <20180403060009.A85572075F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   0 |   0 |  24 |
      master | 200 |  72 |   1 | 273 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                snort-2.9.11.1 | 13
     toolchain-external-custom | 12
                  libbsd-0.8.7 | 7 
              keepalived-1.4.1 | 4 
                libcurl-7.59.0 | 4 
                host-waf-1.9.5 | 3 
                     lxc-3.0.0 | 3 
          usb_modeswitch-2.5.2 | 3 
                  boost-1.66.0 | 2 
gst1-interpipe-10dba89eecc2... | 2 
         host-ti-cgt-pru-2.2.1 | 2 
                     php-7.2.4 | 2 
runc-9c2d8d184e5da67c95d601... | 2 
                  udftools-2.0 | 2 
             bluez5_utils-5.49 | 1 
              cache-calibrator | 1 
                  host-go-1.10 | 1 
         host-libsodium-1.0.16 | 1 
              host-sam-ba-2.16 | 1 
           libfreeimage-3.17.0 | 1 
                    liblo-0.29 | 1 
                   libnss-3.35 | 1 
           musl-compat-headers | 1 
                    ncmpc-0.29 | 1 
             qt5location-5.9.4 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

     powerpc |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/80ccda6535cd987b3c566e9a72526513a50f66d1 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/5037af8fd331b4c165d41d723b683bdf28801158 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/b0baf768dc2c711cf0c8f98577a2f7de5cbab3cd |     
        mips |               cache-calibrator | NOK | http://autobuild.buildroot.net/results/6c163d6afbaa634d340d56e1fd051cf77978fa7d |     
         arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/5f254f072f60dc02ed58c8973813b85bc46c9add |     
         arc | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/86f503970f44868e06fc4d9c8f75884b9e82b885 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/09db0e78d726da31a09ead00d96ac4426dfbed1b | ORPH
         arm |          host-libsodium-1.0.16 | TIM | http://autobuild.buildroot.net/results/54ac6e377ff4f4201ed9b7ce1b95a26d078478ff |     
      xtensa |               host-sam-ba-2.16 | NOK | http://autobuild.buildroot.net/results/a7c76138a1cf068868904acb6678403e3b25fcb3 |     
         arm |          host-ti-cgt-pru-2.2.1 | NOK | http://autobuild.buildroot.net/results/dff4fed42a2651e56589488f0377a666f035c52d |     
         arm |          host-ti-cgt-pru-2.2.1 | NOK | http://autobuild.buildroot.net/results/ac86fcabc412f3b0e4ee5b63f72c723eaa1a5022 |     
      xtensa |                 host-waf-1.9.5 | NOK | http://autobuild.buildroot.net/results/01d8c21df4baa9ecc6a0e45744fe6a4d086a0652 | ORPH
    mips64el |                 host-waf-1.9.5 | NOK | http://autobuild.buildroot.net/results/f2497e57b39814a4afa7e85d297ee30317b5fb79 | ORPH
         arm |                 host-waf-1.9.5 | NOK | http://autobuild.buildroot.net/results/8b62fd78c36badaa9261c2d3f9ac90132d6fa34a | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/7d7274be4d3aedccf8113d5d193c85a98ec53d99 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/d86013d0f986ffedf0f117e85580860e543b16fb |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/28ac5680c31710775b80d9f4c4163d9414c5c2e0 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/d2f8b648fb66f2159c1a9ce77eadbe5855e586e3 |     
      xtensa |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/ff1a52a53bed43cda9e235081a61b352e6e07aa1 |     
        or1k |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/2f51eebe5964e8f1be3ecd2032e7d7837bf98b84 |     
        bfin |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/b13c2f248f277c72b5d266208f991f34474cea14 |     
      xtensa |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/182356701c2110a014c9d6c8d9f18a6efeb26e70 |     
      xtensa |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/e2dfda3547b64e9a3dd343a284bdeb40e01a924d |     
     powerpc |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/45946f11524c57ffa59bf88d4a2ea0d4933fa851 |     
        bfin |                   libbsd-0.8.7 | NOK | http://autobuild.buildroot.net/results/357757e06ba341fadf95a5d43a3fcc5c8b2b8dbf |     
         arm |                 libcurl-7.59.0 | NOK | http://autobuild.buildroot.net/results/58a5839066924ca560db8bede028390fa66d49c4 |     
        m68k |                 libcurl-7.59.0 | NOK | http://autobuild.buildroot.net/results/b198db4b69e18e6d01ec95aae9c6096c1912dd9c |     
      xtensa |                 libcurl-7.59.0 | NOK | http://autobuild.buildroot.net/results/23376d8653dea6361e42b0f17b6aaab3c14d99cf |     
         arm |                 libcurl-7.59.0 | NOK | http://autobuild.buildroot.net/results/64bc0dfe284206390ae0680b94c0876863a3c0f3 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e96da8f55742878921ce52830e55c601a70c1e27 |     
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/39b8f52dc55d084f94d67a762f7608620e292fad | ORPH
     aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/80e8fbbd76be378d3dbd0c0b4362c79136f27388 | ORPH
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6392b850c14f2d2431537a287d257b1546840d2a |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f3cbc6c46246e7324260da9d11b95bcb3acb2911 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/e68dba561b8469d1557c44afdf0379642bec1bd0 |     
         arm |            musl-compat-headers | NOK | http://autobuild.buildroot.net/results/a9737ef3ec61ddba3f1967259fee5c2c2a8994ef |     
         arm |                     ncmpc-0.29 | NOK | http://autobuild.buildroot.net/results/d49990a96d1f67936f5ee0c09da80ec46c525a55 |     
    mips64el |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/4faeb8267f05ac53de81f524f9ebd91b0e5083ca | ORPH
       nios2 |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/d33e1e94acff662b3802dec3111152e71af342b9 | ORPH
         arm |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/8cdbf495911dd7b4239076dca4071126410acb6c |     
         arm | runc-9c2d8d184e5da67c95d601... | NOK | http://autobuild.buildroot.net/results/32613407eaf58ebf72c182627b3b1101639621ca |     
     aarch64 | runc-9c2d8d184e5da67c95d601... | NOK | http://autobuild.buildroot.net/results/d36ac58605d9105254c8477aca8408977a543841 |     
    mips64el |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/204c3f06d6144be2861892d22b8d618b063a721b |     
        m68k |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/023e4124f44e3f727564c3af5451801413c59e40 |     
microblazeel |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/8d1177fb2344d83d8c730233bb7c02c7e83f5b31 |     
      xtensa |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/b4998498e0c343f4bc2a1ae4b9e2aac083d93e69 |     
         arc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/f92b237e930dbf5f411a5245f9bdd3e2da0076fa |     
    mips64el |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/aa32687cda429c98e019c558acfeaeb61c6c44a9 |     
 powerpc64le |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/9255b15daf698c0e9c35f010e1afa1be8a7bc50d |     
    mips64el |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/42890a9a1c1529bd6b96ed72f105721d807c9c29 |     
    mips64el |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/3df11c48c8e2f795f478d1ee666dda9de19133d0 |     
         arc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/d4c4258eb3cb37412815c2d3f331d6b88c387c44 |     
 powerpc64le |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/caf9c91151b09d09c3de9599d2610bdf6bcb4bb0 |     
         arc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/86f3cac14e823ef7a2aecbe05a0746da65890cd6 |     
    mips64el |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/ba64cda415d0ab12b0f746a8f0a46774b4e20b27 |     
        mips | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/bad19baa7ad768730494c0ca6633facd06dde38d | ORPH
      mipsel |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/da12861be569209d75b67da052897ad13dd6a7bc |     
        m68k |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/9c33225fe35aafe1b01c2c58ff9b0a33bd63b0dd |     
      x86_64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/bcf86656d03d83b4d25af8f6a23f3c9665a08b8c |     
      xtensa |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/94030322bd021c596db584fb693d6d7f24d8a2a7 |     
         arm |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/26c5818aa6630b274000dd26fcea292720b9d691 |     
         sh4 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/11cf74aaa384dbde603ef5246bd5defd41cd4620 |     
         arm |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/2740d3f8ff2215de08d311c796ac780addbff01e |     
        m68k |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/12fdad7e8023ecc2e2917e4a6b9c65f52aabc496 |     
         arm |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/4aa9c9b1166f34bc079a4b9bdac6d2040849d8ee |     
        i686 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/2493db46837e820d42dcef76d562d027ca35700a |     
   powerpc64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/45874c950119bc1d2243d9667921d569807b2504 |     
         arm |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/07cb1ddb2d58e84481f35f5b419fba0be49670b1 |     
    mips64el |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/83209a76bf081adcad5f82e36dc4326e35016720 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/45b5334f0b010b662c4c2d8ebd9fcdc2f0d5d17e |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/2741116edd935a3f5e249fd8d88159d2916a5962 | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/8f802daf024f869c5725caec46a6cf12289ab7a7 | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/fba017850e3961f35e433cf2c6175d536d5295bf | ORPH


-- 
http://autobuild.buildroot.net
