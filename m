From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 07 Aug 2019 06:17:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-06
Message-ID: <20190807061729.ADBA386398@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 24  |  2  |  0  | 26  |
  2019.05.x  | 26  |  1  |  0  | 27  |
    master   | 191 | 95  |  1  | 287 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                  libssh-0.8.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libssh-0.8.7          | NOK | http://autobuild.buildroot.net/results/86c462b6a2f6195eee6fda2f0e8ae8d190569ef4 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 12
                     gpsd-3.19 | 10
                   mpd-0.21.11 | 10
                collectd-5.9.0 | 9 
                 libdrm-2.4.99 | 5 
                  cmocka-1.1.5 | 3 
                    dhcp-4.4.1 | 3 
                harfbuzz-2.5.3 | 3 
           host-harfbuzz-2.5.3 | 3 
           host-nodejs-10.15.3 | 3 
                      icu-64-2 | 3 
           python-numpy-1.16.4 | 3 
                       unknown | 3 
               libsigsegv-2.12 | 2 
             micropython-1.9.4 | 2 
               mosquitto-1.6.4 | 2 
                 python3-3.7.4 | 2 
       directfb-examples-1.7.0 | 1 
                  flashrom-1.1 | 1 
                gnuchess-6.2.5 | 1 
      gst1-plugins-base-1.16.0 | 1 
host-c-capnproto-9053ebe6ee... | 1 
               libupnpp-0.17.1 | 1 
                       lmbench | 1 
                     mdadm-4.1 | 1 
          mediastreamer-2.14.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pcmanfm-1.3.0 | 1 
           qt5serialbus-5.12.4 | 1 
                  rygel-0.36.2 | 1 
                    strace-5.0 | 1 
                   systemd-241 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    wampcc-1.6 | 1 
         xlib_libxkbfile-1.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/b72ac1aa16eeb3ecee5381494e52c00f35f8f122 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/7f31d2ce48426c45a56d7d311d6a6fc7d4384041 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/4e175c65286cc18f9635389b9f2dda98887b7d34 |     
  aarch64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/f6da56278329fa14572629a0e3548888b6ff148e | ORPH
  mips64el   |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/41beb2bdb78c90ce5572f6a2ee6458b954b33770 | ORPH
   mipsel    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/d62e6443c5ee5cb61d221cb8e64a2f03c04d81fc | ORPH
  riscv64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/c56de67f36e8a5144a11459ad576d832fe387bcb | ORPH
    arc      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/2d03c95fb7b056d6f0f389c02d7debff1c5d887e | ORPH
microblazeel |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/6d7ac28f154f83208f949c62d28411855f1817f8 | ORPH
    arm      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/e10e94460865f61cbc9a1c3250519465ca490f5f | ORPH
  riscv64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/4c143cea967cfd35a368a8db6bf26e0e6b6ac41c | ORPH
  aarch64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/f582edb7120f1145b5149ed0633a84f0ac520fe1 | ORPH
    arm      |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/3bfa39cb4e948920251b8329508d5adfa603aed5 | ORPH
   x86_64    |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/be32179a645d4fa4af3fd6d19a6170e8a42f0424 | ORPH
   nios2     |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/77862a3c336b3f882f0c422f6c707ad6a022062f | ORPH
   mipsel    |    directfb-examples-1.7.0     | NOK | http://autobuild.buildroot.net/results/2ed761f3b52956422be3dd8457844c9b72f2248c | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/b158602eb1c60f9c9765088e6696d0d2f9a9adce |     
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/d96ccdffff9cc61f1ff0b11b01705515dbe10713 | ORPH
 powerpc64   |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/8f555a86a8235853b0e088df8274b51045ebf224 |     
    arc      |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/5e16a6580fba9e22058bf0e9622c228373971879 |     
microblazeel |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/548feca26438c7043e7439b0435ac4c4b0560591 |     
  riscv64    |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/78d7d5479ef6336ebffeb4d1a996c98157b0ef7c |     
    mips     |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/839a6db07e23ce56e5e75208e93faf112e54c722 |     
   mipsel    |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/44639b8fe407bee30ac96ab54b8037439f3dac88 |     
   nios2     |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/b7567131392e09cf9442e56c4ad185b9b1ca2ac3 |     
   x86_64    |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/86208a1d0d997c2c69402fbe25980299a22b547f |     
  aarch64    |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/2d6618833a612e74c4b2fa4fb4de6286e07be14a |     
  riscv64    |           gpsd-3.19            | NOK | http://autobuild.buildroot.net/results/71d118329c9381ed4836b42e95198d9aec9def22 |     
    arm      |    gst1-plugins-base-1.16.0    | NOK | http://autobuild.buildroot.net/results/870da241461c2a6a1c4daba118d43e1198277ae7 |     
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/35bffa6dc546e35f0f6fb70d1c2418de704036c8 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/f22e76525cd8cf1f2c22eb3364b0a951a39c2874 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/b0dcda3865a4cfe1c638ddb1752a37e2b338ab75 | ORPH
    arm      | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/80db0b691949569604f9c4314116932d13ff611c |     
  riscv64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/64e84cad985749c571fd8ec6022071154db7512f | ORPH
    mips     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/364409fb1014220047e68e2f763b53c6069bfea6 | ORPH
