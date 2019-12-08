From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 08 Dec 2019 07:17:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-07
Message-ID: <20191208071757.69F57203DD@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 22  |  1  |  0  | 23  |
  2019.08.x  | 20  |  6  |  0  | 26  |
    master   | 142 | 115 |  0  | 257 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 29
              alsa-utils-1.2.1 | 16
             lirc-tools-0.10.1 | 9 
                 uclibc-1.0.32 | 6 
                    strace-5.3 | 3 
              host-grpc-1.23.0 | 2 
               ibrcommon-1.0.1 | 2 
               libsigsegv-2.12 | 2 
                 libv4l-1.18.0 | 2 
                 mesa3d-19.2.7 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
   openvmtools-10.3.5-10430147 | 2 
                snort-2.9.14.1 | 2 
           uboot-tools-2019.10 | 2 
                    xen-4.12.1 | 2 
                 acsccid-1.1.7 | 1 
       alsamixergui-0.9.0rc2-1 | 1 
                apr-util-1.6.1 | 1 
                   dav1d-0.5.1 | 1 
    dovecot-pigeonhole-0.5.7.2 | 1 
                  gmpc-11.8.16 | 1 
                   grpc-1.23.0 | 1 
               host-flex-2.6.4 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
                host-go-1.13.4 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
          imagemagick-7.0.8-59 | 1 
              jpeg-turbo-2.0.3 | 1 
                librsync-2.2.1 | 1 
libuio-ca28ff0f69d89a789a47... | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
                     lxc-3.2.1 | 1 
make: *** wait: No child pr... | 1 
        matchbox-desktop-0.9.1 | 1 
                moarvm-2019.11 | 1 
          modem-manager-1.12.0 | 1 
               mongodb-r4.0.12 | 1 
                    mpv-0.29.1 | 1 
               protobuf-3.10.1 | 1 
     python-subprocess32-3.5.4 | 1 
                 ripgrep-0.8.1 | 1 
                 samba4-4.11.2 | 1 
           spidermonkey-60.5.2 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/8945bc3a213078ce1751d6245be041558f9807dd |     
 aarch64_be  |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/61611624357a356bd3c4d376ec8d42e1d269af1b |     
   mipsel    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/3f47dfc7e66fa3757093feb45d23d6d0c33bd42d |     
   nios2     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/fa1d71e73c96c122785efd53b0f84901c55e4ce8 |     
   x86_64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/61323d85192f4234ab28cab5e3b6f1b78cfaef71 |     
  aarch64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/c2b7a51dc818aa86fb225a36758e9457eeeeb33a |     
   x86_64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/1b76324fafac2aae4aa99a9e4314cd698f13cb23 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/53b1069e03cc08ccfae1475f74972c4389c29f20 |     
  riscv32    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/f66c7b68364b4336598d4d83680b85c246120a9c |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/9b9efae572ef349e621d2d32689435019daaa301 |     
  mips64el   |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/6b74fd66db67f2952082f5f8b1b53f23ca9dec24 |     
microblazeel |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/9545809155610be311f5f3f0ae7585c93c0516b1 |     
    m68k     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/0648b6c830082644727385560acaf24340334c13 |     
  powerpc    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/cab16f8ee5ca9789950057b8b08f85a29d801019 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/a01b7b562d9881dba89660af0b345f78d41782dd |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/ef58d5b618f715fe4b6159a789fb4014ceb23576 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/5c71a56c72d2b7a1612f1b3b8cb920d6ad668dad |     
    arc      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/23cbd626db851f7711f7ee00e230b407e8e5b66c | ORPH
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/e963502fe13a135740a712ff971ffb081c6728d6 |     
    m68k     |          dav1d-0.5.1           | NOK | http://autobuild.buildroot.net/results/17ef7053e0e33833137e4b892c5e14dd365277bf |     
    arm      |   dovecot-pigeonhole-0.5.7.2   | NOK | http://autobuild.buildroot.net/results/fdc8e7f9d2be93d8fdc7a6be02916bc99e3ce495 |     
   xtensa    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/6bc82e7d48ce5997dd814c434a743da4c072fe53 | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/709029d41cf12a505117333ff1d6c0c0345560b5 |     
    arm      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/d312b94d9c876cdd9d91ab4422287ee56aa47cfe | ORPH
    arm      | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/dd01c2d691c64d60c4aa1285deffa85d9ea8bee7 |     
  mips64el   |         host-go-1.13.4         | NOK | http://autobuild.buildroot.net/results/fdabdc1112009b82d637190fae4e78995e592d14 |     
