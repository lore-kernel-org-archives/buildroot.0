From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Apr 2021 04:43:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-12
Message-ID: <20210413044355.7FA6C40567@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 39  | 11  |  0  | 50  |
    master   | 150 | 72  |  1  | 223 |

Classification of failures by reason for master
-----------------------------------------------

         s6-linux-init-1.0.3.1 | 18
        host-sentry-cli-1.57.0 | 7 
                  boost-1.75.0 | 3 
canfestival-7740ac6fdedc23e... | 3 
                    ffmpeg-4.4 | 3 
                  monkey-1.6.9 | 3 
                rocksdb-6.13.3 | 3 
sconeserver-6b932d7d8dbb700... | 3 
              skalibs-2.10.0.2 | 3 
               apcupsd-3.14.14 | 2 
  gobject-introspection-1.64.1 | 2 
             host-cairo-1.16.0 | 2 
                 mesa3d-21.0.2 | 2 
                 samba4-4.14.2 | 2 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
              fstrcmp-0.7.D001 | 1 
                   gvfs-1.44.1 | 1 
                libkcapi-1.1.5 | 1 
               luasyslog-2.2.0 | 1 
                  mender-2.5.0 | 1 
                         mimic | 1 
                    mpd-0.22.3 | 1 
              netopeer2-1.1.70 | 1 
                 pixman-0.40.0 | 1 
                 rt-tests-1.10 | 1 
          sane-backends-1.0.32 | 1 
                      tio-1.32 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3731059321069a4a48ddb7eb9861432583cf42ff |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/633f5200816820de85389b08f9a9eac7e12a71f0 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/e892ffa4209255ebbcf32f1c9803d3ef192d4b82 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/5ce334c9110ee8923f6aaebbd28a937847348889 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/4c3d4196fbfc69ecbb7e2aa032c25a867c3fb7fa |     
    arm      | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/3e7e738f1bbea8015f34f2e5f7e0ac9753b49df6 |     
  powerpc    | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/7db31eb481c3fb2ceca3c5057915d3b78f93ddfe |     
    arm      | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/5034c7b5be40af4f31eec8a529e5a781b9068097 |     
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a1efc0b907cd79faff4d500bae2f8d99ccbab045 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/38da408f3097887e6f1b83a90d0b5ce466765b52 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e7d600f23d5f3089934372655ffd6063a2a40764 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c377cfeaddf6838986234bb8795f8541923abbc3 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/189b16644655d73e4a3c9221c5e314e7dbf81ac1 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/3b9add357b460f8e266d6ec645a504fb741258f8 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/13080066ba8dc36bdbe66e29dd51e340af9b53ea | ORPH
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/fc665bfa7baca5017ba34e6543569d783d8ad38a | ORPH
  sparc64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/3cb729dab611fa5b0e94aaf4112627d56ca427cc | ORPH
    or1k     |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/894af123e2305bd0d67c20557b1b2a9cc47e8b05 |     
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/b73e572e4df81147f42e15e3bc03e3d5566033a8 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aeafff6dec8970eeca563e41c0e04967f1719389 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a087f10783f04ff041c0ad6118d277b3c29e1e3f |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/04e44c63d429aaa010adf26f8fc86a71b2286577 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8a534c2673d76a2049e5c11a6fcb913115a5bd28 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fd28a802640a887da7107a818acfd8eeb8c7fa99 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/59ae5481644a7dae000313bda3b3eef3bd0359f7 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b3e09435540a122961cda29e8e1d9ba3901d95f4 |     
  riscv32    |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/70ab7156199a34f53746e51d1a8114e45bdae917 | ORPH
    i586     |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/677b3b2406db7eec2f8f2717440632a4fdc2d0c8 |     
    arm      |          mender-2.5.0          | NOK | http://autobuild.buildroot.net/results/12bd646fb68c95916e145183149447c49d4ec099 |     
  riscv32    |         mesa3d-21.0.2          | NOK | http://autobuild.buildroot.net/results/328c77d02d625e9157ebf2a169d17a562eea0441 |     
    m68k     |         mesa3d-21.0.2          | NOK | http://autobuild.buildroot.net/results/f8d90cb6a8a79070ce8e95f590c07752cce32f56 |     
    arc      |             mimic              | TIM | http://autobuild.buildroot.net/results/d387931e1dcb35d5d0e0345a5a92228ba9b7eb81 |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/46f5daa94f7e37054ae687d42f8a01bacde2cd53 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/8c642f258f2ebf3778574fd61f639daf13c3090f | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/61c9e90bdd2f7cc62ea7f939aeb4cd6f77a14b38 | ORPH
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/9685d0450bf85e256f7652fe2538c9233f073b24 |     
  powerpc    |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/c516d3ba347d6202152969155e99672d7cc0a13d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b06c7cd474f191fe92872b0657fba24bb8d966b6 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/3b8bcf0c20a2155046501b22381886e6b836a0b7 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/a26d1a571dbf0f1fa1d5f812af1ceae090ce5bdd |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/7a137188abff1fa0f67c0bf41b899f67ff9dc989 |     
  mips64el   |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/bc8f987f1505a4efb78059143657b62edfcc67b3 |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/52dc0602cb2070c2e5b3cceacdd14d8acd3be38a |     
   x86_64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/7ebe0cbc5b18aae919c5d8492f3eb6a4916345a7 |     
