From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 8 Aug 2020 11:06:29 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-08-07
In-Reply-To: <20200808074457.29B7F2048C@silver.osuosl.org>
References: <20200808074457.29B7F2048C@silver.osuosl.org>
Message-ID: <CALFsTFUFNwNmDwepL1Oyx-2v6eA6jDO0bif5x9fOyYgnrS8-ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Aug 8, 2020 at 10:45 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Autobuild statistics for 2020-08-07
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>   2020.02.x  | 17  |  2  |  0  | 19  |
>   2020.05.x  | 18  |  4  |  1  | 23  |
>     master   | 83  | 102 |  0  | 185 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
> librtlsdr-d794155ba65796a76... | 18
>         libabseil-cpp-20200225 | 12
>           fuse-overlayfs-1.1.2 | 7
>                        unknown | 7
> dump1090-bff92c4ad772a0a8d4... | 5
>             host-setools-4.3.0 | 5
>                   boost-1.73.0 | 4
>              kismet-2016-07-R1 | 4
>             live555-2020.06.25 | 4
> libcamera-96fab38e02792a109... | 3
>                libglib2-2.64.4 | 3
> pistache-f2f5a50fbfb5b8ef6c... | 3
>                aircrack-ng-1.6 | 2
>                apcupsd-3.14.14 | 2
>                   assimp-5.0.1 | 2
>                domoticz-2020.1 | 2
>                      mtd-2.1.2 | 2
>                apparmor-2.13.4 | 1
>                      avahi-0.8 | 1
>               bitcoin-0.19.0.1 | 1
>                    clang-9.0.1 | 1
>                collectd-5.11.0 | 1
>                    cvs-1.12.13 | 1
>                      fping-4.2 | 1
>           gstreamer1-mm-1.10.0 | 1
>                host-go-1.13.14 | 1
>                    httping-2.5 | 1
>               keepalived-2.1.4 | 1
>                libupnpp-0.19.2 | 1
>               luabitop-1.0.2-1 | 1
> open-lldp-b71bfb87fefb31c4b... | 1
>                  openal-1.19.1 | 1
> package/feh/feh.mk:47: feh-... | 1
>                      tftpd-5.2 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     arm      |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/1fc82cd82f3b73c82dcd4309532da9ba634b5649 |
>     arm      |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/98a79f06b4252a0c578a01dc4aea6b905040f364 |
>    sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/df66d7d92344e9f263c588c7a781945d6ccc6542 |
>    sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cce761b1697083aed02626d38448804a64a8bd63 |
>    x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/077a09430651112d4382619b2a0d4aab5f7ef4f1 |
>   mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4722738ffadacd4c1900d275e4f1aa34f1c0bddf |
>   mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4da7aa4f6dee5050707561443b1ce25c61a26827 |
>   sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/5916a4e1fa166084a05288b0e5a7ad753bff5672 | ORPH
>     arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/e63c37226a20ec7f9f9d54c3244c75b1ab425fa2 |
>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/bd39e4de9806855596ba48c0bdb99428e75c1f7b |
>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/92771dec9a5399cf67eefbe86a84c9e2bef11afe |
>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/6c816bdff25d07dcc3aab847b59a5c0dec9f3400 |
>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/8d28593f5a4953b3af4b23dc4128308c1ba786d8 |
>     arm      |          clang-9.0.1           | NOK | http://autobuild.buildroot.net/results/b133a8fb1aae2f6e1c70a8cfff3f1beb6af1b6d8 |
>   riscv64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/107de84d236d99b28fc957b4791745b67881ba66 |
>     arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/83ea5335ba17f251f02df229befbb7b707b0764b | ORPH
>    nios2     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/7c9dabf64b70d93ffa766ad8d2fcdb20033906dd |
>    mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/d10bbd4907e66249caa06e2fd53dff294fb23499 |
>    x86_64    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/a74c0a9e2b97a0256c210bcf41344d26da8d3904 |
>   powerpc    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/881a20e71c4ec963d352245a4fef594eb162d192 |
>   powerpc    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/039c2565ca0d3295d335cee8822ad04540614895 |
> powerpc64le  | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/09f961882f2a2ede4608c44cbe5d6797f7811df5 |
>    xtensa    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/6487ab23315534e9100e1d88630cf22aa686925b |
>     arm      |           fping-4.2            | NOK | http://autobuild.buildroot.net/results/68455812e7e0a001a7cc13f7f31a3ad7a43a8624 |
>     arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/49e83c3dd5556ee824e138df52d6e047621b40a1 |
> microblazeel |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/fc229826d338867f7cd1535a0233261cd6d5787e |
>    xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/049eff1dc044ae54d5d37a90314924ad00a312b8 |
>     arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/459fca16d9dca3b54ffd48b369ff995e8568d312 |
>     arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/b7296dd8af4d45b084948cb4a98e08dc64653c9a |
>     arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/4fa272ab8e0eea5935fb8abf4724b0acbd700dec |
>   powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/a8af431b176633156ce4aa3220702c6592a5bcc8 |
The fuse-overlayfs failures can be solved by:
http://patchwork.ozlabs.org/project/buildroot/patch/20200725171241.470533-1-fontaine.fabrice at gmail.com/

