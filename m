From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 05 Jul 2020 06:01:13 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-07-04
Message-ID: <20200705060119.9903B86CC5@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-07-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  3  |  0  | 21  |
  2020.05.x  | 11  |  3  |  0  | 14  |
    master   | 106 | 99  |  0  | 205 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.14 | 39
          fuse-overlayfs-1.1.2 | 12
                     avahi-0.8 | 4 
                qt5base-5.15.0 | 4 
              tinydtls-0.9-rc1 | 4 
               apcupsd-3.14.14 | 3 
             kismet-2016-07-R1 | 3 
                  assimp-5.0.1 | 2 
           cups-filters-1.27.5 | 2 
               domoticz-2020.1 | 2 
              host-grpc-1.25.0 | 2 
libcamera-96fab38e02792a109... | 2 
                  ndisc6-1.0.4 | 2 
                  rygel-0.38.3 | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                  boost-1.73.0 | 1 
                   eigen-3.3.7 | 1 
             freeswitch-1.10.3 | 1 
  gobject-introspection-1.64.1 | 1 
               host-go-1.13.12 | 1 
             host-pango-1.44.6 | 1 
                   i2pd-2.32.1 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                 mesa3d-20.1.2 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
pistache-73f248acd6db4c53e6... | 1 
       shadowsocks-libev-3.3.3 | 1 
                    squid-4.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9f6146f2b6a4670740868b3c3f453c5cd1abf8ea |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7fd2195b03140e951bb80376acd0a5595d744db7 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/764f02371ea4c91cb2f889716931056532e15302 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/277cc014920257495962ababcb469f149057400e |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/81bae568107b2e24c4387fd7720c9424a7baa08d |     
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a7d70b2e751f09ccb2337888533da5c311b635cf | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/0fb51497a37f0a6af150e96ae59d270807d47b2d | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e39c4fb322b0b41dc92ad878ba1bcd48e392e8e4 | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/63d55d77b0a842a23ad3e2b354396f55f4b61c79 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/9715698e1019d66a67c254d471d2b30731d2991b |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/5376cf86463c91d3470041b1b55b3a9c83e64de7 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/f13acd7e8dc41d8d2950231b65f4914f61628aa2 |     
    arc      |      cups-filters-1.27.5       | NOK | http://autobuild.buildroot.net/results/854a4de5a0c4fd26f2517bcfeb69fcf51d77fac1 |     
    arm      |      cups-filters-1.27.5       | NOK | http://autobuild.buildroot.net/results/59d0ac9cca898d8360de1134a144753ed5427cca |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/45ed96f6b1faac68235f3ac9868c12cec8fe67de |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/ec183d04295004d42b061479f62ee8a8e5e5c771 |     
    m68k     |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/cd2d2287f9b5f733d768dd355330112c5d1ff180 |     
   x86_64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/93a1ca29f6905da8781ad0e477c420e8f4e3b7f9 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/3a4a40186f42a05450718d9a0eae7e0e07aa46e8 |     
microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/25024a0e890f8d9ef33993fca4de925fad12e8b1 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/4283245d135693e9dc03814eb85e707be0af30b2 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/f921d9848b6b76cb493ff71fc2245241c08d9ee6 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/7db2c4e49c15ef4aa27b8ad2cbd24b1afa2c0c95 |     
    m68k     |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/8469753e3730492ff95a35db060cd3767d2d60bd |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/42f36b9c34cdc551a206b1fd6e20c269e51df382 |     
    arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/9744ac93e5d4f144bfebdd6cee6ebe93d0b91d5a |     
    arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/bdc0473a8bd729b73dc4c306eead77cfb052bf58 |     
microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/e0087ddff521a6a38857fc449c7911375a90f4a2 |     
  powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/f0ce7e790d601eaf3ac193c799b8a1558e1eb6ca |     
   sparc     |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/05d9cf3e7dcaa7f86b209fb541cabf329f1a2a32 |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/3cbb741965c86de91c82285eacf99103579c9e37 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/099874bdc94fb47a371d3b13413644e4e66c79f2 |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/58b0e8c76db185fc9e0b4e3a28299283ef33f66f |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/612b959b2b95b1aab7314a037ac30a486ce15bb0 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/63a9d398a9522f958a53bfb01282cc81b788edc4 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/4c4fe385ea330a03cb09189cfe87119a7628dfb3 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/11097450968eda820e68a3043a7417925f9c6bd6 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/c241a54224f11d05d9add6841267595c39cc4b5b |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b3ca1eaa3654cfe7fee0efe9a62b2a9773ef314e |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8cf6aba712bd733c3448d4e02426a85944ec64d9 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a11318ba14a9f59c6c0b347dd9bf64906d6a6d0f |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/5bd42567dc652cfe62cd72fa22390db0838ee48c |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a1e7227fd6d2c9153a7ad7a1e5ab3a2f21be1386 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/d714ce43732921f88c0e7ed42e0d8cf07acdb7b8 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a8e9169374a2b1c94dce4ff4126ae848fbf0fa0b |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/e5aa0b7889db98424bc528874ceb936c90085d28 |     
   sparc     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/918bf61884d34448279d898099b4bdef6bf2107e |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/d63a750e46ac555e92ad2bb8fac8e05b004c7e89 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/3645d096d8e88165157cbec8de8cd82b702ec31a |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/28ecf0e65eb5c74dc0a27ab1411cef4ae40de847 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9a6f03ed7fdc836fe73c6106e64095f173f1642e |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/3283e8dff2368472e5c6e7fd56f84163b2db4d58 |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/301a1beb17e59dd6c616cda5a2b52c26b19a4c74 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/d9f8973b03aeb02cda5dfc6fa8bace3ec4cd15b6 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/7e5df030c7ae54548c1e66eddd0b6bc56ea2bc43 |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6f2c85fdadf2b5cf1461b564892c3784f4547ccd |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b5613065b9edb85832032ea035eef8f557db4c58 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/75ac1fef19a7dc790d31463c25ab79ad91148494 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/e5eafdbafd640bf65ac8c425663202282e470185 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ade2fc8a061160bbb86e430b263c6d7aef22c865 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/e7a89239dc28ffa89a042278e19993a25fe36fff |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/62aaa0b4dd1dee7d4f74fe73d7c5f3f4c3f15e04 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/fb769127c2429bdae651a91ddfa8c86e39ba9058 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/104e536d9823280840dcd302bd22452b74b54d44 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/30fb9d6d398b274c3a9dbca0263edbe5c8821a0e |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/27e34d3ee4ab3243308247531937669a9be473c8 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/a41629be17633449928e7937ce20fc5bb88447af |     
    or1k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8b602a0f8123d54136180356f41a212f78a4ea51 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/2bd0b9c7d0d342ba79aba80072d96dfb4868c913 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/031e3414004dec645f7cfb62f5e01c45bee60167 |     
  mips64el   |        host-go-1.13.12         | NOK | http://autobuild.buildroot.net/results/f7f4fbe0a0049bd8369901534553bb97e3d0b9c5 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d7c4e6423185dd5a0273e0c2cfef82e4dd6e2e3c |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bcceaa8e77bdeacf288f638bc90c0c99880817b5 |     
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/43f32af7496a3a7626560065ee9f86b0bf3a5cc1 | ORPH
   x86_64    |          i2pd-2.32.1           | NOK | http://autobuild.buildroot.net/results/bbaa3f189990d89fde9ccfd14ef71dff70989451 |     
   nios2     |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/7ce5e3cbac61b8c3756a6b44fa8cdf96a070b471 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/d38223a7e4b165ba2cf83a7769d0602c43e5900a | ORPH
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/7b33ea1eff8a761178a09332cbbbdd4d1cb21708 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/a609f8d7a8edb9f80b968a6fcd15b83d172fc208 | ORPH
    arc      | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/ad3f84dde180d42f0b9af6e850875f8db71ac25d |     
  mips64el   | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/8616b602986978774a882ec5d92a30d0e0de6164 |     
   nios2     |         mesa3d-20.1.2          | NOK | http://autobuild.buildroot.net/results/b3cb800c44f52ee4062e6a96c11e4586fa79ee87 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2523fad451df58df40778cb338517720eef5e4cf |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/462fe6b73ead1646072696f7d8641b08b0ece03b | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/198f0b34754403fa386a6708a94cdd59cedf64d8 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b505e56e15ff407701325f405dfb5f6bd488f1a5 |     
   nios2     | pistache-73f248acd6db4c53e6... | NOK | http://autobuild.buildroot.net/results/794d8a8468e6f4c615d28cfe7bdf7dcee180b399 | ORPH
 aarch64_be  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/45959af6b7a4a44a61579df56e75f804453f9aa6 |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/e23dab84d870482c92454b91a3b20d92f6ad91fd |     
 aarch64_be  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ddc17ca3f510ddf92666d9215a301e55a1efb23c |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/79f8a7782b9bf98150c323ffbc935631adc69cff |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/53bb4e9f33a33d84f1f60fcec265b9dc93649bab |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/58c5960e4e7eb85b5ce94031af6805077ec4f273 |     
    arm      |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/34121b12550fe3e205959488145ba5164febec08 |     
  mips64el   |           squid-4.11           | NOK | http://autobuild.buildroot.net/results/5399eaa1d2e5258cd32376e241e9b029aa2bb967 | ORPH
    or1k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c3143c4923bbf6000b404cc3a8e402e99cef3271 |     
  sparc64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2d19616cb19131714747c21be63fdcd249050b38 |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3b8408d21630625df52327d0394a1a1f67680140 |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a4ce9212d31f4311fc337fde6a082dfd8c07a375 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
               arcturus_ucls1012a |  https://gitlab.com/buildroot.org/buildroot/-/jobs/623441978  |      
                             ci20 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/623442052  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/623442204  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/623442257  |      
                     raspberrypi4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/623442260  |      
                  raspberrypi4_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/623442258  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/623442266  |      




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

       gst1-plugins-bad-1.16.2 | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/b250d774c2c5fd978dc1a3c2b9e1ab348f56632b |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/0f0692bd24d23d695e01b5634e648c135349ef31 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3a5c130bfc45cae42364f31a4a486e1969d9b7dc |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 1 
                    mpv-0.29.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b283fa793ea19beedc58a7a24f676ae28495adfa |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/44a9028edabc117a3dd6a2110790f00ad9bc4d1f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d8f6ea45006e98dbded534ebfcb1b069d70de597 |     



-- 
http://autobuild.buildroot.net
