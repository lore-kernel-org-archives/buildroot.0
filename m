From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 May 2020 06:26:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-11
Message-ID: <20200512062659.1EE5387D98@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 24  |  8  |  1  | 33  |
    master   | 194 | 97  |  1  | 292 |
     next    | 19  | 16  |  0  | 35  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         uvw-2.5.0_libuv-v1.37 | 8 
                    atk-2.33.3 | 7 
             host-gnupg-1.4.23 | 7 
                qt5base-5.14.2 | 7 
                  zeromq-4.3.2 | 5 
             gstreamer1-1.16.2 | 4 
                 rocksdb-6.6.4 | 4 
host-vboot-utils-bbdd62f9b0... | 3 
                 mesa3d-20.0.6 | 3 
                  ndisc6-1.0.4 | 3 
                  assimp-5.0.1 | 2 
               collectd-5.11.0 | 2 
                   gssdp-1.2.2 | 2 
              host-audit-2.8.5 | 2 
              host-erlang-22.2 | 2 
              host-grpc-1.25.0 | 2 
           host-nodejs-12.16.1 | 2 
               libupnpp-0.17.2 | 2 
                    mpv-0.29.1 | 2 
                 ripgrep-0.8.1 | 2 
                  stella-6.1.2 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
                coreutils-8.32 | 1 
                   cvs-1.12.13 | 1 
                  dnsmasq-2.81 | 1 
              exfatprogs-1.0.2 | 1 
                      fio-3.19 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
 glslsandbox-player-2019.08.23 | 1 
                 gnutls-3.6.13 | 1 
      gst1-plugins-ugly-1.16.2 | 1 
               host-efl-1.22.3 | 1 
           host-openocd-0.10.0 | 1 
             kismet-2016-07-R1 | 1 
                   libnss-3.52 | 1 
                       libuecc | 1 
             paho-mqtt-c-1.3.2 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
               protobuf-3.11.4 | 1 
                 rsh-redone-85 | 1 
       shadowsocks-libev-3.3.3 | 1 
                    strace-5.6 | 1 
                suricata-4.1.8 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2f7071550f129c4af629714301272fb5f5ca82ac |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/64c0bc7e1e56e18f3ee6ee6e1580413d7f500a78 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/996ccd90ddfc01799467a172fbed3521d35ddea6 |     
   mipsel    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/4d8ea59787dcc1d9419f93b57988e77db3fa6560 | ORPH
powerpc64le  |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/6f721e9654f00d35e42d1c5d5129263bb4c9fc93 | ORPH
  sparc64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/3fa2d3c003949ed3ebc592f36a0a40a24c4fac04 | ORPH
 powerpc64   |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/e363e8deeaac021049f41185344496d4a0d3cf28 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/01c2c00f30fd950a95d67adc51e48e34e8abdbad | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/f40805c59cef2bc56ea7f816f09c489fc631e7af | ORPH
   mipsel    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/db79a0064b7fe58b87e8e250bae1022f7405effa | ORPH
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/4501f1bc09551843984ff743aec884efce53558a |     
   x86_64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/bde2438feb8a3c2f7848efaef044524c4416b1a4 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/9b650cc19b88fd57df0de8d24b26196bd39e853c | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/756e61a97b12d5488472b3e298f2e2e2bb5e81e4 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/def22dea1aac758643b5c4c40ae7f6959a4318a1 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/b593a64f106bd69023b0af5747ae1feac76549f5 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/85b1ad7c8ae434d4a0ea2127516cb13526575720 |     
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/e6d32e19cddc66acae4764370697648017dd2fd4 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/e44608ef44679d5968947b6759bb50789aee7b1d |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/cb237e394444ff50fd575a4eece96909cee76f57 |     
    mips     |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/8692d99ee24185b4f011cdd7b4714fb49f5685de |     
   nios2     |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/1dd8dab92de429f4b76bff22a1b1a315c25be620 |     
    arm      |    gst1-plugins-ugly-1.16.2    | NOK | http://autobuild.buildroot.net/results/18fffadb415ecd5da5819932974aefa15df640ad |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/0a116822ca040b3ebbfc2abe91f1bafc76802cd9 |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/0f5e5ce1577b38472d968e937f401152dc50bade |     
    arm      |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/68b1b3e0c39c3ed50ee41f88606becd715ffbbbf |     
   mipsel    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/2f717d6c5d0f56a00099490afcfacb4e1e00a582 |     
    i586     |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/ca8ffa030f6f747e99a56ba920fa2f49ec6bfe99 |     
   xtensa    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/a7cfead966004c3dfa8d0e17a26bca02a418bd86 |     
  aarch64    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/87863cb4e3860eb96cb58f9736a50b07187769a6 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e783ad803116ca84619ed9cb7f124121cd973f76 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b227b2c121060e0e5507ecdec3c76e217ddc58d5 |     
  sparc64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/f1af9e864ac3fe43c0020773cfec00a48c25b628 | ORPH
    arc      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/68b80ee082182e8b622080863986f46f42422318 | ORPH
  sparc64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/773f8f84a07053ff0539129c9c3b6734453868c6 | ORPH
    m68k     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/6caa175c0dde130067899b0fbe036d9578da528e | ORPH
  sparc64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/5de936600948bf1cc4b218d6d1c922208c306886 | ORPH
   mipsel    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/9c490732fd3140a7dec7f5819dcd15b98479b8b0 | ORPH
    or1k     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/d6cfee4856fc7bac8fb2f9443f0d2024253ae67e | ORPH
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2e7c2ae0ffb13be55f04d73ba9b5698c037ceaea |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e6361a329b07e9e84e7c53e7aff503fcac444a6c |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/2c44244206e1cc7538ba42b5e31e49fcf3e59ddc |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/b55d54a00c2c48d20c488afaf9ade7fe811109fb |     
    i686     |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/7266b7477c1964432cc6862d98a75440a2034926 | ORPH
  riscv64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/cc82f422cb41f68fd2970153800e40f620c0295e |     
