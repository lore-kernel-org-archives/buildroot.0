From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 08:31:00 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-11
Message-ID: <20171012063100.80BBD2081F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-11
================================

      successes : 163
       failures : 90 
       timeouts : 0  
          TOTAL : 253

Classification of failures by reason
====================================

                  dbus-1.10.24 | 36
      host-uboot-tools-2017.07 | 9 
                    flex-2.6.4 | 8 
                     nmap-7.60 | 6 
                openjpeg-2.2.0 | 5 
           argp-standalone-1.3 | 4 
                 mesa3d-17.2.2 | 3 
             dbus-python-1.2.4 | 2 
             gstreamer1-1.12.3 | 2 
                   jamvm-2.0.0 | 2 
                 msgpack-2.1.5 | 2 
pdbg-77158819158d1d7053a737... | 2 
         python-gobject-2.28.6 | 2 
                      qt-4.8.7 | 2 
      host-monolite-1050200001 | 1 
                       jose-10 | 1 
                   perl-5.26.1 | 1 
                 qt5base-5.6.2 | 1 
           uboot-tools-2017.07 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/47e381fca26a8d3a70f87afd3c6d088326beddf0 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f1946d0f9b063ae7ae1cf9fbf86a95cadac8a28e |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/0e55ccb089777d0648ef3a677e1d86629679c365 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/dd844fcaf2b232d74d141cb688dd58061662baa5 |     
microblazeel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/58655ed847078c940a733745b272b346bd758aa9 | ORPH
         arc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/85229fc2be346d0237b37780cc9ef18c41135063 | ORPH
 powerpc64le |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/2bbac6c23055b1f90495017b904ca9bc1104f0d4 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/91225c4cab1c1b49c86f5d1d22ef16f194138905 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/532b0f3838f50a37a778a5bcb3f6eac04d6d6fc5 | ORPH
        i686 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/141fd763646c0c66389f772373d2c1828d2e8b58 | ORPH
         sh4 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/b7d08d3ae74d38cfcd46e388db74644bab9bc314 | ORPH
       nios2 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/8b47785edd1d345e0ae2b4a130251b82add36c04 | ORPH
      x86_64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/2c43bfd2328da353a038201990983bffa3e55500 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/358ada9fd11ceab12606d1836b10956978644866 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/a83b0a8e7ec472d7b37c293e79a217452434aac6 | ORPH
microblazeel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/fcec75f91820d722254ea225f12855e56434cbf8 | ORPH
      mipsel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/e9e72cad3bc321febdc95a982fa6fbd717f681eb | ORPH
      mipsel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/b143532f224d41c99fc2ea4ca2aa712e5cf91ead | ORPH
      xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/86379bb621a6dd1c20dfda0f44cd706db17bb219 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/61bc1f5925cc74069a3f49000c9ae772abc5f367 | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/1144d79b81effeec994c03f5b3fb121f5fbbc0c1 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/3510a943db9c4e469b571bb3fe4cdf25ba7d5165 | ORPH
         arc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/e12d369f4fc4056df8118bf7c71f89c86f4598d1 | ORPH
        i686 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/be999360a388d55b5a8ec965bf8d7addf070accc | ORPH
