From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 02 Jan 2020 07:17:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-01
Message-ID: <20200102071738.B78DE2034C@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-01
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  2  |  0  | 16  |
  2019.11.x  | 12  |  2  |  0  | 14  |
    master   | 113 | 52  |  0  | 165 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 6 
           uboot-tools-2019.10 | 4 
                       unknown | 4 
                apr-util-1.6.1 | 3 
                  snort-2.9.15 | 3 
              alsa-lib-1.2.1.1 | 2 
                oprofile-1.3.0 | 2 
               wireshark-3.2.0 | 2 
                  aespipe-2.4f | 1 
                   attr-2.4.48 | 1 
                  avro-c-1.9.1 | 1 
               bctoolbox-0.4.0 | 1 
                 binutils-2.32 | 1 
                  cc-tool-0.26 | 1 
            flatbuffers-1.11.0 | 1 
               host-llvm-9.0.0 | 1 
             host-pango-1.44.6 | 1 
              jpeg-turbo-2.0.3 | 1 
                  leveldb-1.22 | 1 
                libgdiplus-5.6 | 1 
                   libnl-3.5.0 | 1 
                  libsepol-2.9 | 1 
                 libsoxr-0.1.3 | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
           oracle-mysql-5.1.73 | 1 
                  polkit-0.116 | 1 
        python-alsaaudio-0.8.4 | 1 
                 systemd-244.1 | 1 
toolchain-external-codesour... | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          aespipe-2.4f          | NOK | http://autobuild.buildroot.net/results/27ba62c87257af73e449a92b641043735bf1bc17 | ORPH
  riscv32    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/2a075a9622118647bd17745a667b12723b5855b9 |     
  riscv64    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/b42a4b22b29f47d5c85be119b310f1dfb61112a1 |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/3588c132602156bd7e9f7c088e450eedb8ea256a |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/caad59f6b84c78195ca32ac6f270e7015800a716 |     
   x86_64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/cce88f3e7029a4ebad4af02d5e7f063fbb96b2a9 |     
  riscv32    |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/b593267fb9fc9a002b977e049b2a5389dbaded30 |     
   sparc     |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/908921eae5515ddc3324cd54aa6026ebf321b6db |     
    arm      |        bctoolbox-0.4.0         | NOK | http://autobuild.buildroot.net/results/1c8eeeac4d3911548ba360794be771e6c292c2b5 | ORPH
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/dbfacbcd26c3c2575cd171de926ee28059a4eacc |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/005d3c37bd42621319a7b008e107893882a4184b |     
    arm      |       flatbuffers-1.11.0       | NOK | http://autobuild.buildroot.net/results/9fa21238e93959e9b1d1af327dfb4fd6261e52f8 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b8a727e29a584cc8619de50e6fb19c5820ea9f5a |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/def59695a32f8b34140cb14147794555c5dbc34c |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4846910a2f92c377972ba4041f6590e93046ac5e |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e386c69618c531f55bc5297e05ebddfee391dcf5 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/72a4301c305d64ab0ec75188a086237f0d1abab5 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7e799458e385e5bf3fe9516ac9ca3b5d0134d692 |     
  powerpc    |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/a69dc2fae5c8b1ca59f6c4464dc119af4d81763b |     
  powerpc    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/0e0676816edee2f32cbb321e27d16d0b2cbedb62 | ORPH
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/05315195ba50afd4c65a173bcc2cf3a51140248f |     
    m68k     |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/7e36ee8eb81cd365e00a4ec2cdeefe90e9fc3a27 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/97801531cb0b2ef63514f6e9aeca4e0b83a264de |     
  riscv64    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/8f1207088da141b9b5fa3ae75b6c46a562f385d0 | ORPH
  riscv64    |          libsepol-2.9          | NOK | http://autobuild.buildroot.net/results/bd7a0b6e3184fa03a5abd7aa34f25105e61acf08 |     
    arm      |         libsoxr-0.1.3          | NOK | http://autobuild.buildroot.net/results/da747d414eb1a68a6803709556d15a98ea51245b |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/fcd082655cd5b274c605b9c6f6cd1ce9db448e55 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/4b7e42745a22444562232661ff913275194adfa5 |     
   sparc     |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/5451df835e0e96545b322bc9bd74f76273ee3b34 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/346ea3771015e368bcf4e9695b7cc2dc978bda9b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d96248867970a85bf1fe13e1ac62c4215aa46aaa |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/34a3e44530f939c1dec5790dc3422d6fea677d65 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/633748fec8d305e90aa2eb0feeed52d3ad71b237 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/c0cc93eede88204a9267aade60e7fc0cf8dfa365 | ORPH
    arm      |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/c83bddcf904d5166c029a3bf7c860058d8c7cbf3 |     
  mips64el   |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/3112a32347eedf28bbbbe52dec0017100fba6b29 |     
   mipsel    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/61d49678117324ffb41076599c0fb32be924f6ba |     
    arc      |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/8dee333378f153a012f239d25d763d249ee41af9 |     
 powerpc64   |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/115f4c548de44dbae2f195767fc171032bbcd1c8 |     
   nios2     |         systemd-244.1          | NOK | http://autobuild.buildroot.net/results/0cf973025e3df2a745c10ca11a5bdee88cd42115 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/de730de6efa789e21f79e1295451d948d10fa1b1 | ORPH
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/12fb44fb75d3bd7bbfe866607598ac7236c45228 |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/497256f5f595e94a3cf5d01f8ddc927c433b6f6e |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/7eefbdfdd4697982160c50a7eabab68e5883a96f |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/f4b7dfe33e857f294b515593e17913312b8462c7 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/58bc711703a2c7b8aa74238c4230261e24deed60 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e2e391b5d5772326117a22b28fb646206f921e91 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/0655aeaa54ff38b2a29d5168ae3919f05bc56a5e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/487f5879466dedd2a96df3c7783b93df365a6dac |     
  powerpc    |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/1b19243ad180bad37ab5a99d858a955dd40eaa93 | ORPH
  powerpc    |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/6b0793bb3feff75804cc72f9d4550963d8c891e2 | ORPH
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/20954529dd573fa45116378d9059f4f5cf982fc0 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
            qt5location-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/488cdc3a65e5b2a6dc2ce11ed6ce0ac83bac60c1 |     
microblazeel |       qt5location-5.11.3       | NOK | http://autobuild.buildroot.net/results/b0845808246a49360821cd78484ccc4318e86132 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              jpeg-turbo-2.0.3 | 1 
                qt5base-5.12.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/37ac53e5b867fbd0b85073acd07f2a7ce7961807 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/35c14069424c5470a5923d8c2130802bdfbfa170 |     



-- 
http://autobuild.buildroot.net
