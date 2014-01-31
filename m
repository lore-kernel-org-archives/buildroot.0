From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-30
Message-ID: <20140131073010.7649D101A13@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-30
===============================

        success : 73 
       failures : 69 
       timeouts : 2  
          TOTAL : 144

Classification of failures by reason
====================================

                      axel-2.4 | 14
                  ltrace-0.7.3 | 7 
                 libhid-0.2.16 | 5 
                   open2300-12 | 5 
                   minicom-2.7 | 3 
                  thrift-0.9.1 | 3 
          sane-backends-1.0.22 | 2 
                 cairo-1.12.10 | 2 
                       unknown | 2 
mmc-utils-11f2ceabc4ad3f0dd... | 2 
                   ccid-1.4.14 | 2 
               libsigsegv-2.10 | 1 
                 qt5base-5.2.0 | 1 
                     gdb-7.5.1 | 1 
                  connman-1.19 | 1 
                 webkit-1.11.5 | 1 
         host-elf2flt-20130904 | 1 
            libvncserver-0.9.9 | 1 
                  iozone-3_414 | 1 
                 libxml2-2.9.1 | 1 
                 mpg123-1.17.0 | 1 
                  nettle-2.7.1 | 1 
lua-ev-458165bdfe0c6eadc788... | 1 
                 pixman-0.30.0 | 1 
             fswebcam-20110717 | 1 
              pcsc-lite-1.8.10 | 1 
                aiccu-20070115 | 1 
               audiofile-0.3.6 | 1 
                 libevas-1.7.7 | 1 
                 rt-tests-0.83 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                gptfdisk-0.8.6 | 1 
  toolchain-external-undefined | 1 
                     vlc-2.1.2 | 1 
           imagemagick-6.8.8-4 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/49293a3ff29f9093892b5d77d7cb8cbd237c9e4a/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/c343c0c20f416262a56918d6f776d1ade8b4a28b/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/0fc5e9fd6a5087d25a0f1b1ec77d5fec2517f33c/
      mips |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/14e044c357dfed3861d80dea23b1531a5ef5f59e/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/32ecc62ba10b72c4c66f8cce194da5abe269f172/
   aarch64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/532848b4026d7cb2c17aeaa94f6ec00f209699cb/
       sh4 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/689388005952700010acb23dc763ae84ca9a469c/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/548b76e951524f69566bbaf0614bc7a87c8ed18d/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/7c34d31eba93d5c7449e180cff5ae092b4c72b8d/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/b204d392881fafa1013cde95c6c5df9e1bc74025/
     avr32 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/f449852b493cb5a748d5fc67bc97037c48bfd0a9/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/88cd30a05e3de98b149981513d2271610cd82e25/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/2d984eb008a92eb07e9068804f3684b38396b7f7/
      mips |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/13a55b7fa25b7cff5b4c75f22a4457908af2bba4/
  mips64el |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/394abab07c78f6fde7a3b7995b2e4da035bee831/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/b7612f07139bcaceaf85dc7d0f6886e3e3c94b03/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f32f60a3dd04fd7eda859df8195ac40c0e9e55e5/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7222727ed74c0ddc9d3b62741e539f67cb685a8d/
  mips64el |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/d061293c81ea862e702d78cf1de703667830156b/
  mips64el |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/acdd37f8cef9f9c7a1e837f506be47b6f1819559/
   powerpc |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/c488e7508900cfa7ccf17b4f07d5fdd77c608a92/
      bfin |              fswebcam-20110717 | NOK | http://autobuild.buildroot.net/results/62b74b3c8024f362035003450676bfcc36c7171a/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/9ddc59b0b9bb479076ac35ef45b6edc87798445e/
      bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/332da9aec5c8c065f89209323c3c33649d9296c7/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/d01fa56a39bac7630118707175a05501baad3d75/
   powerpc |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/78bda9623041ee6ac3deecab531df728470ec37b/
       arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/efb101d04d60fcd143b64db4a9e61b2fcf26592b/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/9cffdc11a0e05baf4ec89064bd11ff85354e434a/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/0711ed5831a9da4b8dab24d54b183527b8130383/
    mipsel |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/114b9308aa22abcaf5fbc7bc49c7c598f88d6f3c/
    x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/23d57e92dc727d9f1bccc9bc5e3ca96cdb094c1b/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/5ce21a31bd8b38c9cc74f5b9286c35f4b1076fe0/
      i686 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/eb8314c8cf5c423b23a2c6076176a40b3788f9d8/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/1c3ca5fb85071fdf0be9132664de878cc588b2ea/
      i686 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/b22f2caa79f371c625939b65a88a2073382c5288/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/41e6e145a4ff829bcb581d945edc7303c5d87a71/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/0ab4446aaef9043bfc12d043e4129cb485171933/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/18d8f753a04ada283dc3a343edb13b50b798f497/
    x86_64 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/3cd0b805dbb30e5658360525d6304daefdc32836/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/d4803b1804730b2f9e708461aefdf187cab01220/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/49fe32f9c01fa70184752b1e51fb4ebece331a4d/
      i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/8c6f8d630ae2b534c759968e01e29019e2992b4b/
    mipsel |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/bde8471cddb609fc39dc23a6ff9b1af363905228/
    x86_64 | lua-ev-458165bdfe0c6eadc788... | NOK | http://autobuild.buildroot.net/results/c1d4cd1785a25d66485657f57491fc72722522c5/
      i686 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/6edada72ed2911b0f4c3346a85d81e795c93bff7/
       sh4 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/e5f6f9dc9843f7cb04f2a0ab6d4cf161dec15805/
   powerpc |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/b916488a10ba78d45f0fda0b2be77f75f123f25a/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/c9d05dee6f619ef408226423b8cf12a4c80f83e8/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/2905f5648567d687352adc41265cd8dca4d6d44c/
      bfin |                  mpg123-1.17.0 | NOK | http://autobuild.buildroot.net/results/d4434b0f392cf18a29d99b46d39ef445e7af8c2c/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/43c9e3004e17a60619944935c56e3989c2e4d8cd/
    mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a90fd22c4aca864eddb4b8719cb7bf009dd1b1c8/
  mips64el |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/8919f82636c19bffe83692be48bc5cd77f5d21c5/
  mips64el |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/7916e25c0b1023eef25715583fcd881caa06f37b/
  mips64el |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/60ba579aae14bf2c0deee58bb60b1731c20e7bfd/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/4e60fd7a50cc4234ed1a0159df8c4b64beea45bf/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/aa02d5b848d6cbb694342e63ef8e1f263c942154/
     avr32 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/84effac3e761f81d5ebd1f7d0c7dc77a7f435a6c/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/6086881710fae5bf8cdb6e367e5705bae562cf0e/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/a60a00149083eeb2d4736c6f832e9213375339d9/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e051a14d7fd0d18c9d44bad1a302d293b9ad18f3/
      i686 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/9813b197858603a5926956b68670dd1e2f455505/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/5b3d463a0063c6d9a9390cde9addb2587d2b1777/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/97741c4f70dcd8cd583f689b93cdde2c48a2e5bd/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/5f85121ef3e4023a85df375508220d989fafc5fd/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/30af7e8b57fc6c956da3db597748d29ca1778406/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e144e64f0ccaed97e0a0b267e0a086e0b93f4bf8/
  mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/d3bec2eb022736a91546228a503de4f600a555d7/
      mips |                        unknown | TIM | http://autobuild.buildroot.net/results/47d1126b98f0cd2e09708247a65dafd407806e49/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/567943a036efbf6260a7dbd5e6638cb12f940707/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/74c39dfe53f65f5375825a6e4449da7f449596c6/


-- 
http://autobuild.buildroot.net
