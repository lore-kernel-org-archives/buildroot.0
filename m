From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  6 Apr 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-05
Message-ID: <20180406060020.A16FE20722@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   1 |   0 |  14 |
      master | 194 |  56 |   0 | 250 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

           cups-filters-1.17.9 | 1 


Detail of failures
------------------

        or1k |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/e5a6941017724c0879d2a7e664ddd43d822711cc |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 13
                  host-go-1.10 | 5 
gst1-interpipe-10dba89eecc2... | 4 
                    liblo-0.29 | 4 
                  udftools-2.0 | 4 
          usb_modeswitch-2.5.2 | 4 
                   flann-1.9.1 | 3 
                     php-7.2.4 | 2 
        python-yieldfrom-1.0.3 | 2 
                      qt-4.8.7 | 2 
             bluez5_utils-5.49 | 1 
     docker-engine-v17.05.0-ce | 1 
                    efl-1.20.7 | 1 
             expect-2014-05-02 | 1 
          host-rust-bin-1.23.0 | 1 
                      icu-60.2 | 1 
              keepalived-1.4.1 | 1 
                    llvm-5.0.1 | 1 
                 mplayer-1.3.0 | 1 
              openblas-v0.2.20 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
                   woff2-1.0.2 | 1 
                    xen-4.10.0 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/e7eed4531a24c71417d9fdb8696b7d4bb52e91bd |     
     aarch64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/80f63c8b513152b57b4a54a6937042f7782ae6a8 |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/81fdb3bbd4cd160a8aa085862d9fa2da3b9d88a0 |     
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/73c815e625464fc41705ca496445644bb5aee2dd | ORPH
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/48032501185f4c7030bfc2710863a12898447a6f |     
    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/fc4f5f582c8953971aa7c958252ebb36af526deb |     
      xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/06da51eca007ab52d1e4702889dc1aba8ca26008 |     
microblazeel | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/6386b460e34304174caa9b9bd26916df183743d2 |     
         arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/756b13f0020c81b4ad6abe4c51fa3242f2425071 |     
     powerpc | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/6347f153a816aa228b6da3672c761d1aa828792b |     
     sparc64 | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/3dab44284fc286433e61ab992f55431ac871617e |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/3103f851ecbc62e55e66bbdef7c8a14e9644d6e2 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/07c974f60ec3158cd3b45e7d8a62fd123a154c91 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8dc2ebcf79965bd1e86c0166f42523b9810049a2 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/26c73f690d7c84f5b5a7c06125502fdb95e2bac6 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/7d5ef889c1c800bcf9b8a2ec41145bd9435ea4ee | ORPH
         arm |           host-rust-bin-1.23.0 | NOK | http://autobuild.buildroot.net/results/65b797f7e4692a86e29c4c38ca8ba0e3608466b0 |     
     powerpc |                       icu-60.2 | NOK | http://autobuild.buildroot.net/results/57db7b08acc5a2d498df70a1281a1c543c2ebc34 | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/f5ced14c3d6bbc83ab1d5ab4e4275f7d396b5c7c |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/a9e0e706f67e141de5b45744da03b3e3c3dbb217 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/4723d2ce32975117b5aec47e498a0a3d51ad628a | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/db5b69abf160dcd45d16cb4d589c3f448e6b0fa6 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/aa63ad3121228a52c4879dd906e1bd58e1a2f473 | ORPH
         arm |                     llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/d1dee6ad3a4b9509415a890b476574218068220a |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ef7e935894caa277f27f0bbe8fa20569ac358557 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5c9b18ef838863bb6e4041a176db85259226fb6c |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/86b46e5f93393cf4b28e1a9b2020c66cf7fa6460 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2a27777291e7b507c4426dcf8bccfb933e11946c |     
microblazeel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/44ab91a964e613ab32ef3fdb9260c7fdaad7d297 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/561c141e175b7403f31f74b9946f775cd5e91d3d |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f79b8d720adab98a62c657cb08dadadbe968d53c |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3dcdb0fce9932d3d82de90b1702093a484f38349 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/e3cf1e1114cee9ad39e647a826df3aa1587733ee |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/223c60932af896d44961a6fa852fc7672b72c96f |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3a54cf4fd52788a6c50250971e136fd905dc0a37 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/e908d2561c7039730ef38ccabefc618e6ff0b297 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/8f0ad32cac0ae5fe09a068b4fa124cdae02468e1 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/693be05ca3ecabc6a0a41aadd378a379ecddb4c4 |     
      x86_64 |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/ae3c6148da0cb636e6ec8cdee06578f697a14a64 |     
microblazeel |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/e1359fcad7bc57e3c5a7ecc37abaa2cf6a6a9ffa | ORPH
 powerpc64le |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/b595685bbfc9a7a53c20169d9bbbce9015d0ffc8 | ORPH
microblazeel |         python-yieldfrom-1.0.3 | NOK | http://autobuild.buildroot.net/results/5de26cfdecdc322378d6ee768c31059ab13de92d |     
      xtensa |         python-yieldfrom-1.0.3 | NOK | http://autobuild.buildroot.net/results/ddb6f03375b530f4a28e1889f948232c758ae3e7 |     
microblazeel |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4032a6516967cdbe3b0f2904ba0ea27d521fd338 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/541bd6365d019cd1906037eb3651dac94e10930f | ORPH
      x86_64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/22f8e571339850eaabc4ae22ae3323963ab05fef |     
      x86_64 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/62466f1cf860195955b7f552e249397738b134c3 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/d9b1e33d199a97aa2420406c17fb42e4665e37cf |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/d2a60b7b4d5f5edebc396cbc20be6bf214a32444 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/ef77a00de6627be47dd744664ba027f10d1cf8b1 |     
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/6efec077caa33a46618a1e28e57b15d6c714887f | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/3ce92929827895f8127856b378ab4caf65046cf8 | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/01e80f0c4355ea674f43cd76e36d88011a2318ca | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/2595700265abea57257117b148093a117e783e91 | ORPH
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/3292bebaac1a7c8699da0ed5674ad68060df08f9 |     
         arm |                     xen-4.10.0 | NOK | http://autobuild.buildroot.net/results/ec7cda00e07b0c98a9a366244b67611e042e0d4b |     


-- 
http://autobuild.buildroot.net