microblazeel |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/ee39a939655d8a7f10104c0cff9dbf5f159508b0 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/d6656cb421756ac04177daa44a20d88aa0f8e9a2 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/a8c2052540019ab0954a8dd06336388ce9f103c4 |     
    i686     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/62271db8d04332637a7c4a3dcca1021905341c07 |     
   sparc     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/22a636deeb1436cea407695b5b758b7d3bbde28a |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/969f6f337f995be0fd4e72ca8d964d8aa9520a54 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/1ee63d2233a53ccc1e9537be29bd2c8a35df75b3 |     
   x86_64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/08731b42a361d9d773bdb42eff95cbec3981f402 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/31d0180bdc0493d72dd41ec9a38bf9857a014697 |     
   nios2     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/39cd69c041befc414e6e68df36425f5e43fa5cc4 |     
   sparc     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/eeacbcd2fbb351a6c8bc4bf828053c8e92515b60 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/322d25ec54210196c8cc319b1f19c9e4116f11df |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/6335fa08143a52c8d2bf4fe0e7e510c5ce4ec0bc |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/62570fa42392a52595479612c6d1fe1ce78b60a5 |     
   mipsel    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/438b4388d93b44ab1755bbd82f8d2bc2f38dc62e |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/527ccb688e725c1ae315a3acd54f8d0ab0a884ab |     
  powerpc    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/4aa499fac5f7ce81f300ef49213fed675ab1a304 |     
   s390x     |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/256337260c267515c9de8f0a661b32d0833cc80e |     
  sparc64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/dd1ed33886f822f3ce51dfa6db9e2bc3f45286e7 |     
  riscv64    | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/60547757f7f67c94b1e45d44aeebe2ac51e68a5a |     
   nios2     | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/5468f9f416e9de76fbc2b2986a6c8fdf253a2dad |     
    m68k     | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/9e6e2b9bd3b6828ba36e08634971e6e9d8b24439 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/8c8b41db50a2e1e0a7cd4b9fa46b689872d89851 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/67b8dabdf158354543205d515ceaf332b74b3da3 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/9c8a4fa70930cc64213ade189db1f027d684b9f7 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/231ea511aae1a675e553d8d0b1c169bca680ef5f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/957c350b35201fe882452e835d8ea95f6f091a45 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/65eb215571f24b6bdbe0a615f48342710a41110d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/358ee9f6d9a6b271053ad3869292f37ee7ca88c6 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
canfestival-7740ac6fdedc23e... | 1 
               capnproto-0.8.0 | 1 
libcamera-ab72e6641c56e876f... | 1 
               libtheora-1.1.1 | 1 
                 ripgrep-0.8.1 | 1 
                 samba4-4.14.2 | 1 
             util-linux-2.36.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/1b7b882eeca9e98a3f2bcecd7c9f1282599e81b2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/02b587f8f096f92bdd704fff9ac15d3f1a686dff |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4442da90b348cdb528a27f0abca1023b3f14487c |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/611cbbd6a0d9bd8afe75955777d17b4057ebedf6 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a54956e7da25da4e9d4a53be50ac76f0c9c1fa19 |     
    arm      | libcamera-ab72e6641c56e876f... | NOK | http://autobuild.buildroot.net/results/53862686f2096eb4c5461a059321b55347218995 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/bb403ae611a3924a59ef40aa06266313468747d9 | ORPH
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/13ad310c0da259811ea32d7e54fe459e1c2bf292 |     
 powerpc64   |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/bb16a860dc13c783194c7d6a14d79724097db2c1 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/460c689d328c4ce44f860efacb308de1f8200b15 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8731786b6edb27937055bebc35ec258dbbb24b1c |     


Gitlab CI results for 2021-04-12
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865410  |      
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865192  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865196  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865199  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865200  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865201  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865203  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865205  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865207  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865209  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865210  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865212  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865213  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865215  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865218  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865220  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865221  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865222  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865223  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865224  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865228  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865230  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865233  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865235  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865237  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865239  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865242  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865243  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865245  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865246  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865247  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865248  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865250  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865251  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865252  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865254  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865258  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865260  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865261  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865263  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865265  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865266  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865269  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865272  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865274  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865275  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865278  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865281  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865283  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865287  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865289  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865290  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865292  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865295  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865296  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865297  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865299  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865300  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865301  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865303  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865304  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865305  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865307  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865308  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865309  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865310  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865313  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865316  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865319  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865321  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865323  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865324  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865326  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865330  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865332  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865334  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865335  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865337  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865338  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865339  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865341  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865344  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865345  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865347  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865349  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865350  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865351  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865353  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865354  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865355  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865357  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865358  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865361  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865362  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865363  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865366  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865367  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865369  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865370  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865371  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865372  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865374  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865375  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865376  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865377  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865378  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865380  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865381  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865382  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865383  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865384  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865385  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865386  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865387  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865390  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865391  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865392  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865394  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865395  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865396  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865397  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865398  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865399  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865400  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865401  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865404  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865405  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865406  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865407  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865408  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170865409  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1170864950  | ORPH 



-- 
http://autobuild.buildroot.net
