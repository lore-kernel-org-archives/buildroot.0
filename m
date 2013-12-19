From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Dec 2013 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-18
Message-ID: <20131219073008.190BC101678@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-18
===============================

        success : 46 
       failures : 64 
       timeouts : 1  
          TOTAL : 111

Classification of failures by reason
====================================

           python-pycrypto-2.6 | 11
zyre-378b8b5cf76d10f5e41b33... | 8 
                     mdadm-3.3 | 8 
              python-pyasn-1.2 | 7 
                    ola-0.8.32 | 5 
make: *** [python-pycrypto-... | 4 
          enlightenment-0.17.3 | 2 
                      icu-51.2 | 2 
               qt5script-5.1.1 | 2 
                 ffmpeg-0.8.15 | 2 
               qt5webkit-5.1.1 | 1 
                  thrift-0.9.1 | 1 
           imagemagick-6.8.7-9 | 1 
                elfutils-0.155 | 1 
                aiccu-20070115 | 1 
                     nut-2.6.5 | 1 
               libsigsegv-2.10 | 1 
             alsa-utils-1.0.26 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                 mplayer-1.1.1 | 1 
            python-crc16-0.1.1 | 1 
                  nettle-2.7.1 | 1 
                       unknown | 1 
tvheadend-c7d0335eb10d02b78... | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/9c789a570ec8c106ccfd158f16275d6567728811/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/5856ce57bfa1a406bd44fb0b93eea1689167286d/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/8fb43dbd5785e417e68268d1c8b4ae7efbcf96ca/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/f47e7f9d88f2955797538c7dd2429fc319e12636/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/cbec0e95b16ad3f211d3a004fd8dc62e99a4f1e2/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/92e5d26ba204ade334be162f2d1a3a5270d58478/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/d889c9a3e3f9cd243ae25a3f43b80e8106586ba8/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/a967cff637dd2e3e2b2fd7d686818439960f5193/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b3ef48fbf0e1516a77325cb6b8f35989486163e5/
   powerpc |            imagemagick-6.8.7-9 | NOK | http://autobuild.buildroot.net/results/950a5b8913f74a1a6b541e66eac8bc8968216bdd/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/0599003968f6634146745ca35c8544770f4083b4/
  mips64el | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/0edc6f5c586e013ccfc5184c7e024b90a2367777/
      i686 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/1333bd63ff7bc855a711615ed06b7c661dc6eb8e/
   powerpc | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/035422a814c175230b05ef50dce3a122ffd6c9ec/
      sh4a | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/9ff94ef20bfeb0e7c2136f8c9796aa0438a4e1b7/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/44e00cd2c69b472e273423323f6e47d47bef67e4/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/278b3e8eef69fd0a121f95265d3a194e56851e38/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/a4831e36f9a17b4bc48f2af48f49e698e4045882/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/a799427195f66cd4c5a86a809cb47017ebe7c5e0/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/c5c50a7c08b196b53bd570b5d49b630ac65c8b18/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/7ebde90bf38c56a35ad8ae2c7131f4c91e32af1b/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/ea02a84ec08111040ae068736e9c295b1d7c15b2/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/d572e93c8fe04d6fe0445bb45d0d6358afa3ba52/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/1a97885aa55e89702f839ce36d039123b967c9a3/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/0ea355d818a688f61cb2b1a79c603d6d3584046b/
   powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a969831b5f96c94c3be66c3b8f47c561bfbf5e69/
      i686 |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/682322653e098030bb1c676c2511ce926b17efd3/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/c1ddb17d63267394e0e0c92dc98c6100440679f4/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/541143b7887cf3dce647e9670a949d51ad13ce58/
       sh4 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/499d674d10d19e6ce53aeed79a5e3e3bb361648c/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/7390ee2978bda017a2d15da0bea10a30d102964d/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/38140b8aa9b2e25b389afcf3eb5b19d9fa5c08e6/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/ec473a15f1b3479b81e08635929d1fcdbdde54f1/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/16695f332bd9d4cf5c251e997ce317e8fdd1d1a3/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/f56fbdc262621eb823eeb303b67c88d436bd0f0d/
      i686 |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/4f8cc57acaa1babb9afd0ee992f9174c493e1ffd/
       sh4 |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/78538b2c0fcc38e8db6642c98f9288f84bf69e7c/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/230bd9a4d306208b866352e06590459683fc8cd9/
      i686 |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/d8ff9b84f43e46a697e885466c11d7e427b5916e/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/a22f70b4c13fd6261cf63e09b51658ab8f1a3c87/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/3a0aa67ecc5bb793decca7f3fc686869adee9a49/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/682de42db2710919e1e2768d26560474a4cac106/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/d8d6686b2083738b0d99fdbf1e4e16606d5fc53d/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/351646a2c9b3ac48953a31f9860b8c1a915cb03f/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/d97d1c3b115f80733bbc87616e6dac36fa556059/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/61790d60ed0b8a7585769fd36c25560415ed127b/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/4a1989b30a37a1520536ccda8b3cfb25a3110045/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/3730de7e44ac64129fa87cd3b6d0f1be51752b72/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/02df335696bb748a99cd94575a8c5cd196cc46b2/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/592dbdff89a6f416391dab8753d70f53acdd4ab3/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/42a972be1f60fe357acd764bd6b254e6f40d81ca/
   aarch64 |                qt5script-5.1.1 | NOK | http://autobuild.buildroot.net/results/650e8a8431a5abdb0c5d6e3c00e0bb2b2c3a3de2/
  mips64el |                qt5script-5.1.1 | NOK | http://autobuild.buildroot.net/results/c6f6d0b67091344bf4b6f3ad7188cee33233ea74/
   powerpc |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/85c9e114587d0d430dbf7bdbda6d8c3bf4288e16/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d2b2978ab9bb6b6ff9a9b17ac555aabddf7451a2/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/609bc18e846ce8879e54309717b8eb86a0803d90/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/37f08cdd36271dbeb4833f173ade61e17d28cf1a/
   powerpc | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/0c55ce1e089a9897fa042bfe08a239926713257e/
       arm | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/c6ee1e955cc1fc7407a45b144ab938ca31a8a525/
   powerpc | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/d0447117a7f17bec59841f2416ed1ee0e0d7a317/
      i686 | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/7efe8f7d19f78048db8dd1e996fb64b2fc3b505a/
       arm | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/0db95fcacbb7a2081542099dae5798c1585116c0/
    x86_64 | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/1bde20068d207c71de18da4099d775f41ada0f41/
  mips64el | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/eaf79fefc3136e1756611e6e784e8dfca6770663/
   powerpc | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/bf29a4affaef304678ba02e77ca615b980f5d19c/


-- 
http://autobuild.buildroot.net
