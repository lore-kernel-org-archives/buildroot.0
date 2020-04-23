From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 06:27:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-22
Message-ID: <20200423062741.DC19288281@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-22
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 29  |  7  |  0  | 36  |
    master   | 154 | 130 |  1  | 285 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             paho-mqtt-c-1.3.2 | 28
              ibm-sw-tpm2-1563 | 16
               apparmor-2.13.3 | 8 
               apcupsd-3.14.14 | 6 
                    brltty-6.1 | 5 
              host-grpc-1.25.0 | 5 
                    mpv-0.29.1 | 4 
    python-dataproperty-0.48.1 | 4 
                coreutils-8.32 | 3 
              gr-osmosdr-0.2.0 | 3 
           host-nodejs-12.16.1 | 3 
                 jbig2dec-0.16 | 3 
                 mesa3d-20.0.4 | 3 
     python-argon2-cffi-19.2.0 | 3 
                  rygel-0.38.3 | 3 
                 gnutls-3.6.13 | 2 
     python-mbstrdecoder-1.0.0 | 2 
                    strace-5.6 | 2 
                      tio-1.32 | 2 
                   uacme-1.2.2 | 2 
                       unknown | 2 
                  assimp-5.0.1 | 1 
               asterisk-16.6.2 | 1 
                     avahi-0.8 | 1 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                        bullet | 1 
                    gcr-3.34.0 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                grantlee-5.1.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                       iwd-1.6 | 1 
               libtheora-1.1.1 | 1 
               libupnpp-0.17.2 | 1 
        ltp-testsuite-20200120 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.4 | 1 
                 rsh-redone-85 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.5 | 1 
                    xen-4.13.0 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/38477116d1ad74d61fca54802b13733c14763bb6 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/67fa302a89280de7e74c0f5f1bd063a617bf394a |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/adeec485387e896153ccbd786ed0d0094f52b23a |     
   xtensa    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f633ee1210a48cbc4063a08c26d7435f16f056b3 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b6fab9d74ea20cf7ac873643f37240177d4d78a8 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b682a1d13527ba5611f46933a17da9eda63ffcd8 |     
  mips64el   |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/28caa36c702674678d67b63a70cef95b1e993275 |     
    arc      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/231a17e6664ec960ab1dece26cd9d7916128d363 |     
   xtensa    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/24fb54bf4eb9ba01d968f16b07a7a065da305998 |     
    i586     |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/cf9b8eb63e8abd29cf443248062c6f5761b18162 |     
  riscv64    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/487bda72d1146eed1c1fa2adcca9b0bc3b8509be |     
    arm      |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/b76cb71dc19a02077dd9ee8cbaf9f912379ff3dc |     
   xtensa    |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/16aaea5117e74904b28c87e612728e339b049089 |     
  mips64el   |        apparmor-2.13.3         | NOK | http://autobuild.buildroot.net/results/bbc0a914be5a8cdd792cbf6dd053ca8d026658e3 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a7354f3cdf25f1a754547eb9d120538ad1ed0fdf |     
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/ec79e3305e8b990f8d08c85bc761a2314f8af49b |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7e89e398f80025591ac96e1a37ea8d50163a80aa | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/bc4b60471983b94e62dc3492cea3bbde90d6a773 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/f1704df9d08a101996a9c89e5d778c7d43d1f75e |     
   x86_64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/6109a7829ba6b16794617a83f40e7aab69fc3f5a |     
 aarch64_be  |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/5f1fe8c18cbdee77eb55725a5d602913452d0bc2 |     
    arc      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/7e5756b7db986faf4cb6db77d280bba4e2ff33bb |     
    mips     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/ee32541bae8acc614037824c027e789a3dff0d27 |     
  aarch64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/84c781d5db14c92ce5c32a7c2cd68461d19f5b10 |     
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/2a9ca5380b5bb8c5b45a7467bc85bd061341cc1d |     
   xtensa    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/593c9cdb93d66dc974d5134d79f0b63b1ee15134 | ORPH
    i686     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/662e05aa77cc015e8da7eeb2a1cc10d40e020e11 | ORPH
   sparc     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/fa4b3a00608830bfcca5adbc0590742a7e0e6110 | ORPH
  riscv32    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/4a76e8bd7f1972793749621983f1baecdf9dc8bf | ORPH
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/41e511b3719e249256125e0e388aa8e8b10db0c6 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/0a004b734864819cfb787aa6262a60577baa3aaf |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/9d27338128a968ad47dfeaac1a78e72d43d2a283 |     
  powerpc    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/69ea39eac0f6e538c546dac0f68a8b08b5bcf195 |     
    sh4      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/413756a1d255dd9e147ccef42e50a99e88ad2d76 |     
    sh4      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/788c222ec0b2ed60e208d8896a4e56504dd745b1 |     
  aarch64    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/1926cefbe3dad9f1976234bad6dc627be7977fc1 |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/4696987b3a9cb10b1f600f767a4892a791c14075 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ea9f8e145c83825fe23212cd53234310c1608e38 |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bb03b96effade8c1d4d3fca84300405379fa744a |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bfb876090d95d54f6f961b11b95e1b4942ae4a05 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/27e9dfd36a24fbdd45c2dfbe653fb2cad9717683 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f1e22ed8bfe522e6ddaa3a4597ac0046294d8cbc |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/de68a1c7844b2bb84bb7bef1324999e7041c6916 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/ca893bb749cce451faf942f41fc026f3096c2a68 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/aae09e5dc894c40e6c6527f932a89a6db42e5efa |     
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/e6598f8be096896056ffa0ca6bec8c90f3803d9e |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9d7097b68d08aa3d826c9614eb869c7a00576c61 |     
   mipsel    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/414d8c7f6cfc50d676e6a6140c53a7c0a2992672 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c68f32eb17095d1bf635bc900137d6ea59d688f0 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2d9e044b1a027693d08e4e2c12a0aa6f58b6bfff |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/4dbc9f5917187b8f5a1f0077bc0cdfe0c37e032d |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/93a805a1cc76e418c604b979d18e1bff3b37ea73 |     
  mips64el   |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/978be0b4e368eac21e099ec7c26c84acb2192298 |     
   sparc     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/7cda54d6c4a23fd130221b9a477727eaa7f29015 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/49463902723bb064be69520c9e23790a98ee3591 |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5744ee4fde6112c782e5dda0cc10d89197381958 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/385f276b2603d431396410101c239961ea3fc0e0 |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fcb618f0bb90144dbca1a458a2a39578ff9e06d5 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/0235593bb811cd125d12b9fc0ad9f2310d122944 |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/452106d5aac06d5697d3faeec67c6bccd3e4a5a2 |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e870904b594a0f3535cdb035b7ae07c6fe66bf3f |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/61a3a9b98fe7688ca42dbadaa2811959fb445498 |     
    mips     |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/5216b326246f09e7711db044dca650b005a554b7 |     
    i686     |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/cf75a05323282d7becfd4ccc921ef83f8264627f |     
  riscv64    |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/7449ba4c7d80cde2f3833d4f7ede1a4c6ad3b997 |     
    arc      |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/ad155949338a55385510de1e14df57f0b320a3cb |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/484b2ee429ffd4a37ddb71d24b155ce1b0655d53 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d29b03265bb83d3175fc679674e63a5782441547 |     
    arm      |     ltp-testsuite-20200120     | NOK | http://autobuild.buildroot.net/results/57e8d2a53f99dc804d66482f71653957fd1a6e47 |     
    arm      |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/f0043cd46fb58f106363af503e1516d0f6c01afc |     
    arm      |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/1b783a5bfff60267a058e4960b5dc934dfdb86b6 |     
  mips64el   |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/7d90e3c689ce8e9e6e5f4dd848b616f33896df15 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8ea68907e35691de47fd34a681d503990ab19b09 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1e9c56a773aaf185f441397c89cf476c6161f1e4 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/60b8fcbbc8754dd4f24d6e236b77256e7c2b5b59 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ec457908f83224b39bcfb602643c37d31a70d5cb |     
  nds32le    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/fe3d22144dd8304a843f334834136efc4b159cd2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/01f5a30c796b3a6cec61aeacf88ef88b2c1003aa | ORPH
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/6d133f8a3dbb7be106a01ea5647cf84d23d2eea5 |     
  mips64el   |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/2e0ef7885f3daf56fa8944aa28e1ce62efa20970 |     
