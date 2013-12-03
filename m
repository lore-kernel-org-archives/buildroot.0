From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Dec 2013 08:30:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-02
Message-ID: <20131203073003.0FA7E1014F4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-02
===============================

        success : 70 
       failures : 88 
       timeouts : 1  
          TOTAL : 159

Classification of failures by reason
====================================

                  gnutls-3.2.7 | 19
                     gpsd-3.10 | 18
                aiccu-20070115 | 11
                  libeet-1.7.7 | 5 
                  libtasn1-3.4 | 5 
tvheadend-c7d0335eb10d02b78... | 3 
                  connman-1.19 | 3 
                  squid-3.3.10 | 2 
  toolchain-external-undefined | 2 
                elfutils-0.155 | 2 
                 libpfm4-4.3.0 | 2 
                openssl-1.0.1e | 2 
             alsa-utils-1.0.26 | 1 
                 cairo-1.12.10 | 1 
                     m4-1.4.17 | 1 
                directfb-1.6.3 | 1 
                  libv4l-0.8.9 | 1 
             bluez_utils-4.101 | 1 
         dvb-apps-be76da69f250 | 1 
ne10-88c18f02199947b2c8b577... | 1 
libtool: link: warning: lib... | 1 
                    php-5.3.27 | 1 
           binutils-2.23.2-arc | 1 
               alsa-lib-1.0.26 | 1 
           imagemagick-6.8.7-8 | 1 
               audiofile-0.3.6 | 1 
                      icu-51.2 | 1 

Detail of failures
===================

   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/dfe0245058288de60dfed927c2aeca0f633d832e/
       sh4 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/ca3e273b701e83bbf5275309ef61b7c09daa1994/
      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/ef056257162350b0620dabda90126fbe875d9f20/
    x86_64 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/f9e0afe0f5b32809df77150506b687311c113ffc/
      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/eda1344acf8711eb4fccbd0a466c6ffa959d3b8f/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/ba93c3c5fd4a6dab8a6538d81bbdd4a6e81ad40b/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/45611232f5a08675a9e10dd1c1b6a7febb8dadb3/
      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/e6825b7eb3dd98d0d5e5b3f2ecbad27baa5240b3/
      mips |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d05e23031ea5542610c26c89908ae64c741fd330/
       sh4 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/cbc655c8e5f304b02647bbe2797419d2178b0a2b/
      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/cf2e62dbb027d80e366ed45b31cbd3c1176c5ccf/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b97027d80ecdc6ed8a2b4584b90cfc5d17255b97/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/f6af3d2c4e3454589190829160fa941d66ef7122/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/2a1c729d5a7ca6cfa18d2e2224dbc70fa6376173/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/8680bdb8743b8d734b24e85d80f194d2fa4bc485/
    mipsel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/d81970024649c1e89c01da491c63760afdad6cb6/
