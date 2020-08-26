From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 08:00:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-25
Message-ID: <20200826080159.B20AD22882@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 23  |  9  |  0  | 32  |
  2020.05.x  | 19  |  5  |  0  | 24  |
    master   | 153 | 58  |  0  | 211 |
     next    | 34  | 27  |  0  | 61  |

Classification of failures by reason for master
-----------------------------------------------

              host-grpc-1.30.2 | 5 
                  zeromq-4.3.2 | 5 
               apcupsd-3.14.14 | 4 
                 ripgrep-0.8.1 | 3 
                rocksdb-6.10.1 | 3 
                       unknown | 3 
am33x-cm3-11107db2f1e9e58ee... | 2 
                     avahi-0.8 | 2 
             kismet-2016-07-R1 | 2 
            live555-2020.06.25 | 2 
                  luajit-2.1.2 | 2 
                 openal-1.20.1 | 2 
            qt5location-5.15.0 | 2 
             stress-ng-0.11.14 | 2 
                    vlc-3.0.11 | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
bluez-tools-97efd293491ad7e... | 1 
                     efivar-37 | 1 
  gobject-introspection-1.64.1 | 1 
              gr-osmosdr-0.2.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   httping-2.5 | 1 
libcamera-96fab38e02792a109... | 1 
               libupnpp-0.19.2 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
                 opencv3-3.4.9 | 1 
                   sdl2-2.0.12 | 1 
                suricata-4.1.8 | 1 
 xdriver_xf86-video-sis-0.12.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7129ed2b4c0261017f76c2784927e203f572bdcd | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/4ca6d8b45f4a853b4ba7820e862810c2bb42de82 | ORPH
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7db4492dedd1bd6d25037ab512c23392e946443e |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/097abd4899dfde2600bb48757445b815986605b8 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/696f9b94a7a558bee96837784a914de1b378761f |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/db99ed19bc0a1c398a73747e8816d1cde2f0ee82 |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/66769ff6f83b02f88a9009f3736d22edb3a4ffc6 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/45abf9fdfd5d769770396246ced4d2c226ff7ee2 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/6d04e0c2b54661fa68e204b2a4d04893dbcc1f8c |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a9d46669fcd57ab49bb2f331d1b9c990c4f630fc |     
    arm      | bluez-tools-97efd293491ad7e... | NOK | http://autobuild.buildroot.net/results/2641cea0483c5f6b65ece8016d546ee9bea0d7d1 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/eb830fcd739ebf4748b478cc80a774dd812ef271 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/aa1831feb978e9f0ae72339c4810dbb54e9f14f2 |     
    arm      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/66b76c07f15bb3e6db697c47796ae3dd15ecf4b9 |     
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/991d535569520697825fed5ba00ca1c63ee3bfb9 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/09917c62c5c57b06891767bbe23d762c93746f73 |     
 aarch64_be  |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/f3fb5fa2164f2fca8cd33f73b6b1616665830075 |     
 powerpc64   |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/9e69d77040a258e1d2d6a77d98dd50ad835af6c9 |     
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/0817c2b7f6c53d86dcb9905ac967c7e8d5353834 |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/6d9455f1af8d1848ea3f18f79b862a9cb83308f8 |     
  riscv64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/7e1411070351fddc66e71d3790d8d0458e99dece |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/4b37e0b08901a3802d2f7a179e25f6a2f9b0c250 |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/8015c20a8beb5d3c95fe3b8156cda56f8df31f9b | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/345e603d769761b9a9065a340db0118eca2fe6b3 | ORPH
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/0552c982abd6ea919aa671cdaeada053d733df8a |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/4c4f6891956fa9385160f5c2a11800bd2487af75 |     
  powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/2ca5fffd55d1146b5669e3882b1481235a77a061 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/5c8ab178dd63bc3f8106643b6a43bf2e7fb007db | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/f3333173b42eba065b99b030ac719216ebc2a846 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/9e9e0133f0b250adeed1defbb046ec829e60f602 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/02da2a47c6473927a9fa78b2dc33706532d68960 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/1374e032d6f144f93b53351b68892eb1564b6227 |     
    arm      |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/873dbda73f759988cf1d4a75d3dff29c2839cb0a |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/d052f8141fd2b19c225ef27b37dc61717c669baa | ORPH
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/dc3d2bd8207a5c211168dfb38e77bb80e3ed1bc0 |     
    arm      |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/b10cea9183bfc9f884faefe59a14c2d5b759d074 |     
   mipsel    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/6b264f8a232776fd95a03367841905347e51b035 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/2bab8ffa590d4c4eabffe94ed27311c7f6607c98 |     
 powerpc64   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f9ca74ec9c01310ea2c82b01896defecf0c54a38 |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/a4cd7ecc6d983aa6f15d3be1e21529f17e04b825 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/cd0e3be19afec32b8e78c2f7349570fa32f01ee6 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/c598e1f11a99660b82d7c88f7dacd78d094191d6 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/749380977e5faaf1547ff07a2966f1d20a1cc0c2 |     
    arm      |          sdl2-2.0.12           | NOK | http://autobuild.buildroot.net/results/4e2c97af14f04bcd0e312b4041c9b1645468fde9 |     
   sparc     |       stress-ng-0.11.14        | NOK | http://autobuild.buildroot.net/results/1eb841836bd2904393fa2f0938b2986052c9a810 |     
   sparc     |       stress-ng-0.11.14        | NOK | http://autobuild.buildroot.net/results/24d0360365e2a5e943a265a6977f56c262c0d3bd |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/65a611323bab97075466258fd6f15c42bb7ecf6f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4f629ba37a5fdef6aa2824fe7e8c426d3865ce37 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/5fcc977b060ee5b9514c90c61cbd0acda2633aec |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/382a432353eeca7f2e021b767dd4852bb81ebe8d |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/613ba161b15a4dcfd432255597dab5fa32e1a1bb |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/d042e43b18a1fd91bd61f55a23592b02eee85920 |     
  riscv64    | xdriver_xf86-video-sis-0.12.0  | NOK | http://autobuild.buildroot.net/results/8eb8149a07b3f3b0263d9d73e56cfdae013ab442 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3b2fa79fb50a06e2240cf3777c7533602102d9ac |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d44ddf367a64d85daac151ed540ced59026f62c6 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/eb8fc43d178d32de9672c63ead733aef9bb80262 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3fa84388b65ebcbdfd7c22af6c6d92c3f190de8b |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/761417d28082c0a378997511591903b61f1b47cd |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 2 
                qt5base-5.12.8 | 2 
          gstreamer1-mm-1.10.0 | 1 
               libtheora-1.1.1 | 1 
                  luajit-2.1.2 | 1 
               protobuf-3.11.0 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/735119a93eff54306375207672b523780cc3639f |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b6dac4d61f03bc06a2d21a6af96b24498bba9d4b |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/76e95e79bd5b86d2e37cf0d6772c83a15e0173ce |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a92a01e3a3244ad85011aa1e160701f3f8e74110 | ORPH
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/1522e8bf44b5d5ae4d10ad150de2df3fa51dccba |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/20b561f2dbb991a913c774a20025482185b4fd7f |     
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/95a50137afd778a559dc93da4941863c54103c27 |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/7dc25844dd5d27a0cdf4f2552b80909988396015 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2169ac2d708bf3d773a9d646ce8b8387c9699f9a |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
                 mesa3d-20.0.7 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
               opencv-2.4.13.7 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c7d61630c75f9d9fc6652a497e914c2dfc3ea06c |     
   x86_64    |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/bbda263d3a47da9a4ed34e8f1a0883cf82d1f44f |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7a5c20c07bddab301edbbe100ea56315e9685c18 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7bd0a664e37f4ceb0c39c59746882bd2a536d61f | ORPH
    i686     |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/9600dc818bcd3828e127b139377ce94043bba9ed |     


