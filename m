From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  9 Jul 2018 08:00:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-08
Message-ID: <20180709060012.661A320876@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   2 |   0 |  19 |
   2018.05.x |  20 |   2 |   0 |  22 |
      master | 110 |  52 |   0 | 162 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/946bb102a5429153471dabd7a0a934041369e319 |     
        i686 |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/d29faab0528791f31387144d2062362cb2a73f42 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                 expect-5.45.3 | 1 
              wireshark-2.2.14 | 1 


Detail of failures
------------------

        i686 |                  expect-5.45.3 | NOK | http://autobuild.buildroot.net/results/10f2780f698a273dd37d83edbd723ea48b30f7b5 | ORPH
         sh4 |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/fce25b487a418d38a754d4f414f5fd044f1a7d99 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  squid-3.5.27 | 20
             gnuradio-3.7.13.3 | 7 
           cups-filters-1.20.3 | 6 
linuxptp-303b08cbf55096aba5... | 3 
                   libnss-3.38 | 2 
                 wiringpi-2.46 | 2 
               aircrack-ng-1.2 | 1 
                    brltty-5.5 | 1 
                    host-rustc | 1 
                libmpeg2-0.5.1 | 1 
              libostree-2018.6 | 1 
               mono-5.12.0.226 | 1 
                      qt-4.8.7 | 1 
   qt5quickcontrols-legal-info | 1 
                  samba4-4.8.3 | 1 
                   wampcc-v1.6 | 1 
                      x265-2.8 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/b0b46e0c157fc1449401c37a93edc44e41f132dc |     
         arc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/7c2a1bb2fe6e86384fdccd86dace76af40be1cfa |     
      mipsel |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/13d600c8b33017793cd0dbdd5d204ba0b01924a5 |     
      mipsel |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/db6a85e7a8da435b0046aabec019392010c492d4 |     
      x86_64 |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/7ec9a7443d4554e25dbd743ef89fab75cbbaef1c |     
 powerpc64le |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/25e1db05c610618f22785aaea762c8d102ec61f4 |     
     sparc64 |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/c3733387ed4d1d9e09e5d52a9b77f4d52c75c036 |     
         arm |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/a9b80681055b1b6efc766b1d9f44f085daf988f5 |     
        i586 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/26cdf1298e1158684c74e7b7041d64b9237afd06 |     
        i686 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/11001a255b4959b0d61db4b911057b84c1439340 |     
microblazeel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/983cef74d76434a4be8ae70bbbb7b1d83626ebad |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a1391f1a95392f7cdf75879eb10c45b3b7991767 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5813194cdb98f497701a7428e52c80c765065692 |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/6f88e7637e8e27983ed1f8a6ff00c115e9f61bfa |     
        or1k |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3b838cc1aafe0550183322439b64962a8a10a9a9 |     
        i686 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/87c9ac6dbe7abb54ee35e1174ca05835aa6246f8 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/00b0ee3bf89c4f05d0cbf9c14296164865c06d7d | ORPH
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/0f601dd8ee52682c2cffb757f03003435b709558 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/c1d8de09765f4772ae718163c1131a19f8a27053 |     
    mips64el |               libostree-2018.6 | NOK | http://autobuild.buildroot.net/results/5e5441822e2a94f8de51bfa0470aced84720ce31 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/691e6617a7e3f1fd5479383eafc544516fec5e0f |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/2aedaec395a00ae8c913fbec8ad183425c386e7e |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/f854d458c1c0bd98a0a89756d23524f17fabe119 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/55de2ad6277869c02f2b71320bae02ad0ff28a94 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d24a3fd5d97292ae358910a1e795467b5de9d188 | ORPH
     aarch64 |    qt5quickcontrols-legal-info | NOK | http://autobuild.buildroot.net/results/4e7370a2385a07ee5cdc92ca6f761bc5aa2d72a2 |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/d82a8ce84d25ebe459f04a0ca60ced7aa066dc19 |     
        or1k |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/1d798fbf1978820d7381a7b4180e74a710a6566f | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/620aa417e87b7151d2ac3fbd6b8bbd692478bb73 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/931a395312b433246cfb7d518d5303983c5b548f | ORPH
     aarch64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/28708712659fe590ba38beea70790667cafec09e | ORPH
      x86_64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/aaca4ff9d3dd2bc457914e536f83041c9514f0b5 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/dd74fe0b76dbb4096ec98d91b735b1cd954735f6 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/406a6d800952b3b2f3cf4a80e3fe7d1cd2075d5e | ORPH
      x86_64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/ce2fc4d384420ef65c1da8de546811dcb8ad1297 | ORPH
       nios2 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/a33009b3553412438a49991e60d91daceb80538f | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/7d51bc21a49d41268121ee202b855c60327db40d | ORPH
      mipsel |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/2215acb7e011b9fd469217abbc319941f8f6ee61 | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/368571184618e87040d9e79963e5201b3063ca67 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/f09fb9f8681d6cd990abb98cb029befe6fcf76b3 | ORPH
     aarch64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/a1a02f7939baae63f7401353a7f632557327ef85 | ORPH
microblazeel |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/5cab8a26cee17a1d19419b80e2c80781c0d5584f | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/f00792e396f9643ab2d09dd2f0099b8d7e2948c6 | ORPH
  aarch64_be |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/e510ee654084b3d727979b2eadc99719984e6d1d | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/9525be15b443e4bb653c4fbda7ac4acbccd98fd5 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/e8a1d6e120ae6b90338b2c00ee5d649226f3bbc8 | ORPH
     sparc64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/14610db9da7cbd7640c945e2cfb8a5764eca0960 | ORPH
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/5325d9e456cbdc30d24c92f17829d8b4e96020f1 |     
    mips64el |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/5e10954b484a2c5ec951974145f794b16a0a9b83 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/a56d8afe51e9b4dce1755181093f5ea873f3976f |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/b4b5c147c60265d9ce4e2425aa99f66c75d37c67 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b519d4cfb9c0c9457ee37cbf455449a6301d46ee |     


-- 
http://autobuild.buildroot.net
