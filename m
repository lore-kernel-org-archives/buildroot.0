From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 06:27:05 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-27
Message-ID: <20200428062712.989FE20410@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-27
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 30  |  7  |  0  | 37  |
    master   | 198 | 167 |  0  | 365 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              ibm-sw-tpm2-1563 | 26
             paho-mqtt-c-1.3.2 | 21
               libtasn1-4.16.0 | 11
         host-exfatprogs-1.0.2 | 10
     python-argon2-cffi-19.2.0 | 10
              exfatprogs-1.0.2 | 9 
                    brltty-6.1 | 8 
                 mesa3d-20.0.5 | 6 
                qt5base-5.14.2 | 6 
                       unknown | 6 
                     avahi-0.8 | 5 
              host-grpc-1.25.0 | 4 
           host-nodejs-12.16.1 | 3 
               libgtk2-2.24.32 | 3 
         python-pycairo-1.19.1 | 3 
               apparmor-2.13.4 | 2 
                  assimp-5.0.1 | 2 
             libopenssl-1.1.1g | 2 
                  libsepol-3.0 | 2 
                minidlna-1.2.1 | 2 
                  rygel-0.38.3 | 2 
                  zeromq-4.3.2 | 2 
               acpica-20191018 | 1 
               belle-sip-4.3.1 | 1 
                  dnsmasq-2.81 | 1 
              gnuradio-3.8.1.0 | 1 
                 gnutls-3.6.13 | 1 
              gr-osmosdr-0.2.0 | 1 
                grantlee-5.1.0 | 1 
               libglib2-2.64.2 | 1 
               libupnpp-0.17.2 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
                openblas-0.3.9 | 1 
              openjdk-14.0.1+7 | 1 
   openvmtools-10.3.5-10430147 | 1 
              pcsc-lite-1.8.26 | 1 
              python-pam-0.5.0 | 1 
              python-pyqt5-5.7 | 1 
                 qt5svg-5.14.2 | 1 
                      tio-1.32 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 
               wireshark-3.2.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/b702bdcb5f50002ca29a5afd15a624f5c307a9d8 |     
microblazeel |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/8666a3af8a97d88dfeee46d7d619999b6460a8d1 |     
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/6cfd592dfb693f473deea335534617f3ad65543c |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a541070493144b7492fb4d98d64d9f6e57c45015 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a76245fb7dbca0c482355b4ba90c647dfbfd16fe |     
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/0fb42dc306102b8adee1a112ae1d9d045bd1e846 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/5cc7afbabdc0a6d03afcde87faf849097697962a | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/25e7598d1774c8093daee926a74d75762f72ee34 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3303933f311f8d5bac39b2a7f3925e2ef01ffa13 | ORPH
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/99d126d7a715782b3a29680fd23a49e843a7c701 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/e6ee45fc8b6d50b592762d445e4f646efdb04d03 |     
  riscv32    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/52b1f13f3e1134d5bfb33e6684373951b8c0729e |     
  aarch64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/f7a715be7c284926f0f0dca8c34d09c876f24373 |     
   mipsel    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/e2622a03ab8ea379838f95ec2cd39be7464f87f8 |     
    or1k     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/824c204fa41db56dcdc3caaf17db98ddcc12f37d |     
  mips64el   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/9608297c7a1cbed3be7c99ce35e8dbe0b884d0be |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/be8e91ada82556501176f2fad58ff3b2330ed9ba |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/8ad22b78844c6111e4eba64dcb107e5c847efb20 |     
   mipsel    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/cf9eabc7195dfcce687d1fbc54a05fb29d11994a |     
    i686     |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/5f7a80b67fc813fb81ff265bc991d75a9e2f2cee |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/d67a2d702a8a31fc2fb0dec937d1acc64ea6361f |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/ed342d6ae599c76d88dfb90d713f9168b02e38c8 |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/09591f7d19cef12c40c0a288ff2528b4c476b602 |     
 aarch64_be  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/240ce5dd60936a2c620fb390760d3038a410b945 |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/51720d59a57771d933b46729714a403aa7159f19 |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/58933c087c9560084e7061f76c92926b0b55a75f |     
 powerpc64   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/e758b768dc676ad9913ab5fc385c9a79ae15e76c |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/76de368563c57c42fbc8dfe1a8a32eaadebde468 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/7010a9bf60e855bd71de7a662cbd08d443243d54 |     
    arm      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/23596340765b454e50fb9e853a211cd67784bcdd |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/0a668539aaa1332e7b326d2c6d62104fdb778899 |     
  sparc64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/19bf24f2f09fa41456703076e59a735eef82208d |     
   x86_64    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/99570d9b98d0331d792d365a2129898081b74bbd |     
  powerpc    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/cb3b2bfc343facfac6de9bb1266bde70e6a5a4a6 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/750aef3810ab76d68de7e2a009fe0d6328206514 |     
  powerpc    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/c9cac134791af435a1902ead1d8f093a27a66b51 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/cb43fc2275564c7db92eebb0e9e32c5790b5d816 |     
