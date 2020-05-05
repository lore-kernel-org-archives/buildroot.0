From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 May 2020 06:25:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-04
Message-ID: <20200505062551.7145D2281E@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 25  | 13  |  0  | 38  |
    master   | 197 | 144 |  0  | 341 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-libsepol-3.0 | 17
              exfatprogs-1.0.2 | 12
     python-argon2-cffi-19.2.0 | 11
                    atk-2.33.3 | 8 
         host-exfatprogs-1.0.2 | 7 
                       unknown | 7 
                qt5base-5.14.2 | 6 
             host-gnupg-1.4.23 | 5 
              host-grpc-1.25.0 | 5 
                    brltty-6.1 | 4 
                   gssdp-1.2.2 | 4 
             gstreamer1-1.16.2 | 4 
              ibm-sw-tpm2-1563 | 4 
             paho-mqtt-c-1.3.2 | 4 
                 rocksdb-6.6.4 | 4 
google-material-design-icon... | 3 
                suricata-4.1.8 | 3 
         uvw-2.5.0_libuv-v1.37 | 3 
                  zeromq-4.3.2 | 3 
              host-erlang-22.2 | 2 
           host-openocd-0.10.0 | 2 
                 openal-1.19.1 | 2 
               belle-sip-4.3.1 | 1 
                  c-icap-0.5.6 | 1 
                  dnsmasq-2.81 | 1 
                 gnutls-3.6.13 | 1 
                 granite-0.4.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
           host-nodejs-12.16.1 | 1 
             host-squashfs-4.4 | 1 
               json-glib-1.4.4 | 1 
             kismet-2016-07-R1 | 1 
               libupnpp-0.17.2 | 1 
           libusb-compat-0.1.7 | 1 
                 mesa3d-20.0.6 | 1 
                minidlna-1.2.1 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
               qt5webkit-5.9.1 | 1 
                 ripgrep-0.8.1 | 1 
                  rygel-0.38.3 | 1 
       shadowsocks-libev-3.3.3 | 1 
                thermald-1.9.1 | 1 
                      tio-1.32 | 1 
                   uacme-1.2.4 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/25c12dfca4db5ea5d18100d8b49594f8ee18cb1c | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/7ab756cfc9f2e8a1592d8c1da303d916e8a388a7 | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/cc85e657602bb13468307eb2f01ab4fb014841b4 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/7cd2eed35b42cbcb47c0fda2f8a56bc32e2f2a34 | ORPH
  riscv64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/0b4b22c76fe78224c1ac825fd7c706ca1f1743f6 | ORPH
  riscv32    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/3a8f0e9febe363a230110ddf331e2bd0fb578c3c | ORPH
   mipsel    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/17736709e9c1a68a4d0adc8be702ae65df36913e | ORPH
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/757ecd885b750cc132fa44d075ada9054bbe4464 | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/16c9b4a85ad3b0df16cb0df5381cf6c77cc00442 |     
   mipsel    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/82ac2316a7617fc324c5f169cba28ab7ec48ba17 |     
  mips64el   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/2c7e2627f6d18c9294f892e6f978ddbc3396da1d |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/e0bb154491f00a7905a94b505b80682e71eb6385 |     
  mips64el   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/8330b5709af0137ab923a626cd4355dbe6f98194 |     
   x86_64    |          c-icap-0.5.6          | NOK | http://autobuild.buildroot.net/results/a6ca3a555a9edfaeef639e2eb5b310d8b993a540 |     
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/21faecf8bcab90a519686a47bf2d5112fe485987 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/dd4a44ce3601d31931940e19b879988b26ce7010 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/c30e70755f0e06e34567da1f913630de68c88473 |     
 powerpc64   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2f89b59361007a70adb64f0ac49a396fd8abb492 |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/277e8a89ed749ff9d54d72599c9dc6aff44d7fc5 |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/1bb8ccb89dfc0cd3bf005a74938cf3ff5770cc79 |     
 aarch64_be  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/15db80393962fad45f14b8cbab5df6fab94b85b8 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/d6a44072c10a74bfc903dc2fcc6cfb18de3c3d16 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/ffc8bbfa2e62e343c23d95388f6cf9970e7cb656 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/477655f239e7eec603438f5b5f735c8c492674cd |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/cd9479fa2eca43700cd46a7bee7afd6af797ed12 |     
 aarch64_be  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/75d780371ca45b651436c0f3b22335e3580d4d88 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/3bd33254f291ceaddce8fedc0f53e2cb6a3714c9 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/f74f775273bf6a95bd7238036065477706ff59b4 |     
   xtensa    | google-material-design-icon... | NOK | http://autobuild.buildroot.net/results/a5e542970d6a6c6ac70daad87f48c128c4619fd6 |     
   x86_64    | google-material-design-icon... | NOK | http://autobuild.buildroot.net/results/f9f65c02435debe88604002c0417af11c8b24de5 |     
   xtensa    | google-material-design-icon... | NOK | http://autobuild.buildroot.net/results/739385d9eff479ed857bb0e47d0c25af7a3e806d |     
   x86_64    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/2ad925d8f8eadd0a723d45b3007729d2caf9709c | ORPH
    mips     |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/109fa5a85ab2aa622ffcd96b4a9c60e12e36d126 |     
  riscv64    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/72b2d9cea10b28fe720963cb5c0ecdf27c3f56b4 |     
    mips     |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/89ec0baf941cc1829ef0b23fd4440f1cb8ca9b96 |     
    mips     |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/30d58f80778f98739bb0b8562321382b2f411424 |     
  sparc64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/b5dc57db66815c239a5a6d117ba4593fb91f94b1 |     
    arm      |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/867f37bf7368a16c1fadf808e0db28cf17b0f14b |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/6be12c727f19a01a93566faad641ed63f2ce9b63 |     
   mipsel    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/e1d5cc146d3bdbc57f1aed9fc3d9142d3d152f39 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/88ba9e217214ccfc4d33c3fb699e95901ddb2837 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/23ba29b064457d7b90e8832199532ce56ea1a27a |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/863ee90d0b1a23c086ffe17b8b0171f272abe148 |     
   mipsel    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/0071b318640424ca1adb16a684745b9685fcd1d4 |     
    arc      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/5f8c4590015d01377081ed2a0dc71f738a2062e7 |     
  mips64el   |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/617e32064d51c70870a118ef0ce511b150611414 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/27fb75dd3f65302d77bf51bf85b688a423f91884 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/bfe72899835f7042fecbece4f05211afa9901724 |     
  aarch64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/5dd7db8ff518810fa2c405a28f841a1936ae7f76 |     
  riscv32    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/802c180274e0625405fc62e68af4b58afab2f75a |     
 powerpc64   |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/a3b56d88e4e9fe33d72bc57116fd69d997437d64 | ORPH
