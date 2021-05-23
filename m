From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 May 2021 05:45:57 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-22
Message-ID: <20210523054602.CB64E606C6@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 23  |  9  |  0  | 32  |
    master   | 115 | 45  |  0  | 160 |
     next    |  5  | 21  |  0  | 26  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                    ffmpeg-4.4 | 3 
           host-libcutl-1.10.0 | 3 
                  boost-1.75.0 | 2 
                  lvm2-2.03.12 | 2 
               pipewire-0.3.26 | 2 
                 pixman-0.40.0 | 2 
                qt5base-5.15.2 | 2 
                      tar-1.34 | 2 
                       unknown | 2 
                    vlc-3.0.14 | 2 
               apcupsd-3.14.14 | 1 
                   bullet-3.09 | 1 
                 dc3dd-7.2.641 | 1 
             host-cairo-1.16.0 | 1 
        host-gcc-initial-9.3.0 | 1 
                host-go-1.16.4 | 1 
               host-llvm-9.0.1 | 1 
               host-qemu-5.2.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
             libopenh264-2.1.1 | 1 
                 mesa3d-21.0.3 | 1 
              netopeer2-1.1.70 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
            qt5location-5.15.2 | 1 
                   sdl2-2.0.14 | 1 
                   strace-5.11 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4ac8a144af2c7e7dd22c57a77942eaca42d66935 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/4b7c778af32af4dfd6027c1035e7a67752f7fbb6 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/726313a3762344e3b030709f56be5fbb95f6fd24 |     
    i586     |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/c25388fec88adfa7be1b70beee0fab135fc30c40 |     
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ed6b56cd544afc00a86a17c1aa6045d73f4fb802 | ORPH
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/47f436a3591d0aa82fee56807ec049194f9b8fe6 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f263c4e4c0c8dac152763019fffa50310dd079c6 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f1f3d06c49513c89bb213560607008dd03853ab5 |     
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/4cb58e724ef6486b4567764d4f458b8ac6a681b6 |     
    arm      |     host-gcc-initial-9.3.0     | NOK | http://autobuild.buildroot.net/results/580ed296ec03fe5b12945f81c72f2f8acc88b340 |     
  mips64el   |         host-go-1.16.4         | NOK | http://autobuild.buildroot.net/results/5b20f927938c59d6eae1e67ce7b203a20c2e7bd1 |     
  powerpc    |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/4d4e8885acb5c3dc3e7de2ebcac748e94786689e | ORPH
    i586     |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/ccff177ce8945e78b656eea681cac8635ed74cee | ORPH
    arm      |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/040088c77b64810ac63f6686685e7c3a5d6bcb60 | ORPH
    arm      |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/68581aad7c622a1fc74bb5556799e3c681425b2a |     
   nios2     |        host-qemu-5.2.0         | NOK | http://autobuild.buildroot.net/results/ba523af70f3bc506d348f235215880565e0e47a4 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/103e09c8b32b5015b91d3370c921053783a22fc6 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4fc3aacd3e65a9c9bc00e06beb8b486328793bc2 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d2b034a268f789d4a23f2c40ca25666901b3394d |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/556193db1fea1b4d2724d4981d71ca63bcf135c0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cfb4c547d0ad713098141eeabfa0bccbc7b917ff |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/aff5ae5a4f2ebb0ac81918866effc1ec65c80f27 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/8ca54cb268dc7effef5f2cc3bef81867622cf39c |     
  riscv32    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/731252dff86f86e3d048ec70d09f7ac2be752b0f | ORPH
  mips64el   |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/8f09b7f6ce523971a99c4c05e389b09535aca480 | ORPH
    sh4      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/4e827a5ff13542677a351b2e59ffe80aaf06cd5f |     
  powerpc    |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/cdb7fc058af1af0808364542f682f9be360c116c |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/0213729f7584a96a3dbb191126e25d6b94015bb3 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/ac375ec365c0729f11455fab431d3986e6d5d10d | ORPH
    arm      |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/ea05fa6ca39b1ac55e301e5c11d3a62080d36e9e |     
