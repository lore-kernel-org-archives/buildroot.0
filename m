From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-09
Message-ID: <20130610063006.6D94552C0FD@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-09
===============================

        success : 72 
       failures : 223
       timeouts : 0  
          TOTAL : 295

Classification of failures by reason
====================================

                 libpcap-1.4.0 | 161
                    gvfs-1.8.2 | 11
               libglib2-2.36.1 | 8 
            host-erlang-R15B01 | 6 
                 rt-tests-0.83 | 3 
am33x-cm3-AM335xPSP_04.06.0... | 3 
                 libiconv-1.14 | 2 
                     m4-1.4.16 | 2 
                  ne10-88c18f0 | 2 
             bluez_utils-4.101 | 1 
                libiscsi-1.6.0 | 1 
                      bash-4.2 | 1 
          host-protobuf-c-0.15 | 1 
                  samba-3.6.15 | 1 
                  zeromq-3.2.3 | 1 
                      udev-182 | 1 
                    acl-2.2.52 | 1 
                libsoup-2.43.1 | 1 
                directfb-1.6.3 | 1 
               libgtk2-2.24.18 | 1 
                libtirpc-0.2.2 | 1 
                   mplayer-1.1 | 1 
              ti-utils-06dbdb2 | 1 
            xlib_libXpm-3.5.10 | 1 
               qt5webkit-5.0.2 | 1 
                   squid-3.3.4 | 1 
                   exfat-1.0.1 | 1 
                  fbterm-1.7.0 | 1 
                libcurl-7.28.1 | 1 
               pcsc-lite-1.8.6 | 1 
                       kmod-13 | 1 
                      gpsd-3.9 | 1 