microblazeel |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/fbcc356c264a9902b0ae33efa39559be443da922 |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/b8f10400191c978d9d2837f1b34f97a7a8cacf0f |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/ec26f487ca23e639dc3de3074bdcfdba454b4465 |     
    arc      |        ibrcommon-1.0.1         | NOK | http://autobuild.buildroot.net/results/225f19295c29ec7ee2143a5fada504c510565e62 | ORPH
  sparc64    |        ibrcommon-1.0.1         | NOK | http://autobuild.buildroot.net/results/9e0fc42d2c9f856b92954b08019b83ce668ef289 | ORPH
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/60803705cf7738292ebed6825f43879c59900693 | ORPH
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/52f45511247f8c365dd81b7b620f0dc9d8d57c45 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a1a2102f3fcf1665b7c92f214c5973f818ba5958 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/31dc5ccb7fc8a5c5750afc13b17551247451e4f2 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/007c1af2cd42e40f5f9f994f241a57fbaef7600a |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/32175e3473b1514c38e68cd29a67878a70172dd5 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9979057d85366580394838d290a460f89c460120 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/2439c9a8ba05d5a699d866b19bf02972a0967f7a |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0911b8516f037f661d4898cc19833606f68a4fbf |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/24ffcb9c5407fe999e5ef96f0e83a714e267bf8a |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b5b6f422c66e4e8b216c92027efd106b974a33a7 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/483560768e91b1000d83f0d654669889d97629e1 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/481569be4f4db40530718d3a6c9ae805085cc715 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0bb414be83ce36d1ba8431e1aedc5a88792cd487 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ed0efa01d049cb57e40d0cff648c5750c2ed6bc8 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/695e13d776fa7198293325328aa3100095590958 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/acd3e318fdaea579de782195465761c3f351e7a4 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7da76ca83704b75d55508eb357bfa79598767fa4 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6ac1c32e8547101d656b72bfecaecff574e40d51 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a1fb95b26a586ff025ed74f91756d74f502152ad |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d5794c7875195b862f7efe1626e851d31a0da5b3 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e81b1cdf0f2dd19513f4e5e3c7dc7bc0278d5616 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ef2643b903d2bcbd367f1c0caa6a029057b09420 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7cf120d455eb16f19067613deb38060cb5a791b4 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9645730b4aaac4acaf32ff2248acbf6b4ef01738 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/82ceb026ca9eab1f7c72f0e7a5fe2f6d0261655e |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a4fa95927dbd824ab5ee432934eceed7cbc17e90 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/562dc7d4e890a5aecaaf2525c32bf5f63ad0c701 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/dc5e8229a3aee170d173d50f5af766c857ad5ba1 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7ccf2a3f72cdbe58aae03beaa159a282b144be88 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e411f11afe22bf00946ccefc00548b9353df273b |     
    arm      |         librsync-2.2.1         | NOK | http://autobuild.buildroot.net/results/767e7c0b082a673146defb7298530ed58b4b526a |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/7df0ec07a5809a3852d79afc016d84f81b6d8b3f |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/ea48529ad2851c43470ac4d5b3916670dd5e0238 |     
    arm      | libuio-ca28ff0f69d89a789a47... | NOK | http://autobuild.buildroot.net/results/eb75a8fcb0b13d8ea68aef5b0c341f8acc158c9c |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/6b5c2adc0112e00dc39c16b9374ce5f57ddbf019 |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/4aab364ccddd9a0667e7c5baf6102ae6910bdb2e |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/f3ae345b37f65a26b8021da504be47c469392a62 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/490647a95353fad23d2425bca87bc7179d0f3964 |     
   x86_64    |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/0c4c8edfbe53f0d0f2a998d351f977639e818e6a |     
    i586     |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/f837bf9d8c5ecfc7d14140067addbef8f45c9deb |     
    arc      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/9c073c11a31278ac215b0e3bdb0e92508a305586 |     
    arc      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/7f385ba03345315f8699e324a919e6aa88261182 |     
    arc      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/0a8a86230f7cb467b83d715702701bce94d310d8 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/8779293cb1dd39daa19b531a679d48d1f73632f8 |     
    arc      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/28b02d167e5c2ad2f01f24940b29eccc1d500c06 |     
  aarch64    |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/ee91be5187cac612441b78cfc03baf86d7e6a741 |     
   x86_64    |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/f7a9c02add9bde563c7289f7c0be2cb7aefd96b8 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/8b7ff97db18b754fee1646de8983bd522c047a25 |     
  aarch64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/39ab0649e50969f745dff144ec4c14796fe95027 |     
    arm      |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/e80d0f1201a34499a6c5ff5cc84794373e6fd97a |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/d5adfef4d467400eedcd368a1ddc19e8e0f4792d |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/db1db604257f88a82df2c0cc0d0e7b8c45f9e006 |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/6fda5100ef0fc9b8bab3de5bd40f2d5da6b03ba6 |     
   x86_64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/2dde29deee6514d1327422789f8abee5c7732255 |     
    arm      |         moarvm-2019.11         | NOK | http://autobuild.buildroot.net/results/57fc70f56871807f6ba74f41c7a1be5be71b6b17 |     
    arm      |      modem-manager-1.12.0      | NOK | http://autobuild.buildroot.net/results/b91303710942f9845f608afed5ff665492e30077 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/ba4410334969724b3c17fc9e15210cae9b72e8c6 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/abb6d1876bf0e13750595c537e39223bb95e10fb |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0e49fd3c90af5b5259bcaf4ffbb6f842a427c5a3 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/161a8e40578ddc95f3b058f71409c9ff2e0f4a42 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/0a64ed9e82d7c3693baee689fddeccc0ccef480d |     
  riscv64    |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/dcf944129392ee6cacc106e096d8d3adfa4447bb |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/7f9342693cb272118ab60f9c47982f95a43c1590 |     
    arc      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/abd10126ed7180e22c06c85046e31012469f5ae4 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/29191bed7e264b3be7f936321523517a4bc28aa9 |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/7decb7626f303d989f751a780fe3b32d8366243d |     
  sparc64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/f4bb808b46b08dd471310ff78169f2b0de78a1dd |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/73ad294f985b262806a3481dcb4e12bfe15b8b46 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/b137f1d0e0cf717c9e9152eac803c9b57acb2305 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/25d121fa126a4d7b5169ed4d13570c62fbcb6311 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/971deeb596ceb379d822409ca4f474b3dc6ea744 | ORPH
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/e672ed0f0074388882d743d55e96c80e6a286d8a |     
    i586     |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/394b91abbc9834b24f20831a4615c2cf88e3b78a |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/444830675ff67dda98d1f35159e9201ae324ce13 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/dc1687dadc0fcb2e13e4989e0b93bcf5de013c0c |     
  powerpc    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/da727add9e09eca7b9e242eec85f5969d067d1eb |     
  powerpc    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/a2598230ef1d486efee222c047ed0f711e15e814 |     
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/9e487c4c361d740621e3b5e29a6a30b48e18c594 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/0f3902a627783f7dab322d5b79422b2e7189a03a |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/5172f55ca6ceeeb84115d0059fb3c3fd456b5caa |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/60cbaaed5e5ea66abbce9c5d35cd3b304e6cb0df |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/8b455774014c5b75d11d835d6f80bda339ec0b66 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/a17931afb4a60046065ec00e419b03bb153b8dc1 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              python-pyqt5-5.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/121f761449a73f1b8fd5ac531ef3ebb8321dfdba |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

            host-mfgtools-0.02 | 2 
                haproxy-1.9.13 | 1 
   openvmtools-10.3.5-10430147 | 1 
          shairport-sync-3.2.2 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         haproxy-1.9.13         | NOK | http://autobuild.buildroot.net/results/98dc935eda4fb4496b0cf877092db0f10ab765dc |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/cd183da2528e01bb1f7d169153bc0aaa79942b68 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/f1c0815f3582847fbbbcffd442115820545237ce |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0ad8d48e3af585a57782cfe0261b6a5062063cf0 |     
    arm      |      shairport-sync-3.2.2      | NOK | http://autobuild.buildroot.net/results/e2fe4fbc94b48aa96ec4b7d8e70e7ee83ca694e0 |     
    arc      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/fde7d9ed06e92b5227aa22a4cf06e824517653be |     



-- 
http://autobuild.buildroot.net