microblazeel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/e1e91775c1829a1ecb1d720459944e5fee652298 | ORPH
        or1k |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/f9ec0925e3e836414b872ec5d1c66e13e1b12b24 | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/92338ad6fd99f5b880ab3340c2c9bfd8f54e4413 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/a19d64ff836933ca339b7da8e7d2237cda892e17 | ORPH
       nios2 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/ef91249f480bb27ae5c9fae641a161158fa4ca70 | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/4a3c95541c05426860ebf8c8b8641ed8329ffd80 | ORPH
   powerpc64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/08f60a544d84b7750113e5834dc1bbb4aefaa20c | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/c2079276b3493a9fe92bd59e522e409de8112442 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/0d9403ee8ebceb5cebd159bf8263ac6142b80ab5 | ORPH
     aarch64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/87b62b33e3dfcdc7e9981bde3fc0fa85e097986e | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/476d157faf4dd56f5156133d4bebf475bffd2a64 | ORPH
      x86_64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/52be12175fb4c8de9abc2fed218d217835b32351 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/6da460a33a6923fd12b2cefd49b245753b306c30 | ORPH
      xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/5947e264da24e8c157866f4170b6085c13fee2ee | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/2db1a40f451e7c422c784fa84bdfec594a666f29 | ORPH
      xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/61eca1aa0fa8a7bf49c98068464d2ad2f822397b | ORPH
         arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/90b2539727deb46d2b4867259b90e212d29453d3 | ORPH
      xtensa |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/6adc72dea35f288d3e2d6db2a1362886b89e8403 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/624c1f3e35f343db2498e68af19f4138a655aba0 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/ee55a4365fc5ea7a231ae5116a89078f69cf5687 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/e20bfc5a3bbcecf66273605af1b53b66c0515123 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/de23999a6254143e1549f4abd6eebb998d75a7b2 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/f571ab8065b1b0df920f0dc2de77a5f6802a85df | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/425f82c4bfcd731aa15a9c94988f2dbd70c3d0dd | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/67ef190984f542c4894711ad0e76b076903742d2 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/08bf42cd454f9eb4455daf551cbdd3107718419b | ORPH
         arm |              gstreamer1-1.12.3 | NOK | http://autobuild.buildroot.net/results/d9591e7cf8279b4b6567ed706c25859582414cd7 |     
         arm |              gstreamer1-1.12.3 | NOK | http://autobuild.buildroot.net/results/89361344703c6572f69da7a6bb62d827bcd3ce91 |     
     powerpc |       host-monolite-1050200001 | NOK | http://autobuild.buildroot.net/results/c5ac86ad5911cb2e0d5b2adcb4171ef1f1a116ca |     
        bfin |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/42b912cb916681bc56a26056b1255e818f5b3fca | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/32e4ec2c7a5539e3798d385299d9436615d44a89 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/50e558bf6ff20e49de2a92b5ec0b37ded60faaf6 | ORPH
        i686 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/edf86edb119e476205ab54666e249de58c26a78c | ORPH
     aarch64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b04b7b5180fa1699bb77c085a0890b3bb2889e16 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/8f665b73ac3cbabec2e3a3c55b524239e313219c | ORPH
        m68k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/26e64eb9d4b0beb7f17ce88198ac915a90a1d64a | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/dd09116c179529d3e2bef5812504da598e26fa19 | ORPH
 powerpc64le |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/547e4404e9283448c3cbb26d294ce3593ffd40f0 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/4e19b5ab7bb9cc819e7d964906ae5beb9ccc2548 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/b53751b5211367a2b381d04748e149c9e85fcca4 | ORPH
     powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/52d052a474ee1b7032232e2fa7db303034aa5525 |     
      mipsel |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/9e49f663bcbe05872ca8235b4270013993e6ed8c |     
     powerpc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/74535753e3d4580306fc760e41522078e907805c |     
    mips64el |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/a96c0e4ac98cb4fbcf77865a0add575a0b058c2d |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/4a0cc043dd89772feee724da4922d8bb49e853ea |     
      x86_64 |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/fc571099ef2e609523fb4d1147684bdf5ae7cb71 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/bdaeb22741305c14445db645b8a2771679a0bfac |     
         arc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/4053a599693e99d8e377257ed39924531f014ce4 |     
     aarch64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/435324af5ebe33376c9da1e13be87773fa95dc47 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/ccdd4964e265f9e79ab2ca81ece9eb8b1b70f34a |     
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/12ea570d8189f131c15e24417e9e9b3fa38f32ed |     
     aarch64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/deaf702e8efca82786ab47265fa1833ae75153d7 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/249a6a14850b2670e2f651e25eaf96143940ec4a |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/025d2512e82be3afd4a6515c80e658cd2cd269e1 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/00f7249c6840d42c2590eedc1ac5d402ba4b7379 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/84d35e94a3b3152353a388881c90a463aab3ed55 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/2f2bf0b6b7c2b0ea66d8755ca72d0c0c4beed638 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/5d1e1cdd0ab98cdaaccc76d70d91268dda52505e |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/1dc7fa695e3fc2b0ed62369ce43e276cdac05521 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/25c6574fba21dfe354283ad19358eede24b21cb8 |     
         arm |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/ba8c310351588d98d0bf694b9d90ac3e372826d7 |     
     powerpc |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/c1d1ff0a4f8b976d09c3eba51a9622b36d003fe0 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f508b0d7479f96a73d0327ef1c70015a6af5fbe2 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/da1632c30052c6b71b2d76e655d72ae8c4bd9e09 | ORPH
         arm |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/5c6f003aa45c4fe023c5695a759b4e0e630337db |     
      xtensa |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/a80227e306ae8bf6cba17316e4ce7f92b8897af5 | ORPH

-- 
http://autobuild.buildroot.net
