From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-05
Message-ID: <20130806063005.8549852C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-05
===============================

        success : 100
       failures : 71 
       timeouts : 0  
          TOTAL : 171

Classification of failures by reason
====================================

       sunxi-cedarx-74923e55fc | 4 
                 libffi-3.0.13 | 4 
               libglib2-2.36.3 | 4 
                   mplayer-1.1 | 3 
              strongswan-5.0.4 | 3 
              libatasmart-0.19 | 2 
           argp-standalone-1.3 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                  zeromq-3.2.3 | 2 
                  connman-1.12 | 2 
                 libnspr-4.9.6 | 2 
                collectd-5.3.1 | 2 
                valgrind-3.8.1 | 2 
           libcec-libcec-2.1.1 | 2 
                    acl-2.2.52 | 2 
                      pv-1.4.6 | 1 
                  libxcb-1.8.1 | 1 
                openssl-1.0.1e | 1 
             gstreamer-0.10.36 | 1 
               libcap-ng-0.6.6 | 1 
                   attr-2.4.47 | 1 
               binutils-2.21.1 | 1 
               ruby-1.9.3-p429 | 1 
          enlightenment-0.17.3 | 1 
                 zmqpp-31220ca | 1 
                 cairo-1.12.10 | 1 
                cegui06-0.6.2b | 1 
                   libcap-2.22 | 1 
                 binutils-2.21 | 1 
                     m4-1.4.16 | 1 
                      qt-4.8.5 | 1 
                libcurl-7.28.1 | 1 
                beecrypt-4.2.1 | 1 
          host-protobuf-c-0.15 | 1 
                libtirpc-0.2.2 | 1 
               erlang-R15B03-1 | 1 
              fontconfig-2.6.0 | 1 
                  webkit-1.9.6 | 1 
               qt5webkit-5.0.2 | 1 
           binutils-2.23.2-arc | 1 
                      icu-51.2 | 1 
                 qt5base-5.0.2 | 1 
               w_scan-20130331 | 1 
                 rt-tests-0.83 | 1 
               libsigsegv-2.10 | 1 
                gettext-0.18.3 | 1 
                  ltrace-0.7.2 | 1 
                   dbus-1.4.26 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/42154e691ab6120e392114c89bb58be33315f0e4/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/e8534b81d4e2d805f9d147491568dbced392b1d5/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/7ccdb2d377535486a074b45218c62f81a353e2d9/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/a8303e20ee1a987ce8484ee65279659706c9989d/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/ee4d1d1be4f8ff6e96dcd6a563f1478fc0c76280/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/bf0a9d24db09e1039588f05d52e3e921f0c3a953/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/ed348ea9ff42cd36a29ab51790243d1ac979ea5a/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/930e1a386cdf0b3fc3042a3d3fa0e1af569bbeb3/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/3e7bc5e2f82c2ff1f3aa4c29699556ded382dc7e/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1b1e4ad2f00de1e0d1cc9045822751c3882c7493/
  mips64el |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/103012e6b0696662403cbe07db1bebe9a8f94ace/
      i686 |                 collectd-5.3.1 | NOK | http://autobuild.buildroot.net/results/634a5fdeff81337dd3a40a494569aa237299f101/
      i686 |                 collectd-5.3.1 | NOK | http://autobuild.buildroot.net/results/7aeb5565ba06b302ada0815d159cde75bd781bfb/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/c4ea12c7125d003790453948730aaf9e96d52b96/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/aee6864aa3017387fcc809184954d1ceb7a51509/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/10a983162221d7d465e75ae36367aa7e0c1a938e/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/6d778d65f4d1ece30d23d7ee45f4ca18884a7d50/
       arc |                erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/d5e10f6281d307b66676b8003385d6c3ce885f90/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/2eed70bd72f3e2fe3938547dc09273668dcadc13/
       arm |                 gettext-0.18.3 | NOK | http://autobuild.buildroot.net/results/5d3856992e2643c13d9aebd882b4236345f571e6/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/0701ee5988e3429428a624fff5519104dd0ca550/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/78d401eb5be35c43e28c78ed77396a018cd04c1d/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/2841ea3ede6aed8eef19c00d37d5da65da9e3833/
      i686 |               libatasmart-0.19 | NOK | http://autobuild.buildroot.net/results/0f1e27e46a98d8b7262dd3b0ccd1d9ea848c2cfd/
  mips64el |               libatasmart-0.19 | NOK | http://autobuild.buildroot.net/results/acef43413e0375a07b3c67e5ac1c27b5b38e8187/
       arm |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/0e1980c3dc16f19c97c4c7fc2360db031cce897c/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/3df084dff9d8657e5883870e384f8c2a70f4ef9b/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/9f090c97f4443da83bd96058e71d2f12d557c891/
       arm |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/a83026d928dd6e6b66fc6df3b6eed33c32d69bc4/
  mips64el |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/95a693ddef7d3600991af23f496f31ab860cf452/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/3c2962163b84b9df1075c260bbb8636251aa9465/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/e547c1b310dfd206b69e43925b7ef2d581912d5c/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/268263718158f6f48121b252d46aa1471ddf921e/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6998bffa5881cdfe4ec8ea022c44ffbee6dfca3f/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/49d7e86bfa66c70760a32255a45fdd9229dea139/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c809df7d375af4aa3af44659af01989ec22efa1c/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/156431d4b4bbb2f1f3d600cfb6166baee1f399f4/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/283745e1b286b4cc6c8e36fb4f9c56add6d64609/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/1189d93d030a37bcc65b3fe2f146d5f55481e7f7/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/5db02fc3f5bdf43974864bc497efc082f74fc7a0/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/6b768f0cede197715cb221b3ee7b1ee6384c7b24/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/a576ec36a78a70d1bb30fb225c54ad6efc138c49/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/6c859ce5603b8fc9b495c9fed4113ac3aadd6f19/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/a2204803b30ed48a5cff74c2bdfa8031b5045b57/
       arc |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/937b94e5bdb9ad7cf4e5afc2ce9a29e4493b2405/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/19dfc0f94978973cb50b8164a3a8325454a93bb6/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/3f1ed5cd0f25392749c8531491f2198f0260009e/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/cd713b8f8f8f05a80529a225f8bc13f582a518ca/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/2fb63f8bfc9642433b1b294d1db7e27b51cfeb4a/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/c0aa185134c6f8acd7c696c8bd5570d14c6ffc65/
      bfin |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/40313eee3eeea8038200e05542fb1c3a3e79120a/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/8f6ddbddd6a27cc8c39ee20469a7cf72bedaabdb/
       arc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/cac3019ffe344e58408def3b74e3964f19cc49c3/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/a9f7ffb0d1a1c90615fbfce8b54319cc18699e5e/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/9c0ee78d56e910601e5003b161d26d78691394ea/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/772f80a30174e829f2dbc8581e11127b2b93ef7f/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/6159beefb8a98baca97b417202c79b3781cb2fab/
       arm |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/06ad1ea0c044741748b1462a3dac6d6c64cbc2ca/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/4d2e4ea87b82fdca65e07e6659436fd51b9050bf/
    mipsel |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/26ef29e65461ebfa26fdb565c3b462c456e8df53/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/485c499b58b0215aebcaba19e365db4aade5419e/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/ec0ac8201162ac331648b8e6c6caccdb25a6d3e0/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/fa1a4ba89da8ccd9820762dcb6c4a9d52f10bb6f/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/328b36c3cbf952cccabf16a25fc13f0c3515e8bd/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/6935762c7b5ebb3cad4150cadb052e4b94c3b6d3/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/05fb261315373621d6ffad7f786acf2c6a6ae9ff/
       arm |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/b84763b7d1be731ddc065b5a17ee55c6d7a0bba3/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/69f804b0fea424340aca6797edd7495c6e6a40e1/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/1a2331993f98b38bb4048d899beed9f7bcb50b25/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/74a8465fcae3b5799ae4d6997916131283c51041/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/733e4aeb1e251d81d5679a669b625ffba6a5ddd5/


-- 
http://autobuild.buildroot.net
