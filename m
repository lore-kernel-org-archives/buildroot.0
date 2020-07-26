From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Jul 2020 07:49:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-07-25
Message-ID: <20200726074943.A6AE787639@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-07-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  5  |  0  | 18  |
  2020.05.x  | 17  |  7  |  0  | 24  |
    master   | 124 | 106 |  0  | 230 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libzip-1.7.3 | 10
             freeswitch-1.10.3 | 8 
          fuse-overlayfs-1.1.2 | 7 
              keepalived-2.1.4 | 7 
      host-python-networkx-2.4 | 6 
                     avahi-0.8 | 4 
    host-mender-artifact-3.4.0 | 4 
libcamera-96fab38e02792a109... | 4 
  gobject-introspection-1.64.1 | 3 
                  assimp-5.0.1 | 2 
              bitcoin-0.19.0.1 | 2 
dvb-apps-3d43b280298c39a67d... | 2 
          host-binutils-2.33.1 | 2 
              ibm-sw-tpm2-1563 | 2 
             kismet-2016-07-R1 | 2 
                libcurl-7.71.1 | 2 
            live555-2020.06.25 | 2 
                     mtd-2.1.2 | 2 
                 openal-1.19.1 | 2 
                      skeleton | 2 
          skeleton-init-common | 2 
                       unknown | 2 
                wayland-1.18.0 | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.73.0 | 1 
                coreutils-8.32 | 1 
                   cvs-1.12.13 | 1 
                  dnsmasq-2.81 | 1 
               domoticz-2020.1 | 1 
   gdb-arc-2020.03-release-gdb | 1 
      gst1-plugins-base-1.16.2 | 1 
                   gvfs-1.44.1 | 1 
                hiawatha-10.10 | 1 
                host-m4-1.4.18 | 1 
               libtheora-1.1.1 | 1 
                     ltris-1.2 | 1 
                minizip-2.10.0 | 1 
                  ndisc6-1.0.4 | 1 
                    ocrad-0.27 | 1 
   openvmtools-10.3.5-10430147 | 1 
               protobuf-3.12.2 | 1 
                qt5base-5.15.0 | 1 
             qt5wayland-5.15.0 | 1 
               qt5webkit-5.9.1 | 1 
                samba4-4.11.10 | 1 
                suricata-4.1.8 | 1 
                      tio-1.32 | 1 
                    vlc-3.0.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7605e73e48ad7e8ea1a0863b849fa06d16438e07 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/d8c883e4abc05a3721ea1e6a5801042e3d31cf30 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/6eb055913ad068779dbb33175e9459690ddf4547 |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/560dca86f8735f46467537f51d3ede68bffba986 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/221622141948bb3639cc2288a81ba76ad8f9289a | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e944ad6ac19cd4b346a739f7d7c07cfce1ef0468 | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d7c18e88f729a38713ecddc95dcd08eb65f31a7c | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/b5ccce28969b231872b51d78756d4312ce3064f9 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/4d04e919974d4b73190c0e4a2d663eb365d4804f |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/710718af8165b44962c2c2d67ca4424076b2778f |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/b9d020d65e8caabfcb8d8983227ae73801669e03 | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/249c69daeb610880b23d9d9a3e673774cc75fb49 | ORPH
microblazeel |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/73d782334ec643b79b21545ba2f321feca0f8ff7 |     
 powerpc64   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/f994fa5b58d38195951c0913e4c6ecf4091ae378 |     
   x86_64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/3b8596c4b20a3fd8235aa399f0a72d88547dd3fd |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/51ee12b91a1d7d6c86cd89c4d18870853159e2c0 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/91851f20372b977aa87a2e6dfb4a0234665f44a3 |     
  mips64el   |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/8772d13132169e1c2f49781e7c4b860905ce102e |     
   xtensa    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/e2792a0048c4fc08d38538f3929ec316e377f095 |     
   xtensa    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/982fe0994440896a411bbc781271e8ca671f61e0 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/a58aeeb9cdf08535270da556112c4ce0c3e25586 |     
    i686     |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/ad190052bd880987fc22c972d1c35ef6cb102504 |     
    arc      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/6f3a26fc76087a61e33122718f889a34d58a8260 |     
  mips64el   |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/3f8ef6904c1beba18035463700bfbd13ce440e99 |     
   mipsel    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/a2b2f1f8fa1133b9b3eef87244932b6096a11894 |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/c1fefc272b669ad7531173241d8cb0f321b3f0a4 |     
    sh4      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/4ead035d9ddf0af5831a24d3b672be5ecac3b653 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/863d6cea1cd309a5ec319b758e0fe10c0a61cccc |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/3a5ae7ffa616f035d54c976e22086b79341ea825 |     
  powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/2e5ec2a7745ed708a49de3286ab44753fc7ee830 |     
  powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/7186515526ee60488dac3bf9c4580ffd13a0ceac |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/e16dd93e6353adbd74b0391e456ce1af96bb33f1 | ORPH
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1c07da2599cd09ebba17dac69e9e44b49da27214 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/3878320fa1c58f4d602a912c0af7b7a2465be290 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/5cdc6b4a6021649d255f6e78dec9cc03a9f2308d |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/63b24feb59697eee924d47a5305b2ea1fb1922b2 |     
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/f75b5fc036b85eb31a02d80f5e6151ebf4977cab | ORPH
   x86_64    |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/4f57d880488456c3121fae1a757eacfe18aa8c29 |     