powerpc64le  |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/592135553f6d6edda7bd116a43194ba744bc07cf | ORPH
  mips64el   |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/1ee8f61ea47de27229d5029488b428bc6c6c3798 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/f9ed5470f03c1634ca23b1f22c69c74475c238d7 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/f010ceff818c8cf814a7a60f7f9502929666927e | ORPH
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a5d2a42737bb9254beb945dfc12b71afb8d6d91e |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f02d6ab1299b2960dbac1e846e38075df191d4d9 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/12d1e4dd4d8e26a617726cf41acd43d067ca74cb |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3fbfe41a21e99d034270b7b5417394846a0dfc1c |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/602db5fae4b2a637336458c8d012bb0ed954c4b6 |     
  mips64el   |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/b7e3eede729ef1571f88c491e010711e8ef6322d |     
 powerpc64   |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/34fbdd8f216930498f755d0944a2ff1381657057 |     
   x86_64    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/ad645a60e7c176f3d35824888881af66f4e9e5d5 |     
    arm      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/c2cd28291e27568a44dc90e874cf979b1a25a935 |     
  powerpc    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/08e75f2d05a1f0097f44e747e6aaeefa09379e11 |     
    arc      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/f2dff47c22e5ace58cfa579e31511bd9081446cb |     
    mips     |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/2d9a6b0cf6d8d53dd4861fe794dac7a317f214f7 |     
  mips64el   |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/55658373b59b3ccec6a481a3428fe9d61f7aaa1c |     
    mips     |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/90c8eecebd4173209a9daf2f007ad662ad68d227 |     
   xtensa    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/540e3b4fa045a9073476708b7af81434b9074fa0 |     
  mips64el   |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/9b674d4eaf7ba1c265818ab6a0978a746e9f4ed4 |     
    arm      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/01babc1e1502ac867eee41f262cd5e53112f5acb |     
   sparc     |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/f1745256a39de60ddd54b5b06ac756a71a4efc45 |     
  riscv32    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/bb170abc5d574e1777f31963984bb3b84f542f3a |     
  aarch64    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/1e14fcda661d37bf5ef335d7e97f8b6799670ce3 |     
   x86_64    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/a756c128d2a40642fe6df055fc2dbafcc069758c |     
