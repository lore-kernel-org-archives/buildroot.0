From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Aug 2020 07:57:08 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-21
Message-ID: <20200822075716.A332E20395@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  5  |  0  | 23  |
  2020.05.x  | 20  |  3  |  0  | 23  |
    master   | 144 | 56  |  0  | 200 |
     next    | 32  | 27  |  0  | 59  |

Classification of failures by reason for master
-----------------------------------------------

                qt5base-5.15.0 | 8 
              ibm-sw-tpm2-1563 | 7 
                     avahi-0.8 | 5 
                       unknown | 4 
                rocksdb-6.10.1 | 3 
                  assimp-5.0.1 | 2 
                  boost-1.73.0 | 2 
                   eigen-3.3.7 | 2 
             kismet-2016-07-R1 | 2 
                  luajit-2.1.2 | 2 
                openblas-0.3.9 | 2 
                  zeromq-4.3.2 | 2 
               apcupsd-3.14.14 | 1 
               apparmor-2.13.4 | 1 
                coreutils-8.32 | 1 
  gobject-introspection-1.64.1 | 1 
               host-go-1.13.14 | 1 
               libtheora-1.1.1 | 1 
            live555-2020.06.25 | 1 
              micropython-1.12 | 1 
                   ncftp-3.2.6 | 1 
              netopeer2-1.1.34 | 1 
              python-pyqt5-5.7 | 1 
                 rsh-redone-85 | 1 
             stress-ng-0.11.14 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c76c9ff787aa983bfdf5e8cfe3f013e9689b291b |     
   x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/fc512a8a8dbbbd364c3881a838d78b7332c7f9c5 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4c7ed539efe066950342cf9e1c28359d1a41ecd4 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/6d267a8985b143f9d4501c1a31cb718c2f937fe7 |     
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e946710c44a4b981af82170d5691cfcb44aeeed0 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/73d11a5b6f3cc9a3574655cec3e74e4a5f65f445 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3774819959c1408e9a4e79f202ec64fae46aa552 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/179f6e67ad6da868e8ca37f28306ae27b38e60c3 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c780c3d21fb7d9dc1e53195017281e131c6b1449 | ORPH
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/3706d7a90374dab96e1cf662bb03925372b2caee |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/4a0a0a7e6c681578b49627187f16bc6d26efbe32 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/d1e6fdb0e1e69b35ad2e8c3c64333060d309ffe3 | ORPH
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/d8f4550a914cd27b3588e1b9e3b8395d3bb1f1f5 |     
    m68k     |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/97a551b72737ec2c2b7cf4c69f3a6b6cad147e9e |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/78a7741e61c9f5d9e0e332ef945557b18a1d2696 |     
  mips64el   |        host-go-1.13.14         | NOK | http://autobuild.buildroot.net/results/1085fc8280d4968f8768ae80ea53f9256440c9d7 |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/153cc8607f37f6abc1e21d6e688908afc3ecaa86 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/caf45d5cf2f4d27e3d1685c5665bdcf2a8bb5977 |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/86f1d9e05f4aefd2fa4ba6b4ff41e90b546a63f4 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/609c28881a08604ee4aba9d462654f846ba77d83 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/902e9b78fc03b72a8ec7c71652f454dc2d1db9ea |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/8aa088fac545d59c3ad045128b25e8ece88f6a52 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/cfa12267556c651a9bd10f9bf312fbbf3a02729a |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/e232d8e19f4368f4b410c2fe434cf32dd6733c29 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/106d561c893ead85ee0afc6fe08222c843a33fc7 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/24e967bde5663bb0c2ddfb2559905a21a809a0e4 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/12e658803d2ff682a26abb863e4d332e6487e0ea | ORPH
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/51577719b57aff6a433135134cd79d04e942f1af |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/fe293dbba33a554127bd31b8dd0f528e3a9e89e7 |     
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/3312bf849852a7ad4f2e2c4eb47e6b3af9fdb16a |     
    arm      |          ncftp-3.2.6           | NOK | http://autobuild.buildroot.net/results/78822bc0e0039e8f8949011a256cac022863276f | ORPH
   sparc     |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/014802fd0547646943d57edb4e42bfc95c3c7975 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/370a2187169fb3a673e6387e2d6ca0f52b68288e | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/40fd8f348017d41814f86481989fc9c94d1d28df | ORPH
  aarch64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/3c2af4006dc32300e716b9bdffc33999e0d82943 |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f11a574b40e153738f9e756b9ec9e0159e9aab8a |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/e0bfc194d61faaddc44a67e15390aa789dca2bd6 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/d3374515a2e578094eae9c863a7a0046d67e7314 |     
   sparc     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/72c07dc387507b4d2d4d92e993d6f6c9a23b8457 |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/6e8eb4de543bfce5d7ecb817518dfcea18a00be0 |     
   nios2     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/29f925d82ed306d4a6c6f06bd8542eaecaf63031 |     
   nios2     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ba009ba7228bbfaee8faf9685f425a0e52bb7110 |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/abd956d2ccc3be1a622eb6e013a5711246415181 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/7b743490044e32f6f3cd723fff71515651db7dd4 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/51a23fd16b330932d69d32c3138c11c54aeba42f |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/16f36941d1fb422b07e2426be8e803dc558d2297 |     
    i586     |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/b3edaef35468f520c20d297eea16c5396f1609c5 | ORPH
   x86_64    |       stress-ng-0.11.14        | NOK | http://autobuild.buildroot.net/results/3fc5e140f9b51c50d11cb47f9beffc36e6957c40 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/491c8d803f266ebbdb8c7d6209b847275f56e5c0 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8db6d8074f5aebe5c9f37878fb19eb31f9d2daba |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4ef7170f216e731f41c6224950d1e80e483ee1d1 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/f4a848683e93d9a249e033d7e1ad0380ab419cf4 |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/024fa2251e72b25a41ed30e5e0c56ef2db055845 | ORPH
  powerpc    |        wireshark-3.2.5         | NOK | http://autobuild.buildroot.net/results/203cd632f5f4d1b8912613bc14b6a99f1c0b1d6e | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ccc41f062f7a19a23df12b570cb1c41e6768ca0c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b79b1959402678cc5d5a1af3b42a2090e568ceee |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
               libtheora-1.1.1 | 1 
                   mimic-1.1.0 | 1 
               protobuf-3.11.0 | 1 
                    wampcc-1.6 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2f5f244db4c445e80fa3a52111c652de95917cf1 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/333b3388c5ff6141aa7c2d6be57cb8710b1dcd97 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1800aa0fab376d5e474088763cb0716228667b9c |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/d7e2a6d8c45e1cc1e78f40bdc427c5fddc5d450c |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/ea3a23739ce661f3661e958ece6d4ed81fb18c65 | ORPH


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               belle-sip-4.3.1 | 1 
             kismet-2016-07-R1 | 1 
                       unknown | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/7250029d6e979efc5c6f62c84532eba1dc3af334 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/cb837921baa369152885c4c64da50f49fded96af | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f13916166248749c56980953bbeecf1edec63eb0 |     