make: *** [/scratch/peko/ta... | 1 
           imagemagick-6.7.8-8 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/64d9411a2a9dfe800dc57a1c5d6c75496124d850/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/d5ca993d22205eb327dd6c56785a369700899928/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/6277766098ed37c2054f3c1e535b48f4dd6337f8/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/db13623b1701bfe678c302e8f88c7473cb2345f9/
      i586 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/ca78a582efd81aa2e1a0b257078d011f8d7a615c/
     avr32 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/11cadc7676cd2cddbbfc4af460c54254a28af5ae/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/fd0a5cc5d62a668d2f4a50862d829cd3d91f8a56/
       arc |                    exfat-1.0.1 | NOK | http://autobuild.buildroot.net/results/2f43e4f82fb12d03329e4dffde8e114ed27ab854/
       arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/d4eb9e3835ce18e42e25066f47a6afc3e93a3a21/
   aarch64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/781531f965afe23db3f7c2ad8d09c423ead209f7/
   powerpc |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/bcece11e26b1a2289b27b649308b90e59b9bba7d/
      sh4a |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/186f32e4e2f49868e756627bd93b0967af61da2b/
   powerpc |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/d026f3e697d60a3730f89acab18515eb568c4d0e/
       arm |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/e466346341dff45a84402db9291281c3b9becfc7/
      sh4a |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/175d09623919c07eca5159ec8edcf061f264a412/
       arm |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/11f3ef1b51360bf0d7e6e5e1bc91072924c1879c/
   powerpc |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/f26c08f0c8fecb1f1930d40128e2897ff9b14942/
       arm |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/cfc5bf6f0adba7a2e7e114d135bae3db25e2d613/
   aarch64 |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/131c5d035177200c8c1c2efca261b65015930538/
       arm |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/36aead136d8af9fc08efd9ca7e92eb135380b9ca/
    mipsel |                     gvfs-1.8.2 | NOK | http://autobuild.buildroot.net/results/e266463d0ac3c0d5619ab992076190ffe5f560e5/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/8f20f44c6bd6a765c84ec48ff2c3dd55c26b603d/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/bdf37607ca59adda179007d84a762bd3c06d7c89/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/049b1f3ffc9237e4624ae739d02041c1e93dfc15/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/b0ea64950b91f41c50fb35eb354469931dbca4c6/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/82e7bca04a948cc186f061a536f322ecb50926bb/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/d3243f97c8ca45c924c2a458bff4e703dedb279e/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/94361efbd36e4efdbb87657c2c43326887cdf6c9/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/0918709089e49f3cf37f7715cd9240a6eb1293ae/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/39756c7aa6f417675d2829080a08bf7389072a18/
       arc |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/dd7ef742667b3369160a6d6af71e58e41405861c/
    x86_64 |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/ed68b2c0e7f9c02d4478dc998b464cf99598718c/
    x86_64 |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/3a9c74c9db6153e3119c53fe68156006ec1663dc/
    x86_64 |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/05d21eb4ad1b13b93e09e4a8a7543bc7fe834dd8/
    x86_64 |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/8e277dfa82c8d16e10a33f1bad7f941b748931c9/
    x86_64 |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/a86b54a336567fcb6bea487a42e6bd9c04cd0701/
      mips |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/90564335bb996edd26584a4bec0f4c9098a2152e/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/82efcda246a3a9b89343172146b5a218ef02a7cb/
    x86_64 |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/dece077c2cc831332badefb46c386a762ffcad55/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/a87847c6f68f134ea1023f8b2caa7c55074e7245/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/55662033ec7cafc1769cd343e0fcf4eb2dbeb1ec/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/16800604f3eace97d1090d7799ffa72b29eaa7d6/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/a69eb05048e5d064aba7b3ce5814000c44d29b32/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/0c011fb3ec46a9eef3e0e8d7f8ed1559a29619a4/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/6aeafd9dbdf9e948d8fc31c5ec33b554f4dd8d20/
   aarch64 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/dbea09ea5fe152f399616fbb8f5ad2598ca698d7/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/ff5428a0001e601faa0c23f0a7b63f23ae02e009/
    x86_64 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/6a4518f90f01010a43ca12ec4897756c0dc7f31d/
    mipsel |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/e995fe9bbb0c46ee999c3683bc350379cbfa002d/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/44eadad72d567e6202e0f0e4959a9b9e87c194de/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/583bc7720f96833155bb6fcd9db579f22ce1a08f/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/72128423c0e777ca4068a06bff85b7047a8669c3/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/8ee0abb32236dabc7e0a0cc94fb1080f28e42295/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c667b01d398fbaeed18786e442336cfa08dd0059/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/ec7967636076592363fb8f4f0ac71860f8e77739/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/fae7853f6bf58fa588d6f08eca5b3c022ea771f6/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/4d9c6babfa6dff7eb59cdfe933ae727b8380d35b/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/cf6e8817c24d19b11192c988ded9646047cbbc91/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/b6585bf2985a188e797e5a6b71a35c461421e3b4/
      mips |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/69d35086c495d7ef8c0a737eaf866172f66d1dfc/
       sh4 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/cdb5858afe696e106136d7a18c2655aa203be994/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/ad35e152086422bbd9fff358470ff0c790a245c3/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/bcaa9536d300e5403c1dd76e36b0a5fe6a2ab8ca/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c5cc567dc2b71680238a5d6d155dde4230b2b2f2/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/5f4f375c685d77ccd4b8c4bfbf7205aadbe63dc6/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a0f196e6174b1e231e1123ee3fe4d7db5537c792/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/4e07492d780e0d3b71c3e500fae1ac54afc27659/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/5efff86c78afe6e9028a486b43abf5e5763676e7/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a02f202bd1a400cc95647cd93979dfe05ac30e5f/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/d8074b2135aa3bd82a138183183146d5b4b2143d/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/60f4cbaa4072e779a616b6d04ba81ad85d7677de/
      i686 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/2e06a885d7d351f623d7c6d4d0bf6dd73978f615/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/1da8ad5d24fdbf147661c30a84330511a7908921/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/cd6ba6f87b912d76533cf126777c1247abb2ee17/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/2ee7aae3db14ea5f44f04d4d8477715456de46fd/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/9042ccbf825e0310c4395ca28f2ade30da09fc47/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a02c17a1fe571c0c22d985b9f16696921720ed3a/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a95ced98ffc45385d621c2ab5368720a96d904c5/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/374abd5c9c7cff55b4ba137d4bdb6defbe54744e/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/f9826e210f9955071b21a94ad7486c0bc7930c4b/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/5cec2ed4d75c965e46875dd32dde222ec62720dd/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/4a12556427942eee9ccb9629ff8df819f482224c/
     avr32 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c0f39b1824efea1f8dbf1d027af0cbd1d5d8dd88/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/406e150a68e06fcfd2619765df7833dc5792516e/
    x86_64 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/e492c1b4ca95b8af67c2a3c1cf4f87ffcb09ed2c/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/dc70523403e8f5169b6c6f750d735befc4aa2e11/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/2b1cdafdec9fdec1121cd8acc5f2b5e3260d8d80/
    xtensa |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/b9d19a680f881093ef32e3457080cd02087dface/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/954419aefcb4ff228c49d9c75ff6a2e6992344c8/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/e04cdcb0ad89a5ceb634b5483cf8aa1da6bc48e5/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/381566a344cb08fef44355d1f77b7167868854f6/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/7a4bb22b5bd754bcd629398665a76eaec9f20b64/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/eca9fb39f278ceacbb9a1b4bff37ed11c2515dd1/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/1efe9f8508078b4442679e820b3fba6981effe87/
      mips |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/25137905e414496c047ec2e40299b34ef7c8644d/
      bfin |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/fe2812052f18abbe3b4da9dd42fbd0819a9356ca/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/10fb979a10b32f695a7c9770bcb7c2391a2bc42b/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a0bfaec01202c1425a511c0d9d7a42f77940de39/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/945b7fdd886ec6570f3ef0c511dbef5377a36969/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/e7fe3c0efa71cc67db27dbfc019fcb8415463213/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/849d870586dc2fbc6f6836020832c0bf300a9abd/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/b10cbd8cc8da58564832511c6c1b8ed36a06d7c9/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a5b696ce284acbeeff2edc4f9d9cd808b6e24de3/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/f66366d41997c0764fb2ae7c40291f643bbd27f3/
      i686 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/49372ac10e5f2ef1b2200bc368fcec0966c214fa/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/540698af7b949f2afe95ede49baae85444a2bf71/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a78c8f41b0557ee39628581884a6051e3b99c2f3/
    mipsel |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/326fe2801a4ba32aeeddcdadbfffdc1cfd9db98a/
      i686 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/fc427ebe8b3ca8e648ccab21e50cbb8fd8a12044/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/7a24e3398d6512b9c081cdf8ce1fc5f0be084816/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/4724a6f068634108fb0722d0f97298c520083e1d/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/86abfcce137b94021216d9b1d5763079f09af056/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/266a0e3c4e804d0511eac4ec99bc49a3ab0c1ee0/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/b09d88577d57629d601b61cbe4b66d300c8d90f5/
    x86_64 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/9076cc79023eb8eb191aee432a9c24163ea1ffb7/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/aa1b722266a317bae9ef62b5310d6ff0419cebb7/
    xtensa |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/defdf3a3e6339538a5f09ce9f3755600e3b5d384/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c64f846212f0c10c88bba671873a753e7d9edda5/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/78f4fc50396cf41c5e247311840d57c9484651fe/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/8bfa90935cb514f198527c322fc40c2ad20e9638/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/f535844fa9cbded95d15a586fc1347bdc9716543/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/4addc25c613981495ae378810755b1e5b6c3cada/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/d4b798e75d6ca0de5b4fa2066423eba83d53a6fa/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/cfdb56793b9278db123b1f03991da3eb06a53e25/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/07bbe275eb0f7aec454ab0b9201e8966015da657/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/7bb5d2c0bf18b9b1fe9b018c68d6c955d64d0d72/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/eec14bdf484c2f818a3437d0e5a476d61c8232a9/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/4d188750b5e8009ff7702417c8742aaea192a657/
    x86_64 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/ac4ae1db2cc7cb7dc701c09cec20e1451d0f6796/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c0f82d850f1a90cd824a094d90e0973f244f3b85/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/d8a5272deaccc9f9347a4d5d38bed0746b418df7/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/5a6cff68995d31005f5d067411968fdbb70f4d42/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/af44bb5f060c3a7343a3781c070fa19fb8915941/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/ecb445efcc146b6eac91b592c97e399c1dd746c0/
      i686 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/44fc886bf91f907fa0dc894535fdadb924c65ead/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/66d0686c57de41ebd41f5f16b4cbd9168de1945e/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a0ce10d76b25e954f3a65ebb8bd71ffac9f098cf/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a200a12a16b7f43084e5008b70b3050950f059c4/
  mips64el |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/af743f53ff14de135fccf8bfe41bd34ed9742307/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/81912c070026a4000433f6b1d5d953be8d5a718d/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/1794a44dafd219f2fc2a495a549d07db03c2f082/
      i686 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c4e3f4f997a8817965c633e6c72888351d99a493/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/804e686881412225af20d990be304732ed733cac/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/37829b7f5b59c00e9184d391d0e704d3a157ec3f/
    x86_64 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/5aec81e0e0a644b0c99da96c8b62ca7651131489/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/b07996db073c1d9cd9715eaab1e346990a8879bd/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/654dcd28a1c750c4a0b687268eecf2924563d9e7/
    mipsel |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/6101aba23f7c3b165921e1dd8edc3d827c5f96e7/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/d0ba5f6db30082bcf848ec009e155d95c8238e56/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a3e0be641ac30590f458ddb6656405550bd0576d/
      mips |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/68e01b5a691bcd0f2d11e375129225641acd262b/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/ed214092d657a4c30a92e9ca205ebaed18ac8268/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/628d0f687104c8c0a2d3ccfd508f244b9f74dada/
    x86_64 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/05b686ca8f398f8bb9a1ff987ff2bfa62615dcb7/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/51eff11ec95d4fe4cdfb6eb565162630fe48e082/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/8efbec11e5fc6336b73ce087c869f8d2d05446b0/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c818327bbba96b22b38abcce6eb7d8dccbd218d5/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/24ae37f16fb3b436a6a4137618b40b3e07385039/
      i686 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/1efcbb9b53f60af04828afec1f9b1d95e97f10aa/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/019b756637bc6270ca018241bc17fe471e034f59/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a6ffde9957a99ccaa42b71787cbecd21acdd8b61/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a59bf17082068f843b61d6e652f1b745b8376b0e/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/b708b93076f25f1e8f3a02f1bfbc84de18d909e2/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/93758ee9fc75b040afd6eef97cbaf5839a74cecc/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/967c7875209a8d7bc6481ec543ee3b4f8e990ab7/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/2cf9b1d822a22d9abdde79bfa515ffa9d84c3038/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/232cfdc7759ade928a4ee0ae1e486c54f0de875e/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/acbee3eccf512127b1889b4ea813dc1c6c303ff2/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/a33af42e7af5323dfe2b42f4c8080572ebbca5ec/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/1fdacc89d98da5b9acac7923a49579a50a8c7e4f/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/5ad68317c4936fbcaa0b7970a269c7f2ec27790c/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c952c0e9652d9e99bff659e2910413bebcc79323/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/f04ac5e7de6fe73b20e181b84db72f9f539362dc/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/81d5d476a2a37a4894f547093ac76cb2485a3580/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/30010d659337bdbeaadfe6987df50c730b0c9c7f/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/f02588cd5d3da6b772ad8c3d2ac66a5c56a4c743/
      i686 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/671c10669d414456e4b15cccb98a0abcc27ab8d5/
       sh4 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/50b85971180f1954d6e3c947c1704e01dbbe437a/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/b8eada67b5bb238a50686aef92ba9b43752d7953/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/e365a5610257b30030ab36efd258ea0e4f8bc40f/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/2a928001f3761e0f50496d31ce99be6bce83c08f/
      mips |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/f1b20ccbfd10b38f0969a21d690138469d3275a3/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/65f900d2306f41210de227a0a6e33670bf8e635c/
    x86_64 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/43ad3ebf531f324d2cb6813b8931181fedec6607/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/f732e2670a95fe11cd3edfedb93fd4ff6513a138/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/3b732f86de9eaa96c8a79c99999d3890775c4d8b/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/9fcd4f22afe3e19c7c14e2f87fce01240b869c75/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/be1cd25706b92d0f0d31628aa289944fd26e998c/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/f9abc7ef80b787a8601fa12bb28a6bdd177324b4/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/3f292ed263e0fd6e8f3a10e13905e3a36e8c3d5b/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/30852e02c9885c1b94b4de33f49355950a76a396/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/88d5e9d00a7170e172ea95eb685c4a7934c8b388/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/84d9e9e93cf99de871147143eb4ed615a3196115/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c67413dbb0d1a211690f5564eb7e41b1c963c3f2/
    mipsel |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/663de4fe0fc829a41065ac6a0edb4a7f5ab4ca12/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/e843ad6da837c9851a4700489adbc34a19da6bf9/
       arm |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/c8be685a08c30098eb7e49921b52773d3bfc56c6/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/304cde253347ca689ef16b39d63c2479e66ed1db/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/e769cabcea689ceeb0834e77232049a9aa13e10b/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/492fb3fa86a70913aa13968c9e30e1a32436ccfc/
   powerpc |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/16934ff4f9ee7ba3d6f337ded26b4da1782a30f2/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/4fa1d60419740920d88c5eef4b01031397ced9f3/
      i586 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/3d848c3a7d3778f02ba0434c2128fa4f8c11ad3d/
    x86_64 |                  libpcap-1.4.0 | NOK | http://autobuild.buildroot.net/results/8d459978b921f85d1d1e6505a4b88b49930313b6/
      i686 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/e240828ed2fdeb98f36818c0ef19b15dadc2e59f/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/ebe70882d6365690d14e1b480e618dff549f44d7/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/e7bd8dc2fdc630874d902d18b5249ad84407b2af/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/0ec6309daa63d75200f1499ccfec0af64328cb40/
      i586 | make: *** [/scratch/peko/ta... | NOK | http://autobuild.buildroot.net/results/e7cd8e9635ec58ae18ecba1c08a3d92c376745f7/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/6623b24340eee572c8159cb412789d0924f54c34/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/ba40c469496b91dec66aa685c7c894ca0ce08fec/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/284eed7935cfc0b627b3d4549ec23dbf323f0e66/
       arc |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/3f7b0a1728fc9768192db1e950e6f3228fcc30c1/
    x86_64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/11dd4a83295803498c4930fc6ab05ce9cefde459/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/a6e00d5ab1133574fba597c1f2707c250984aeb0/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/2cc7ebfbb88a9b217ec3dd8c98eab93f96d79b5d/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/fb813ff86e94af08fe945fc2da83aef28674074f/
       arm |                   samba-3.6.15 | NOK | http://autobuild.buildroot.net/results/24fe95a7775af10c6ed7514cbc72a2189e57bc25/
    mipsel |                    squid-3.3.4 | NOK | http://autobuild.buildroot.net/results/6f6bacbf0b7d4d55ced81e2ff1b01b8c4ec7f2d9/
       arc |               ti-utils-06dbdb2 | NOK | http://autobuild.buildroot.net/results/f3f1701f9212bc9c04eba3f75573a1f8bc3bb046/
      mips |                       udev-182 | NOK | http://autobuild.buildroot.net/results/4642731aa77149ae68d1180e440e0096465f988a/
      i686 |             xlib_libXpm-3.5.10 | NOK | http://autobuild.buildroot.net/results/7b71722e52c80367780e53d28d25fc9fcf399ec3/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/d05f42ec91aa3a538372221e39ffebad449d8174/


-- 
http://autobuild.buildroot.net
