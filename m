From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Feb 2021 07:43:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-13
Message-ID: <20210214074359.A82BD85B25@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  9  |  1  | 21  |
  2020.11.x  | 17  |  6  |  1  | 24  |
    master   | 140 | 79  |  0  | 219 |
     next    | 33  | 18  |  0  | 51  |

Classification of failures by reason for master
-----------------------------------------------

                    mpd-0.22.3 | 8 
                  dhcpcd-9.4.0 | 5 
        host-sentry-cli-1.57.0 | 5 
             libopenssl-1.1.1i | 5 
                  perl-gd-2.73 | 5 
                libselinux-3.1 | 4 
                       unknown | 4 
          libmicrohttpd-0.9.72 | 3 
                libshout-2.4.5 | 3 
                openblas-0.3.9 | 3 
                rocksdb-6.13.3 | 3 
              asterisk-16.14.1 | 2 
                    orc-0.4.32 | 2 
                   perl-5.32.1 | 2 
                 pixman-0.40.0 | 2 
                  zeromq-4.3.4 | 2 
         coremark-pro-1.1.2743 | 1 
                coreutils-8.32 | 1 
       docker-containerd-1.4.3 | 1 
                elfutils-0.181 | 1 
             gdk-pixbuf-2.42.2 | 1 
                 gerbera-1.6.4 | 1 
  gobject-introspection-1.64.1 | 1 
             kismet-2020-12-R3 | 1 
             libgpg-error-1.41 | 1 
            lttng-tools-2.12.1 | 1 
                 mesa3d-20.3.4 | 1 
              micropython-1.13 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
                pipewire-0.2.7 | 1 
                 python3-3.9.1 | 1 
         s6-linux-init-1.0.3.1 | 1 
sox-7524160b29a476f7e87bc14... | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
             util-linux-2.36.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/178b6a131e928f91568c0efc83971fc835623e78 |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/1fbc3efc4466b9358fff8ae67b9afd2408738546 |     
   mipsel    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/78064b3f1d14f50c2816a1578fa50d4ca3f22701 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/88619c2ba02ef85ac030a9a9a3a1d5b8368892af | ORPH
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/85bdc8e2a10c15c13fbc29646b938dcde9e89692 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/e37551cf1d95c0390c362e5846b86f410944adc0 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/21f219c2dce9235ff31d139a2e35caf7d5047ff4 |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/cc43c17c530b7c6f58ce7ba6d15d4edfbf4d4a46 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/bc55b3984ea9bf968a1e2491998226c59dd718d4 |     
    i586     |    docker-containerd-1.4.3     | NOK | http://autobuild.buildroot.net/results/b0edc076fb348951c629420bb6d69f424b9b0959 |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/5ad19a0c531a8add524a3a81eb9f926a7e9ad159 | ORPH
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/5bfbcb2c5f44c23636efc8826c93e616e4bd9567 | ORPH
  powerpc    |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/068f95a238cbce6f21a10041d286e6d97ac2164b |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/db2cc5a4bccf634f86bbcc11db34e6bd391fc2ce | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c744308685032e87dc22f555a3efc47f225e67d7 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aa5319b20e2e8e529c57d99cb314a32f9e874d41 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/52d969be95bf68c8cb2b516cc4d7ae586fadb8c4 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0c9f902be1951dd3c4ba4df9b266c01db5a957fd |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a2269c2b1c1b00cd343c85b9b683d8aaf143d096 |     
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/0b0072551c1f8ba49695bd21b4f2323cf031e7e2 | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/3c43257d88a10dd8e37cd06e239f8ae40253195e | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/f9e079f6c1f2cf2028431a4fcf79fb1e3f91f016 |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/d71b3397afae89f85ff93d496c695c97b5385106 |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/a686a9e73973c26d598b0107af88eb85befad973 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/58983fb97638bbbf78da8f17dc2a3865a6461571 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/acf6859524cf6242e6ad6b92f2dc7e4d7cf30275 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/d764b2ce1d7148520c204c1213fa0fab9f9903f8 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/e5c82fa8d9ac85b99eeb98cda3870c07cdfb1ab2 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/53a4c7e256c16f0075f8d31b8e13b00d3db0929e |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/1ff0d6e38b224e4f950606087af3fface50001cd |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/010331f1f9fdb37b2652109f248395cc2f36e5b8 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/4b16adf82d4a0de243f5f45765e152fd10e990b4 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/eaf9bea8cb8363653acecb9dd246e40e73941b11 |     
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/843b9d835a4e264c372855aefbdbefbb0c6a0331 | ORPH
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/0a3ef39e5c51c2b1cd8588b96c2c44ea971cdbed | ORPH
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/9c8fe5acc46ac82df566d6b803d5b1da0913bc8f | ORPH
  riscv32    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/34bbbe912f14c0558567029f66bf40bbee302d52 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/869f4b50051980ecdc1f655cc9b0afa552a6d363 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/92b684c603db7fe17411de7690c158cd9b60a1c8 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/13232063623340f33ad9afdff0d483f8a1a40364 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f3d9c84b1540cb87a49f313db88331066e8fd8e1 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/61acebe75b92a6be79b043c8b4b63911d143274e |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d6a3e62d8c2458478bcdea33bc57d9ecfbe59503 |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/5403434532b82435a10cf1d6a607b550a0694f00 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/cc65efdbad3b7e7df33b949eeb964c02d9a3ee75 |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/3f9dc75b8cb82c473f7d94fa169dbb7174d615e2 |     
   s390x     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/061acd65982405630dc722556b77df6fa403ca17 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/0bd457921515e40957c04f850be1d634c2e109df |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/edd07095b99099e4872c12210dcc94c11183cef6 |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/e4f4edde1f45a384114acc4ce8664323bc94c7ec | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/1894650b27d97b18db17a1855b74c0119709493c | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/dc566ac2d93f76f47868ff7b5374b3d14aa93440 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/27c8eeaa2e27426954c30a1271446ee4a5bcbb1c |     
