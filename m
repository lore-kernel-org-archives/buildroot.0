From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 01 Oct 2020 07:09:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-30
Message-ID: <20201001070944.E542686E89@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 23  | 11  |  0  | 34  |
  2020.05.x  | 18  | 14  |  0  | 32  |
  2020.08.x  | 22  | 10  |  0  | 32  |
    master   | 140 | 87  |  0  | 227 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 12
              asterisk-16.13.0 | 8 
               target-finalize | 4 
               apparmor-2.13.4 | 3 
           host-elfutils-0.181 | 3 
              host-guile-3.0.4 | 3 
         libcpprestsdk-2.10.16 | 3 
                  ndisc6-1.0.4 | 3 
                  pango-1.46.1 | 3 
                       unknown | 3 
                  boost-1.74.0 | 2 
                 fwts-19.09.00 | 2 
                   libcap-2.43 | 2 
                  luajit-2.1.2 | 2 
 Makefile:753: target-finalize | 2 
                openblas-0.3.9 | 2 
        python-m2crypto-0.36.0 | 2 
                samba4-4.11.13 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
               apcupsd-3.14.14 | 1 
             babeltrace2-2.0.3 | 1 
              bitcoin-0.19.0.1 | 1 
               capnproto-0.8.0 | 1 
  gobject-introspection-1.64.1 | 1 
                   guile-3.0.4 | 1 
             kismet-2016-07-R1 | 1 
            live555-2020.08.19 | 1 
                log4cxx-0.11.0 | 1 
                 mesa3d-20.1.8 | 1 
              micropython-1.13 | 1 
                   mimic-1.1.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.15.1 | 1 
            qt5location-5.15.1 | 1 
             qt5wayland-5.15.1 | 1 
                 ripgrep-0.8.1 | 1 
                rocksdb-6.10.1 | 1 
                  uhd-3.15.0.0 | 1 
               util-linux-2.36 | 1 
                    wampcc-1.6 | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9202fae6f32a6b465faae206da2e93f763b429b9 |     
 powerpc64   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/eec79dbe26f35dc8b7ab9b957c87f9456b82130c |     
   x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/3beaa10a6d10be438366943f0c18b1153becf4af |     
    mips     |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/09a5319ac8ae154911ccd9a87500c310b2e46ada |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/0b57de25f97859f2d7f2b655d5e98e7bef250fcc |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/2375543ce8d10300db3eddd631ebf41cd8741bc2 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/dc040cdd9a176933c963bda4a041b91efac1e612 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/132edf53799f20a21a893d9817d85c3a63c2b2cd |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f159bb7f0d7cb95a55195ad2dcbf6c0e3a1bcf77 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/0024ce728c052c5682427278076c5635fc3d942b |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/fcc8945b55b0267a9d1b8a774f5589cebb21b198 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f105448b8dd37454b0d37a0aa0c2293bb7e20a85 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/b50b18a667ef37a92f678b0191cc07cb09b4e495 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/5bece810119313b317688b6d4d128f343b8b540f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/4c4178ded63ef5512d55dd21692ec2fed43d5317 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/fc2fcba7292a0ab895ce45f383a254aeea6e1e20 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/205691e2feb2950fe42e8c4b109f75ef5a9cfc07 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/063c0833328cbccb4cefef9b5169f222c9b41044 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/eea4c4ceb92e12141d704aa2f1c1ca95b421caea |     
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a10f9777e5cc298a01d24dccf0e71b111bbd6a6d |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/fcd3c3c2639b33586ff613f6175d91916098697a | ORPH
 powerpc64   |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/3d64bce388000cc8a625a8426a2a468f09128936 | ORPH
    arm      |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/211f3041be55b7937832dd33a72b855ba0bce28a | ORPH
   x86_64    |      host-elfutils-0.181       | NOK | http://autobuild.buildroot.net/results/bba9e189e97682ac6fecb57b4617e398c03b8aa9 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/b68d6cd15f23ba8a50bb6381ddda01b74ca6082a | ORPH
    mips     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/d0ef31a6189c121c7a33e8d40a0ebb973b4692ba | ORPH
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/9c898e129d710f923e1d8c45daf261a0f9f67fc6 | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/139b4a3f017fcde272549050b8e38e1c9b871016 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1f49376d13bfb1d774dcb3fc4830f2b264938e1d |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f606b48382b4a134307828c8cfd42becfd7baace |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bb574d526aec330d32c16397f98dccf5f9416bb5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b116b2f338dfd2b2879f4968d08bfd2862d71b14 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cc49207b4da04f23255838b920d68275991b20fc |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6a00b211852b9e28de72b1b982b4543f0490934b |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/559260065b341986bac149137798bed4e0f6fa21 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7b8c8652af988a6511d8f41dc3a4780632dde43e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/806966f452b84b9131f633417b84c7ad479918b0 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bd7a8857fbc2858ecdb884604ff211925bbb29ba |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/573358039bc6897862b996c74ce789a7161926a0 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/9dfade928e474b09d19edbd6829774b92bdd316c | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/ffbeea6d6d8c0a1e0bdc1cb7c5c0477f88c379e3 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/b0c880b54e18ee3e3dd2a4a21429fc1f525b4bcd |     
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/5ab0af47839ced6128f25ee4d90173963328ef89 |     
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/71cf4b14aeb3e49e84ddc34f755ef8fdfc17178b |     
    i686     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/29b9bb82c489ce0e1808dc1424d37ec121545e8c |     
    arm      |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/a149d0f7b21b48eb85ebe550c6948f3637065813 | ORPH
  powerpc    |         log4cxx-0.11.0         | NOK | http://autobuild.buildroot.net/results/ad87c527c1960a2bf6bffe9bc3ad80060ac2cf67 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/d95f6db71f4d8fa85c42eb2c43b282304d8e5a4f |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/04c8df735dab5836d009ed14a71a1378f50903b7 |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/38a2e27c5a122836e0d3f223690f434e4ddf0570 |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/c70fe1ae6d142af3ec1ce0b3fc8ba50e744b3bc5 |     
  powerpc    |         mesa3d-20.1.8          | NOK | http://autobuild.buildroot.net/results/cf8b1c4d4376034cf7092829bb46466079f0df3a |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/89993ee9cf7ab467d3619e5800e5f010145088e3 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/2a1e9c5915992739612e6b01477417b490aa53df |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/457f5dfcbf14043b11b46cc8b674c7640ddd46c9 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2560feb9ea51836a63c946c45798343431dd0bde | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1238c3ed70a6679b735f138c9855c304593beca5 | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/a79fcc955e75366fda7edecfefef5ea6ea9569e4 | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/38abc954be0c2382556bba3531fa11796dd18b4e | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0bdf1a2712156f31aafab0a345a6f1f04c46df0c |     
    arm      |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/ff0c44a9617128fd9c4c4fc16d8b153b2acfb2e7 | ORPH
  aarch64    |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/70ac3286863c51c7f71a33e5b61faa8759587466 | ORPH
    arm      |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/821fc4436b771c07d856c312da7a026d66fb6298 | ORPH
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/4581a79fa332c8860015f60944b6af45bf2fec7f |     
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/e2b172d64d4571efaedb5f07db95aa6f0eeb646d |     
   mipsel    |         qt5base-5.15.1         | NOK | http://autobuild.buildroot.net/results/4bd58853e2c775a617055208f9c5e0be60063eb6 |     
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/805387af14ff8e43ce78b6213f1c559a45ddd165 |     
    arm      |       qt5wayland-5.15.1        | NOK | http://autobuild.buildroot.net/results/1533d85cc0df06f30ccdd9a0495d5588b0de98cd |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/1900d9ae41d3976d8f9afd7473f8b3e33ff93493 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/f216e24801dc86650186ba9cee194db664109cd0 |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/7175b1bdec11af0a139d724c61212f8fabc04efa |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/2f08df0cc15facefc47e0b2daefd3bf3b51ab521 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/eaada055fd3fd9781ff61c35a481d2ddf281251b |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/ba562986c28c6f944ac679b5cb8a7521391b7a5d |     
    sh4      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b94441a7c285faba08e03407f44230ff9afec2b3 |     
  powerpc    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/102709d2b01ec0d1fc47b5df125cbe7a2e7cde38 |     
 aarch64_be  |        target-finalize         | NOK | http://autobuild.buildroot.net/results/c51bcfd29c2ee979765abbe7f0d85187ae945358 |     
    sh4      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/184b73a6b1fd8d6a407849ec949e6636f20730cb |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0c7b5fe2d7096b6ef9f552408990ebac74962046 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e2dd4af936707663fb42d438340224508a2d8da2 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2e0e8651e5353283532485986f4af9fc3472fecb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/56222a7bf477966b0b68b78d29ba0f6abc27effc |     
    arm      |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/bc4a8403ca2ec64a57b0d2321666badfab62faae | ORPH
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/93416ffb525d98611edc8f28537b0cad0a507ea0 | ORPH
    mips     | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/6db59121f8a7a827cf00a718543ed712ba79b855 |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/968d132f060e3204807443c6ba73f146d71c67af |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/74eeb347d7aeeebaca339c14afee740ee27e26f7 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               target-finalize | 2 
     dovecot-pigeonhole-0.5.11 | 1 
              host-grpc-1.25.0 | 1 
         libcpprestsdk-2.10.14 | 1 
 Makefile:753: target-finalize | 1 
                 opencv3-3.4.9 | 1 
        qt5imageformats-5.12.8 | 1 
               qt5webkit-5.9.1 | 1 
                      tio-1.32 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/128d61f81c6e8445b8e14221fe71b417584994e5 |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c7a50c622891177b14f8eb0e83235e0c5a0928e0 |     
  riscv64    |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/ccb93f7e76ece2ddc8789367e17d6154f89a8d01 |     
  riscv32    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/53829745bab643cee7b7bdb33a03976dcaf066ef |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/23daa81f83b082c02471068a3909dfe30d9b26a3 |     
   sparc     |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/58a6b3f765a3945d554656fd53e73816caab7a3c |     
    i586     |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/312c1a4baa822537bd7a027ba84d74c947a6147c |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2d9bdfb91f21d6dee1a9f86bac1334c3b412033c |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/dde096444ddfe882583b7bb5d6aaf5e85ac410c4 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/34f3b69526d32a3669984e44dcdd9c303df70360 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/171cec1de1d78f0549eebb69ee9dc306b76daf33 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

         libcpprestsdk-2.10.15 | 2 
              luabitop-1.0.2-1 | 2 
               apparmor-2.13.4 | 1 
              host-grpc-1.25.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
             libnetconf2-1.1.7 | 1 
                  luajit-2.1.2 | 1 
 Makefile:753: target-finalize | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.14.2 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/1a8fce487f79ae9b02ad0ab621f838bf6942b617 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/558b0cc0ca2cf2288d81bf9d2094dcb2e4bcef04 |     
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/7e4a8e249f79270150624eff7b9eb83788d14a56 |     
    arm      |     libcpprestsdk-2.10.15      | NOK | http://autobuild.buildroot.net/results/e4a2fb47a8fd101fbf92e3041ba1bfc8df9bed2f |     
    arc      |     libcpprestsdk-2.10.15      | NOK | http://autobuild.buildroot.net/results/1ac8b5610fa7491c662e5f9d257f8a85068d50b4 |     
 aarch64_be  |       libnetconf2-1.1.7        | NOK | http://autobuild.buildroot.net/results/2be8b4c60a618ab58590c1fe2d470efa06f6460f |     
 aarch64_be  |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/d3d1570de8c527e35a23bc6e1ce3733926d2fbb0 |     
    arm      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/a901a9a620caf652846cc0fc260e019e729ca419 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/737e5350acc6c5e3e2f1c945e0f2f3460d833720 |     
  powerpc    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/4fa477a9154201b20d7789efc5501556ba74a0ca |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/8d133ab15b77dba948218bee7cb3ad5d6e746219 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/27d600f49d845c230476198b9785955cf13eb4d7 | ORPH
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/8c56fb25d1a52df90ca3a8a3f5b5010c70213c50 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c6afe3bae3d8c9a747771a7f508cc04caf9aeaab |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

 Makefile:752: target-finalize | 3 
               apparmor-2.13.4 | 1 
              host-grpc-1.30.2 | 1 
                  luajit-2.1.2 | 1 
                minidlna-1.2.1 | 1 
                 openal-1.20.1 | 1 
               target-finalize | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/e11f3f805ccd6b25d26cefad247e651f27efa4ae |     
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/0715163b733b07f5859932c4d7936713a9b16343 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/6cf5f026e83dd6352d43db1cb207d06b8c19d122 |     
 powerpc64   | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/1225399e6de37416b11d6f4266be724006045afc |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/1939d976d1fed3fe0e2c70900e6784d9688cb44b |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/dbca6153df58eda2c9a2c3bb4b313da34082cdd4 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/c11627a716848007d02186d51ebd5a700da83ffb |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/48b2a338ac848f75becc4a4c3c6216609adab0cd |     
   mipsel    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/0c8382a23253c0388860c4c3f02dd455fb25e69a |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/d59b0599761f4751aa441aeb13c35c4875e6408d |     



-- 
http://autobuild.buildroot.net
