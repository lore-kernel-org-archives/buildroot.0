From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Jun 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-04
Message-ID: <20130605063004.4425352C13E@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-04
===============================

        success : 71 
       failures : 119
       timeouts : 0  
          TOTAL : 190

Classification of failures by reason
====================================

             host-libftdi-0.19 | 20
                   bzip2-1.0.6 | 16
                  libbsd-0.4.2 | 12
                p11-kit-0.18.1 | 12
package/sunxi-boards/sunxi-... | 10
               sconeserver-211 | 5 
dtc-e4b497f367a3b2ae99cc520... | 3 
                     pcre-8.33 | 3 
                    acl-2.2.52 | 3 
                      qt-4.8.4 | 2 
                libtirpc-0.2.2 | 2 
     xlib_libpthread-stubs-0.3 | 2 
               qt5webkit-5.0.2 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                 cairo-1.12.10 | 2 
                     m4-1.4.16 | 2 
                 binutils-2.21 | 2 
                 openvpn-2.3.1 | 1 
                libiscsi-1.6.0 | 1 
                  zeromq-3.2.3 | 1 
              udpcast-20120424 | 1 
      gst-plugins-good-0.10.31 | 1 
               libglib2-2.30.3 | 1 
                cifs-utils-6.0 | 1 
                  libedit-2.11 | 1 
                 libpfm4-4.3.0 | 1 
               aircrack-ng-1.1 | 1 
                   libcap-2.22 | 1 
am33x-cm3-AM335xPSP_04.06.0... | 1 
                 libevas-1.7.4 | 1 
               audiofile-0.3.6 | 1 
          host-protobuf-c-0.15 | 1 
             bluez_utils-4.101 | 1 
                  connman-1.12 | 1 
               libcap-ng-0.6.6 | 1 
                     monit-5.4 | 1 

Detail of failures
===================

    mipsel |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/83591b4688a7ee7970c79845f42aa5f2a1006630/
      mips |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/ff27e26edc2dd5a7edd255fa03b90dc4071f1609/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/bdec1fa3197ccf8e157e55ce65c1be65ff2eb024/
   powerpc |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/85e8e971bf7134a61bb842998dc537bfb271aab6/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/3a1c463a897a0be5dbd1c99f94b24e42b85b6d39/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/7dd31d4c18f28ab7fae70746e17ff5413e1d29a8/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/b91bd49b3bac5c39e2f5f6d8f0ab986e542bbf1a/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/eb9847ab382861720700b516e6d29ea4ca4ed677/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/41bc889cbf57061f9926c37798e7c52714457785/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/c229c92a307eef2088b5f7a673ebcb27ef94b00f/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/9fbc34bc320dfa7bafb288e61e34fae689d4415f/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/dcbcb21efc55acac3144d5eda954d4ea0e7c0066/