powerpc64le  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ca7e295b869e8705fa39fd834f9cb395788179fc |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5fa8fcaac822f1d87a6e4a1f3867ac2766c7106d |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/8a90d3bd422c30f77588ca9d3bcd4d9ee913684d | ORPH
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/ddf433907772b9bd13df72bdbeef01a6778a0635 |     
    arm      |            libuecc             | TIM | http://autobuild.buildroot.net/results/abf45684aa645f89301e0edda7dd4e2de1c97bc3 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/051174461ddda7470775678e0345145b05b37a78 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/bf23d942cb273599992cfaced425800301c18b99 |     
   x86_64    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/2c4975500417e6b1258488cac40edbe963fd01bb |     
   x86_64    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/affbf8141be407c8fed2a62e2ea4c1ba999b3687 |     
  mips64el   |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/8d5937e509830122e8ec14d9b81a99f0227f3f14 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/07cbee46008b63944bed04d89e099c56b2d807f4 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/302cc1c6922e6e61dc81a8f77a1ca5bc455418c0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1946014fd4adae920291cf232017eefad7fb134e | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e2f88bf3b27be1276d8a5f94334628e84d55a674 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/cac2f9eb40ef51c8561d0163b68fcfc34b7e2898 | ORPH
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/8ce8223acb4fee1ac8f2c9487405dfb7e0d0329d |     
    arm      | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/c790f5b96dd6414f8d977d41ae6169b4bea4acc1 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/c4186bb9ea82a4fe3da7ef47fae3365316f0481b |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/839c4d16e8a58cef1cd2d89991038915ece42896 |     
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c60ae7afcdefd11e2f0233b58b7070d531afcd07 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/915e3a6e175883513be1dbcb50491b489faa818a |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/6bc2c0b1c507a57f65305e81e7ceb9ced42820d8 |     
  riscv32    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/5e7ad5e575e141f592893970d660662c1f708421 |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/83f5f6027f77a5c463598cfed2f5bac912e04daa |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/96b64d2691c1e994fbae9a140b67d5d285c8bdbe |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/e60af19e29a44c2727cfdf3054c067277862bf95 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/991c3e0d6a77861abf493434d8efb035322557f0 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/9e8397630f2dbda6049dcf77625a76476c76a343 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ce9fa209f0f14d5f1727583affa8e0fa9521c8f0 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/8ccb345c2c1c0d00f2a95c57a727661b3350cd0b |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a285e02adb343551c1caf5edc0d2305a8fad433a |     
    arm      |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/c703f85399c72ba683ad8cd5312958ff5386c136 | ORPH
    arm      |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/6b2cfc669e66760118c22d214ed5e2476822a62a |     
    mips     |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/a495c4da5911fc07968e6bdf7eab5d93d9617d9c |     
    mips     |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/1c5dfbbff63906efd605e8cc4fed2dae746eb8a4 |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/53d6dac4047742ae2acd682a0dd97d986ba611bb |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/3919ef7586bd9fc556edddf7de4ebe99125fedc8 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/f2cc6b86650a3f52ea1e3409fdfee0391090a191 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/f619823eae22ebe4d59e6936b0a5e5c1b2b63a4b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/420ed47c0750d20662053074e12edb94e4b8968b |     
  riscv32    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/964986ff5120a29d1ea21e79701d5b454acccf3e |     
   mipsel    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/ed9a52ca0c552b41f151df279009627ed41bc484 |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/209b3f6d4576942541ab9ea433ecf2c8bcb31482 |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/3131edd2d7707aef2b9baf1899ad21a915919379 |     
   mipsel    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/747ff18ade8bd9aeeb0d2d90b06291a4ed66f887 |     
   x86_64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/b4a29e70577db42e638462099d95d51de777bc99 |     
  aarch64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/cc233c5d24891e15d76c346e50e8fb475c9ad111 |     
  riscv32    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/505d802d2c663a2abe2daf846df6015a20d6a4d4 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/bcf2d8a025241daf875f7e50cb9469e47360ac8c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d70338bd8ac4320675a376383256dbbf3cf8d659 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c8ad4df8315b19e3356ec91437087d1faec734cc |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/67cb5acf1c034586e3a13642a803bc03cc2c32ea |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/65c62e1e8f7e1082426470635bf1fa2af21130b7 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.13 | 1 
             host-gnupg-1.4.23 | 1 
              host-perl-5.30.1 | 1 
                   mimic-1.1.0 | 1 
               protobuf-3.11.0 | 1 
                    squid-4.11 | 1 
                      tio-1.32 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/607e03fe1f2d305b4fc73848ebc25e69a9f9d146 |     
