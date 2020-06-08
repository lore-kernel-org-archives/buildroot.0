From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 08 Jun 2020 06:27:19 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-07
Message-ID: <20200608062730.B036B87A4F@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  6  |  0  | 19  |
  2020.05.x  | 13  |  8  |  0  | 21  |
    master   | 152 | 71  |  0  | 223 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           host-wayland-1.18.0 | 8 
             freeswitch-1.10.3 | 7 
                qt5base-5.15.0 | 7 
                       unknown | 6 
                 mesa3d-20.1.0 | 4 
               apcupsd-3.14.14 | 2 
              bitcoin-0.19.0.1 | 2 
             c-periphery-2.2.1 | 2 
      dovecot-pigeonhole-0.5.9 | 2 
              host-grpc-1.25.0 | 2 
             kismet-2016-07-R1 | 2 
               pulseview-0.4.1 | 2 
                 samba4-4.11.9 | 2 
               apparmor-2.13.4 | 1 
                  assimp-5.0.1 | 1 
               belle-sip-4.3.1 | 1 
                 granite-0.4.1 | 1 
           host-nodejs-12.18.0 | 1 
             host-pango-1.44.6 | 1 
              ibm-sw-tpm2-1563 | 1 
               libtheora-1.1.1 | 1 
                    mpv-0.29.1 | 1 
                nftables-0.9.4 | 1 
                 openal-1.19.1 | 1 
                openblas-0.3.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.14.2 | 1 
                     qwt-6.1.4 | 1 
                ramspeed-2.6.0 | 1 
                 rocksdb-6.6.4 | 1 
                  rygel-0.38.3 | 1 
                thermald-1.9.1 | 1 
                  umtprd-1.3.6 | 1 
                wayland-1.18.0 | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7e5de2901ca1343e19407944a20a63df7e19372e |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/67b004d87b27d413a4abef71aec6d79fa0c4e336 |     
 aarch64_be  |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/3080e620b033eed800640a6f71b2bab48564c2e0 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4bdaaf76c8848c61e1e9da783a2af712098f22f2 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/4044e120cf9a9353849867bf2adf968d950af282 |     
   sparc     |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/986cd1172b513d30b5e414a1780225aa760f9bb8 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/dd9cb40e46ef453946bef13dd5d78c03a40363f2 |     
    arm      |       c-periphery-2.2.1        | NOK | http://autobuild.buildroot.net/results/0822d015c68e23565fa02fff5e96a2695cf937bb |     
    arm      |       c-periphery-2.2.1        | NOK | http://autobuild.buildroot.net/results/37a3afdaeca077ca5a2ab4dbe515c61ea1922c18 |     
  powerpc    |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/db775d7bf2b2a607a166075cb5fa793508650aca |     
    i686     |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/f5b20ee30870049f10e7114858e583b927240e20 |     
    i686     |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/47228a5d73d64b88241216c66d6aa6f6de424c97 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/83df78b8f0578493efc30af5c1c044dbe6c4d9b2 |     
    arc      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/e092ed2c7830f11cea7636f61a19fc675a52d51a |     
   x86_64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/64578180c022ae4547ad7ae11bfdcce55e16e6c6 |     
