From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 06:26:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-09
Message-ID: <20200410062646.DCB1486B8E@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  2  |  0  | 20  |
  2019.11.x  | 14  |  4  |  0  | 18  |
  2020.02.x  | 17  |  4  |  0  | 21  |
    master   | 125 | 83  |  0  | 208 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      ell-0.30 | 19
                       unknown | 9 
psplash-fd33a9b3d68c89fa22f... | 8 
               libglib2-2.64.1 | 7 
                  zeromq-4.3.2 | 6 
                  boinc-7.16.6 | 4 
                libtirpc-1.2.5 | 4 
                  assimp-5.0.1 | 3 
                     avahi-0.8 | 2 
               belle-sip-4.3.1 | 2 
              host-grpc-1.25.0 | 2 
                 jbig2dec-0.16 | 2 
                 openal-1.19.1 | 2 
         python-markdown-3.2.1 | 2 
                    gcr-3.34.0 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
              gnuradio-3.8.0.0 | 1 
               libupnpp-0.17.2 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.9 | 1 
                     php-7.4.4 | 1 
                qt5base-5.12.7 | 1 
               qt5webkit-5.9.1 | 1 
                thermald-1.9.1 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4b373ae7d8fd40efe3e2592f94f2d769d6a77669 |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5d95b894d1a13de53a26cab0333dc4a05418f668 |     
    i586     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/33719989bfe47ab729a783bebd3188826837dc30 |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f57eee400cd6f05b577cfdb141bf18cb91bff1e9 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/cff0bbe6e2b4ee57c63f23efc6ee312ca8566405 | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/ab26d09862d6135df3f50e8e97b2c14c4707946b |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/b3fdffc81efd2bc7fc57cc2849ac8d6b0ceeadf3 |     
   nios2     |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/296cd07642a40e4604a474553ce346fd5979e632 |     
    arc      |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/b8cfe2bccadf9e0050e8a276352f2c9e438734e9 |     
microblazeel |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/ddc9e13154609a415b1aa3c33ec5ce94815664b1 |     
    arm      |          boinc-7.16.6          | NOK | http://autobuild.buildroot.net/results/e455d2da52135d889593e7be7ed40566656eb5b2 |     
  mips64el   |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/a09eed0dba3232286aef7a2768ac485e552be843 |     
  mips64el   |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/375784ed87b17a3de5052a7c3355c17253df6674 |     
  mips64el   |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/0835c032a1bc711c56dae27c6e70382d7fdf5e22 |     
microblazeel |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/f966464a4eb5f5d592dc3b1319f4198ff47de7ec |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/2d1a3f82abb8475d39908b22f775c2dac781f330 |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/f3d424ef3cefadb2d55149b682d175f6ce6c7f5a |     
   x86_64    |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/22a33e012f439222920c67782f069ef81a289e63 |     
microblazeel |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/8c8f072d035f4fa7c23eb17fa9d6769893860b02 |     
    arc      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/c977df0566177e2ed71aba89b3738c889fd081e2 |     
  aarch64    |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/7471c7b76a8da7e25f6a5c4cb49365247b7e66fa |     
  aarch64    |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/1a3719f248d05b4d768a0227152db750a560dc6f |     
