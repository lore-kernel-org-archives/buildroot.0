From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Mar 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-22
Message-ID: <20150323073020.6C27F1018F4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-22
===============================

        success : 202
       failures : 85 
       timeouts : 2  
          TOTAL : 289

Classification of failures by reason
====================================

                  powertop-2.7 | 33
                  boost-1.57.0 | 8 
              postgresql-9.4.1 | 5 
                  dhcpcd-6.7.1 | 4 
             armadillo-4.000.4 | 3 
                numactl-2.0.10 | 2 
freerdp-b21ff842ef3de583751... | 2 
                 jsoncpp-1.6.0 | 2 
                libtirpc-0.2.4 | 2 
                      qt-4.8.6 | 2 
                   strace-4.10 | 2 
                 openocd-0.8.0 | 2 
softether-64fd19e6f849247e3... | 2 
                     vlc-2.1.6 | 2 
         lua-periphery-1.0.4-1 | 1 
               host-ruby-2.2.1 | 1 
                libupnpp-0.8.6 | 1 
                elfutils-0.161 | 1 
               libecore-1.7.10 | 1 
                  prboom-2.5.0 | 1 
                libgtk3-3.14.5 | 1 
             odhcploc-20111021 | 1 
                host-gdb-7.7.1 | 1 
               linux-pam-1.1.8 | 1 
pulseview-19be0af16af83ca10... | 1 
                  python-2.7.9 | 1 
                  cppcms-1.0.4 | 1 
                    qemu-2.1.2 | 1 
         erlang-p1-tls-53f0478 | 1 
               libcap-ng-0.7.4 | 1 