microblazeel |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/aaa9e047225935060e35c6306bbbb23879c657bc |     
powerpc64le  |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/7d39c31ecc55fa9c22b55611ab65c1ff1318f445 |     
   mipsel    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/a624f955b5ca3ef758483fef3a307fd40aac1cb8 |     
    arc      |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/544b5aa48d8da1c237589ed74dab7b3566e358bd | ORPH
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2fbb528067f1385505de46891294b2965857c608 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e0123329eb79823ff8a8ab935fafe5e633086340 |     
    arm      |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/04e99a09b62c961954bea5160416f0f6d9cdfe9e |     
  riscv64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/530739ed9556d73af4b88597ee85f68ba06b3fa7 | ORPH
    arm      |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/5946dde7d6781d5fac12b3eb0d74799490dfac96 |     
  aarch64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/92eda7de07e1398c195df62640ebf23f86e7bfdd |     
    arc      |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/498a05c940c12218ff0ff83cc24f627b6f0ab976 |     
  powerpc    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/d5abbd52613f49f7475886ce49c517422c82dd6c |     
   x86_64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/22a0700ed5ebb3f67a264e216f534cd7cc5dd1a6 |     
   mipsel    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/09c0fb9b12a401e6bf9cdfe3c8935e9f769e6bea |     
  mips64el   |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/f3af97ad46830568ee3ad710fe45329f7626c27b |     
   mipsel    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/efe1f1925c53830ddc4115f95ffe8bf0e84c21d4 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1e84ebd92f6e5f89934397be6ccf3c4ef30c4248 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/379eec10849ddb79a4ae7b7af1f3eef5d207ea71 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/822b6cf657c396a24bc4f0703df144f74d67b5d3 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/cff77454cfe587eb578de23af832c6200e99bd91 | ORPH
    arm      |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/980d0c33e2a7903d9426af8d9d243b250018ac34 |     
  powerpc    |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/a87e4d5fe5683d68ace35dda588856e20d6c108b |     
    arm      |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/23011209e4a0e40c26758e98f0239dbe3fd1a71a |     
    arm      |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/eec39a4fbfbfaa58980fab36f2fd902a16eecf0f |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/bb7ff8eca81f3e36b56ef36beea246f3457138af |     
    arm      |         nftables-0.9.4         | NOK | http://autobuild.buildroot.net/results/cf2359b8311fe91f9335c91f2bb4a730c9f4c9dc |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/34b9128460ce84d2cce838f74dc71e8e98b407a7 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/457e359ffd336a954bd4c386561698a7cb3cca33 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/bbe02b1784a6ec57137819254559ed15d7d985ef |     
  mips64el   |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/671170c6f930571da31d33ad1799bfa73275410e |     
   nios2     |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/475e029200b44c724debc334f64506eb4f520f8d |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/117c7f63e25b64db79aff264a067c9a3f6dee5b2 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/aab690ee29daa7715ff807c9fd2b2f795656e7a4 |     
  riscv32    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/cd064ec4e8ea906550924481a9ccd3edd869770b |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/064ed55d6912592d3304789d74b394ec7a24d177 |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f37a1e741a73389967e9be6b85eefb9224a67b24 |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/8aac4e569f48f00b5f5e9c657c5d9bcffeac8ec6 |     
  riscv32    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/cba25efd6fc52fcdc2d9bd7aa1819bfe140cb72c |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/cf8295cc9fda970fc5cfc715f2693d8c30f55563 |     
  mips64el   |           qwt-6.1.4            | NOK | http://autobuild.buildroot.net/results/e8aafa2a1a5fa4e207d2e8bb8c9570789a8ccaa7 | ORPH
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/53ec60e8fa37e9dcc611ae768c5f0cbd061f88a3 | ORPH
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e4d1abca77000a2b13b38aaa89e06d934084f39b |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/99f28eb02275a8a69c2e022f51e3c3d7b3b0842e |     
  mips64el   |         samba4-4.11.9          | NOK | http://autobuild.buildroot.net/results/d2382510f088e28becebd2f48ae7d36031bdee74 |     
  mips64el   |         samba4-4.11.9          | NOK | http://autobuild.buildroot.net/results/55b75ff995057efce0bb33e56679739568eefb16 |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/2f3c21f505b5032467ffaeb1cbf5a46b4d6e7028 |     
  riscv64    |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/030d17f1751fe24c0c732254602076853a2713ec |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/f3a0aca02e7eb16d9af6603ca0a853db9ec94342 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/99bf2a05d878130629ae9eee600e4e4ca2942a49 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/79937b1bccb234772290414e867ee4f8b8734cea |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a4e8f47c5e0016f4d7ba923bd0e188c736a0011a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b835684cd7ac9ebdadfe963069b6be4a0adbe9af |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/797011e5c1c05055d5369e7ce2274ca980c97209 |     
microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/5f00368f6d4d6f77172e3119eeb74fe8f77a1c09 |     
   x86_64    | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/fc6e7e46472b9a70341b046d50a11473c006d9f9 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c795714eb2093494e6d970e2570f352c188822ce |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               acpica-20191018 | 1 
                 augeas-1.12.0 | 1 
              host-grpc-1.25.0 | 1 
             libopenssl-1.1.1g | 1 
                 mesa3d-19.3.4 | 1 
                suricata-4.1.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/79386092f72d1cafe172d974b4530edac8c1b0eb |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/d6910e609c386baaf3f159cd57d5f6d866fe9d50 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/13867d2ba531e15c1b0ca71c3bcffad41cb2381e |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/f9aecb0c6d4dd705e4b0f2ef6b3c8969e1745b0d |     
  powerpc    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/0336517db2bca642239a590a60911d6247353c05 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/3357e78ea311cc81240000aa9613347435cfd799 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                     avahi-0.8 | 1 
               collectd-5.11.0 | 1 
                 mesa3d-20.0.7 | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.14.2 | 1 
       shadowsocks-libev-3.3.3 | 1 
                       unknown | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fcf79a326d11937571c5f579a4465dbf4291981e | ORPH
    i586     |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/69e495f9189bc04c5361e2588f2ef4e68b3461a5 |     
  powerpc    |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/92866107001c7b60e05148edf954e39ae47472a3 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ba95ff2751fef5ebabb55b27b5d2777c4a3148b5 | ORPH
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/86f122487d233929e2674c3301de3841cb8dc509 |     
    arm      |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/96212625f96c74baeb2c6376551089257aec0195 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e3d18c7a850f8695ed0026eed39d83f2c07112fc |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/c3660ab1a0869f48d80a0bd7ee07b995c8ec92d5 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8.7_SP3      |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20191018     | 20200528     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.37.2       |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.1.2        | 4.3.0        |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r39   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.7.9        | 1.8.0        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.850.1      | 9.880.1      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.6.2       | 17.4.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.2       | ORPH
                          axel |  DISTRO  | https://release-monitoring.org/project/09344 | 2.17.8       | 2.17.9       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2020-01-22   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.2        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2020.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.1       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/21396 | 1.1.0        | 1.2.0        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.63         | 1.64         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.3.1        | 4.4.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.3.1        | 4.4.0-beta   |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.3.1        | 4.4.0-beta   |     
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.13      | 9.17.1       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.2        | 3.6.3        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.20.0       |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.72.0       | 1.73.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 4.5.0        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.6          | 5.6.1        | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/05840 | 1.16.0       | 1.16.1       | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 2.1.0        | 2.2.1        |     
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20190110     | 20200601     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 20160414     | 20170601     |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.7.0        | 0.8.0        |     
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.45.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.45.0       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.31       | 1.4.32       | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-alpha  |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.0          | 20200518     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.1.0        | 2.2.2        |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.15.0       | 0.16.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.102.2      | 0.102.3      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 10.0.0       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.17.3       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.6.0        | 0.7.1        |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.2.2        | 2.3.3        |     
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.3.1        | 2.3.3        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.26.0       | 1.27.5       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.9.0        | 2.11.0       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                           daq |  DISTRO  | https://release-monitoring.org/project/13264 | 2.0.6        | 2.0.7        |     
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.10.2     | 0.5.11       | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.16      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.11         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 9.1.1        |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.5      | 19.03.11     |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.13       | 1.4.0-beta.0 |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.7      | 19.03.11     |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2020.1       | 2020.2       |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.9.3      | 2.3.10.1     |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.9        | 0.5.10       |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.17       | 1.8.18       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.12.0       | 9.13.1       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/21344 | 1.5.2        | 1.5.3        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.0.6        | 3.0.7        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.24.2       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.03        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.179        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.3       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.30         | 0.31         |     
                         empty |  DISTRO  | https://release-monitoring.org/project/20564 | 0.6.20b      | 0.6.21b      | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.8        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.24.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.15       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.0.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.4        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.6        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.23       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.8        |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.5        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.34       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.20       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.33       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.6        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.19       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.41       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.7        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.25       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.5        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.7        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.4          | 5.7          |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.3.0      | 2.6.0.2      |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.0.2        | 1.0.3        |     
                          exim |  DISTRO  | https://release-monitoring.org/project/00768 | 4.93.0.4     | 4.94         |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.2       | 0.27.3-RC2   |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/13755 | 2.9.1        | 2.9.2        | ORPH
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                         fastd |  DISTRO  | https://release-monitoring.org/project/17116 | 18           | 19           |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.4          | 3.4.1        |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.4        | 6.4.6        |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.2.2        | 4.2.3        |     
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.19         | 3.20         |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.1        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/10437 | 2.1.2        | 2.1.3        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 6.2.0        | 6.2.1        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.13.0       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.0.0        | 2.1.1        |     
         freeswitch-mod-bcg729 |  DISTRO  | https://release-monitoring.org/project/21862 | 1.0.4        | 1.0.5        |     
                      freetype |  DISTRO  | https://release-monitoring.org/project/00854 | 2.10.1       | 2.10.2       |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.05.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.8.0        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.36.0       | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.0.3        | 2.0.5        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.4.0        | 1.5.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.20.2       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.50         | 9.52         |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.26.2       | 2.27.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.64.3       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.65.3       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.12       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.5        | 6.2.7        | ORPH
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.2.8        | 5.4.rc2      |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.13       | 3.6.14       |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.8       | 1.14.4       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.19         | 3.20         |     
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.4        | 1.0.5        | ORPH
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.4.0        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.14       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.30.0-pre1  |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.37.1       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.0       | 0.13.1       |     
   gst1-plugins-bayer2rgb-neon |  DISTRO  | https://release-monitoring.org/project/21851 | 0.3          | 0.4          |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.6.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 3.0.2        | ORPH
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.45.2       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.1.4        | 2.1.5        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.6.4        | 2.6.7        | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.5       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.336        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.2.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.31.0       | 2.32.1       |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1628         |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 65-1         | 67-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.10         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.10-17    | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.1        |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.1       | 3.20.2.2     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.1.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.1.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.2.pre2    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20191112     | 20200520     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.489        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.6        |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.6.0        | 5.7.0        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.3        | 1.8.4        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.6          | 1.7          |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.11         | 0.12         |     
                       jansson |  DISTRO  | https://release-monitoring.org/project/01417 | 2.12         | 2.13.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.9.2        | 0.10.0       |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.2       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.2       | ORPH
                        json-c |  DISTRO  | https://release-monitoring.org/project/01477 | 0.13.1       | 0.14         |     
                       jsoncpp |  DISTRO  | https://release-monitoring.org/project/07483 | 1.9.2        | 1.9.3        |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.20       |     
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-04-R3   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 18.7-Leia    | 18.7.1-Leia  |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.3-Leia   | 2.1.3-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.2-Leia   | 2.3.0-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.2-Leia   | 2.1.3-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.2-Leia   | 2.1.3-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.2-Leia   | 2.1.3-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.5-Leia   | 2.3.0-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.5-Leia   | 2.1.2-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.6-Leia   | 2.1.1-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.4-Leia   | 2.1.1-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.4-Leia   | 2.1.1-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.3-Leia   | 2.1.1-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.5-Leia   | 2.6.0-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.9-Leia   | 3.1.1-Matrix |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 18.7-Leia    | 18.7.1-Leia  |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.6-Leia   | 5.0.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 6.0.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 5.0.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.6-Leia   | 4.0.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 5.0.0-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.21-Leia  | 6.1.1-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 5.2.0-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 5.0.0-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.16-Leia | 6.4.4-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.19-Leia  | 5.0.2-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 5.0.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.7-Leia   | 4.0.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 5.0.0-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 6.0.0-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.4-Leia   | 5.0.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 5.1.0-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.6-Leia   | 4.0.0-Matrix |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.2-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.4-Leia   | 3.1.2-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.3.2-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.4-Leia   | 3.2.0-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.2-Leia   | 2.3.1-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.1-Leia   | 2.4.2-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.2-Leia   | 2.2.2-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.1.2-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.4-Leia   | 2.2.3-Matrix |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 18.7-Leia    | 18.7.1-Leia  |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 2.3.1-Leia   | 3.4.0-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.6-Leia   | 1.3.0-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.1.0-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.2.1-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.1.1-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 2.0.2-Leia   | 2.2.0-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.2.0-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/09815 | 2.9          | 2.10a        |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 551          | 562          | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.4.2        | 3.4.3        |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.36         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.15      | 2.10.16      |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                      libdvbsi |  DISTRO  | https://release-monitoring.org/project/21571 | 0.3.8        | 0.3.9        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.1        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                       libexif |  DISTRO  | https://release-monitoring.org/project/01607 | 0.6.21       | 0.6.22       | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.7        | 1.0.9        |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.1        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.5        |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.0.0        | 1.0.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.36.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.64.2       | 2.64.3       |     
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.37         | 1.38         | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.25       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5.1        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.0        | 1.8.1        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20200225     | 20200521     |     
                 libhttpserver |  DISTRO  | https://release-monitoring.org/project/21934 | 0.17.5       | 0.18.1       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.19         | 0.20         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.1        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.2.0        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.18.1       | 1.18.2       |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.3.5        | 1.4.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.40         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.22.0       | 1.23.900     |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.24       | 1.1.26       |     
            libnetfilter_queue |  DISTRO  | https://release-monitoring.org/project/01679 | 1.0.3        | 1.0.4        |     
                        libnfc |  DISTRO  | https://release-monitoring.org/project/01680 | 1.7.1        | 1.8.0        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.6        | 1.1.7        |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.52         | 3.53         |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.1.0        | 2.1.1        |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200311  |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.1.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.12      | 1.25.900     |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.0.2        | 3.1.2        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.49.2       |     
                      librsync |  DISTRO  | https://release-monitoring.org/project/06309 | 2.2.1        | 2.3.1        |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.3        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.1       | 0.20.3       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20200518     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.0          | 20200518     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.0          | 20200518     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.3        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.70.0       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.20.2       |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.6        | 1.2.7        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.12.1       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.7        | 1.12.1       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.17.2       | 0.19.1       |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.11.1       | 0.12.1       |     
                  liburiparser |  DISTRO  | https://release-monitoring.org/project/10160 | 0.9.3        | 0.9.4        |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.37.0       | 1.38.0       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.18.0       | 1.20.0       |     
            libva-intel-driver |  DISTRO  | https://release-monitoring.org/project/01753 | 2.4.0        | 2.4.1        |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.9.2        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 3.2.2        | 4.0.15       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.06      |     
                       libyaml |  DISTRO  | https://release-monitoring.org/project/01800 | 0.2.2        | 0.2.5        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.167      | 1.0.176      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.6.1        | 1.7.0        |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.3.1        | 4.4.0-beta   | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2020.05.15   | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lshw |  DISTRO  | https://release-monitoring.org/project/06701 | 02.18        | 02.19.2      | ORPH
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.0.19       | 1.0.20       |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.11.0       | 2.12.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.1       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.11.0       | 2.12.1       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                   lua-cqueues |  DISTRO  | https://release-monitoring.org/project/11726 | 20190813     | 20200603     |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.2.1        | 4.0.2        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.22      | 10.5.3       |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20191016     | 20200505     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 168          | 170          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.3.1        | 4.4.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.6.6        | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.54.1       | 0.54.2       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.37.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.9.2        | 2.9.3        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 57           | 59b          | ORPH
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2020.02.1    | 2020.05      |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.10      | 1.13.900     |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.2.4       | 4.5.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.8.0.123    |     
                     mosquitto |  DISTRO  | https://release-monitoring.org/project/06078 | 1.6.9        | 1.6.10       |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.1        |     
                         mp4v2 |  DISTRO  | https://release-monitoring.org/project/98413 | 2.0.0        | 4.1.3        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.13      | 1.26.1       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.1.0        |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0-rc1      |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.7        | 1.8.11       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.13.5       | 1.14.2       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.9.2        | 4.9.3        | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.14.2       | 1.15         |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.37         | 0.38         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200606 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.0       | 1.22.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                   netsniff-ng |  DISTRO  | https://release-monitoring.org/project/02071 | 0.6.6        | 0.6.7        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre2   | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/05386 | 3.9          | 3.10         |     
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.5.1        | 3.6          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.25.2-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.4        | 0.100        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.39.2       | 1.41.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.9       | 1.19.0       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.16.3      | 14.4.0       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.11.2       |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.6       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.5        | 6.9.5_rev1   |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.9        | 4.3.0        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.2.1        | 6.3.1        |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.49       | 2.4.50       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.4rc2     | ORPH
                       opensbi |  DISTRO  | https://release-monitoring.org/project/21804 | 0.6          | 0.7          |     
                       openssh |  DISTRO  | https://release-monitoring.org/project/02565 | 8.2p1        | 8.3p1        | ORPH
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.1.0       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.7.0        | 3.9.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.7.0        | 3.9.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.7.0        | 3.9.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.7.0        | 3.9.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.20       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.3.1        | 4.4.0-alpha  | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.20      | ORPH
                   paho-mqtt-c |  DISTRO  | https://release-monitoring.org/project/21375 | 1.3.2        | 1.3.4        |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.2       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.6        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.7.0        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202005       |     
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.34        | 10.35        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 2.4          | 2.5-rc1      |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.2       | 5.31.11      |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.81         | 6.82         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
            perl-exporter-tiny |  DISTRO  | https://release-monitoring.org/project/11846 | 1.002001     | 1.002002     |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.06         | 6.12         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.22         | 6.24         |     
             perl-json-maybexs |  DISTRO  | https://release-monitoring.org/project/11953 | 1.004000     | 1.004002     |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.58         | 1.20200513.1 |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.40         | 8.52         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/03136 | 20180117     | 20200520     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.23         | 1.24         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.112        | 0.114        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                 perl-timedate |  DISTRO  | https://release-monitoring.org/project/03463 | 2.32         | 2.33         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.010001     | 1.010002     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0205       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 7.4.5        | 7.4.6        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.0.4        | 2.1.0        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 76           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.5        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.7.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.9.4        | 1.10.1       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.0          | 20200518     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 0.89.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.11         | 2.13-rc1     |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6c       | 1.3.7rc4     |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.4       | 3.12.3       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.6.0        | 5.7.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b2        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
            python-argon2-cffi |  DISTRO  | https://release-monitoring.org/project/33377 | 19.2.0       | 20.1.0       |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.6       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.2.7        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.1        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 3.1.6        | 3.1.7        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.1        | 3.3.3        |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.1.0        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2020.4.5.1   | 2020.4.5.2   |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 2.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.3.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.9          | 2.9.2        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.17      | 3.0a5        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 2.5.0        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.48.1       | 0.49.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.4        | 3.1a1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.2.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.5.1        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 3.13.0       |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.4.3        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.5        |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/06870 | 0.4.15       | 0.4.16       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.2       | 0.18.1       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 2.4.0        |     
                 python-ifaddr |  DISTRO  | https://release-monitoring.org/project/19908 | 0.1.6        | 0.1.7        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.15.0       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.0a1      |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.1        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.2       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 21.2.1       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.2.0        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.8          |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.5.0        | 4.5.1        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.2.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.1        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a4      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.2.0        | 8.3.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.44.0       |     
               python-mwclient |  DISTRO  | https://release-monitoring.org/project/09693 | 0.10.0       | 0.10.1       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.19.0rc2    |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.3.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.5        |     
              python-periphery |  DISTRO  | https://release-monitoring.org/project/21705 | 2.0.1        | 2.1.0        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 7.0.0        | 7.1.2        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 20.2b1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.5        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.4       | 3.12.3       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 20200531.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.5.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev10  |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.6.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.5          |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
                 python-pynacl |  DISTRO  | https://release-monitoring.org/project/12703 | 1.3.0        | 1.4.0        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.7        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.6       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.0       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.12       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.2.1        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.30.0       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.54.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2020.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.0       | 19.0.1       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.2        | 3.5.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.6.8     |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.3.10    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.2.3        | 4.2.4        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.9.0        | 2.10.1       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 47.1.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.5.0        | 4.1.2        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.12.14      | 1.13.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.2        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                    python-six |  DISTRO  | https://release-monitoring.org/project/04027 | 1.14.0       | 1.15.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.4        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.6.0        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.1.0        | 2.2.2        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0.1        |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/21612 | 3.4          | 3.5          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.17       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.1        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.3.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 3.0.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.10.0       | 0.10.1       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.46.1       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 20.4.1       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 20.3.1       | 20.4.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.1.1        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.6.0        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 3.0.0        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.9       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.14.2       | 0.15.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.2       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.3        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.20.4       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.5        | 1.8.6        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.51         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.25         | 0.27         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.9        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.27.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.1.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.2        | 3.9.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.6.8     |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 47.1.1       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.31.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
              qt5quicktimeline |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.14.2       | 5.15.0       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/15197 | 0.8.1        | 0.9.1        |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.4        | 6.1.5        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.8.4        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 5.0.8        | 6.0.4        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190609   | 2.20200229   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.0          | 20200518     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.9        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.6.4        | 6.10.1       |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.12         | 3.14         | ORPH
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.15.1       | 4.16.0-alpha |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 1.6          | 1.8          |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.7.1        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc10   | 1.0.0-rc90   |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.44.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.44.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.2.0      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.2.3      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.1.2      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.9       | 4.12.3       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.30       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20200518     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20200518     |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.0          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.0        | 0.7.1        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.7          |     
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.6        | 1.4.7        |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.3.11a      | 3.4.0a       |     
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.15.1     | 2.9.16       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                        spdlog |  DISTRO  | https://release-monitoring.org/project/15599 | 1.5.0        | 1.6.1        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.3.0        | 4.4.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.10         | 5.0.2        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.0       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.6          | 5.7          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.11.12      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.4        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.13.0       | 1.14.0       | ORPH
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.8.31       | 1.9.0        | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.8        | 5.0.3        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2019.11      | 2020.04      |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.7       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.4.58       | 1.4.66       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.2.1       | 12.3.3       | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.2        | 4.3.3-beta1  | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.6.0        | 1.7.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.2          |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.1b         |     
                           tor |  DISTRO  | https://release-monitoring.org/project/04991 | 0.4.2.7      | 0.4.3.5      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.0        | 2.3.2        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.1        | 4.2.1        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.3        | 2.4.1-rc0    |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 2.94         | 3.00         |     
                         uacme |  DISTRO  | https://release-monitoring.org/project/22795 | 1.3          | 1.4.1        |     
                        uclibc |  DISTRO  | https://release-monitoring.org/project/13815 | 1.0.32       | 1.0.34       |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20120424     | 20200328     | ORPH
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 4.10.2       | 5.0          |     
                       uhubctl |  DISTRO  | https://release-monitoring.org/project/17364 | 2.1.0        | 2.2.0        |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/05042 | 1.10.0       | 1.10.1       |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.2        | 5.9.3        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.4.9        | 1.4.10       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.96         |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.35.1       | 2.35.2       |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.5.0_lib... | 2.6.0_lib... |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.4       | 0.12.5       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.48.6       | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.15.0       | 3.16.0       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.0929     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.60.3       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.18.0       | 1.20         |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.28.2       | 2.29.1       |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 5.0          | 5.0.1        |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20200506 | 1.0.20200520 |     
               wireguard-tools |  DISTRO  | https://release-monitoring.org/project/62381 | 1.0.20200319 | 1.0.20200513 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2019.06.03   | 2020.04.29   |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.2.3        | 3.2.4        | ORPH
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.6.0        | 1.6.1        |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.15       | 1.4.16       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 0.29.0       | 0.30.0       |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.13.0       | 4.13.1       |     
                       xenomai |  DISTRO  | https://release-monitoring.org/project/18451 | 3.0.10       | 3.1          |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.2        | 3.2.3        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.6.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.29         | 2.30         |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.43         | 5.44         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.7          | 3.9          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 356          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.11       | 0.3.0        |     
                         xvkbd |  DISTRO  | https://release-monitoring.org/project/05273 | 4.0          | 4.1          | ORPH
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.2        | 0.7.3        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.2.5        | ORPH
                          zbar |  DISTRO  | https://release-monitoring.org/project/13689 | 0.23         | 0.23.1       |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                           znc |  DISTRO  | https://release-monitoring.org/project/05305 | 1.8.0        | 1.8.1        |     
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.5        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2020.1       |     

-- 
http://autobuild.buildroot.net