microblazeel |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/e7e7df3d2a3d69713e7355db098703ccd10ad7ba |     
    m68k     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/44883a96a5953263e2701bcf61b5f2a7381fdb5f |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/59f7c498d6003278c1d4bfea39483a5bef3182e5 |     
  mips64el   |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/c32fefd0ad387e177318a0180b098f49ccaa9f4a |     
   mipsel    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/5d6474b77bff3cbd52e5ed1effe0ab1fc5344735 |     
microblazeel |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/974d717d3b12174ac3a456c8a4c5b51914abf0ec |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/48282d8dde2ac022487c240ac90eea73a40955f6 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fc6a9a69126b719a6713ed86208ad47b0e32e2a5 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2d4f6c931e4b5838823516feb6db201b353ed4d5 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/835cb13fafd3ff6f6f93ba3d96cf3d604ce5cb21 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/46a0d362403556e6619da92fca4ce25a2485e43f |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/ed4154e0aaf20f3fb89b8b6d86f20079a6bed531 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/77b4070ec69f69fe4d5675e3db58fffda858f5b8 |     
   nios2     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3477c01176d1b6b34cf3b4259b92b6ac007acdd4 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/cc276bd091d8301c107eb19e0e3092d6dfd184cc |     
    m68k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c18517d613d987520387c26e5a48dceeaf3f1e72 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/8329ba02b05cdafc4820f70bd41bf2bea63d34c1 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/07d953f8685881bb90413e17781a9ddccddfe4ac |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f34ff5e3a11623e47c93fe9ffcc50c7ad01e77c0 |     
  sparc64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c9438f35f2086724f256aa23f9f7168c338f56d8 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e48774784be403c6bfb1463a94c8be0f4f705511 |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/148431983d5501af0b9c395e737a7688c005d29a |     
  riscv32    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/47ccbd7f6ec033eddd0fe67dc4ca779f5d6242c0 |     
   nios2     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/87e6764eec3be5d501fca30f97e53796b7972787 |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/abfaea17e94775bcd0866393dc4ac18ae7261b9b |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/666cf5be623a43dab165df184cfb5f432bd94c4e |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/08cc607f825873784f12aeda8b1e5b26425fa0d4 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/74def71b4fe819cc9eb2d255947360c0dee5156a |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5434c9f9309a3082cf44a5bd12d2b9e8c6a2de09 |     
    mips     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/11e30a927b495244009236bad9733043f33e4aa8 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/de5aac8dd537efc36a52e6cd48a4b0fa78606857 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/41a5c67276a62b3a510454008af8d0c3c97eed81 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0217b02e8f8aff4fb13964036c3bcc8f0b45ddb9 |     
    or1k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/eefe7475399f403e16283022a751c040042885b3 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3b1b21f5209c127fe60b4e79f4831b97500df6e5 |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5d5644914f0796b0e826020fd3a9f4a1ed12e1b0 |     
  sparc64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2adc53e1b11af118761997b7eb8474804a997a19 |     
   sparc     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f14831d86cadeb4fce3ea3cb56fe32e20c296174 |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1706f654005a0076fc7c5112437153461ab6f0a2 |     
   xtensa    |        libglib2-2.64.2         | NOK | http://autobuild.buildroot.net/results/fe30cf9b0219c0aba0c81646393f274d1ce874be |     
  riscv32    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/5c794a1d4380795f24f99dcf13020e005c7652d0 |     
   mipsel    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/d6159f23d95b319bbdf1bd2230aa3a44a3da8ce3 |     
  sparc64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/6af59529cc695272221ed2255104b73d20fafd05 |     
   xtensa    |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/3f319f8fdc76a3685a3c07638f9082e3c49536ea |     
   xtensa    |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/34433a67d676cbb70e177efe3b4bfd01c60c6366 |     
   xtensa    |          libsepol-3.0          | NOK | http://autobuild.buildroot.net/results/982c7e446c3382e9fc8d29607eb9aec69511a445 |     
   xtensa    |          libsepol-3.0          | NOK | http://autobuild.buildroot.net/results/32578e7d6769c660443886cbdb731062d30f8b08 |     
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/e10b2accace237d951dea579eb19e5dd46262841 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/f692e7e91d2eb146f42e50eb15b54faf6c2234c0 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/ba7b25ceea19969cb70f86d21b260235631d3370 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/9ecf93d4e1adcaaec9b40891b6d73e8207aa64d7 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/f91f051633202d70f5aa70da3d8f4604e4e36b22 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/d2d889da5ad1999b2fa29b5815c4d33506971103 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/01646759d09e2fa8a160ce65e7df67349c0b65be | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/e11f0d3d8dfe7d6a88c4a3de859f009f406a52a6 | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/d87cd49a73b3793f636f9b69fb1db48bbcaa66ed | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/ad5497a655d08b5a65bb1bb54ad28f5182c029da | ORPH
    arm      |        libtasn1-4.16.0         | NOK | http://autobuild.buildroot.net/results/b3f7e02b7d3c9c4df21c4140fbe3fafa15bee782 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/aeb5a4454bf6f3a996003c63ff671f50a68a9cd2 |     
   mipsel    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/a31fcc9ab57245cc5f966f2ef986b298d1fed3ab |     
 powerpc64   |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/b9fecc7b1f8d5ee454c8f6e2f0e49051a1f9bd10 |     
    arm      |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/583457806b2c97130dd9df4b8c691f647de93359 |     
  aarch64    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/b5841008ceaae7b502264bb0aaa81446f8a491f4 |     
  powerpc    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/1c492bd456fe505e0cd616d9118e0185953656dc |     
   x86_64    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/41ec2ec6e07019f12eeb8109cba01839fafc4cf3 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b50e3d2c31c992a24857f40e98fba4a37fff26ad |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/c21faaf3bd16d4b5158b08f6ade60d665efea96c |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/4307d6f08e005c3fe5b578af5e99950a88ded119 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b407cc5016f1b61d56910655ebb4886ef6486e77 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/0353b3086225af5187dcde909238caa15c53463e |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/3e62a685da6a43d607d3f8076ca51d0b5f34f10a | ORPH
  aarch64    |        openjdk-14.0.1+7        | NOK | http://autobuild.buildroot.net/results/0763d74063d27bb9d0b194f2e1ecc8f0e127b138 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/17c50bd11e70a0156602af064d0bebe002a70063 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/f83b3d6aa6093faf62b4b2c385e852806d931e42 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/5765e4b43e01053914c8517d91c23cc8b9df9562 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/cf1642899c86eb97d7fe2d598868e9c0319550f5 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/b91d7a1547c0a11ce5f87caca86c718558157497 |     
    sh4      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/fd2635cfe2590c7528aa48389511ee697859f65a |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/965aa3fa0217187417444e12344940fd9d63e9c8 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d93d3e19e0606cf4c8eceedf45288d9731dad600 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c3cce2742667adb3b68d11cb598b1e95e643077d |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/1f9db5524acc39bba9819e15a14715b170e146b3 |     
   sparc     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/364284c99c61eb14da2f2a5e81111057970b62b6 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/43f9e8fbdc665c2eb972af3c60e6619f041f0833 |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/a490ab8366d25ffff090cc45b9a7345c5429d6b2 |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/1abc0c629b23a51d69e5302403c1a7c5a668b0c0 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/4362eddca0971631cb15382d31b52c9771d018c1 |     
    arc      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/78b692b19b5ed73b48d628251e0479219eb2734e |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/3af2dcd74008b89fdbb3055d5cb485b3338a31c9 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/44363fcfc9082e6bb2a01fdc202bf4140447c356 |     
   sparc     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/016185d85d6a3b887fc75465182bdd58b0819a45 |     