powerpc64le  |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/46546d28485f8812ad5352c7a60c2a30b8c7d027 | ORPH
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/6cdbe39d96dd3fa55e2c79bebbb684881b0f91af |     
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/e183a655b851cf97caa3fad9211df90e78ea630a |     
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/2ce9b0d03ea4f4f59ee4205d29c704048d3911ef |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7d4512fbe9475ab9030b4911664b6b1491877207 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/90974584de1567871dfb4cf4d9696158b0a9b46a | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/298cfa0b13b68020211af9842f0c381685ae8f70 | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c9d26cffeb185e7d67236ee032a13c527536c42d |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e0a746915fb512ee963e1864c4294cc1bf206091 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/3a444b42599b0782325153815d33724ece4c6e52 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/770e6594068c389a5cb7bd83260d82adf18362b9 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a71fd30cbcff57f0702db065019ed9d7fa5919fb |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/783578b89fb3208515436ab36a1de162907228e4 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/ab4c5824ba0c99e9e53dbd470464e5865c5fedfb |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/a3b5e66fbd2b35df635ca8e88db5842f051d58af |     
  riscv32    |            lmbench             | TIM | http://autobuild.buildroot.net/results/b1561e4d5fc5c655895eb84cbed57bbeb44b36e3 |     
  riscv64    |           mdadm-4.1            | NOK | http://autobuild.buildroot.net/results/37d6b351f989ceaf1acf0fe0b3b9be6d1c5c300e | ORPH
   sparc     |      mediastreamer-2.14.0      | NOK | http://autobuild.buildroot.net/results/7cc12896f7ed7623ec4b3c78f59ee19fba3d81b6 | ORPH
    arm      |       micropython-1.9.4        | NOK | http://autobuild.buildroot.net/results/be956c1b8d942c701769baa5b0b25f4b009ac41c |     
    arm      |       micropython-1.9.4        | NOK | http://autobuild.buildroot.net/results/318a29a33b93be9dc84cdf44c20229c609bcbc0b |     
    arm      |        mosquitto-1.6.4         | NOK | http://autobuild.buildroot.net/results/169df441e0acca5db87f59c86c9c298189010778 |     
    m68k     |        mosquitto-1.6.4         | NOK | http://autobuild.buildroot.net/results/0a25229241aa20b98747d9abe8b1363033126e9e |     
powerpc64le  |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/6a0adfaddd5ee088c4ba23674a6e0c5305f55bbe |     
  aarch64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/4bdd2a5c1139b40d2a58f17e5000c91883ff96f6 |     
    arc      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/25cadecd2678ee844e99593e3c377bbd7982458d |     
    arm      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/bab8b633d7ecb2d943ad77659c08a69f0115c5f1 |     
  aarch64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/c0e85bed72c5f3a31576ac782ee79e1f06e51ead |     
  aarch64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/ec19d54e99a65e7ff9796c289a32112a7d64438d |     
  riscv64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/143bc3a70faed530a7bb79a2554382ebf102000b |     
  riscv64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/bea73f76ce8056411499cf5c7daf70a26e182226 |     
  riscv64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/dd5083bacd4fc00f0a1b9d47569943434cc5a5ec |     
    i686     |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/8c41ddd812a5f080eb7f2f284ca4f4ea3c6f2ff7 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d3b486f2d98087db5e97f6433f93b4c1aaf5ff42 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a43e200ace278a58aa0efa32d897485471a9f17e |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b53b93706ac46a6539581e627cc491b17014f822 |     
 powerpc64   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/8bb55949d1bbbfac0c972bb6d3151d1c311aa73b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c829f028b419e9b4d2a71729f5e8386b6fd26122 |     
   x86_64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6b137a23dacf1b6faac37b8f35cbfc136538bb36 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b8197ee871e4a69edadb4d44c9632537553060c0 |     
  sparc64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4f28f03ee36f53e3922dd1d630c6b77af1b4155d |     
powerpc64le  |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/13275a2fe5211dd270f9b6f9341253094016275a |     
    i686     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3bab6a2ba42a5febd986e4e717784d6b9b97537a |     
    arc      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/85ffc19c1f7c9a623ea5d1a20667cb60f2c7b333 |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/417f30ccb074934112285d013054ca325bfa11b0 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f8a063137ae19d72c2f77b23e126c19e2b1a90a5 |     
    arm      |         pcmanfm-1.3.0          | NOK | http://autobuild.buildroot.net/results/f6dfad52aa7f3528472a33a0fe4f5e35932541d8 |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/f3ec2a991e455b1c731729db263ed3444718ffdb |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/8ba4ed23b1a328be355fe844f95b7095407f18b1 |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/2a264d1efe8338ee0990d9a8926f4c0de527cb3c |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/736f62c973c7a01a4cf7b9db97d1e7c43b287686 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/64d3ba50d2beed4a1b6dc54cc80f68c61b45641c |     
    arm      |      qt5serialbus-5.12.4       | NOK | http://autobuild.buildroot.net/results/ddb0952f6d23183aa5fbce33a40909e27d27bf37 |     
    sh4      |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/1aea53bedb9620a0881e5d4ea76820d49df2f2d8 |     
  riscv64    |           strace-5.0           | NOK | http://autobuild.buildroot.net/results/6327f45b4c910efa5cb6c27cfb24f07c77e8aa08 |     
 powerpc64   |          systemd-241           | NOK | http://autobuild.buildroot.net/results/3505730741a854d2183730ab9b30097668ea7b41 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/5ee3806646a088ba09f54c923cdc7d7677ef983c |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/7208afd4cc35e570ed60d61d86e43630dc42c551 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/77348c39b99fdc40eec8a080b2c7946200c0aff1 |     
   x86_64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/1677c80a8b48a4af77a3ff60e4ed19c34eb0a393 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/8065f928426a22b52298aed8633f5bb1ecfb3af2 |     
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/e638d6fdb60ad6ebc2d06aed0d4263a9285550cd |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   mimic-1.1.0 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/0d04c880e7b4df56786e37a8f98b20e71b519573 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/cc7e733df195c1d898937c81664e554f965350b0 |     


-- 
http://autobuild.buildroot.net