powerpc64le  |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/c8ee1fa42748055a48772c0093697dcf114cf7ab |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/c207e290c48a64b171d5569b1dee66c36131ca31 |     
   xtensa    |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/fe38b3234164ea54e3bfc92618823a793c729ff1 | ORPH
  mips64el   |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/9ef30d213a8ba8b68847ffb75e332aeb9278f30e | ORPH
   xtensa    |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/ee3116110ba0609c2c8ddc704e08e88e433ca324 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/644fa4da7e872e6beeccb619466503c4c1e2d3de |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3ce32687a8ec423644d76c49f15fa59e75794473 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fad063473b03435d4fe333d16b8909b046a269f5 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d7b2d35a0042d1e7fcd5674525a2bc3c4c4a4bae |     
    arm      |        json-glib-1.4.4         | NOK | http://autobuild.buildroot.net/results/4e391cdaefaa92d1a1630454ac722f5832c0dfa2 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3a0b0afce2e40044edfeaf1dc538edb8e29cb2a7 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/0d2ca301531895f161bb34d43d2f499ea244f647 |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/2adf0ead53ef08c66d1cc31f3eed0bb7a4a5a41f |     
   x86_64    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/601719343dfd5a26c7f283d6fc00b80411814725 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/32ea0d86b8528753f494f26e250eb28f13f99a2a |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b901ab2d9580295ee55cba6558e67a46d0c3813f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/12193ac9da5db4f79a7339438c18bb85c3f1a6a2 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/68bb2f94d8af07d7887fb3c89fa3ae685cd92536 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/611a631691c732fdc701efcef8d91993451a0756 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/1213029a18c03e3aac055e3cb01fa52d14662c86 |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/b478dbd47a399482bcd8c3a70b0038699b1d891a |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c312f0d1414851a774819925c2ee259e251e1b1c |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/596eb2882c4e4dc86699d609a97996bdc70f3c1e |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/4bf97e91fbb674a9c10a5c7b51a4e6b48ead1320 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/137bbf77fd0f49b048cade47d96622d060bb8e0f |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/c124df40d58ec1ee35917064469f30ed8c8ce87d |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b0f2a09a0c4947a9737dba8247b64f444fd47566 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/adc242769150e3c33cb79f5b6cf1141335d128dd |     
    mips     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/adc1987b2acd401ba32c036622423063d5d7ef68 |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/28048da6d9150e16f865700aa4a903edefa906cb |     
 powerpc64   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/633bc036db3c6083db2c9ae5d26aadd4b18a5801 |     