microblazeel |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/ebc7e5c896ccda258edd35d6f4ebf5f34293cf6c |     
    i586     |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/23b5324b73967f7ba153a1e028c330ca01d10e75 |     
 aarch64_be  |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/c20662bd741dae85245d7af1365143ec28d1e210 |     
  aarch64    |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/a966c286d77d6a87f5d89d6fc076a60e351b9b86 |     
    i686     |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/d92b7c7ef1d520175a350071edb9e7c4061b0675 |     
    mips     |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/a1186400943dc6df1fbed85a8b5ad6a54829c265 |     
    arm      |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/a4c98a627a75e0c6bf40ea8331869d3de52ac351 |     
 aarch64_be  |            ell-0.30            | NOK | http://autobuild.buildroot.net/results/398c7b20d3ae3a1a7f9d05bbef99d7f16b1b9da8 |     
   mipsel    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/5705566fac5f9faf98c7dd9e10f194169fe94d56 | ORPH
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/77afef51bcb1449158ba6ab6a734b503294ef605 |     
    arm      |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/cae9ad5b746bfd728688ab655c23087a6f70fd50 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/697ba8f6d690009bfa72f7af1e619a9973537592 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d422b600343ba31ba215fdf072c484dbc7c1c263 |     
  riscv32    |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/84266a5a221969d22d041c0051bee4911bfb2258 |     
   x86_64    |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/64adc46129b716663746439b30743daf1d2e07b6 |     
  powerpc    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/3e7359250715f0ad63e7a821431ffc56cc4f4a46 |     
  mips64el   |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/008dbc543cae3419deef5b3fff6ab4dc3f77eff9 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/3b2a0868a7745bac56842e6c2e1da26eff65e8a1 |     
   mipsel    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/4c818d9c8fe90f615d6ef3d65228aa68e9f5b0b7 |     
    arc      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/072849bfc67406eee88fc0c5f332069834758338 |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6bc4fad88fb7121242321bcce5d4f12a9c0fd57e |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/de25caa0ec0102c4e4a7640e4235173faae7297e |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/0529d1d4d2450311adfffd9d7ae98077ec0c5dce |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/367738b82aa0186fba5fbd9997a659336fa4cd89 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4fa2de0df15693be212cef672d3291933ff4f2e1 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/039b3c5a05b50926f79a4b62dce1218f4cdfd863 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/497fcba8fc32637336690967e15d336681a3b143 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9be2a8c0fca9ee9f538340e79db4d30ccb964027 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/a508c8119641b15df38f714674845a1e0edbfb9e |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/f08a25f632ad5f2a7f6fc6287f86e2b3bf52bb88 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/27bfac72d593f0e528292ac3b067ed12645996e6 |     
   xtensa    |           php-7.4.4            | NOK | http://autobuild.buildroot.net/results/5857e10641db9db84a4ea1f0eddb2d7aae32d248 |     
   sparc     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/4f74269d08fc35955dea11ea9eeb2dbe86d3f9b9 |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ec8a0b553e3b5104f955cc7ac9afcafba3640670 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/76e553718f48ca21fd2edad342c20c992d44e387 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ae7e2d626961bca8edbadb933472b89a405c982e |     
  powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/4959b84ce67c7961da1616fc3f8ce7de3536206c |     
    m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5eff8b3dc3a72d968d0b1b1eeb41f909ae1c7809 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/478cf2c1ac5a91cf58c8a35e2b620879f33dcbac |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/3f200e36ca7edb3afbc34cca2914ee92877254ef |     
  mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/afd35fd1fac4e47d086ef55eb8ddc40cdac2b6eb |     
    arc      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/b4c76ccc842641b65ef3a3002ec8195b2e193e7d |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/d2b597fe14c19e077c71818be979d67ef3ccca60 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/a3c687df95da8550701860797fcb7c501afd1dff |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/6e8e2393a2d02ce3a0f7416700f0482fa1e2413e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/afeb1f80a9d63cd1de28bf72d6d0e5602ceffd59 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7181c0ff7db9b2e9070329b6e88b66b1b011d574 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/637cb598e1fc3f71de227d36550c42a1d8be9db9 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1abfe79bbdc0b7f60ea2d164505eab0226acaa2d |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/84de24413a32f4e2da7ed0c1189a8f357b1d86fe |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c1982bc4dcf860c096127b448b70137b0f8bf254 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/fc1f83f2c2360b007fe421c22ddddcc48b576b81 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d408d5878329f088f46d2b69967619f2987336c4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/79b87c96c74790c699b00ae9776a65d5e11c9267 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/7342f74dd7df61e3c14d6b2f9afe226ba9f14b5d | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/1a70985bcff9459733f5d3fd3c994938ecdea4dd |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/470428950567238fbd8f060d903d026dbfcacc59 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c67936cc9933b4e7cf2d56d4ecce70be6b857743 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/4032f8482a047f2632d90afb96664b19bb6f554e |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e6f000a7a86267ac69743262e0ab778cc13dd372 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a255ff9395ace1852e2ef54d536e94db22bfbf1a |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
              syslog-ng-3.19.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/d3bfd1ded3fa2afd4b14ad9e182d31cb514cb5e4 |     
    arc      |        syslog-ng-3.19.1        | NOK | http://autobuild.buildroot.net/results/e09c48589b62f9f68a6e57df4d6ea10c7148fa27 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 1 
             host-qemu-3.1.1.1 | 1 
                samba4-4.10.13 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/00f2a37548071406ae2d35825f543a1ac8645ac2 |     
microblazeel |       host-qemu-3.1.1.1        | NOK | http://autobuild.buildroot.net/results/4aea34542f6618923d0f65fed0e902a5aef254d0 | ORPH
  aarch64    |         samba4-4.10.13         | NOK | http://autobuild.buildroot.net/results/f414ac0d557345a25c217f819afe3a0d8201f2d1 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/ce9e3bb01f650dfa175ca4719bb6eb3c8113ad30 |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              bitcoin-0.19.0.1 | 1 
             fontconfig-2.13.1 | 1 
              host-grpc-1.25.0 | 1 
           host-nodejs-12.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f07a9f6becd9051adf327ee3ce5a1c107f7e3a77 |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b6d5ff24aaa821fa88245d9a0b5b9741003ab431 | ORPH
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/690d1e9172d3a1111e6f0da6e436a75d07c6c336 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/a19e4b9a9070ff928d458e8c10f2adf56860ca46 |     





-- 
http://autobuild.buildroot.net