microblazeel |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/85c22156b4b813639538c1460fe6b82f59c6819a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8f409d51ec18bc8a16d47cd5041e6e9ce0360dcb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f25612804e6622fe66e08c6d7767a046dffc701c |     
  aarch64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/9d6041094b70a099925b1218e3df17efdf5bd15f |     
    m68k     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/26694b2e147c38538b52165ec63e0445c0f4a22b |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/4738612811b28e7230b078a3c322b3cbf76eeed3 |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f87373c6b89c3fc112d7ebdc6d885ed1e1d09e0c |     
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/d6811efbead2299dc03d5ae3fc8e00fd01b6c0a8 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/bab2c1d395ac49e39353f1693ad945f773eb92e5 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/c2dcf6abf3e186a8144588ad5fcc985a52729ac0 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/eaae6548fb536e2b0ea539c236cd7579e63fa21e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/08763a9d2ced3342bd6ec118ccae642396bf40b6 |     
powerpc64le  |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/83170984f96238756c45bf1f4e542363afafd45f |     
    arc      |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/12d7541cdf89300a7caf003c34b2ac3c2c77dcea |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ba4e43899d346c170e25718ac242b48a40c6803d |     


Classification of failures by reason for next
---------------------------------------------

               aircrack-ng-1.6 | 2 
                  botan-2.17.3 | 2 
                    ffmpeg-4.4 | 2 
           host-libselinux-3.2 | 2 
                   neon-0.30.2 | 2 
               netatalk-3.1.12 | 2 
                 libgit2-1.1.0 | 1 
                 libssh2-1.9.0 | 1 
             libtorrent-0.13.8 | 1 
                  mender-2.6.0 | 1 
          perl-net-ssleay-1.85 | 1 
                    pppd-2.4.8 | 1 
                   rhash-1.4.1 | 1 
                 rpcbind-1.3.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/fba458f1626c7645a95bf51aa064fa89edb15018 |     
  sparc64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/52db9df321be45c41142c664a8ec59b7311f0c00 |     
  mips64el   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/8bce8c847d8233dbcb32af98d53ca01dabfed000 | ORPH
  riscv64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/904fd56305e44416ca9bb2d182d4c94cd6ea1350 | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a0ada2f86619e681ab108f4242de4eb4a5be9c7c |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c7fc76b2e42d9675fb3efb9e097b2ae09da6faa2 |     
 aarch64_be  |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/8e344bb4022ece429881be8e5904906b5902930f |     
    i686     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/c3b3cfedd5cb158a067a79d7f9bbb2e5de686afc |     
   x86_64    |         libgit2-1.1.0          | NOK | http://autobuild.buildroot.net/results/efb4ce2174cb6944558e895ce852182ba2738a70 |     
    arm      |         libssh2-1.9.0          | NOK | http://autobuild.buildroot.net/results/5d0c2acc67b5d5429b3a398adb022709a6882424 |     
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/92b85bbf61185af5272989cf4501053b1f8dc8d1 | ORPH
  aarch64    |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/649c680de31ff4ce8d517ece0c1df081cbde37eb |     
   x86_64    |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/1ce35a61eb0d23a068d6cc631a14a49dd31daded | ORPH
 powerpc64   |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/34ffef25159350a15a9c7e0f1ccacfd02cd72f79 | ORPH
    arm      |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/da25a7a53cb80a558b927c621307c78df3bed867 | ORPH
  powerpc    |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/db1058a6ff74ae00d6f92faf96a0310d74c1b17e | ORPH
  powerpc    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/0705564da52f48ff24e1e79f2f108dbb213f46dc |     
  nds32le    |           pppd-2.4.8           | NOK | http://autobuild.buildroot.net/results/625e583268f105269f95ece4ac8611096e86a993 | ORPH
  aarch64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/2f5207288994ace1dc72842835d38754e9eee8ef | ORPH
  mips64el   |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/4bcf7f7bbeb4e39dc28eaddb3320ac752c7108d5 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/60b595d5fec5e435dc2597f242d7eb0b209a4abb |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                rocksdb-6.13.3 | 2 
                apparmor-3.0.1 | 1 
             host-flatcc-0.6.0 | 1 
           host-libcutl-1.10.0 | 1 
        host-sentry-cli-1.57.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
monkey-f54856ce250c4e257354... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/406f1eacd61c8c539c787e7452ca0e5cf52ac1b1 |     
    arc      |       host-flatcc-0.6.0        | NOK | http://autobuild.buildroot.net/results/c2265ef1063e235fb7fdd4a65da91ff82c3c224d |     
    m68k     |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/8fb57b6fe643ba7cad33746fc5c0ce4cad2a97f6 | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/603b5b712b3424b42fe9c3e4a5b7c37f72e4cfa7 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/3b0059e68671dc751789eb0fc1330836a41faee8 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b711a7f1c1cfe34a8a80d87f436d92ec272da42e | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/6a5103eb1c5601da7017ebe8b26018618affd806 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/7a732ba222da220f66d21475db1f75dce5ccd29c |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f5571d4db1c05d8ca809fb8ced0f40e49d821f3a |     


Gitlab CI results for 2021-05-22
================================


-- 
http://autobuild.buildroot.net