microblaze |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/660003cb4f46d529bb87aefd11f66dcaa5f396ce/
       arm |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/15d60791add88f8304c3ebdbb54709b2cbae2ba6/
   powerpc |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/ec1e00a93863824cfe0f76b47e8a4a64aa9812ab/
   powerpc |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/57f97abf1bcc3435ccf1cf15855652e5ea9e73e5/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/a23ea29afa48c871d6a047f151a229f4ab8c33ee/
   powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/bc200d9de367d08e4830ac6ee83ea25fe74d5ece/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/fdb817aaac4155c7bfefda4351b37d4a640d34c9/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/43a85f88e3a308da41c875a5c51a8026c19d120d/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/a7b77d5670ec0e74e38b9f5993c182962402a715/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/d9ee4b001d2a35110e005fdf044adc0f509ba29e/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/19d4b19a8f57251021435db3d90ab2fde47b9003/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/a87f6c115c18db4cb58b39f0247db8da4c853a5c/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/e62431d4da80a851fe17a6e4849c359bff7a3c9d/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/6c88d7e1940ef471890bacbe8c50d9168fab425c/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/8dc81f0a94dfae4494200a64f153b9323aaa4e8c/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/eb9e61579e7e3086e16ec992c294f75ec0b47c1f/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/49c540c7ed436972b625790612328adbc8119501/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/4bf4bcb9ab9a91430c0b20f5a30e08e7605935ca/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/e557a35acdbd1485bf32957e434be5b4fdc4b519/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/96cfe9088cc144ea18c7dfa7ced1a56db8577a39/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/8d7b223004176e5072d39915fb312025e4bb0299/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/beb133c21d4b90cfd9c3134776a19971d2855e20/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/88b8a0a063385d0c7bb90ca4a57fd90e3486c04c/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/28c2264e568476943852ca608ff3dd66cacbf00d/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/e4c68329e23ecde38dc5f95998df76cc2e877811/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/e89167c2873c6ffb5f4407670fb6813ae76c4db4/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/8809e6edad06d0d720826cd944857ae7289a1316/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/05f503483e8bcd983d6c2c4cc99a5240db53ee5e/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/f6757bef1af40540c73351637a4a43ec6227b2e4/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/c3d6ec91015120bbe861411452ad08d7f780fa5e/
    x86_64 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/8779d4d241a547cc750a7461011dd27c13fda43c/
    x86_64 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/3e3c210a553e688f4124ae7ea8d4a91e51936839/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/5544731198364c460d3519820e9ad89845dd7ea2/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/9b553b1cce884920604e7f5b3d89ab54d887b2ce/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/7538961228e143882c0f7c251c25bc1b6c8a3ee4/
  mips64el |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/0a95190399548ca50b13040382e4928606585558/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/76900d82f35ba75ba70432795c0e671b4232e581/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/9c127f903340024be45ba1f1ffc94df77924a791/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/42409545547daddd77c9e9bd59474ed033834ad5/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/9c604e7d2c25f2b1a3fd164b597f01c1837f102b/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/d4ff97605cb2ffd4945cf9046e465e57f08e43b1/
    x86_64 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/152ebbaadadefb6539999e9fb9d9cc4b0f5a82dc/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/a3698aa3836fa67fec590836097179fcfd82c3c0/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/a054f419ae25c03287195b945fe525a46e728b93/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/e7932ddba0a594e0c7231046d15fe95830d1777b/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/cd566cd34dd1b48d8aa449e1935044af5eceeae6/
   powerpc |            imagemagick-6.8.7-8 | NOK | http://autobuild.buildroot.net/results/de6a90777a9c1c29546f678e50c28f05436dd0a5/
      i686 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/526f4d272a53e84ca33f8f495b406b603541c68c/
      i686 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/fed68c2178c2c85f4d7d6f563891222a6533a461/
    x86_64 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/193d8efcaa59551dca84689d143d3a5c176e2c52/
      i686 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/648db8a0ef39af2ffd5b486c79977dc92cae27fd/
      i686 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/f0be60a699052e62bb018e978260832540127715/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/73d736dd3c8a70358ef4b19a63dda46178cf8bf1/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/e7e20082e3abb9c6d2a5a5b3e8970b8b1d2c2545/
       arm |                   libtasn1-3.4 | NOK | http://autobuild.buildroot.net/results/22a8dfce288975abba41d93ee88cf0d16c9d0f96/
   powerpc |                   libtasn1-3.4 | NOK | http://autobuild.buildroot.net/results/b1f8f4a1143ba479b9264068c59616ce16b229a9/
    mipsel |                   libtasn1-3.4 | NOK | http://autobuild.buildroot.net/results/15700a48db95087f72bd22e97705b75b56c08bc3/
   powerpc |                   libtasn1-3.4 | NOK | http://autobuild.buildroot.net/results/d14e299f1bcce1296ee0adf2f587464ac205031f/
    x86_64 |                   libtasn1-3.4 | NOK | http://autobuild.buildroot.net/results/5f0e8f62be86b56813f5fc0510e83289ed2b0410/
    x86_64 | libtool: link: warning: lib... | TIM | http://autobuild.buildroot.net/results/0df6e75f707a48d4ae1fb9fa84efb813a1ce438b/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/328c9b5dae0eedde67f8997bb341e8505e84244e/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/b8328c3aefd4642cdde7c5c53aecfb63954da3d4/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/4b7cba2c044cd6119d4d13aa38d9527306cdae84/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/db032bc1e5a9d6865a603152dc85e21816ca30b7/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/4f07f208f7da29e769d05952fc877d0b6ae9aea1/
       arm |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/e9c50962e3d954655ffb2beb22025525840e1fe8/
  mips64el |                   squid-3.3.10 | NOK | http://autobuild.buildroot.net/results/1e3c583c88f44eafe9047bf32886e0ec03f41549/
  mips64el |                   squid-3.3.10 | NOK | http://autobuild.buildroot.net/results/2c3a9801eb816eba0ec85dfeeb41ebd1aa3ddbdf/
    x86_64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/106e6d907126ef4b73617d0253c2f47825876ab1/
     nios2 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/489dbc7ed41ded35239994b6ea8bd5b396438999/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/c1ff3744716b072b23ac9d650aca599fca8531ae/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/150cde4a13b2de5a23f7b5872c1e7fa81c043abb/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/6943b20d745fddc5082b2f99bd8784f2bfeeb649/


-- 
http://autobuild.buildroot.net
