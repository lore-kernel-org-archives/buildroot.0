From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 07:26:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-10
Message-ID: <20200311072606.943A820472@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  9  |  0  | 30  |
  2019.11.x  | 26  | 16  |  0  | 42  |
  2020.02.x  | 31  |  7  |  0  | 38  |
    master   | 185 | 132 |  0  | 317 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 15
                   bearssl-0.6 | 11
                  connman-1.38 | 10
                libtirpc-1.2.5 | 7 
               libglib2-2.62.4 | 6 
               libupnpp-0.17.2 | 6 
           mediastreamer-4.3.1 | 6 
psplash-fd33a9b3d68c89fa22f... | 6 
                   gupnp-1.0.4 | 5 
                       unknown | 5 
              host-grpc-1.25.0 | 4 
    host-python-markdown-3.2.1 | 4 
                mini-snmpd-1.6 | 4 
                  ffmpeg-4.2.2 | 3 
                  pango-1.44.6 | 3 
         python-markdown-3.2.1 | 3 
                libevdev-1.9.0 | 2 
               libtheora-1.1.1 | 2 
                 mesa3d-20.0.0 | 2 
                   mimic-1.1.0 | 2 
                  ndisc6-1.0.4 | 2 
                     vlc-3.0.8 | 2 
                     avahi-0.8 | 1 
                    brltty-6.0 | 1 
                busybox-1.31.1 | 1 
                   evtest-1.34 | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-go-1.13.8 | 1 
                   libiio-0.19 | 1 
                libxml2-2.9.10 | 1 
               log4cplus-2.0.5 | 1 
        network-manager-1.20.4 | 1 
                     nmap-7.80 | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.11.3 | 1 
                qt5base-5.12.7 | 1 
                 qt5svg-5.12.7 | 1 
                 ripgrep-0.8.1 | 1 
                 rocksdb-6.6.4 | 1 
                   sdl2-2.0.10 | 1 
                suricata-4.1.5 | 1 
                      tio-1.32 | 1 
               wireshark-3.2.2 | 1 
xdriver_xf86-video-mach64-6... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3d3596ad386144609549693c0a1aa9b704ba748c | ORPH
  riscv32    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/372cd9604adfbf979bf42e58d7a737e54efe382a |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/937c39da84224c28c8ab827ea5cf3711bb4c4040 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/792fae8341713ab952233d0f6631b0aee97be9e9 |     
  riscv32    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b3704105d8459050f941f52e8f7e4ad1dc478185 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/217de632547d3904f20e7604fba8236ff6e9e0b9 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c737df09244dd6acaa06e66d1b1e347272df1556 |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/61021bd69989b2f1d91731f93362d5441c1f179e |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/13bb372f1915e3aab9dbdd154920e34386df51a8 |     
    mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c5b9fba89a11025be84f86feeafd33d72f8af570 |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c7d21ff0a520680f2195f6289518cd8f9758fcc2 |     
    mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e677519c7536447062bf15fb7aa73eded19a6cf6 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/31b49cd48f8d414587e1cc694cd26fcecf1a74f2 |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/6b3489c80b40f1af3f9406aaac21cc32918a711a |     
   x86_64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/79a0b5d0a2ce4c4107bc39f457988ed73c8c5a79 |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/4a8279a2fb1d023f75798bc08e59fc50a4dda40a |     
    m68k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/61c49377f7b600131f99d10df709f76614628b0a |     
    m68k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/bdb2a33627b83ab06e3cefce24d99e8a5e7c8da0 |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/430652b48c60126ce8acbd4edb96419ea90afdbc |     
   mipsel    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/57b0fc78242df92d2050dfab18604fd035fd74c1 |     
 aarch64_be  |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/64da9a9afc32385361c04dc42e97d45e6bf5a2ad |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/30f0d586505152ab92e842453b04e4427dffb739 |     
    sh4      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/1ccab46bde3ff0551abc2ca0b62bdf66e19f3b36 |     
   mipsel    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/171b430d34241d089513aa31e5886a4366846f68 |     
    arm      |          evtest-1.34           | NOK | http://autobuild.buildroot.net/results/73355877a945d3555350bea3bef70dfa68b80018 | ORPH
