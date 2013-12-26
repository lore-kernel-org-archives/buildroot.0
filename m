From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-25
Message-ID: <20131226073009.32010101A08@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-25
===============================

        success : 90 
       failures : 73 
       timeouts : 1  
          TOTAL : 164

Classification of failures by reason
====================================

                  gnutls-3.2.8 | 24
                    ola-0.8.32 | 4 
             util-linux-2.23.2 | 4 
                 fio-fio-2.1.4 | 3 
                   qjson-0.8.1 | 3 
               alsa-lib-1.0.26 | 2 
make: *** [python-pycrypto-... | 2 
                 pixman-0.30.0 | 2 
tvheadend-c7d0335eb10d02b78... | 2 
                 mplayer-1.1.1 | 2 
                aiccu-20070115 | 2 
             alsa-utils-1.0.26 | 2 
                     php-5.5.7 | 2 
   host-gcc-intermediate-4.7.3 | 1 
                       unknown | 1 
                   ulogd-2.0.3 | 1 
                  bonnie-1.03e | 1 
               w_scan-20130331 | 1 
               audiofile-0.3.6 | 1 
                 netsnmp-5.7.2 | 1 
                  thrift-0.9.1 | 1 
                xapp_twm-1.0.6 | 1 
                 cairo-1.12.10 | 1 
          imagemagick-6.8.7-10 | 1 
                 libxml2-2.9.1 | 1 
                      icu-51.2 | 1 
            python-crc16-0.1.1 | 1 
                grantlee-0.2.0 | 1 
              python-pyasn-1.2 | 1 
                    systemd-44 | 1 
ne10-88c18f02199947b2c8b577... | 1 
         host-elf2flt-20130904 | 1 
                protobuf-2.4.1 | 1 

Detail of failures
===================

      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/3c8f8dc19b0168893fcaafaedc19cabf380fd3f2/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/56a64a244c2bcc8dcae74f12f6365c83271a5fa9/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/72d44ec6e4c7f7decb33ec80680f3be3687e3a78/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1f2f3586164c3c55578880718c69f44081e94469/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/ee107c8491a3a4c76a0b2ec10d920ffa8c493076/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/a08846e5699fede1d3d7c1a04ae81d53c2fda9e6/
      i686 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/815c2721a5c26bfd037b1a3fb065de6500c7b88c/
    x86_64 |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/d1bf87fc03c5046272efa885a98572123d0cbeb6/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/045e8694b8803cffaa56d75c01abd88890556737/
   powerpc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/f7ae7ac2b5da9afc6314f1e813300597896e5ca6/
   powerpc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/8ea0d5eb1ab8e32c4639056a16909e8e2697fc68/
   powerpc |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/ed599f2a5efd741a571df752bc719dd37c785d08/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/fa0bc654228687bd9bb940cda65ef0c1e4a2f88d/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/23ef49d9b809f30ac7f0278881514ad4627cb780/
       arm |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/f500ad896265d7bb7dbcc73847d622bb1c145e5e/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/4c2e13a3527f7d99455554f39a3d77ec6da3d244/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/0742b958c712ace05faefdcf91a13ccc2a84dc38/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/34aa9f86d621412c00c9111a61a5627d304378a5/
       arm |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/867f9c620d443b5f6a0c5b391639de4126673da7/
       arm |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/63a3c89fa41cad65dfccdb4f3329a1e72640a518/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/9f9e8b83549f19eeb82e25943511886e55720a59/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/c2762c9aa4ffb9bbad355f4b38b8971fd97c376c/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/9048e0f54972123f0b1ad28cd88419c5530c7aff/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/d582f2e1a60addbe3997040f419f857a00c51e2c/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/6e778307a8abf9f875ac2234fc184798f39b42bc/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/4526821fdb140855a32000b2b9873ff7648b18ad/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/ac80dc862a1048c1574d8698869793ef7eff1f84/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/0a101ef5e5fdeed6ea868cc143459306e7c031d5/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/18f61b3be6aed73f83b449b5082492a4a6ba8ffb/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/a3d47ac5427b8bf81f9157ce5fc10414f495531c/
       arm |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/5e220e26756e44eec4649d4a985a2c6f76ec130a/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/55407464149006022aeed57536cf321ee29544fa/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/e3b99008fa38da5c24eb40ce346475c1e6c7f594/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/79d454f14efbd1a293ad41519d9c4ae1a7936151/
       arm |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/a4735e8e2201d59e2f8da44041aa551aee7115c2/
   powerpc |                   gnutls-3.2.8 | NOK | http://autobuild.buildroot.net/results/a588d0f60669d981bb3a2f201ba52af0b3a92863/
   powerpc |                 grantlee-0.2.0 | NOK | http://autobuild.buildroot.net/results/844b3e10e57455138fc026d412f4b8549384853b/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/06f375d282cfa62125d60df8eb2b40fedc6618af/
    xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/be1a0193c08f075807bb93e68f5a5f47ffb38966/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/7ce63ca6dd78b16485b774a083991f1e516fe895/
      i686 |           imagemagick-6.8.7-10 | NOK | http://autobuild.buildroot.net/results/1f5e97f653c6c3f52fe975fde4b1874a7f0275e8/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/c1b1a1c85834c7a1061b8b544e13faa7d80e8cb5/
    x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/97ebadb310d2d9f75c2c13a99b5fabb564f8c810/
      i686 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/355ae6af3fbf7f483c00d1a4bc95e2efde17b229/
      bfin |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/5d80ade791319b6a66ac1c342f7b1d25c023f0af/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/d61c44e4ee4ad459389e3be6bd471fd180774568/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/e8d5ff6da488cab9662c8789e3a0ec59041518d9/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/5136f1617111142472cab49e20ff5ff8d765021d/
      i686 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/84f26188fa924b9f1f22c57b14881e7f08a1cbb5/
      mips |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/9d5ec311890c58a4c86a5767e79a66b6619bae61/
  mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/a71f76ea4212d68c4969101959cf9b4b8130c17d/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/e40708f3fec4169841c5f17c24c5ba580dafa188/
   powerpc |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/67500a0527b276fcc869b9d35146ec284ccf1884/
    x86_64 |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/44101113e96307e93dacdb74fc66e62f64223b9a/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/db7785da51133d9874857731de6e7ff19e13527b/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/63c4cc230fb0c1b359f2ca15721e20deaa0eecc9/
      bfin |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/e54cb3d74a886e8bb5b88373d3e67b7a6c586fa1/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/da83810d8021f354b0ffa0c42c02c7f066fe8ea1/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/0c36b1084a5f97ac01058f2468c2b0cb82098313/
    x86_64 |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/f73b543c4d2ad308c343834897f2e6fb8c7b8532/
   powerpc |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/b8a846b45b9490e9e15052bb3ee62bb9f4865936/
  mips64el |                    qjson-0.8.1 | NOK | http://autobuild.buildroot.net/results/b4dd14d84bdf6ac3f4d1b362a5f32fbf6e561165/
    mipsel |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/ad9516b9cef6dadbe784b7b29e9ed629b850229e/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/6bf7a65c3f0dd88fcd0ba54fa8c5d17aaa66bbed/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/c4ad870edd26bb20f3648627054c95ab7403d6d5/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/bd95b2ff3cef163b405fc73f19b743638de039b9/
       arm |                    ulogd-2.0.3 | NOK | http://autobuild.buildroot.net/results/1cece0db309dfe5cecc69e88b02428615ed87316/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/93ea6d6ba2e6783671eeaf35041f8d159c13437e/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/8204008da6944923034fa17ecbcfefcf15373ee5/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/e5b52d01e8ac2eb12757cdcb1b7c47b72c622c04/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/3e4942d8aa762a0807d57eaa4680dd96150ab8a5/
     nios2 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/bb29e296c0823102e538503841c569350de2186c/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/0246e3c7fa7856a5e4323f88951520cfb1b34304/
  mips64el |                 xapp_twm-1.0.6 | NOK | http://autobuild.buildroot.net/results/a5b8b65520be6adaa53e6fc402d25b23c8a0075c/


-- 
http://autobuild.buildroot.net
