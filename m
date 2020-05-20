From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 May 2020 06:27:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-19
Message-ID: <20200520062707.05F8520367@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-19
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  5  |  0  | 13  |
    master   | 93  | 59  |  0  | 152 |
     next    |  4  |  3  |  0  |  7  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-audit-2.8.5 | 6 
                qt5base-5.14.2 | 6 
             host-gnupg-1.4.23 | 4 
                  zeromq-4.3.2 | 4 
               belle-sip-4.3.1 | 3 
                 openal-1.19.1 | 3 
                  assimp-5.0.1 | 2 
                    brltty-6.1 | 2 
              host-erlang-22.2 | 2 
           host-nodejs-12.16.1 | 2 
                 ripgrep-0.8.1 | 2 
                 rocksdb-6.6.4 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
                coreutils-8.32 | 1 
               domoticz-2020.1 | 1 
              ejabberd-19.09.1 | 1 
                 gnutls-3.6.13 | 1 
               host-efl-1.22.3 | 1 
                host-go-1.13.8 | 1 
              host-grpc-1.25.0 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                   libnss-3.52 | 1 
           libusb-compat-0.1.7 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.4 | 1 
               protobuf-3.11.4 | 1 
         python-gobject-3.36.0 | 1 
       shadowsocks-libev-3.3.3 | 1 
                    vlc-3.0.10 | 1 
               wireshark-3.2.3 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/96ece6a4ed2fffede426d7ebe5269b03dec4ece3 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/855c7348af7df8445b210e16473dbdb930d4239c |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c50b73a933e0f5824fb38c7fb4d735f37e8ca6cd |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/1c22a85debecc8afe194c2635548e920aae2552b |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/206811c560815b5cbe61bcde35b3489d2d4b74d6 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/4744f07d637ca6300e6ac5ab8b045aa37234a6b2 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/22e510767a92f81854d045da66613b868f863955 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/c4e8944a1d17f5ad41f9e0b14e4edad18d4d16b6 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/1493fef084c81776b887a296451fbd2ad609770c | ORPH
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/b6ff76f3b6df08009e9ca5cd3f22595d9ed7181e |     
   x86_64    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/16e649381486c3eaaa20945dd539673641b5d1d8 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/d2a932e14af326041b1a79ea4c8d6889be7a8f2e |     
    m68k     |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/48d052b3e1c62e04fd0f31b6ed887555a82f8de7 |     
  riscv32    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/c572b5f7c85b9b8671cd1b7f15c1626223d22c4d |     
microblazeel |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/fd79a319f6c19014f5a8f5dc19dded88aae759fb |     
   sparc     |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/e4df23c43ed13f09e2ba5838e6c2d6966c67b76a |     
  riscv64    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/cbd190068500970774ee978ca1d0596f0f579bc7 |     
  riscv64    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/e6ac173b7ca14f3554f85707e4f71e76f662356f |     
   x86_64    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/5090231d733dc6188f66d6b14165dba8bbb7c650 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/65cffee10b3fcf71ec78122b14305153c1f9077e |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d7a6f62280572f5499dd508621d96f02e51b9940 |     
  aarch64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/668bdcf347f82f72762b586487b465f260e724ff | ORPH
   mipsel    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/e9c17a7db56a8b8148eb9a044c65d19c717329e3 | ORPH
    i586     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/70c534627354629496f379b6a4ce702492f10102 | ORPH
  riscv32    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/a32f602563c1ac6e22dd23b2b3a4a32b53cba1a5 | ORPH
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/0308a88b05039b9cea3939a43b98022a2fb87796 |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a06de99b9a3f301b2bedb58689eff86cbc437df4 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/367fccb68c9dbe308067e1c7b3826c3dca6556d7 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/82b2f149823b4ade05e029ef4ed35222018f81ae |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8731b1480a80a7c01de749b1db341a7f46e1f2b6 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/1b6a62119463ffc028079c9a88ccf4afd89b90c0 |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/b7a39e5fb15dae181c8abfc0742b07f10b7f5c01 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/2adcea2abc4b023dfa446df36864ea359bf2efb9 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b2111de73d2705841c412172eee966fd0c02e8fb | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/08f001bd161b19691b1e2273e50984a5f8e693d2 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/0ccf89bff1a3591b44d6e65bd568215c72d57062 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/0f4db8115506b9b6b9107fc37f9b486eca9f7da5 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/e13afed7c26f32567fd68cbbb5c745f610d70674 |     
    arm      |     python-gobject-3.36.0      | NOK | http://autobuild.buildroot.net/results/a64e7322b64e7a78f2f82d2ebaffe7ea75db9185 |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ca5ca188668e7c29b5a12ac00e3a0353c31d980d |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/bd93fb2c80336bbcc65cfd3bf3c8d2783e3fde7a |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/f2c2e1806b998164f157cf0de8a06c638888a1a0 |     
    sh4      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/933ab4d3fbc82888c91aa34d3f558f131619e452 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/aec7d6ff624194d9de81c74a61a0919876c53b2c |     
  riscv32    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/00e28c7eebf0985982e724cf246626fdc605fce8 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/2d8b4f2c0195dc24337aeb60483d3695420c2c68 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d492d4df6c5fcd49a478692452892668fd364c81 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/d209cc9e78d0dd638df74b3a1c6b52d0524c2ae1 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a2b69a4fbc1df968f18544116bb44ffdca71468f |     
  powerpc    |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/0e40b636525e59fc6dd943d2dd7ebf6e79e8ec5b |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f3c84fd7017d777fc85daa944d99ff5a229bdc50 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9587893944c30ba2e6d7e583491a448ab86eaa9e |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/e193106151bf87246db0a95940d72919e91cde35 |     
  powerpc    |        wireshark-3.2.3         | NOK | http://autobuild.buildroot.net/results/df9226113d718b603537e37fa0c96dfc42487d21 | ORPH
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/cff030202cdca95655007db362f29bc032cfc3d9 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/581e4223495cd404d374055d807352008c991692 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/fd3858cabb4027ae97861df7284b5d2fb5bbbb70 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/aef873c6007a7fd4a3cdb4535430bbceba2e7959 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e9baab13d4840b616a0817572c55a6b1cfd63c66 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-dtc-1.5.1 | 1 
                 mesa3d-19.3.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
           oracle-mysql-5.1.73 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/b3ae8dd0234abe1f8d518b7060cca168ee7d765b |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/e3c6a52e4a44ea1d639eebe6c3aa6f43ec35cfb3 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/20ab549cfb42714083680626e3b079afc9c9a8c7 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/f34629584e41c660c502f0cc6eb05ef2b08d5aa6 | ORPH
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/899471f34392e4bbcaead108c878b8bc0e280c0a |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    atk-2.36.0 | 1 
                    brltty-6.1 | 1 
     python-argon2-cffi-19.2.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/1095ba79a6fbd202364c20ac19f6af0c8e448faa | ORPH
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/abf7b29285020ae9d719d790430cb321e514645a |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b98eb47fa064b20942e56958dc99eb5d52243c8d |     



-- 
http://autobuild.buildroot.net