>     mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d67c3fbb60b991a44fda8b3abb229b7e84235703 |
>   mips64el   |        host-go-1.13.14         | NOK | http://autobuild.buildroot.net/results/6c8cb6e2bb06b71918e6295a2682067b9a9c6c3d |
>     arc      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/89575d7ac015e3dcec5dada0d624e232261d4e2b |
>     arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/c2873dbb3e74891882d7eee82b42a2cd07c5d7aa |
>     arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/10388c09ab9a56c4f4b32d85111b8706ee61d279 |
>     arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/ba3caa3038a04eb296c42e86af211c38e875e659 |
>     arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/e6d34148c7c7d10d48b084a05669437d5d1c6453 |
>    xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/4eb78218a35a79fe508528d562d1734f46a1f427 |
>     arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/c5ea31532c2e466abeb4bdc02c3f7990b339a588 |
>   powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/de0abebfaea6ddb27d8537e2b40eb863f309a636 | ORPH
>    xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/2faefedde8bc98b316a0c57d816cbc0fc100ed40 | ORPH
>     arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/2ded04d8898cc4fa97211db93261e37d70a1fcf5 | ORPH
>    xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/8f3c4a88b4e08fa095f5bdbbf0ea3697a8e87909 | ORPH
>    xtensa    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/2f048b650ea28cdceb5870a19f4d1a6e6bf5c7f8 |
>     arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/fe3bf4728cfc044f87bafc1e72031b17bd24c519 |
>     arm      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/2d796dd4cc43388da235b83f53778d902f477799 |
>   powerpc    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/52d20a8e54a1889e95282eef7e7cdeeb3ec180cf |
>     m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/239a3b64bf4510c7bbac5f7d251c3ae319ea2a80 |
>    xtensa    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/5a15903838065beb7251b1a3f50ba255a59caf74 |
>    nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/0ee07df85d1cd8a5e3f7817028ac3ea2fe22d470 |
>     arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/d9b27b8cb68496212dded5b01a845b28234c6a40 |
>     or1k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/9673143789c6250f9f7867bb083bd5ae3c91f4e8 |
> microblazeel |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/62ad99fe44dac5676c123695c4a0ac49e7e2242a |
>   powerpc    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/3fa43407bc0ed467388862e59a124e3820482eaa |
>     arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/eb593826cf1f75c06d8fc316b8b03f76753087b2 |
>     sh4      | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/d67b00b6fa392c0b9535b91ca418e6c17ac7afef |
>    nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/326e0c104cfa32075b96301deb8748707ec099bd |
>     arc      | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/cc8a52fced6143151394e17ff0719d2efad8f744 |
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/d92753da687a78c04d9d50c64dcb7638eb554051 |
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/abc4045c32ab1ca2232b3179c43c8ffa20b58fd2 |
>   riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/5fd07e6482adb32d7b9191a32fe9f9c1d2d455fd |
>    mipsel    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/5b26bed7e78139612570bd2fd1bb9835223966c0 |
>  aarch64_be  | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/808067dc603a3ede67ca69fa0e9a76c2cbf5b20d |
>   aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/b25abbc0a9d5823a3b538457435f4e82f14eccbf |
>   powerpc    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/79c717389b7f6ee505905ee9879c4fb433134b00 |
>    xtensa    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/da3bec46e1007fa2822fc69f69f0f43a39de2fca |
> microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/5710a0bd5c3c1c697c7ab591be2aa811f3e7e04b |
>    x86_64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/ff8fc0325c5ae5e67813820d9a579d7b477c5455 |
>     arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/d377f9d1365d5be5e4446327338c325e70911e68 |
>    sparc     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/d701b72b2ac4ba5ada500a33684f7abe54aba6e8 |
>    sparc     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/f3a37a42579ddf114a91b662b6f6ead84e950860 |
>     mips     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/63e6e009bf6868a95b23438df7b9d837fe50eb72 |
>   mips64el   | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/5621fee3ea58799738b429a62f295407cf6e4bee |
>   mips64el   | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/a7f49983a7e4a802bcd3cee13acb551a0f6f1336 |
> powerpc64le  | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/21f5219734bb8292e5c292863b015b44196405fb |
>     m68k     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/b6755b5a628cb5da455eaa0c1cc080b8c18128f2 |
>     arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/7718e852a3378800b254a3a5afa998c6c448e1a7 |
>   riscv64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/8e06bd96863c5a53eb1404646d668d3edd92408d |
>     or1k     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/1fbe10136922e0dc33c7df507448e55d202500f9 |
>     arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/fd9c526441458de4d10cf79bdb33d8dae380c052 |
>     arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/c0680a4d3232555815e18f9eb0d57cbd39359105 | ORPH
>   powerpc    |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/7c5f5bc9aad4f4a290ad6be76dde0d31ee629659 | ORPH
>   mips64el   |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/4e3b9fe6a632e32a9dc41ef6a69e7800c29e71af | ORPH
>     arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/062474f578fef80bbb6582d0f7154cf1f9584c60 | ORPH
>   riscv64    |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/86f210759a8c1366a84c112badfd96e43e0244a6 |
>     arm      |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/0b8742de62eb9342f085596196d1f5237a721942 |
>     arm      |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/1477b36f62f340fb13e1c0594df217a2b8998fc9 |
>     arm      | open-lldp-b71bfb87fefb31c4b... | NOK | http://autobuild.buildroot.net/results/3bae8a6e5a69b7dfb7bf987c167c64785d9502f6 |
>     arm      |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/58cbb0c998744a48142eb64f94d1713480344158 |
>   powerpc    | package/feh/feh.mk:47: feh-... | NOK | http://autobuild.buildroot.net/results/991fb57bc99c2f44a00c846688f1b3e017b87724 |
>     arc      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/90d82361d30075b1af038fe5c3262200e971ff94 | ORPH
>     arc      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/4c1982ca604443a17a5a61e2610dffd2acef91a7 | ORPH
>    mipsel    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/30d95b2c581900cc81f10c3ddf4dfdc2f29dac9d | ORPH
>     arm      |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/750ddefd2c31872fd44e9ae70d87048d8512849d | ORPH
>   mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b176ad083098c4cde1f8d1899f38bb1bb2f4773a |
>    nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/5f62d5232e4b9e0a96830186e9926fecb8fb3fae |
>   riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/6166bbc5962aac521648583fa2ccaf44e0bb0d95 |
>     arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c19800a8c1b8305f2b6181232d0382e24421137e |
>     arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/aad592cec510aad9942f0d01fe0799adb96f02a6 |
>   riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/4d5d46ebfa86bbde0c3c508c12ffd506cc0f6aa7 |
>   sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6ccf812db886be1d531e4f7387518576c6860f5f |
>
>
> Results for branch '2020.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
> make: *** wait: No child pr... | 1
>                 suricata-4.1.8 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>     or1k     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/e7dc82cb0fcf1e0cb3429d5bcb370ec81542cab2 |
>     m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/63e20a84f2f0ae4a8d78526ddd2639be6254d566 |
>
>
> Results for branch '2020.05.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>                         bullet | 1
>               ibm-sw-tpm2-1563 | 1
>                libupnpp-0.17.2 | 1
>                        unknown | 1
>                  xvisor-0.2.11 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>   riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/77c1264694dc07e5d17af43bca24ca9fdff5db83 |
>    x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9773f8c7635adbd46bc6b5be4b48814568039e5d |
>     arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/b6ceb6c954d223f2c5432551f45df76f73477711 |
>     m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/32788005a4c49b1a870980e5e88e935a726e32fc |
>     arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/333ff0d519bf62969e6ac02fa5a16095565aba3c |
>
>
>
> --
> http://autobuild.buildroot.net
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Asaf.