Classification of failures by reason for next
---------------------------------------------

              host-grpc-1.31.0 | 4 
               domoticz-2020.1 | 3 
     dovecot-pigeonhole-0.5.11 | 2 
                qt5base-5.15.0 | 2 
                       unknown | 2 
                  assimp-5.0.1 | 1 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                   gdbm-1.18.1 | 1 
                 gnuplot-5.4.0 | 1 
              host-guile-3.0.4 | 1 
               libglib2-2.64.4 | 1 
            live555-2020.06.25 | 1 
            lttng-tools-2.12.1 | 1 
                 opencv3-3.4.9 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                rocksdb-6.10.1 | 1 
                supertux-0.6.0 | 1 
                    wampcc-1.6 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a2a931fdd51508d1fc0afc54db9231fd4e2bb9a9 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/b7668c7265feee6423c8f28398eed2b0d9796a50 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/05c20cebdf94625bbf9096ca7e2f1d33b2e834e0 |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/c7176e78e606ab302955a98337093fb1ff5ba381 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/6997227c8ea132ac9ea49e131140d893ef61dcca |     
    sh4      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/0e780c91b246ed809e494873fa3a390405d29960 |     
  mips64el   |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/00f05c125e1f1de723cd7c80abde758992df3779 |     
powerpc64le  |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/6be8e1ab64656baab610f973bce9252f36c500b7 |     
    arm      |          gdbm-1.18.1           | NOK | http://autobuild.buildroot.net/results/a8e02fdb5df6167876078eacac463196815747c6 | ORPH
  mips64el   |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/d92010567450f780e9ef25381782ac0b76cd7c15 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/c913fa5f07f3a4c9eca5442a6cca260bf97836da |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/18821b39dd9f70fe1c6230625b35c5c736775196 |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/00270ccb6a6801c285c7c31fc94c9ed89deb7188 |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/e9713074107056a5eba958b43b81e06939b796af |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/9dd5677bc90e105d3e6e43bac9be3be46e65d43f | ORPH
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/d2aca20d788b2ecbd8e9af425dc4b89f5b427a80 |     
    i586     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/2d9d1d1cb90f709cdfaae045dc7adc14bc7ee18f | ORPH
   x86_64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/ecbaa497a31fbfeb2505ac6697ab352f8c2af3a9 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/65d9ae72790b7b740bb6cc17a959cfb998864d73 |     
    arc      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/a47ef5381380e599adb33b2e873caf0f92d1c87f | ORPH
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/72a33aa59b5e159fc0eaf1af992f91be8690a3b3 |     
    i586     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/aa7410f9671528f112acb43073142170f9fe1ef7 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/4162582b1db40e78333d11555bda49f2cc9a0b01 |     
   nios2     |         supertux-0.6.0         | NOK | http://autobuild.buildroot.net/results/5e16aa1587bee12a85548ae80f0c6443b0faab9b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f2d5a8a76ab9c5c970ac25980ea1e5bee3a6f8b5 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf7be25440c87db3ae70f20e35c5115c199bed1f |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/4d90c97aeae6c0aa230394afbb1d944e9db74291 | ORPH



-- 
http://autobuild.buildroot.net
