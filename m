From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 May 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-30
Message-ID: <20130531063006.D3E4152C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-30
===============================

        success : 89 
       failures : 45 
       timeouts : 0  
          TOTAL : 134

Classification of failures by reason
====================================

               qt5webkit-5.0.2 | 4 
                 pixman-0.28.2 | 4 
media-ctl-ac40b79f002a2315f... | 3 
                  ne10-88c18f0 | 3 
         host-gutenprint-5.2.9 | 2 
                  gnutls-3.1.9 | 2 
                    acl-2.2.51 | 2 
               sconeserver-211 | 2 
            libvncserver-0.9.9 | 1 
                      qt-4.8.4 | 1 
                  gamin-0.1.10 | 1 
           imagemagick-6.7.8-8 | 1 
                     m4-1.4.16 | 1 
                      cjson-42 | 1 
                  ltrace-0.7.2 | 1 
                  dhcpdump-1.8 | 1 
               wvstreams-4.6.1 | 1 
             bluez_utils-4.101 | 1 
               iptables-1.4.18 | 1 
                 cairo-1.12.10 | 1 
                pulseaudio-3.0 | 1 
                 libnspr-4.9.2 | 1 
              gettext-0.18.2.1 | 1 
          host-protobuf-c-0.15 | 1 
                   httping-1.6 | 1 
               aircrack-ng-1.1 | 1 
               alsa-lib-1.0.26 | 1 
                   dbus-1.4.24 | 1 
                   icu-4.8.1.1 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                 rt-tests-0.83 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/282b5f9c41198a38edb11c9f0a804a56d3860bcf/
       arm |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/839c33c8769454adc38bf01d87e4ace8ffb1f6b2/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/690d8c38381f05fc1e1f2b3c1e831797603ce901/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/334d3ab1d3f29ac30fdf66281e666d79a9c8fdbd/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/24827567df4a78bbd591daef8d384938edb12463/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1f32624eec14c55855e313c83b64805bf77221fe/
      bfin |                       cjson-42 | NOK | http://autobuild.buildroot.net/results/e478ef72d1b34806ef23a10ca1db849abcd9925c/
   powerpc |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/12c08bf1dc57d7482a0469fcd93a86e0cf931e52/
       arc |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/048ba096be903b219b3b988e44a900d0ecc1d731/
       arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/2a92451f657b6b79f54cf559352748aa7c709e88/
    xtensa |               gettext-0.18.2.1 | NOK | http://autobuild.buildroot.net/results/698e62da80d5037ddb32d5d152524b298bfc5ee0/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/8e9ca4e183b3377db48a2f33eaa572a0c05b6ae6/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/623eebfcc2fa721b341a76525ff97348558030bf/
    x86_64 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/0dd2f69fcfa53151fde938e200d75b66ad9d6963/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/85eb004690f43ab6c0419fc5124d9adc60346f98/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/e3ed1b1e3fb11bafc664e442f7861bd2c2a7e77e/
    x86_64 |                    httping-1.6 | NOK | http://autobuild.buildroot.net/results/81ec4e1cae5feed8be9f8b4da12eb14c451d43e4/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/2a223fe80850aa38a0cf148649232755b63ce576/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/cc7aa41cbc92ba8b8c787b161c9511e5c64f8eda/
       arc |                iptables-1.4.18 | NOK | http://autobuild.buildroot.net/results/edb80ad3725742320bd88f76bd77ae85d491297a/
    xtensa |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/3c99116adf3ae14d323622818e1c030428f0bed8/
       arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/aa53001ca284e84600894b0701f2eaff22525e99/
microblaze |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/6e5bccda2b14fa2387db79ceea90a2212d8ddabf/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/4d64ee4f1f14d47b102b40b16ed1018c6f6ceb1a/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/253d10f0fdd2739f83c2f68ede2131b124f09755/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/374ff4ab695176f25a7b2a5458271b46642ec745/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/ba4579da0f3f8096aacb02136916022c29509fc9/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/720dddabfb0ecb7cb7156bde1e54eaa006e77cd9/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/3c4e24a8bcd44cdc8c7839c89edb44c993cbc226/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/bfa3268ba8434af54aad8035a87fc4537ddf2ced/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/dccef98fa83b86229aa73558b6e7657c08055307/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/5697afb0f622980ccc91d101153bfcee3827482e/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/2927665e832804ced2e88938e342297b5b389ebe/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/77031087acd426ca689a1d02674722366091321b/
       arm |                 pulseaudio-3.0 | NOK | http://autobuild.buildroot.net/results/ef63fd624a82796b62795f0767d5c3f40267dac0/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/bda175424126fd0ababe5cd12a650f7f6e3ff672/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/0e358732efa7b9012e664e239f7c7a55057f9a29/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/01177ba86ddd3b19099bc92e627c2917244e4c08/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/92086e1dcfe8555b368dde2bd7965af3eb7eec24/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/858578c354efd69c10337725ec5a6087e1fb48f3/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e4f52c9c2f1bbc3a6b4420f7f3f508b408d576f7/
       sh4 |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/ed318e08c1b37c4555deec1a85cce731ccfe9761/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/49425c212e976f69c78a0751ea2f23f0506f0f07/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/b70d621c2830f9d8d303ae386acdd1fc9ab2a6d4/
      sh4a |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/e6ef3d7416e63eb92fd2d02123d6ea5ae773b955/


-- 
http://autobuild.buildroot.net