powerpc64le  |           orc-0.4.32           | NOK | http://autobuild.buildroot.net/results/cd8110c706faa58f0788b968055661673df8652a | ORPH
powerpc64le  |           orc-0.4.32           | NOK | http://autobuild.buildroot.net/results/0e256d73301ac65fbd38b34e59fd0063e9baea76 | ORPH
   xtensa    |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/93b203fb8330af3568c83d1d79c47f77f5a4e4c9 |     
    or1k     |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/321fdb65d43c7937053693f74c14b8e33e778d61 |     
   mipsel    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/94217693f73eb4d0ade9f7e9a3f4fb320d4a9f43 |     
   mipsel    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/f7d959d7a5811f08a6b36f81b8b94db28b436709 |     
 aarch64_be  |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/8a309d29dc14592e5bac3345296d9b8bd6b6734f |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/a8bb8e8aca5284d18c988913c483e319ba6cd525 |     
 powerpc64   |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/f01d5877f454aa0371d926279ccd161ce06edafc |     
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/1aa844c0a843615555f1dfbd00ea1216ce7b3bbb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f1e282187ab77a611679a76be6372288dc326cb6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ee46de16d7a81eb1a7256ae516ac6f26109756fc |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/9df3913973e43600f10ffbfbe0219bb16cdf783d |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/05e5fff164862b8aae522297bfa76b9acd5e2d85 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/681752f10e2e6b2b1c5b6ac9cb47ec2587c5276c |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/b84fe88b51c87ef4b1523231d2e98c017852e7c0 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/66b7f44948ff3be1de9f34a3b6628a6be3ecc5e9 |     
    arm      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/0f3654585105aaf020e3145b33ffa267574d4ac1 | ORPH
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/45e58bf5d39e226d40c7c80aa011000abed3484e |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f9f065b42f5a79cfc729496482408e4af1fae284 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/9ddb3c6d515e973bc0e067458cf7957680a61870 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/df7da96bc0b83391bdbac4b7ceafa0515e51cf6b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/5bb959d2556e80db1e983bb551ddb4b47eef370e |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/19edb8cbc82517907f6af31f7b1c3dbdd7c1f865 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3542f60676f4f93a358eb2abf6a033e985cd1ff3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/182a5153d2898bc1c848571ed7dc869ef519e330 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

