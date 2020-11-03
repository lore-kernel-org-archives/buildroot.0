From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Nov 2020 08:10:09 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-02
Message-ID: <20201103081015.7E69585D52@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  5  |  0  | 24  |
  2020.08.x  | 18  |  4  |  0  | 22  |
    master   | 138 | 71  |  0  | 209 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 12
                  rt-tests-1.9 | 7 
              asterisk-16.13.0 | 6 
                       unknown | 6 
        python-m2crypto-0.36.0 | 4 
                  boost-1.74.0 | 2 
                  luajit-2.1.2 | 2 
              sigrok-cli-0.7.0 | 2 
uclibc-ng-test-c64d6ac77f0e... | 2 
                  zeromq-4.3.3 | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
               belle-sip-4.3.1 | 1 
                clamav-0.103.0 | 1 
              cryptsetup-2.3.4 | 1 
                  dnsmasq-2.81 | 1 
       docker-containerd-1.4.1 | 1 
               domoticz-2020.1 | 1 
glmark2-c493520253fbfe3676c... | 1 
      gst1-plugins-good-1.18.1 | 1 
                harfbuzz-2.7.2 | 1 
                host-gdb-8.3.1 | 1 
              host-guile-3.0.4 | 1 
                   libcap-2.44 | 1 
              libostree-2020.6 | 1 
               libupnpp-0.19.4 | 1 
               log4cplus-2.0.5 | 1 
 Makefile:753: target-finalize | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
           optee-client-3.11.0 | 1 
                   pcre2-10.35 | 1 
               pulseview-0.4.1 | 1 
                rocksdb-6.10.1 | 1 
       shadowsocks-libev-3.3.4 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
              webkitgtk-2.30.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/59333520d004ab8727469161468a900c6d366f6c |     
 powerpc64   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7b5dfb3b3d803510a91e5f2857cc0adfab237fc9 |     
 aarch64_be  |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/499a6f088c5c29620e3faeaeefed553be36cc087 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/368b4e9fae58d88f17d190cc1418ed97ba3f7922 |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5d55fe9daee6a6f22f919659c07f99b37e2e470d |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/6eb559156e36b20e3fc0dbeafa2f6f942ad7db3c |     
  powerpc    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/df527c1ad3600b6a289477aac2bdebd429aaae01 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/81b5278e7baf4792050f0f2ceb9b8e00eb5ea16a |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/41c2d442b9e576ca692a1ccbf11e09b096f26b16 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/f2d5f870ad7dfd84827a5a593b34bf0e644e1162 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/f9d9aafce3dcb517fe1b596ab05438de80f498b3 |     
   nios2     |        cryptsetup-2.3.4        | NOK | http://autobuild.buildroot.net/results/bfb3775388b05613bd511baa4b0940eae9af7070 |     
  powerpc    |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/03667c5d74f02ebef86de39c3fd3b61199d243bf |     
   x86_64    |    docker-containerd-1.4.1     | NOK | http://autobuild.buildroot.net/results/1d415eca162db273f3ea6e28b614a8bc6dc81375 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/3818f8a504744d93d2009cada7019f2f020dce43 |     
    arm      | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/2077f71766c139eef68b94ed34215a6fdd670bb8 |     
   mipsel    |    gst1-plugins-good-1.18.1    | NOK | http://autobuild.buildroot.net/results/5a50e1e70f1f1875652805c12dabdcdcdc555909 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/322cb99e9b7b414c5c067defb6f82f0902aef340 | ORPH
  powerpc    |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/8e28254d5dd52a9aa0999a4001532b7ad74b61e9 | ORPH
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/c2c31ff5c206bd3791d64d953dc1574546644b05 | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/caa1b91baa3b502273e4609da8c0cf966c0f876e |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b5d691d72caaecdd37372355bd7e500ba92d39e3 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/efd236b65ad0d04c65705369f1acc3eb7f0f0046 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/091568da40b4c27092c91a083598941d833b1a06 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/538a507b91fa6549b5a495468aefb7d0d62720b0 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c09d38ca2b38bfc650469e288521e499b47ab364 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/87f04a2547f57e39a153cc9882b57aedb2ae5359 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a83575098789d5814a7e29056ace37049c4bcad2 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/06978705a76761daf429a364be9cb3b21eff2fc5 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e104b38221918b05726e5fbedbcf1fc3c22e0514 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/718fe83a24a040e807df9b1f4aeacaf705362134 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1639f7aab70d1e83a8f4f9990e18f08f4fbccb42 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/72b95efad41cf5d499ad5c1495647a1f318a71de |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/4e6319d074f11e06f09344748c511902978180ea |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/7119c35953c44d8a7c9b5c348d8dcb0786120ac7 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/bd30df7cb133199501791f2851dfd4790b7b3d4a |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/e0abc24a29d26c00fe7d2b0e1b226de5261f0ded |     
    i586     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/e5d5333af793a527a02dc24399ebb3d18a6ed675 |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/ac13b00eed867ceb4c6192d3206db8eab15bb5f1 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/264aae5ce0944b9b6d6a1ecf12fd35e52d1843e8 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/2b2271731776b0894cc511b85653dbcdb1efed04 | ORPH
    arm      |      optee-client-3.11.0       | NOK | http://autobuild.buildroot.net/results/8ba72963ce66d85e54c9616aab8de1e0c23a3605 |     
   mipsel    |          pcre2-10.35           | NOK | http://autobuild.buildroot.net/results/eab208c050867c9bd12bd80dca33cbe0199b0a7d | ORPH
  mips64el   |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/9e0dd34d58a74f15724deccb06104d31edbc7d11 |     
  riscv64    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/abd51e39ea1a22a073eba60d37dd6045000e6e28 |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/b6a3eb057a8b9130d9881950721d085a2dff3866 |     
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/7f124f3e09a4099d22597eca71eb03036860a50f |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/8e6e13dd73a87dc1359eeb0ab2afa1a9ed41fa51 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/0dab5e9e5055e180888472c7e88fedf9e85a179d |     
  mips64el   |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/72322cf7239a91211b0be74c01b55873340763f8 |     
  mips64el   |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/0a2419d4195c1963b751a9900a31c14c018a0f74 |     
   mipsel    |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/cff4f1dacbde948963abc70e99c9a66f8173b549 |     
  mips64el   |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/b0634f2ec0160462b617e3d916dfd0b6131485e5 |     
  powerpc    |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/8102f3898c8e47d943df86d636f7fa1ad27ca2c3 |     
  powerpc    |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/e6c74985209cb807f291a8046e903b54864f675d |     
  aarch64    |          rt-tests-1.9          | NOK | http://autobuild.buildroot.net/results/d9bbef10a55bcdbb4481b5aa429f3c9fbb1f23ff |     
   mipsel    |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/3115e5c18602c3c977dbae57f18c2b7fc651ec70 |     
  riscv64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/9146b9937535290bfee39dbcc147c42779c1cfc9 |     
    arc      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/4fc4ee1b6f63ef8172ac24d0a62d86f4b4dafbf5 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/d9bce5ee058efe919fbccecfadb63bb9f6d63297 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/2a2905c07dcb94ddde51ea82e8bad2a0cb05acd2 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/548f55ffcdf2480b54c784a5e44b36f34ecaaf39 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dd1cb3d923a95efc18ec0ccbe777e5e91a10fe28 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5aac14c5b74b238de4d512b7652f69c9403f09c3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dca26159e20aa994389a7d5cbd3058e4ff5acab9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c9bacfb52ae46ab78a5f9097a8df83e10d23ccc4 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/992b77fcb81fefe78984bb99049ecfa1b192d0bd |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d053cbcb8fa12fe55b7cb8c2617a46387b246511 |     
  aarch64    |        webkitgtk-2.30.2        | NOK | http://autobuild.buildroot.net/results/2f548362cda36a61254edebc38ce2427ae749f78 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/c6ed6cefbffb93debd62a1ae51dead61e80c94ca |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/a879c73d17367fdf97f9e293d7e72358a09b5ffa |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             fontconfig-2.13.1 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
              host-grpc-1.25.0 | 1 
                qt5base-5.12.8 | 1 
        qt5imageformats-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/feb5b7be86de4b5a3d05c0690d37f912b23d539f | ORPH
powerpc64le  | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/06d216af8bf6c534bba57cca50befce399132470 |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/605a7e9911fac8785272d0ffdabdde9c8876daa5 |     
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/33d6598043ecf1eb410fff3ff146875a8c6bd32c |     
  aarch64    |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/7292bbfea386d9edf2825b3cd0a12052ee128f8a |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 1 
                 libraw-0.20.2 | 1 
                rocksdb-6.10.1 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/42d1dfadd4f256a73bf74277ae9a016eb0f3fe5b | ORPH
   xtensa    |         libraw-0.20.2          | NOK | http://autobuild.buildroot.net/results/f3038152b252a4186619cfb62e3443d38293ad75 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/3f0d720a6e14dc5645f365d258774cb8e3334957 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/2b4231da194581928e59d5d767fe3b105fbc9be6 |     


Gitlab CI results for 2020-11-02
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824122132  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121716  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121717  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121718  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121771  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121758  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121759  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121760  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121761  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121762  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121881  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121893  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121719  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121720  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121721  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121722  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121712  | ORPH 
TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/824121713  | ORPH 



-- 
http://autobuild.buildroot.net
