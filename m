From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Feb 2020 07:17:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-01
Message-ID: <20200202071748.5E6902046B@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-01
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  1  |  0  | 16  |
  2019.11.x  | 12  |  7  |  0  | 19  |
    master   | 88  | 93  |  1  | 182 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  jack2-1.9.12 | 10
                 libnss-3.49.1 | 7 
                   aubio-0.4.9 | 5 
                    brltty-6.0 | 5 
                   mutt-1.13.3 | 5 
                    parted-3.3 | 5 
                apr-util-1.6.1 | 4 
           host-doxygen-1.8.17 | 4 
              host-grpc-1.25.0 | 4 
          libmodsecurity-3.0.4 | 4 
                    olsr-0.9.8 | 4 
                   mimic-1.1.0 | 3 
                    mpv-0.29.1 | 3 
                      bash-5.0 | 2 
          libpam-tacplus-1.5.1 | 2 
                 mesa3d-19.3.3 | 2 
                bitcoin-0.16.3 | 1 
                  cppcms-1.2.1 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
              fluidsynth-2.1.0 | 1 
             gnuradio-3.7.13.5 | 1 
                     host-llvm | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-12.14.1 | 1 
      host-uboot-tools-2020.01 | 1 
              jpeg-turbo-2.0.4 | 1 
                libgdiplus-5.6 | 1 
           libsamplerate-0.1.9 | 1 
               libsigsegv-2.12 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
           libwebsockets-3.2.2 | 1 
               log4cplus-2.0.5 | 1 
                     lxc-3.2.1 | 1 
                  ndisc6-1.0.4 | 1 
                   ogre-1.12.0 | 1 
                 opencv3-3.4.9 | 1 
           oracle-mysql-5.1.73 | 1 
           python-bcrypt-3.1.7 | 1 
                qt5base-5.12.5 | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/72d7246d3f17a1b45f1ef7948f65d32e421fb9e9 |     