microblaze |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/32585ebd762fa7f84aba5ad4e10542f0293d4e7b/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/ad1b28a809a1acb053ab4ec3821ed72077355c57/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/10683a3d346d8db426b3f5ec844b8f61964f5d74/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/3d8781867753ad31551bb8e53d254412ee6a7a6b/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/8afc7829df88471538b3ba52259502e8cc1e8243/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/cd39ac6ec8fe1d3a8761248b1344493205f56648/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/a7e23fe3655e8abb13335eaab0952437670d33a2/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/b70fb3c1a5e5357c7362f44e00f070c4a7e6bceb/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/2cfc025b400525fbacf72d27f48ee66163e8c0da/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/2d317c26f104fad7f4b19a60e5cec3c0dd98de42/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/dd0413006ae12d86ced7faf7c7dcd3be797680b8/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/52f95c8c6ff097318aa8c492dd168efe688b6d04/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/94463a0393c43ebadc461081ff742594c91b9759/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/fe1097a0dec2927b573f408c81940479254a0bc5/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/463cfb41fdc39bbaa702f9945612b517a5bace42/
       arm |                 cifs-utils-6.0 | NOK | http://autobuild.buildroot.net/results/c8e2f18cd9638122b2e21e693e2f7665b81aff37/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/52d771c8d21ccf2323c2aa0033f86d4b08a15990/
       arm | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/d750ba21e963d4d153ce12ff35c74461821252e5/
       arm | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/8cb5ac122fb272edf53daab6aab2551c3e1bd3cb/
       arm | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/000a042f6b485d90717d14b93efcf011841c33c3/
       arm |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/70a7bc1877824aa7a6711a390a5f7729222afa37/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/2aafbc7600815b88b145787854a45238d192a0ed/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/c0f845f14ff82d476b902ab5eaa5109b973b9618/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/d3da886492f3af859795cef8bcb548be420ab09d/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/5a45428820170ae704d94324f6569d998827474e/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/056899ef4de0bdcf1701e265080d3517acc14956/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/4cfe332f24c2c83341f2f6377f1398083369d830/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/55c667192dbd4559af3b9693c26fe2bca002f2ad/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/d645418d0be2d55574f787acb7efdb77ddf7343e/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/ebc790c1dca3eda9612e1290cd072128658b3c23/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/32a292804668a32f52c1244031c151a59ac16628/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/54a6c0a66ef3f16dddef9050f8136a1ad7fa6efe/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/2c8e603b69ffe2972e0480fa98a8a1ead87b8004/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/8b4ef8a3217e0e9743611ad3b7ea8846781d0763/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/09b62ddcadeca0340142d655f9ed74978e0de68b/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/ec00fed103d1d1e36c23d1f6b8525c12d543d236/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/051d72c269b0f38c0e36ebbb9d19b78540b3043e/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/de4b0966b88ac02ae21cb6bcb9ea152b0b6dc863/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/69ed13c00b2526fd59bb00b47dfb27a5d8c656e2/
    mipsel |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/ba72bad3ac96320af46c9f7124e11f79bcc78d86/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/ece86bc291b999a5a315fc07bc81bcbf45f8a4e7/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/188b97e4cd1a0fb3efdaba67ec0e509528c6ff5f/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/e005d2eefeb8b54e483deea01402dd45b1eaaf32/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/9b7a80d74270e1523a3396155db9ca3bcdd52b8c/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/b8e8aa72bf792c1a82c840df928be43f59d33220/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/3ae264e3bbaf72f0bff9fd7c343de7700a0e8b26/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/105d5bbd867cbaa485aa6d46be680046ad198fb1/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/67a71c0c16a93ab499f57ace93a7823267173c49/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/b25b1929c9791cba2c598fae0570ed324364a767/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/8f509f72239e4c015cb64e60c6e2d3aae5cfe43a/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/f737f3cc9f2554785aa1b16ea8c4e5fc961eb777/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/ee8c38cd4a4ee3d81cc6257e0b9adc763acf2378/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/d66f20cdcf8d05c4feb48565e5f38555bcd07db8/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/57cd2a6cd09a55f87929acb7683ea2c4c48a8f35/
       arm |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/869e2b4fc11c4068f79756a778193dfc71b45736/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/af38fb017cbcbc75cc784ac2d18d26ad01d62a5a/
  mips64el |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/2b7a8ed8454e42c62e3f0c5eaa7c57c99d4b4f1d/
       arc |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/bba773c0e76fec283162d418deca3cd8884fb262/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/7c748fb616d4a1fab2a2379dc5e7ad463beb3de1/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/c070ad56ebe383eca750d6d7552d86275e78a54d/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/1f949edc1500295bb562f0152688edff78718374/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/71bb15d879943c1bc98e51aa9a72cdada269f10e/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/53151f053149bd72170ebea45a491fa83d582b5a/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/f4f7cf83f95fabfd8758554d0de807f23c8cc9b3/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/0e09e09006074c0f9a5570897c7046b07bfb0338/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/96795fd31fa766b4216bae072c4bdf5692592a6e/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/1bd3a8fe35cd2330347681ab30c87eca66d3d995/
       arm |                      monit-5.4 | NOK | http://autobuild.buildroot.net/results/0b5838f3d11b45244f27bd2bcb092dd6a88fd39d/
   powerpc |                  openvpn-2.3.1 | NOK | http://autobuild.buildroot.net/results/b79da1173f862261bcc166bb9f4ec908379a654a/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/7b9057c9040f5e31117615e78e55c9fe0bf9e987/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/a53d2736f745552c0f7cf1b77a9dad51370f1237/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/12363e25318fa96245a1a4fbfe3acef7224128f6/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/2d150e270701151db655354c8503bb4958e23e77/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/4412127a606993629a6fee8d0c79ed158650a527/
       arm |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/53181c14383fce2a00504c17df1795bff550feef/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/00285c7ea9ff27317e514ee9b2b4b5f8421032da/
       arm |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/f337944683d7b406dd8f8a12f8ecfd69caf81d44/
       arm |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/42137df8c70e6be547a0da78fc97badaf29f1abe/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/105988e0fcb807890d378d2f644569050ac763e9/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/976796097c6eeab9537f0f806a43cbc75359ea70/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/422f8b360996c9454404b7da95cc7b7054e4d499/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/d106cf2550e323d294ea66ab9e715f2256197444/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/e447195de3cbc202fd22253cd6b44b78839729f4/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/5c0ac8dce8028e9d8c721cfe01b61b053184f956/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/56bd59fd0954fadf886aedcedebdfc4c1e454c20/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/9f5615779a6718e2dc72f176deb2cf2e9916abd8/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/741e80ea06e6579d43c3fc692052cc8c889f2d86/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/5ca96d2cf0f495c0f3797e649e35f8167f03fe44/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/077dd2f4553535e5f17ce98f4a57ed6e993d6d15/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/cb13d1a67c41fe5d2c94c467e702340e1c5651fb/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/db74c3ce035034bf823bcccaa6dfd97b6faecf57/
   powerpc |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/b15f053aeaa7832909d95d36515cb2b77ece4fca/
      bfin |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/12f183d79fb1b9fa9039cfbf53a2b828284c1e57/
    mipsel |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/68c2b0f86101849132f7a90db05dc2f031a497d1/
     avr32 |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/55978fe1af78f58018a79dcca500b77c1ce4ae2f/
       arc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/edec9497dce009d005f7593d31d28a48e316cb9b/
      i686 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/667f4bb4e54d9d0aea4877e391107be1b5547be9/
       sh4 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/307ff8a6a913fedf153ade8dd8cec7302a634dbe/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/5bd604d83edc08453ab4f889bb703802e36bc64e/
   powerpc |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/e7433faaefebadf65f031aff28191cd5d923dae6/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/22b04b7e61fd46068e2c305ea66051cd14021690/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/2428177b81f41216d0760c7eed51ec556d72511f/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/03f313811b264671b5a82c33e50c977fa478143a/
    x86_64 |               udpcast-20120424 | NOK | http://autobuild.buildroot.net/results/28bc8651ee798af150bba5997b66ec7bb450ecde/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/c6c9352890eebe40f78fd16ef0c4842a07d9c92f/
   powerpc |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/4126a74851417ff0904e49cd66044400209bf4b6/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/c12e5c36e3032219697ad3ac3460a65f3c7ac146/


-- 
http://autobuild.buildroot.net