sox-7524160b29a476f7e87bc14... | 3 
                  connman-1.38 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                pipewire-0.2.7 | 1 
                 rocksdb-6.6.4 | 1 
              spandsp-20180108 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/64e8f677abf44bbefe3b9f5516a730983fb75bd7 |     
  riscv64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/343838d6de1a166c3da7c1017d364597ddad76c9 |     
   sparc     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c6518213e34879ca230f2eff57780078ccba16a1 |     
   x86_64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/6f86f14d82f57bd3ad3ca11f7594678f363be19c |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a22d473607c78237e4d05e694232c260dd9450bd |     
   xtensa    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/50fdcb3cff40249c2656caf3eb627b2e68a76a87 | ORPH
   mipsel    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/9112214447d75414be702ce0c1dd2d4c49c5df4a | ORPH
 aarch64_be  | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/95249495a5760a581d02a6f11723270eb288944e | ORPH
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/15c9f09113991553d79b25e45512482e2df0c277 |     
   xtensa    |            unknown             | TIM | http://autobuild.buildroot.net/results/d5f210b36b463f052ec347495fc043be4e90789b |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

sox-7524160b29a476f7e87bc14... | 2 
                     host-mono | 1 
        host-sentry-cli-1.57.0 | 1 
            igd2-for-linux-2.0 | 1 
                    mpv-0.32.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/a2d289e182023eb94879033b4a06674a905388e0 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/726dfb69df1bec35070266e2590af252aee409ad |     
  riscv64    |       igd2-for-linux-2.0       | NOK | http://autobuild.buildroot.net/results/1c55a66e91580b444c13a980885e113e5deed981 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/082b061d64c973890067db773c0d133295a154f7 |     
  mips64el   | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/8185a765ba246f51e8b24b5bf2058b25b9b0c05c | ORPH
    arc      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/0d2cff80164b2c36cec66dc5ac9e7f64751dfadd | ORPH
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/cb8a84724c57b13cda7ec01220ecf4bb21afa75a |     


Classification of failures by reason for next
---------------------------------------------

        host-sentry-cli-1.57.0 | 2 
          libmicrohttpd-0.9.72 | 2 
             libopenssl-1.1.1i | 2 
              asterisk-16.14.1 | 1 
                 dc3dd-7.2.641 | 1 
          fuse-overlayfs-1.4.0 | 1 
                 libgeos-3.9.0 | 1 
                libselinux-3.1 | 1 
              micropython-1.13 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
                 openal-1.20.1 | 1 
                openblas-0.3.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
                   perl-5.32.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/c237ec61bb329013d50c755189a0ec7096df261a |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e5987727d8e1d175d7ec787d20160503ba373d61 | ORPH
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/fc27d5a41588c48c0acd18b26e3eeb8481b925ba |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5720ec441fb16acff2331f14772f30bb22b593fc |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/61a345327704b544a9f07cbdca8a4977ff59ea82 |     
microblazeel |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/dd5381a96ddbb8155466bef9684d62d659fe7f21 | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/090a3bea2f4e00589a62831aa079dcca705a2a83 |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/d937e965d5946efe172ce72a3eaa69d47e797ec7 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/c281d6667ee8ca2195b52ae0afbdacf928753f52 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/36b2e7f87b77747f8ac0bbfd4950409a9cec6ff4 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/51f942d9801fd518cd77f333d13f4278dbc962cf |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/6e751f7f006965b6f20cb1be7408048eaf6fe4fa |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/642c934d104e42e45ddaea127efbcfb4936520ea | ORPH
powerpc64le  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d32cac271d72363f3f79471473a56787d05b5c34 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/b8280c52634f43af1138a7cf6d49643a7c53b1ce |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/7ac0306999d1d2a334108e0f0a7a34077c68cca7 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/fe2ac425fd08924041e64963b7fb79c9cff32618 |     
    arc      |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/8495b8ac9237e38f412d5b5786e3a49c86e519ae |     



-- 
http://autobuild.buildroot.net