microblazeel |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/370d8fcb52c7ce54a9ee26714172266608f9e254 |     
  riscv32    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d50255207e53c2a93b061ecbb60dc754f4eef0f4 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/b1e011e71488382b1c347bdf6ba6e860ee86e1c0 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/f0dec3973d0d761c015ad24ce98359dcb79b3d32 |     
   xtensa    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/39aac1c5aed140011231cbae8c6b48658cfe355d |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/563a27a0ed5dbd8dbc78f55eea09269690c047fe |     
   nios2     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/7ea1791778053613e9ef6b146dbd1992a0f63dc6 |     
   sparc     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/8ceff84b9b1b68a38de81c55b3bd5ea8c301c6b6 |     
  riscv32    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/a293f76a010efeb8e9de38f496e00a0804e7bb6b |     
  sparc64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/4ad90e6da48a1141da6d65ff4d93b320ac12224c |     
  aarch64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/40146ad1e340f6e39e9c3c6e59a67d652a51510e |     
   sparc     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/cea64d00ada351292ecf3dc362afae6368bc3c1f |     
  sparc64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/19ca21ffabf2ea6f5335dc7321ce659159426695 |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/36247c8cd04a95298add32ed9d456b81f0ef68db |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/fc30715de5d44cc6ba998518e517bc07630700c8 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/864830f4c6be1b90086e95a6f651cbd7aa66a450 |     
 powerpc64   |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/9f06eaba41dd55ac0036900c4335fd113707cf61 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/0b830f103c37940f1afbe2c8563ba131168259e0 |     
   xtensa    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/f5b7ae7200417cfa29a6491a7dbc1260fe0475b3 |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e54d4db75cad478f42c4fb591c907b094f9ceb2e |     
  mips64el   |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/dacdf9fe3256b780d1967f2c65b212884bd8a700 |     
    m68k     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c35694f391de06e59a87f68588d94eca3f0bdbca |     
  aarch64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/7954f9ffb65887cf1242b1e2f73f98d4647c015e |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/057df43e4b7cf7f71fece6890a65b65f412442b5 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/a10810c9f2b8e3903d11efc095f05003c1f3ea89 |     
    mips     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/3bdc4d2de9112b73bb52f65492c40cee2d2404eb |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/198b4a588bddbe8baf93f1286d7ee0289f2ba002 |     
  riscv32    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/6927c51afe606d7113b4656b38bd96aaf4662bcf |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/479b0bb31886a2426454d4a4608b92b8a3bc5354 |     
   x86_64    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/69fdf989d582a9f9a3136cb47fba2f8e8af89e08 |     
  powerpc    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/34e83927da755d440af0cf6b9fd44384854a311f |     
    arc      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/d0edf203d5200891e395b818270251e0a6d7a69e |     
   xtensa    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/7ead64852147656354d5e90a0d08aaff70a9f144 |     
  sparc64    |   python-mbstrdecoder-1.0.0    | NOK | http://autobuild.buildroot.net/results/324dc351752d412a315955faf69e8f5637e75123 |     
    m68k     |   python-mbstrdecoder-1.0.0    | NOK | http://autobuild.buildroot.net/results/a09031b25563222a31e1c131452f6d38db6169da |     
    i586     |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/3a8eacd1189de57bd6e6df01562ae59ffe3d9056 | ORPH
    sh4      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/d6aa9aee6a2c2d52a20812b1182370facd0e2c5a |     
   sparc     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/783c8a617cd0953ab61576a5a787a1cc5686d041 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/2dfd5cf3c8c39153778cb3e71fb4b136a2730041 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/4a6f11acb8bde96eadbca4f8001e5e841e128799 |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/db312545ba5d1d7941e2fca3e4b5a74211f66d67 |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/4b6ab6ae6a50fc6a7a8faac0bad4df058aedbb61 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/30df549436efab19f37d80d13bf0afc9fe544733 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/5a8862f680749e1c870204f3a8f70d24914dc3ae |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/9259cc922a0f976bd4446a966d64c3c5a691cbe2 |     
    arm      |          uacme-1.2.2           | NOK | http://autobuild.buildroot.net/results/2642656ceea6db4d9f27ff988de6cc478066c1a9 |     
   x86_64    |          uacme-1.2.2           | NOK | http://autobuild.buildroot.net/results/5d42189299549cd655218e9e7cfcfa63e79f74ec |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/378c5e9eb7644d979d72061d7388450fc14bf973 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b81b0443065eebf0b59703ed4654242e3bcc7bf5 |     
  aarch64    |           xen-4.13.0           | NOK | http://autobuild.buildroot.net/results/0663283a79654bb8ec8ea08cab7cf61fee09c97c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d49218eac1620627957bbfcb8cc6b729b2c7e4af |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boinc-7.16.3 | 2 
               libglib2-2.62.4 | 1 
                 libidn2-2.3.0 | 1 
                 mesa3d-19.3.4 | 1 
               mongodb-r4.0.12 | 1 
                qt5base-5.12.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/6c6b7670bd97c09dfd4b3f5820571b67a21aba9c |     
    arc      |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/8380a3ebd42a6efe4f3d9aa4e00d06673f8d1518 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/11453073385d65228dc1717a0c163e0d930c9544 |     
   x86_64    |         libidn2-2.3.0          | NOK | http://autobuild.buildroot.net/results/cba9bf6ac4f29df6e34b820ea1b04ec42b5223d5 |     
   xtensa    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/6a852d711971169659e2190d670b5c4d5be3b4c2 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/37f71a1f8ab6104f791ddcaefae5998f312292ca |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/8127b4a32f5bcfb2ea13d999fbdfcbedd1186060 |     



-- 
http://autobuild.buildroot.net