Classification of failures by reason for next
---------------------------------------------

               domoticz-2020.1 | 3 
              host-grpc-1.31.0 | 3 
               libglib2-2.64.4 | 3 
     dovecot-pigeonhole-0.5.11 | 2 
                 gnuplot-5.4.0 | 2 
                  zeromq-4.3.2 | 2 
                    bird-2.0.7 | 1 
                  boost-1.73.0 | 1 
              host-guile-3.0.4 | 1 
  host-python3-requests-2.23.0 | 1 
             kismet-2016-07-R1 | 1 
libcamera-565f95d64ff92e871... | 1 
                libcurl-7.71.1 | 1 
               libupnpp-0.19.2 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
              spandsp-20180108 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/a9d1aad33df1bc4804579718dd44fbdd71c1f940 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/11ba75bfe33c84c9476c104b2f3c1423b35234e4 |     
  aarch64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/f50ead171bb3cf5a16c10f3186c36daf218ed6e4 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/6215d25006c7772fe4cfecc5b6a5d7cd63cc6172 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/cd3437ee3dddbca1c8acaf6717cd4d27896bf7c3 |     
    arm      |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/3986fec4dad3a9cd7c77a9cc9eebafd74979294a |     
    i586     |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/13ec4208271203474ead02eab9b768dfcc9dc84b |     
    mips     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/9a3eaec5bc52cd05b4bf6962da1e73a551178243 |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/7c22a52976dd78059542fb649c883557f438506f |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/a2948a413133983c4d84b00b98c781313c49b478 |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/1a9566e256cb15cdc33b6953300b895f74547b9c |     
powerpc64le  |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/6c43d8b8c95bcb286494e70077363cef2339f364 |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/81325309ffc3794ee8f320238f909f5ae7671c62 | ORPH
  aarch64    |  host-python3-requests-2.23.0  | NOK | http://autobuild.buildroot.net/results/e57f2dfa5fc4e33a7c8969b180e0f487228e96f7 |     
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/1ea7d55851a82170158418593520d996bec33cb7 | ORPH
  mips64el   | libcamera-565f95d64ff92e871... | NOK | http://autobuild.buildroot.net/results/db9b088d93d9a7652cca691d86bf9c1db15b31cd |     
   sparc     |         libcurl-7.71.1         | NOK | http://autobuild.buildroot.net/results/e3533f821ad17e7558f41c13ba983a7c30b874d0 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/3622a54436eda97865a641042aec292a1d4f2d21 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/16a6d100673429911102cfe5f1da19a5a7ed4192 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/525b8815c891ec5570c1bf0d3ef031bf1ab6a14b |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/ac94fe2fc944ddc47d2b1056c48fe43f57331786 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/91a4c22f58e67eadb2046dc1caf27fc557205d98 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/f05e1224e9b665f3b3c0cd798ff979e0ee2b0c90 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/efbd9e7699c12e605f6ad702e02faa0045116e2e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/86a5fa81ff5d5ae8287261d165b6378f6478f272 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/65adff006f21780833ca2b59edb9ce9a48310edf |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/888f430d8fcd9003b6dc9d76b53dc9f1390e5d07 |     


Gitlab CI results for 2020-08-25
================================


-- 
http://autobuild.buildroot.net