microblazeel |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c658363a96f98635dd52c9cc657c3e0ae188c2e0 |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/09dafc39725e2e8fc54690f25045cdfcd8c00469 |     
   xtensa    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/0c855c9bd5d7e7c89270ba4f44517ccf48ffb559 |     
   xtensa    |        pcsc-lite-1.8.26        | NOK | http://autobuild.buildroot.net/results/ff2b29d9bde917f3b67ac13930b1c371a686501b | ORPH
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/bedf0178a981a69367c80babf1158fff36216244 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/9a6871afa88307e20da13bc9274412112cf12f49 |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ade60db0a491db450647d2a56f76eddb386b7fbd |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/40e945379699fb08b228b7e223c1a969f6fdded1 |     
 powerpc64   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/706d1d15f6fde5ae2f5f5df8c01b6763c9fb20e9 |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/5fe944cee5687c160e4f942261776104a92a9ec8 |     
   sparc     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/8a052add09cf2961453effe3d05e5fa76e42706e |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b5560de241eb9f37438019284616290c65270ac8 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/0e812413ec9b8595acf399c2231261edbff927ee |     
microblazeel |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/6cb054c88108921823298c33bbda5adf4d794ac6 |     
    i586     |        python-pam-0.5.0        | NOK | http://autobuild.buildroot.net/results/55f4bbd0e977acdb43e82433ef8eae1aba8f4ee9 |     
    i586     |     python-pycairo-1.19.1      | NOK | http://autobuild.buildroot.net/results/c2999d6f2c2a515de8391ac9e0d57614d6e27627 |     
   xtensa    |     python-pycairo-1.19.1      | NOK | http://autobuild.buildroot.net/results/c4cb838c3fdca6279b5a8b3901ea08ae3d31f5fb |     
    arm      |     python-pycairo-1.19.1      | NOK | http://autobuild.buildroot.net/results/5a9674392bcb6f8da2431cd149b9523397032deb |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/9c11085b1a98f9c85e5f382c5a7248547b62e782 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/e7f966f9f62c05ff8b49224f5b139b8ab0ff7b74 |     
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/8c216de77179a9e69efdf997f38d90a75030afa0 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/8b5a288081b46d6c02ee6813b909a6c0efd7b4e1 |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a6bb4d01cded9d8bd5ae7c759bb3446a7c1cc5e0 |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c21c3a3c69b01a32732f951df7bf38991889da83 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/7fa896a2620434481f5de5c512ec70f56c3ea45f |     
  aarch64    |         qt5svg-5.14.2          | NOK | http://autobuild.buildroot.net/results/cd05564d54446871521f23917dec97d9763512d4 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/6bb351234ea5664f379e1f9992ddde0db880eadc |     
   x86_64    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/e1e39a931a9a3b4559391d3d06a48e7ea648cb32 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/84c577e35b81293db2f6f0f70a48c92fe89e6796 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/35a4087ff34b6a2cf2ee751ef34a8f69270faf1d |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d93a6390402dbb95db7934448fa57066b8ec22dd |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6f1670994ea8e549edd81b005c436c113d9e2a3f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/885e6a4337a4ab08d3fc52e0ac16fbec3f5babe9 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/e081cad94045ecf17ca058e5574190d2cf3ef326 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a7eba3acf4e67affde9cbc17244ec4d7a34a4f8c |     
   xtensa    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/327abe80bc3ea31be2b1222cd60b7c0277e0d351 |     
  powerpc    |        wireshark-3.2.3         | NOK | http://autobuild.buildroot.net/results/518e7a03ad18daba0835861ef45dab356cb2a7d3 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a2838f2999da9cc312fc73a380b3666154092b22 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/593c3757c8df2c1a1ca89c7299672772606fa6cb |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 2 
              host-grpc-1.25.0 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
                 mesa3d-19.3.4 | 1 
                   mimic-1.1.0 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3736058e8067531fbf3139843a40d1f07f64562b |     
  aarch64    |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/88634c5b2d7825212b05e5bfc7e46e935818bbea |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/358000ed50900745dc92ad2bdc69bc830cba223e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/87e6191baafdfc1779dc5e4a83c8a385c9323875 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5ccd91b72b8fd6f11770c9fc94265125469664ef |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/00332557bf4723368e886757fde978bb24f2fd96 |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/41dee768e2564bc5d5ab4f76022d4cd809d64fd2 |     



-- 
http://autobuild.buildroot.net
