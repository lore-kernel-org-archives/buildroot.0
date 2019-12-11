From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Dec 2019 07:18:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-10
Message-ID: <20191211071811.B1B2188489@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 26  |  5  |  0  | 31  |
  2019.08.x  | 17  |  4  |  0  | 21  |
    master   | 137 | 81  |  1  | 219 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 18
                 uclibc-1.0.32 | 6 
                  apitrace-9.0 | 4 
              host-grpc-1.25.0 | 4 
                   libnss-3.48 | 3 
                snort-2.9.14.1 | 3 
              alsa-utils-1.2.1 | 2 
       alsamixergui-0.9.0rc2-1 | 2 
                host-go-1.13.5 | 2 
        matchbox-desktop-0.9.1 | 2 
                  polkit-0.116 | 2 
                    strace-5.3 | 2 
toolchain-external-codesour... | 2 
                apr-util-1.6.1 | 1 
                  flashrom-1.1 | 1 
                    git-2.24.0 | 1 
                  gmpc-11.8.16 | 1 
google-breakpad-7515ab13768... | 1 
          gstreamer1-mm-1.10.0 | 1 
                     gzip-1.10 | 1 
                haproxy-2.0.10 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
         host-ti-cgt-pru-2.2.1 | 1 
          imagemagick-7.0.8-59 | 1 
            libsvg-cairo-0.1.6 | 1 
libuio-ca28ff0f69d89a789a47... | 1 
             lirc-tools-0.10.1 | 1 