Detail of failures
===================

         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/a1667e2baa7f3d4b01d769a414f1cd5c39c653d9/
      xtensa |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/22365eb757b9aa252d7b1641e0f91042a983f6ae/
      xtensa |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/82639cd97f41fbdfd394460c3cf179fdb885ae06/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/471e67d55c700f345cd89681ba0a6e66ecc2530e/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/8ab7c12107aeb0cac0cee26226a981c5503e40a1/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/6bb3b8ab008fe23b4d769350988a60f1d61347d2/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/a58c702d8b5ad808def8d975f03dbb0efc0081ab/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/f98d4ea39975a00b741e80990a30965378b724cd/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/1d3fa47c5f3a8147ab1d838355a14370fb87184f/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/87ffb40a84aeb9c4560791c9d62939330bc2f3e5/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/86dfcb2db7f5831cca6816c5082928fd2ca20e0d/
      mipsel |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/cd4e70cb10285c13d52b8e04d275e9cb1be28669/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/8b62545f854dcf22b69b30ffcc68e1f7c68d7a9e/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/b7388908944fb843d9c5d1b9422ea699f208a43d/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/56561830093d9ea98f375c0d8b986e2ab0796bf4/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/308d430b5e810bcd9fed518cc3529b2ed7c731ad/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/50e5c33068bb9b4ccc205e9dc9d14667e6ed4f7d/
     powerpc |          erlang-p1-tls-53f0478 | NOK | http://autobuild.buildroot.net/results/ec0baf7576e5eb77290f0a9ccb89752dda75cb6a/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/35ab2f03ce55f1f1b2df96e98f6f936934fc0257/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/b01c12319288ff40a810857b213f036e7c7ac486/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/2643e9621f8428e71be68398d391e5ecb40a9d45/
         arm |                host-ruby-2.2.1 | TIM | http://autobuild.buildroot.net/results/5c696390321abab2d422e2ce95233f45a2486965/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/f496266e3b356ccb23b9d6f45758563da0a7ba3e/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/ab72a8db614c4a1178b25be6437fd8aea0f01e1f/
         arm |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/b7b3ae2890f443e7f275be95ea1c73720391814f/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/7387d34bc766d5babaa2f77bdb0b13063a421098/
     powerpc |                 libgtk3-3.14.5 | NOK | http://autobuild.buildroot.net/results/48022eed0310cff1ce626a074ed1fb43428867d5/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/2387b36d45d80dd428b7c0c25dcfa1deae93d316/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/61770023ffc78514acc8ad3c6f532be8bda5dd5a/
         arc |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/bc1d2ca20f1f5d277caa5cfe66d373140481736e/
         arc |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/c25a9cfcee88391b57e2dc5503a66f6e5868fe66/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/cdc0a4d7079826e39727d414ca9574b4d79584a9/
      x86_64 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/74fefb2973ba29100db789e9ad0066b5af30c881/
     powerpc |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/16835d8f2b5a8645fff77e1f3a5374665ecadcd1/
         arc |              odhcploc-20111021 | NOK | http://autobuild.buildroot.net/results/740983d6e1e4de0ea055f302828b0a1794abbb99/
        i686 |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/bd7f90f3cc1d2b395f9849eb0630c2602a075bf5/
     powerpc |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/d8ea7b26dbdf8bbbd83323409adc18a9f303f169/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/916487aae929c181d4e3f471c6c7508552f0b683/
         arm |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/2900506ee8370acd379b72e4008f0b4cf68b6a3f/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/921a94d1a489d81b362c5b6a403a156b4691effd/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/dbcdc58ad32b7b811ea47b6fc0f926a477e30786/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/68b582f4caec223a646f095487263353f273156d/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/2f48582826eb0fc20708b47bdc63e27df9cbc97e/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/c399b0401b40586f0005957d5026e489765b6128/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/681f89049ebc2b4f7a88836e52c47fa0c20fc5e8/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/03261680cb109f0ed5a806d96b248303ae949fc6/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/f38cbe1bd8e19076d7b1462ddc65d3d50428eb80/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/31ed9efe2b0e9a14eecd3c4c9f2b55ffbc781356/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e11e727b2f197736888b7129b26c16d7a538d346/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6afc50a95bd85f57e8d402a988033329dfd2ab38/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4286d01d937b9bab73758274cf8af671180b466b/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/429564e198b46a5b6c69b1410c2acedc21f40993/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/8e0f740dfe53173fcea6ea3b47aac78b7a5ab0bf/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/be6bab802ba0c7c734c39fd43a07959d35236ef2/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/89e56cecb26ae3a8ba00e307ae23ea84c4113da5/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1d6d1aa49e45ee5b7ef6b9b7ee92259c2e8a60bd/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/83fb142277f61a18be4621106d03ba12a2f6c8dc/
        sh4a |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a9399c4b918a1203fca1397d12376dbebb3965cb/
        mips |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6d72622fd928c399739c05fd97e2a41243303817/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/bc930909fd9f745f3bb6b811fe743bb58061bbed/
        mips |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/ab944997a367b52ec384a57a695f352a2f8c6804/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6afb670fee57919bb31e81d585c520db241deca0/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7cedc55082ad05d33cf0409767bb4e04cfdff2fa/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/858b81ff49f8442a76000d6efa0ee12e367fb13a/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/162683cd917e78bb1dc6e9a1cbccb4d340c81b09/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e5b230ebbea3fea486f23eb7a9f16ad9e5ba1513/
        sh4a |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/31e03967301b9f6888532ba69501ae89d21f9a6a/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/caaab9d07e0cbd9e89dba16f4ea7e3f511ce6ba3/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/254a0c8b6002926d13436e9e713df033bf4858c4/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4fac92337a814f94587f0d8cf68dc6ab56d6406e/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/acafb481ac137698b1810fa74e7165cf4a1734fa/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/fc73af41748241fc885684bce2a00ea4267a8cfc/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4469ff65aba993e050e8cdfbef7cf140acee265e/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5ddb46ee6d8eb3fead22e1f7232a1f59c938728a/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/8410e86c44861762bc6352b5864d2d364a6ba3a9/
    mips64el |                   prboom-2.5.0 | TIM | http://autobuild.buildroot.net/results/e7dbd0165952371395a6b6df0fcfb6bf72c82f45/
     powerpc | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/23052ec0325b8e17c972f940eea32ff6812ecadd/
         arc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/8c38aa31bb0b2695c3cb93ed1a335583bd3b3a18/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/6463ab0a7f5f7e56bfff16dff93a223cb17875aa/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/fd025f87fcc1783db01df1a120c8c53e78c8d168/
      x86_64 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/237470245aeba5056c6b135b6dd42501a2d0efab/
         arc | softether-64fd19e6f849247e3... | NOK | http://autobuild.buildroot.net/results/e13ee90bd15a7bba99b3c54de596c8fcb14e60c0/
         arc | softether-64fd19e6f849247e3... | NOK | http://autobuild.buildroot.net/results/ec853d4b8d8e91d6d3cdb46bcc15a400d2fcd5d8/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/8c52a691588a11ff7ad4fb19780937f520425e43/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/8ef76c1b9a580348273ad7a49c79dbec7c0cf66a/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/cd9deb85223975c0e4c536b54b00cb82c89d0ae6/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/71430c83bb5f1477038e2361795cb5664bd14c6e/


-- 
http://autobuild.buildroot.net