microblazeel |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/c60a5919957815fadb1b0d0f6724ee2cbb4d0dc0 | ORPH
    i686     |        host-perl-5.30.1        | NOK | http://autobuild.buildroot.net/results/ad35602f7e5c524c2869b09b82023fcefe05d79d |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8b7c14f96429edcb4fecb8f63c9375d28b3560d3 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/36f4af76264052b483b7df4a900689dd50754d3c |     
  riscv32    |           squid-4.11           | NOK | http://autobuild.buildroot.net/results/999a62e7533a64e97a6ac0004470e293a73480cb | ORPH
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/4939daf1eb39340dee151eca8e398f722e9721c6 |     
   nios2     |            unknown             | TIM | http://autobuild.buildroot.net/results/3bb01d0215fbea68fa8008b1adeb870cb8101e0d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/cc6bd0a90a968992750b108f82bf94ea8818deb2 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              exfatprogs-1.0.2 | 2 
                    atk-2.36.0 | 1 
                coreutils-8.32 | 1 
             gstreamer1-1.16.2 | 1 
             host-gnupg-1.4.23 | 1 
                host-go-1.13.8 | 1 
                 mesa3d-20.0.6 | 1 
                 openal-1.19.1 | 1 
                openblas-0.3.9 | 1 
pistache-73f248acd6db4c53e6... | 1 
     python-argon2-cffi-19.2.0 | 1 
                qt5base-5.14.2 | 1 
                suricata-4.1.8 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/e3e66135c5e8ce4c5568aab38515a5f9e013cfb5 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/75d906b802bab58cbc49645fafb568f0739f617c | ORPH
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/3ecec1627b15e5889972d14407f62598450ceef2 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/bee178836ee88ebf4f7d1e0706516377b71a2e60 |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/7444bfe1b3ad475ecd0feb6690051bbcdf374a42 |     
  aarch64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/7debdb7f9d777cba80fa7acc16cf6bd9feb2dd5c | ORPH
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/081b8b57941e755d5a73541d6825500b89c80278 |     
  powerpc    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/f161e79687c8b46be56cf26e76dbf5220be00915 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/16768f14488aba5a0dbb0e012bcac1893d65f541 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/1890048281a1b99db5db56902c612bbd0e492571 | ORPH
  riscv64    | pistache-73f248acd6db4c53e6... | NOK | http://autobuild.buildroot.net/results/f39b52ec67a436206c012d722f4e65409dbde810 | ORPH
 aarch64_be  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/6ad07a19bc5b7f085088bdbd26da1fd195c02c7e |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1303ffbd8b0afa884900818542dd73b83b413119 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/bb91dbf045a4a5c451f922187b36f1fdffa9e253 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/981316b05fef7cc6e7fe872c83181e9526c47377 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c43a64dc6d7c19a5aa5b98121503ab0bcd0f28a7 |     



-- 
http://autobuild.buildroot.net