lua-msgpack-native-41a91b99... | 1 
make: *** Waiting for unfin... | 1 
                         mimic | 1 
          modem-manager-1.12.0 | 1 
               mongodb-r4.0.12 | 1 
                  ndisc6-1.0.4 | 1 
                   ogre-1.12.0 | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.10.1 | 1 
                qt5base-5.12.5 | 1 
               qt5webkit-5.9.1 | 1 
                 samba4-4.11.2 | 1 
           uboot-tools-2019.10 | 1 
                       unknown | 1 
                 xvisor-0.2.11 | 1 
                       zip-3.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/981f0698112ae6aaa752d490ffbe4dfbcd3fb257 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/f407b397e29fbcae2757a9e6de2cc4904c2cfc03 |     
    arc      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/0977d567d75d9c490fdeb5ae809b7d59a313bcdd | ORPH
  mips64el   |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/6611580eee5ba33c3e32a162f55cdf243e005a86 | ORPH
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/fd0d004ec014fe218241749ff6846a0fdba890ee |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/8ffc36f00f87349a708471d6a4fdc6ecd687ca14 |     
  powerpc    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/c76e60cc2b4339e0ed327a05ee2fffe0996568fd |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/60825a1f36d5b7e338de6b263572d152905d66f2 |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/65fa6771af47a295e784915ebba412aec80392df |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/a668babd0f08635ba26d618f99daab7d0365f367 |     
   nios2     |           git-2.24.0           | NOK | http://autobuild.buildroot.net/results/8c3618461fd33edee00886fff8772e3d089b9b51 |     
    mips     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/200471355c658be9a6961cb4d99931684725b80c | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/30c3d403284b259fd291bcd463fe8f45c553f56b |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/7c190a7c8928df63e8945071f67de7712dce6b91 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/44b48bb243fa754bfa64e419d4a270fd806a05bc | ORPH
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/b01cc9de38fefd021d17f5b276ccb6f7da448f33 |     
microblazeel | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/83c6d47c06334bef27791a59bdd491b1de124c49 |     
    arm      |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/d5758db10739342bc322995a42c6504e842a1e5b |     
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/bd25ac6138dea26763b5f8fae7effa887a085302 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/07e4fa0ea4148e12030c92acc58b6fd144b45544 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8066b97d970d874e587a7bf043a385a11c8ca3f9 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e1bfdf0d268722980ce9955bb3028a529052a915 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/378dbde13eb2ce4cdfd9f18d99bd8d3056ccc45d |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/93dca2d929b79b8ce2fc7746e2ef1ff0099115d0 |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/439c929121e690907fc6b4cf2540073db19f6c8f | ORPH
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6144443ff14b41d97c1ca4d7a84a1cedf092da68 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a52756d24ea3ae73915d03c098d12e69ab59ecbc |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/824e1e062331b24d5224ee06d90c46198c80eb61 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/90cf1ff44784bce403ea3aef5a10ec303be4df64 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/503fabd65113cb093d97df7de91fefdca0f4057a |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0f9de116989dbfb7726c742e34db7573063f80a5 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/013160e4c350eae012da97ae74f4039ebcca13b4 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/2abd39e8951cc5bb1085365759b083bb2c4ebdb1 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/1d8416975185a1ce9441daf8c932d87225af0f4e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/4cf9908f2d377e87af5272af7a1e277ac51b063a |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/310377d1a7bd1edf8698b64ed28dc9b992fe3d1a |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0a81985144b98f0f9404780204847d777854be4a |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/1c600e909c1c79f46d85dedb9542e905455813c5 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7d0fd6fe0144fee83ef25209eee5a3bf6baa25c8 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8463cc8749b7300d6e4ede1e555774bf14d4033c |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6196332a770eda433c23b995d569ee820f1e2f22 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/c9018ae598be3ef1d3f0621005225922f4b877d8 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6357bac0f5c0b32c8fbb7edaf8af4a5cbc2b9f99 |     
   x86_64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/1251ab37dad3f36ea65b008747f9244963b8df78 |     
  riscv32    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/61001619905e7e35df3089bbfc157e0c745fdb54 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/da79d954cf4e67af931ec1e69672a51676701cbd |     
  sparc64    |       libsvg-cairo-0.1.6       | NOK | http://autobuild.buildroot.net/results/d4d996f3923699e266afd40cc7180de0f7257d99 |     
    m68k     | libuio-ca28ff0f69d89a789a47... | NOK | http://autobuild.buildroot.net/results/9be944e35090bf270fbc9572423466be9af7b1f2 |     
   x86_64    |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/33e4c641025a019c943f94375d2c38cd50a4cfa2 |     
    arm      | lua-msgpack-native-41a91b99... | NOK | http://autobuild.buildroot.net/results/4e428df01def186cb034a1774f6c00e2e7c9468c |     
  powerpc    | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/62e3d15606a173b49254bb95086a94dc424781a3 |     
    arc      |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/aa6b1b8f1e4e1878579b334da22b41e6376debcf |     
  aarch64    |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/b0810aa816892e792c87fd79d78e869d85cedad5 |     
  mips64el   |             mimic              | TIM | http://autobuild.buildroot.net/results/b581824fda17785da622e6eb6d7388f525f38d14 |     
    arm      |      modem-manager-1.12.0      | NOK | http://autobuild.buildroot.net/results/675296f511a532a9c3b9369653e8db9dc0982834 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/483056fecac8c7cd84f3421477779d7f7c16181b |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2bcd2a999a5b0fbad121059e89e27ad833383140 | ORPH
    mips     |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/8220d31ce30a90befdbc479476719692204dc216 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/5d87a7b76b0de587ddd9b299f3e9a04c4fb15ef7 |     
  mips64el   |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/c9084009e6db7a5e20547edc9e9ec6d4a3d0215f |     
    arm      |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/2407e47d09807ebb9360efad12fd522be7eebee5 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/488974666a2198e2b15e12e3e167b5d8451b5843 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/2efc76cf1ae1362720d20e4a8c63e641073887e5 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/a39c5253d5477401b39d4d1d621ff386b2b802f5 |     
    arc      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/40b5224de4fd1618f0da0b23ccfd07bc9a251eb6 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/ec7b3d13315c07f55a902c7a94972a46801a5e20 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/e27661d2fe005df44aaaa63de092f8a6c5f63307 |     
    mips     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/197b665f4a19aec516123022d5d574fa1f697731 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/4eda2e8f2e1135fa8bc702bfdb6da42d89369c39 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/533d59323b6e6a2432ab264ad4c0280e09cecd6b |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/b769a672b25d9f3773d01f9780a947ad4526d1e3 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/b3123f3771686453d6c5680556de9c13e67e09eb | ORPH
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/9dfb69906b9a18fdad871c57c56238b950f80749 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/4b4aef8f63e67bb4ca63046b84d110dd8a47e793 |     
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/fd1bcc58cc5ec4877b5c9d26949809edf48ef2c8 |     
  powerpc    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/2523f1c3d62da02a6ec5c34cdfb8d421c68457fc |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/61a703ce567e0b703909e30748190ad3d77bdae0 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/38a0a43a18feecbf76242ccafa11ab367c7e1dd3 |     
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/0a1467ac119db16fd13e7a4d0a96fb2cddc44cde |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/aad825d624fcee65c3c3fe81e9d2b4a820619f5a |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/fa6174a40133d780200450a4f221d8567667b8bf |     
    arm      |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/ca50946b2cb0fffc10f79f79510ba027d23061ec |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

host-google-breakpad-7515ab... | 1 
           host-libselinux-2.8 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.11.3 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/529e8e3ac6ba38f39519c23f877c874e8d9c290a |     
   nios2     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/de5ef8ba14dbf9c9dda5af366f9c901f2fe521a4 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/53124916701eef00a07d616803d96470d7f656ac |     
 aarch64_be  |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/f05dc709145488b9367fb37edf279baf7927bb48 |     
    i586     |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/55150d73afa094785610a78aed478f8caed3c758 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

host-google-breakpad-7515ab... | 1 
                      icu-64-2 | 1 
                snort-2.9.14.1 | 1 
                 uclibc-1.0.31 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/200c2d35afe45c7a12775bf3d73e1f78b2a557cf |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/a820cd1d285ecf452bfb4d2408c69b1a077a0867 | ORPH
   xtensa    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/14ad61e56dc9477347d275e7680ef96a7d913a3b |     
    arm      |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/6499be3f183054114a18969225807c856e11dade |     



-- 
http://autobuild.buildroot.net
