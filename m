From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 May 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-02
Message-ID: <20150503063016.68237100B90@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-02
===============================

        success : 189
       failures : 43 
       timeouts : 5  
          TOTAL : 237

Classification of failures by reason
====================================

freerdp-770c67d340d5f0a7b48... | 6 
host-imx-usb-loader-f96aee2... | 5 
                  bcusdk-0.0.5 | 3 
make: *** [python-pyxml-leg... | 3 
                 cdrkit-1.1.11 | 2 
            python-pyqt-4.11.3 | 2 
              postgresql-9.4.1 | 2 
           libfreeimage-3.17.0 | 2 
                     gdb-7.8.2 | 2 
                  boost-1.57.0 | 2 
                   bdwgc-7.4.2 | 1 
                libtirpc-0.2.4 | 1 
checking whether the C comp... | 1 
                  thrift-0.9.2 | 1 
                     vlc-2.2.1 | 1 
                    qemu-2.3.0 | 1 
               libecore-1.7.10 | 1 
             armadillo-4.000.4 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                tinyxml2-2.2.0 | 1 
               gptfdisk-0.8.10 | 1 
               sdl_sound-1.0.3 | 1 
        python-pyparsing-2.0.2 | 1 
                ipmiutil-2.9.5 | 1 
               boa-0.94.14rc21 | 1 
                   czmq-v3.0.0 | 1 
               libcap-ng-0.7.4 | 1 
checking if /home/peko/auto... | 1 
                libevas-1.7.10 | 1 

Detail of failures
===================

         arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/81aa6b04928f965b7a96c6ee091ee5c69eace1e4/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/3e25df0063ef49b4d9928dff5a9e16d6dedaa9c9/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/476d250209eb457d3821cbc318825301878dc33b/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/4bff9de4599300e2bc81f16fd0de35e1c01d346f/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/f6b5860d40e32f1cd2c7683df0a91e2bff7dc315/
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/76a8d5750c30321825acaa2fc3ce9d73a1c87bc7/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/a68ef92012bb6c860c5e00fb0b49fc75585766fc/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/1328ba4ac34e9e89a580f7f13cba653ec71bf8c6/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/e5c0105d9ce49a50751bdac4678dcc0f53526110/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/be3b6e3e5cc6345d79d10f937edcf54bb65c6dcb/
    mips64el | checking if /home/peko/auto... | TIM | http://autobuild.buildroot.net/results/b1077a659028261862a0caf67d8f764e10c4ea4f/
         sh4 | checking whether the C comp... | TIM | http://autobuild.buildroot.net/results/e332641ee4fd307b03d941c03899fea6d3a7209d/
      xtensa |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/fd602617839817352763e51754553960b7f795ac/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/ddcabec69890c7c7cb11adf18594aea17385ebb1/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/23900dc50cd999a4f6f8b1b97b32187abc982e3d/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/8ff7960d3745f61b15c0c9dc3c9235dfb4f36ed3/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/bfd4ef86b257ee918e3c4463ebc5cf77694244a0/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/7f3b44275b1b9453e5d00cc71b2ad66689c51c2c/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/7dcba9814389446ffea9ce6c02ad0a4587e2a63e/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/2e5310d0e869f036ec70b978c62c7bd9d3d2bd70/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/01af4276353e8de0268c612b0a595833d05086c2/
        bfin |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/47d85a20e438aead2f42127188545606d16f820e/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/54aa27811b450b210928e5aca868771ed38d2dcc/
         arm | host-imx-usb-loader-f96aee2... | NOK | http://autobuild.buildroot.net/results/337d899760ecca9fd7861955b772aa6edd2e3b99/
         arm | host-imx-usb-loader-f96aee2... | NOK | http://autobuild.buildroot.net/results/49d83d80722d2245654b7019eda31b483cd43179/
         arm | host-imx-usb-loader-f96aee2... | NOK | http://autobuild.buildroot.net/results/fba11afe003c512ed5c529c417f3a0feb920b0ed/
         arm | host-imx-usb-loader-f96aee2... | NOK | http://autobuild.buildroot.net/results/fe9d9a2953423a8c25b7136b177fcfa9709eabc7/
         arm | host-imx-usb-loader-f96aee2... | NOK | http://autobuild.buildroot.net/results/27d785a742930b84f58defec416f222ed6fc560b/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/a10167a492dd4cd36d7c7d35f262ecdddea68759/
         arm |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/98c296d8bd717f4419fc6010dc9c92df3027a9f0/
        i686 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/c145089731fefbbdd0cae105922ce3d326032243/
        i686 |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/e5fb1e62cb634b20233751b4ea3b0630de70e9e0/
         arc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b3372581c82786cc0a87f8cc2e78f047cc079255/
         arc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/054d8496f1555274c8525c8c7381aaada27f9e70/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/54b519d67447d02bc3962511c894741172d56a0c/
     powerpc | make: *** [python-pyxml-leg... | NOK | http://autobuild.buildroot.net/results/e3bc3b23f41fd3df0483e133d22d348f22a46d99/
      x86_64 | make: *** [python-pyxml-leg... | NOK | http://autobuild.buildroot.net/results/9727fdeccc6df40c791f8ab31a606e0a8caedb87/
     powerpc | make: *** [python-pyxml-leg... | NOK | http://autobuild.buildroot.net/results/1b3db819a7182c0ad96735b47a7a07907c4b209c/
        i686 |               postgresql-9.4.1 | TIM | http://autobuild.buildroot.net/results/e7c34cd8581a54b236ef34f23c32f7e359c050ef/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/b42819fd3183dc9f7d6cf0dc7fe0f74085b3dd8e/
    mips64el |         python-pyparsing-2.0.2 | TIM | http://autobuild.buildroot.net/results/3ada21509ea94d2921a3e613444c27e391f983e2/
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/5b3fc12dacd4620231055f8d7b30f5f7e0ee0281/
      mipsel |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/78651e3d07480a11b56fdfcd074734f100936244/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/0477d2acb7bec65a96d8b43df10e4c6e27f29c17/
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/37d0ae47902c5fa6f749e8b832f31924ad03b7af/
         arm |                   thrift-0.9.2 | TIM | http://autobuild.buildroot.net/results/26c9e54a60e5f2117a979bff654131f1fd12602e/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/c0d68de3b5d7c4d37cc96636d40acf3f24d5d673/
      xtensa |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/ae31f4585d2c2f850473c446f1ccfba7699c711b/


-- 
http://autobuild.buildroot.net