powerpc64le  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ad7a92c31077ac4e9c0bcc2f437ba5af14c34dcd |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/43527d7013a75929e752ba44d60155bd26892284 |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/77ad2936bd959f082ca575c2189c8ef3446a1aa0 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/42d6a44743eb4e0f226bbcf338cf8451e3feb303 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/2abe71b3bbc5beb7ac6721ca97ee99307119aea4 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/2dba331bf6bfb2b9ba0d166a97a4a6c230225e57 |     
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/6ac4648448bdbf168cb61f9af13e535de2515f2d |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a1923ea8c0925ebe8a398a2e417ffc65828bdb18 |     
microblazeel |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/2123e9be124c665f58ed9703edf4610ebd1885cf |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/9194bafd89ef849f9cc4175d8cef18380a39f70e |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/780b9591a248207c13f56e0ef4e5e40eeb8d8092 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ab5b7d85393e7e5358b03693fffb4f18b1e2f687 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/b96f8f651e855af6b84ba7a3e7018484d2f1690a |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/86fa7057b922d94179d81c8599d25e8b10d8bfa0 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/62467244e68283640eb3eb4c8c0b80277dac9afd |     
    m68k     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/cfdd4cb45d85988641b1535d6c4e856af63fb774 |     
    or1k     |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/691fdf50bc3b48a63da9998a2f24be87ca1ddabe |     
    i586     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/7d09abccff764cdd58bfeb822a280609cc8b4682 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/a9d018aa44ccb164c50688cb9b8609f4c960e0eb |     
 powerpc64   |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/4d4193faaac009bbc950c31b8bd114c1f2a598fb |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/0d621645b7d93a392d16c817c2a9eaeb895b095b |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/8e793a4080c4b593be91484371c3b0db9e8c881d |     
   x86_64    |          uacme-1.2.4           | NOK | http://autobuild.buildroot.net/results/d241121f8155bad9b6b25c16234576abb7fc940b |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/b4c692963846a0434d80fbbce76ef871bef17d20 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0ef0d95f07b0435b49be7c4bf2bf59e89a003424 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/455ba6ab44479cfcb7e016887f23f8bc40c03549 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/09dad9534798177674e698cdc1d3c0e2c69684cf |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/24d6a14671c2489ec8a74a175eb9aa3131b02c6a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9c8927e4c8e6c2b3412c59b54ccee65ba85a131f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d97d3471231e4689476f7d614859274b6808f3a7 |     
  riscv32    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/8a7dfad995ffdc11480b284e7feb85a79494a33a |     
microblazeel |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/9399180817c25a78e16b7f702c8e9997c35934a2 |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/31dd6c594b9f1b90b52e7dd275616276c82fdcb3 |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/69d80fd2d12006d9e54130b5fdc4ee0b70e668cb | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/903d740a8fcb9c84e9fa9521812e8e4a6adb7efd |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e6f36a3872b43ed359cf352474e33f3ddc076796 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/531901971727cc3e71d685718799518c9c7044a2 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-libsepol-2.9 | 3 
                host-dtc-1.5.1 | 2 
             host-squashfs-4.4 | 2 
               acpica-20191018 | 1 
             host-gnupg-1.4.23 | 1 
                     php-7.4.4 | 1 
                qt5base-5.12.8 | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/8f33695c48eb2691b14f3c2344fc21785e16f2a8 |     
    i686     |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/2f8aa1f8b81fb22b4715a347681b50b2183c1d89 |     
   nios2     |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/0abf93bda1e35f2cc39e383e149ae972f12853ce |     
  sparc64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/85d2610ae8264ef55d25cf45ec0e1565a4e5cac3 | ORPH
   x86_64    |       host-libsepol-2.9        | NOK | http://autobuild.buildroot.net/results/1ebeed4bb1b0f5bca493ff687f879367eaeaf868 |     
   x86_64    |       host-libsepol-2.9        | NOK | http://autobuild.buildroot.net/results/3dc634f4a6458e8a52b9787cd7fbddc5ffc5050c |     
    or1k     |       host-libsepol-2.9        | NOK | http://autobuild.buildroot.net/results/fc5a69429091ff167c81ecb6ee0c5d9a468b1452 |     
   xtensa    |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/d0be5cd5fbcda32a9d7fe57381499f6720b072cf |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/e1c30a37cf02d17f66c8e4e4093736e99aa6b821 |     
 powerpc64   |           php-7.4.4            | NOK | http://autobuild.buildroot.net/results/751f85fd1e5b5b3fee9d32f80254252a7abd76f2 |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/663f0d6bdaf8afde6cf11c0d6df639257b091e0f |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e3524b4f54f4db7d65c84ca6395909324427d5a1 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/bfac0b018847d0d3531682524168f8485d9e0511 |     



-- 
http://autobuild.buildroot.net