microblazeel |      host-binutils-2.33.1      | NOK | http://autobuild.buildroot.net/results/d30e8fdb1fce19ec5abf901930392eaeccb14e5a |     
    arm      |      host-binutils-2.33.1      | NOK | http://autobuild.buildroot.net/results/d697fc0087a9164b956c64d8336be7dd579e7df0 |     
    or1k     |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/0f7ad0131b7a49930b44ff0fc52b258dd3e44b84 | ORPH
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/02837e30bb17a48fea510a9dcbb9a5c69e7a337d |     
  mips64el   |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/014836c8e164dfec2c70a62c06a9e6e61c7f9f0e |     
    sh4      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/741a4df1c0a2b69e4063a5266c1cf2cae099e8dd |     
   mipsel    |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/0626ab05045f2b7580f9856aa56737c16675a605 |     
   x86_64    |    host-python-networkx-2.4    | NOK | http://autobuild.buildroot.net/results/0e1c7c3821e195d7accf7882329c06c8633d811f |     
    i686     |    host-python-networkx-2.4    | NOK | http://autobuild.buildroot.net/results/c0600649236dc55cd4bb085a2605a62541fa11d9 |     
microblazeel |    host-python-networkx-2.4    | NOK | http://autobuild.buildroot.net/results/be3435d025add8506923d664d44cddf0a865b693 |     
    arm      |    host-python-networkx-2.4    | NOK | http://autobuild.buildroot.net/results/3da6a71f685805123e830910059a99fd655e7064 |     
   mipsel    |    host-python-networkx-2.4    | NOK | http://autobuild.buildroot.net/results/0a958ba4bfcb88772b241cc112a319fa1fc63d5d |     
    sh4      |    host-python-networkx-2.4    | NOK | http://autobuild.buildroot.net/results/2bf9d0094ddc1075d1fb8fc8f1c0969289790cf4 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a8856d25999460cda6a05d94c0e8d127fe5fc2a7 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0adf1db0b101ccda66b8e2837af8aefc4efafbd9 |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/f4cff1b7e29a6cb3a4d88461c512e9a4e0fa44cf |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/ea1561f1d4d2a95b622bc6d9397cdf7fe38ca190 |     
   xtensa    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d43e2e1a86d6aa15e7f93acebdbbf59ae52c2031 |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/9919f85d1b17b5cb9b2fec7c8a0742fb96f5e72d |     
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/97d1ebce5527de43f1723c65765b6fb657c677fc |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/29764b00d54876d43f4fc198bbe0380a7a083557 |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/47ad9051ca76d0d6a905d7546d94a34ca6a1fa86 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/277c46f3006dee7ca8cccd4d915e7a25ed5ba722 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/c46aa30b6407d90bc7e8b752b3b23059c67c02e2 | ORPH
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/bf96b23133ef3602696d66af83c3c376926bb6b1 |     
    arc      | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/2db7292e251ce81d31187c3a9eb36dbc9236bd07 |     
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/6aa83ec3db0153511c540231d0cf603bfff401ad |     
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/8b8e821e5031d3eb29f571f1896feeb4ed4f1b16 |     
    arm      |         libcurl-7.71.1         | NOK | http://autobuild.buildroot.net/results/2f07a0ac1240a6040a3509d2ebf06906a31fd172 |     
  sparc64    |         libcurl-7.71.1         | NOK | http://autobuild.buildroot.net/results/f8d2fb919475cdff4a36ad93071048ee09193b98 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/d61c44c38c5792a347254575d46a0d955466c2c6 | ORPH
   nios2     |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/d9be489235277c69f6b6340004f8be5b60ee5ea6 |     
  mips64el   |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/14b98e797d39590c4c91fbe3dd9380612aa9bf83 |     
  powerpc    |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/7ff0a4573d3436c7e6ef3137517306e9a3c9e7d5 |     
   x86_64    |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/0530c5531230117b5680daf7413256f4ab32c267 |     
 aarch64_be  |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/51d2f777b172aeb0ae6e16b719f2783d378332cc |     
   mipsel    |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/ede8c2fd39a38a8938997de4302ed719bfabcb94 |     
    i686     |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/672987129d4da4f682325456cc522773132af151 |     
  powerpc    |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/0edf1dd8e06a704291cfb23d5ee13c2cb8b623a2 |     
  mips64el   |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/bd5638e917b75ecb69304ae0e2392837061434e7 |     
    arc      |          libzip-1.7.3          | NOK | http://autobuild.buildroot.net/results/55f23beb55126204f71f3b195879318630c2d600 |     
  powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/83370cef8a32e9e6e9e4b037602ca036f14722ee | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/424917b7628281a96a76eb38c393cc7ea576a515 | ORPH
    arm      |           ltris-1.2            | NOK | http://autobuild.buildroot.net/results/991d601b30831df61c78dc7109a2f4ab9ace3f84 |     
    arm      |         minizip-2.10.0         | NOK | http://autobuild.buildroot.net/results/b8baff4b86923d29163ce5cc9e391904d81fc90c |     