powerpc64le  |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/5eed1a2efd31a0d13ac8adc2f5d57f5c2d3a2bca |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/ef1d09d8b234807dcd993422f9557e5c34506013 |     
   x86_64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/f99efb1ff5e34a95557b2d165136c41a220b4246 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9807a2b0c95558a7f2de473cdd6e32b470a41f14 |     
  riscv32    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/df86c47653953b94d0b8b5604fde363fa52437a6 |     
    mips     |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/372361c2fa244e2927ca74674347c617a17caab0 |     
   mipsel    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/a18d50107b11b20731d7634774a9f0ee3eb6b270 |     
   nios2     |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/ea91dab1d9a59c1aefa481c316115558a6f6e8f8 |     
    mips     |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/d3f75a743fbaab9d32db9ee53bb40901a1f5d52c |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/5a95b93e4a05487234c58d40890872c4aded4b3a |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/04e5b3f7ba69244603fe7c60e45b16e81041b5f4 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/09f95f6a51f08edd2ebda50fcf340e27749a89b9 |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4236d8f7a420b4f07abe7c5b4abc538353bc16c8 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/22ea5c1e0f264e5254694c0dcd4f5de9cb0bc94d |     
  powerpc    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/800bd42cc7d1f534f23b34ee5a585259ac3360f6 |     
   sparc     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/40d56ad45001cd602c8927b12761e59c3fc6fb5d |     
  sparc64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/6ab6a18d7b4d1acd8d48706d1a00b3e078f25afd |     
   sparc     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/1a69660610028d6207ddfa8a03d3c7cb1880b391 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/1045e004e0af3bf880f55176d5e1875ace825836 |     
    i686     |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/eebfa807af0d35b494c8d918add6557cf473b9a8 |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e1ff86eda5a11d04d3e23b09ac5694c6c35610b8 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/00d6222fe2733662af9a588b016b127aebbf2f7b |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/bb6a6a433dcbeb7e06eac2628155896b3e07bb6e |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/3fd493b60f509cc2bcef54a642a0be4f447cb10d |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/4a607443746240c9a8dea60023653c4586534319 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/342a5cca5c0c932c1eee8be9d54ef41d82493bc6 |     
    arm      |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/58b08c1ee9a7c1b5fa05c291d02420a7366e8817 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/d0265a8756a1bbb7458af14ca4ffb5568d7bd6f5 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/baaeaa025c17787d872c23dc4da4373f457d094d | ORPH
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/2b82fe789cd03f063491a5cd63fd812d597cd8aa |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/499c8d085611be94eadba00d95d7b79e0ce9df5b |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/d85374e59738bec047170ae277e82195f692fbe7 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/1d862ca5ee6c14f9b8587db68d63178be321a8ff |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/0cd54c569bec3c2c0129f0e5fb472509365dff09 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/2577989726b7f377b810ea854051f2c03b4ae48a |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/08f94031fdc3221a40ac017fa931a25a65385c69 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/c0b4495ab16a0f210d591d2efbf38af88263f70e |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/71e3c24e96e5b281dd7729ad4662511416f6e92b |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/5188f4d67f3749cbc0a4fdaf956f4a2cfc6b5549 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/a6c6b61861b1ef2c1c61dc43149e68cf718f371f |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/831b77a25a29521f0b9f4d1730093d7fb8002d05 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/e7d26c33ea80d0b58e87b6854dcac0d98f2fde09 |     
    arm      |         libxml2-2.9.10         | NOK | http://autobuild.buildroot.net/results/1f0a2c0b73be3326aaf9730f410f5fa6e3a56999 |     
   nios2     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/8b5c7556c531596458f9efb9785f960ffc0a8f25 | ORPH
   mipsel    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/9419985af5f2bc007ac57b210912927ac96e6fec | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/22e70f62f4f1bd283c214d669b075eb1f9903af3 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/1b8b30458473634e8a767bfae33d802e49caa693 | ORPH
   sparc     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/0434c664b85ee00bb83cbf45f8cb950ca31257e8 | ORPH
   mipsel    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/e2f02bc433921a8531a4b31477dbb13fbe34dbff | ORPH
 powerpc64   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/b2bfa4513495b8dc5be9ab158de815ff82899dbb | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/590a7243031a89660dbbb0fa93b79b928163fb84 | ORPH
  powerpc    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/f6697faa4a99be70fb4ee0a6916453c197f14aa5 | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/fc715c2fb33616a030b637db120c3532e55f3652 | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/af602082d1309395e5bf05b4d4da9c7f9d457b2e | ORPH
    sh4      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/80fa1bac2e19b54a3cb4c8a821a35758f8f7f252 | ORPH
    i586     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/4aeeabeb9b34c4405380bd55055b0cb2b09d1d1a | ORPH
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/ab85db77a8d0385e51de008e37c8f56e8fc67725 | ORPH
  sparc64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/f4af130bc70ecf0915351b0dd3be8821e0616b9d | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/940c4a6e611a93961c4478e36ebb289d44c69db8 |     
    arc      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/afc3b5c201255840a66fb80409094c84e5563e35 | ORPH
    sh4      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/32d06517a5470f71d9b7dc99139f6c3071e7d77d | ORPH
   mipsel    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/4f030b21fa29faee1d330b22d737bbbf7d065a73 | ORPH
 powerpc64   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/e6adf151141ae56f5194165fd5b74b52164bfb17 | ORPH
    arc      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/7ee9595a2db8dd03b86d76f8e0ac0efb64f0ce5d | ORPH
   mipsel    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/b26a2e6da3432434824da1825bafa469217ee2e7 | ORPH
  riscv64    |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/2ab7dfb2cf972d3bb75731832a86069a9e150613 |     
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/a470c34f375fa044ba3db3d64a829b1c6ede4e86 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6d8a04cd04488c3c566cf6abbc66f2b8f656db43 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/54a24fc0b68cb33ddc314af5e3329a454be47144 |     
   x86_64    |         mini-snmpd-1.6         | NOK | http://autobuild.buildroot.net/results/806b688b827341a2d67422f3a9c70f0ca91d8d7f |     
   x86_64    |         mini-snmpd-1.6         | NOK | http://autobuild.buildroot.net/results/9a5c7660acb846b77da791ae58e40342fffcd8dc |     
    arm      |         mini-snmpd-1.6         | NOK | http://autobuild.buildroot.net/results/5431363f8498cc19affb286c7f36ef10845ad9cc |     
   x86_64    |         mini-snmpd-1.6         | NOK | http://autobuild.buildroot.net/results/4c16e98db844b7b8b7c935d2f3943c1e7ccd30e5 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b3a0392078965ffb5d9468e3af159587c48416ad | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8ab96c7f00fc29e996b9339fc125b2313f828a80 | ORPH
   nios2     |     network-manager-1.20.4     | NOK | http://autobuild.buildroot.net/results/71fb540bec04557e828ff30e716e7b87e9926cb0 | ORPH
   sparc     |           nmap-7.80            | NOK | http://autobuild.buildroot.net/results/1bebedce796a881d98483ab00b6ee28ae26f98cc | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/71df9b8870eba09c201a9f421785df1cd09eaffd |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/c058e5f769a0172e55da89cdebcd0df8f727e177 | ORPH
  powerpc    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/01a4a2b44acef48cb0f1bd55a875600290e8850b | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/963a95c186391e6b2a2bf882c288a4a3306f13d9 | ORPH
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/537d99a0f2eedc41cdfae9e4b4992f7052b785ae |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/6e2a798deff838915e973f11667aabc27a55d9d7 |     
    i686     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/43ff1202996ba48fe07c9fe3d897ff53cfbc1ccc |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e3b568203bee05533bf69e461cd10d37e360df5a |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7683602128919e1510d4801a1c176abcb5b1eec5 |     
  riscv64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2cefc789f855ffa322ec7e24702abd3e5f79e605 |     
    i686     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/51d06996f1d6fc0bac84a86c4211be7b0010527b |     
   mipsel    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/02d09b9c88e60eeb9873a122d16b7c51a2a4b9d2 |     
    sh4      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/e30e2fe994db362c88c9274ba8cfb8eefc5ca55a |     
   xtensa    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/8716bf52a883be7e14bede70e205fbb1c548c559 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/252f3e4bb770fe68ff33344c1250045d463e9511 |     
   x86_64    |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/331984e7ef9c310cdf3ef6277130fee050901e22 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/98c84c9ddf95a277ea6c7c9928b4f1d74c3ec33c |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/37022e51f0612d46d689575174beda4036dda5ca |     
    arm      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/020a8f40c0d73ce5526b70ab61be0a1d1da3ee31 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/a2385a1ede89dcc677c53ccfe5df6d3f66cfea88 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a4dfdb1e6bda20bee43bdc35a8da2a14c9d14b71 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/9e288198470108fb205e77a5ce07e941722f13e3 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/be872cae22d35c1846eae2277a7b233751c12bf8 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf3ca48981e7d9bec8ea7e1ae5bc724fb8fe5b18 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c7411564e67447083473ced52625897426d5e344 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/79bca93953bf8212b34d8359af6106073522bff1 |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/23c1dd443945ab8bb58c19d43fb269ab85c5efa7 |     
   x86_64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/7f71dbea20290689754b6872ddc6a04f2117c421 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/cde5a056690731f94ba0b5a653e33ae191625f91 | ORPH
   xtensa    | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/0d91bd99d4b4d23a31e0735b6bdbfaccb9df885c |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 2 
             host-guile-2.0.14 | 2 
          imagemagick-7.0.8-59 | 2 
               asterisk-16.6.2 | 1 
                haproxy-1.9.13 | 1 
                 mesa3d-18.3.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/85060e71ad61eb0289f461e1a500a1a4906079a2 |     
 powerpc64   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/4d8819460a33673dbcd8bc243d00ae86bc4a7cdc | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/d4efb06d93de3dedde7bfbeaf0860a7f9afa46c0 | ORPH
    sh4      |         haproxy-1.9.13         | NOK | http://autobuild.buildroot.net/results/042a7913cff315512491b71350b8c67a8deb8745 |     
    arm      |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/449ade95190f535738821f94d3a8cec5646fd5ef | ORPH
   x86_64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/f7b87b5d44a32e18407c9034b0b32060711cc102 | ORPH
  powerpc    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/f8d0c493900cc94e41305d3e32eecca9ec54b03b | ORPH
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/3931ccd0528e8be1defc853b561202ffc55718a4 | ORPH
    sh4      |         mesa3d-18.3.3          | NOK | http://autobuild.buildroot.net/results/fc51a547af229dd3327e3f7ac3a7c1d8df385d14 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-59 | 5 
                classpath-0.99 | 2 
                haproxy-2.0.10 | 2 
             host-guile-2.0.14 | 2 
                   dante-1.4.1 | 1 
                  flashrom-1.1 | 1 