microblazeel |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/b2eafa99d18f9f227272a5c69a16c765da898932 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/13b9824c716f2ab65f974b667e82865c5adb42c6 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/6c58805e1ec260def86d8391f659db22f2106826 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d421edd0e7d3223f7fe73b6cf0894173a6124726 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/60a063ee3a9ac9e395a7256fcef1f0c84da4530b |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7e1aa19e662213c44d98a16fe872ffd1c3fc1746 |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/47755e9572d28952ba2295188acfa4584a84b0c9 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f02142156df96103961acb5d5b17df82af5b1ace |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/88521b487609221e2d2d2632bd87bea7684b1ab0 | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/ed60b273cef790a0f540ec0aea5aafa5f0aecab8 | ORPH
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/f31bf97f7d7b7d9b9041404cacc56275e99b80f8 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/cfdeed12fcbe0bb799ac83266dfa0130054dba60 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/acdbbb2d24ba81fa8d82f7c9c29bbbf8d6ee29a5 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8d4a67cc9622bc6d77947cfcce8ff3a5018ef2c1 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/865fbbad8363ec063937c07e68e341610426d5d1 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/12c3c736aaf8b0a9ac4983c273cc44949f28df24 |     
    arm      |          cppcms-1.2.1          | NOK | http://autobuild.buildroot.net/results/a288105ce73cddff7694e796bb728e5060740de4 | ORPH
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/efe209176a9a8761b24ae8c27cac574eaa3f8294 |     
    i586     |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/30ce138c533902116c39a2d18700ccf09f030656 |     
   nios2     |       gnuradio-3.7.13.5        | NOK | http://autobuild.buildroot.net/results/0bb3eff929d7bb26b321a594fe936ef4db3eb30a |     
   xtensa    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/6e173f977b27111b6a85912580a1fbe932414ea2 |     
   xtensa    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/51a3d849d29e1ae765149d1397929cb1aad5c5aa |     
  sparc64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/9a97b605ba3439c435cf27025a777aac3aa5cb3c |     
   xtensa    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/4139f02ca82c0dc63bccf2014d2fe8cba01fa8d7 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/862de16cb83987086c1e0b7386d602fde800e5c7 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/88425f39980daa707733f96d082d8a4d3ff5e4be |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/379af03eb169fd3984101195a1b2861c2f37cb19 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/05a3b7253f4cae86944d559c4036e9262737e133 |     
   x86_64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/80e6fdb6bbda9cb6220b6d8608bcefa440518bf9 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/ed619a21075b2d9a9bf441569bafbf781108b86c |     
    arm      |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/0d309f1e65be58e11e150cbd2d7a4c10113cda2e |     
    i586     |    host-uboot-tools-2020.01    | NOK | http://autobuild.buildroot.net/results/fe31c798427f3579dfc61fbfaaabc81b162d06ac |     
    arm      |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/f022bd6f6f06715ff2af1e1b6a2ccbce3203a60b |     
    m68k     |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/41b1cf6b2e02d54bb0c0def2289fbb85c89e2d57 |     
  sparc64    |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/44e049c51813130a46fbaaf5e5994d672789f18a |     
    arc      |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/539fdcb2f07359a89f42d8531c19d423dd9e7cb8 |     
   mipsel    |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/ad08874282742b47c02e3bb19da6969aa13d22c8 |     
   x86_64    |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/ed2f87a4652b1b4c52df78d32397a28089359aa9 |     
    arc      |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/e9619c22c3dd85e5a41adb5621da901fc2acecfb |     
    arm      |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/0bd7710c25204ec4a5ed65ff60f2cd1828c92122 |     
  powerpc    |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/0ff217c7667d408c921d34112ca7fd82d097a136 |     
   xtensa    |          jack2-1.9.12          | NOK | http://autobuild.buildroot.net/results/f1cfc3acb362812bdd714425a2b1c9a45b4ad314 |     
 aarch64_be  |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/27d1689d1d1cb351feec373eae0fa89ff90d67cb |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/4002d7ab53f2e330a441ad9e9f6a5e92320b8cf7 |     
   nios2     |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/ad823a652d8caa4b0aa8d1ea216bea9abd0d4478 |     
    arc      |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/4a966439334a8911a589692f76cfb5ba0f2c5baf |     
 aarch64_be  |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/3df6f24f951b9249b78725f063e7238db7a309f9 |     
   xtensa    |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/925310f04b7a5243c60b9f96fc4f6390e0bb4fe7 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/f5af658bb815c7d1e5f168e37b84451f0f5fe572 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/92bce2269d1eeac0b5dd60b2106323dfa66e145b |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/20afb36400ad121db34dbe7c513e64db1982d2f8 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/2687d667467a2f4209af74e6e77073801c716a3b |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/af0287e1cf435b58f4337e2d3f6a1915d09ab70a |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/f9aaf1a61c7277db82879f2afbf6d129f264d46f |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/04dc30115e24650c407859b5e0167d3a89e8d0d4 |     
   xtensa    |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/11da35b8d731a3bccbf0fa109104045b8f943071 |     
    or1k     |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/c4b4cf62298d609257d80f2931765b41e8b6d45d |     
    m68k     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/5f58df129722493da587fd9852dfc5a6deaaa076 | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/32d602229f10d55372743eed778bafd4ebebd03e |     
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/3b04a6596d1aee3291291b650d7e218e64e83553 | ORPH
   xtensa    |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/f716b115e7b08864ad1f4f2a41d6cae1cccadaed |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/03dbab76d9bfc63135cec9c1480a160f2a3a35c1 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/ef8d493b8a636c8e68a253ed952316e62b2f570d |     
  mips64el   |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/d4553b2d0d1b158201f00a177552d7dc63e76aec |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/74dd7b223f690e2500e4a103c192a4e9e6ed79bc |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ed501365bd78c6f60e12a3c65f5507a6ee0c2f60 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5ede6b2dd85aac1705cb9426389988151d2d20f9 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/a2b7c1eecbe290a53b6051777faf8a58a422a8b7 |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2ff50f3ee566f41275a5bf7917fa4affd286e4d6 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/436e250766da3e34f0a9754924b08dd148aa0beb |     
  riscv32    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/15b1e8b62f75cc0fab966d9ae3df6a49c032d0ce |     
    i586     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/fe950a206ef5f6911543ad1161b78b595d57a51e |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/47eadb81e99832ef08ddbfd8c91090ed4fe16894 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/cfe6d4c24e6d7adcf5f010f6f1ca053d825e41dd |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/977e29bb40b5a13b103a268cd8f0824f0321000a |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9fba9e1aff23e81a86ad232f0173a5ed012c3b71 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/62dab2bbe72737d3f19997e889298a6e267c1d38 | ORPH
    i686     |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/9ab3a44cac8493e24f93d99deb2574cb65a81687 |     
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5c827f33cf8b62abb2312ee1a9f6ee7bef8f8b11 | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a5c01e1b8e682edf59bc923e16514bcabd78822a | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3784b62615006b4ed706c24c0e089ac737a90929 | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f0d6cb2817cabab3aa0208de27652414740013c2 | ORPH
microblazeel |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/dff690cf59287e0e53af1b1732d8effb8eced8e5 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/201513e79f00bf0c5157eb323a30005f1ba0609c | ORPH
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/863940c62fe128ce40b0848774a25a16962a2b88 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/8de20bf2f09e0ea9388be18c87cca24529154672 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/3686da8ab065cee744efb058ef93790fa26951b3 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/2f4d0dc7d79c3995557b3021b4be21d44b6edafb |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/e0921099f67e4886b3f11e2ef90b6489bff499bb |     
powerpc64le  |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/fa85a8beb19f244f3f4ac7c8b04c1a72e8f61fc6 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/c657b1f406d16181d8252a54ba735a723f139b0b |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/5e38bb07f50d0280a5e89a9bd4aa021ee1248577 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/0fbd92e4cf9630b3a3fbc93e30d25980beb88155 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/221a2c2382f76da6390ee208ceb270d952c9b460 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

          gstreamer1-mm-1.10.0 | 1 
              host-grpc-1.23.0 | 1 
                libgdiplus-5.6 | 1 
               log4cplus-2.0.4 | 1 
       python-matplotlib-3.0.3 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/4d436a8626b6f62354936e2f4c9f66f768d73845 |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/52b8476dfb4c73a1370dc0945c650082e48232b3 |     
 powerpc64   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/5088be65c35fdad17d255b7069d1851deddc09ae |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/2bacf608be9fcdf0c0338a19db2ad84abb963348 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/99351fac35713f7fb6a69e7cb135da351e54152e |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/55cbb54f3f0248837c548182f78a4807dcc293a1 | ORPH
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/6577a2495f9ee7e3b5c28802d86c0eb143a5d475 | ORPH



-- 
http://autobuild.buildroot.net