microblazeel |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/41254c5633348c58e39769339dcbbf931d5e7c25 |     
    arm      |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/83b7607e0d98798de4fb6f29cdbfb9c098585e77 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ecdaef3398c5febf18f5226fc88f7a96c8187f70 | ORPH
  sparc64    |           ocrad-0.27           | NOK | http://autobuild.buildroot.net/results/99ca8523601373f86b819a09c33414d11f3397c4 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/575cc203d2dac16c85641cdd6ca58de3dc466853 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/f1d916459b459f01c445c15b4d6b56616d5168c9 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a228927591434c156594babbd2b2cbbc15f64c1d |     
    or1k     |        protobuf-3.12.2         | NOK | http://autobuild.buildroot.net/results/86e376e5d9a8193706b9f72400ed1f5027f23cb9 |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f4d7dce2a89442b50dc6a2fc204db75a1b6a8482 |     
    arm      |       qt5wayland-5.15.0        | NOK | http://autobuild.buildroot.net/results/de75d36202eb9c89a2bc1ac184320df88415a5c0 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/edbd4b8b2af0d1bee8d1c3314b63864e369102bf |     
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/740fe33d95ed7552f8d11e94d18948c9f2d28cdd |     
    m68k     |            skeleton            | NOK | http://autobuild.buildroot.net/results/19318ae7b1881bdfb35281659db122e1c08a6cf0 |     
  powerpc    |            skeleton            | NOK | http://autobuild.buildroot.net/results/09a78ae8d3908405954ebaa1969c91e37c436728 |     
   xtensa    |      skeleton-init-common      | NOK | http://autobuild.buildroot.net/results/cbabf50032f3ae5eb3832132668ac80500bef803 |     
   mipsel    |      skeleton-init-common      | NOK | http://autobuild.buildroot.net/results/e313db7a39c032b2a5ae0c819896be5a1f2444ed |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/cce45dc3d5565e15ed33628eda7c3d14704f2e32 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a422571cf5e5bc8451c9d51d29a3124b89d4d91b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/019a48c1b16e3b779bd83233033f25b02f2ef10a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/223394de88389cf6f2abf7f51ac56305222de205 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/fcf4a7532a8454f8542804d627828ba3f1fcbba7 |     
microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/a54580814b72ee697f51e2e4d78a472cf64fb92b |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/44a28b5c1cd01efa5bb0203f5650d42f820c7fad |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 binutils-2.32 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 
                       unknown | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/965f1a927afa44b6683aec6886e677e7d53210e1 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/116f2aa0881641a049c8fc5f86aa6bd27a89656c |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/4a54b1ad8545b3b2bf79057227ae280ea8066509 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c060d7559c2aac910eba566e7bd18c674eab3763 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/7366f3de01718daec6b2fe023a0921b6e3ad8f3b |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
                 mesa3d-20.0.7 | 1 
                 openal-1.19.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 rsh-redone-85 | 1 
               wireshark-3.2.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c51846d09b00daf074b8d00f1d1a7ead579733d9 |     
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/24c0000e6a780820934e6f567c553f6a60156af3 | ORPH
   x86_64    |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/482164fc3872c0197162e40923cb8ef023435232 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/541f0933e2241f1a726ff23fc370e78da353a897 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f0d9ddd5015ff3e4c185f0ec31792ab17cf75f4e |     
    arm      |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/4ffa14b2b0c0aed76965783f92764d14d0494810 | ORPH
  powerpc    |        wireshark-3.2.5         | NOK | http://autobuild.buildroot.net/results/25191143092f5a0622812b53d571202f6350df85 | ORPH



-- 
http://autobuild.buildroot.net