google-breakpad-7515ab13768... | 1 
           oracle-mysql-5.1.73 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/8f411b395035519c66d77073f73008f6ae12001e | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/5ce0d3aeaf7f30358cb20465c7e34d4c4e117c9b | ORPH
    arc      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/c0eb2d89440071887965d3ff8e88b437be49d04d |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/5690ac98be16190ecce83b813a751addca3865eb |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/e03c28652908239a3fe19f672d0de8a84f7ace70 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/b9c8256b7550386af46a56fe0422caecb2c3a308 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/a0784ccdb607ad88cac9c2982ead1ce54768e1fa |     
  sparc64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/9de383801ff3c84a1455066255893a16aa744b76 | ORPH
 powerpc64   |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/2a7edad80a1eae3fc2a37ad7c39902400a9e2513 | ORPH
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/0d9f1e663187fca88f599443130982826bdd5e20 | ORPH
  aarch64    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/3fde8290ffc90f07447da7a811769fa46e6f7b49 | ORPH
    arc      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/4e2ebfb9864f04d49bd6d88da16ce3b57143e2cd | ORPH
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/f0660293e2094f468b7cceb6c0e0728cc4f3518a | ORPH
  riscv64    |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/0197308bc473d2a8fd3be223eb195a27d0053aae | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/77630c410e29994f52c9245817ccc8003c3e46b3 | ORPH
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/2530209770ddd099ab75c52b4324e32eb7d98aff |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               acpica-20191018 | 1 
              host-grpc-1.25.0 | 1 
           host-nodejs-12.16.1 | 1 
               libglib2-2.62.4 | 1 
                 opencv3-3.4.9 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/ff8394673d7e0f57b8bb0735e580d58c8df3cb37 |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f817f315ee44e97dd511e4028d1d0a6a3dc05d60 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/b0ca7b5a9caabfbb7a87f13c6ac637aed1b10912 |     
  powerpc    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/f86257045a42bc2cea5694086203843f05bd1a28 |     
  aarch64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/48d34dfacfc1b109ec0d76f17be922b2f61c38bb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9ed4ce0e1c7bfa473198812ee7353d2cd7f0b49b |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3024c8accd0120f6bbb7f55525f01d5d6d5903f2 |     



-- 
http://autobuild.buildroot.net
