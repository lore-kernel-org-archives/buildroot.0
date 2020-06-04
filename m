From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 4 Jun 2020 06:44:52 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-06-03
In-Reply-To: <20200604062805.96615887A1@hemlock.osuosl.org>
References: <20200604062805.96615887A1@hemlock.osuosl.org>
Message-ID: <CANQCQpZuL2Rbbw87JhCLv2D+dxpQ2R5PWkHs7SHLyaeOH0PgAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,


On Thu, Jun 4, 2020 at 1:29 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Autobuild statistics for 2020-06-03
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>   2020.02.x  | 13  |  2  |  0  | 15  |
>     master   | 80  | 67  |  0  | 147 |
>
> Results for branch 'master'
> ===========================
>
> Classification of failures by reason
> ------------------------------------
>
>                host-qemu-5.0.0 | 17
>                 qt5base-5.14.2 | 9
>                   assimp-5.0.1 | 5
>            host-wayland-1.18.0 | 5
>         python-markdown2-2.3.9 | 5
>                   gloox-1.0.23 | 3
>               ibm-sw-tpm2-1563 | 3
>                belle-sip-4.3.1 | 2
>               host-grpc-1.25.0 | 2
>                libupnpp-0.17.2 | 2
>                     qemu-5.0.0 | 2
>                apcupsd-3.14.14 | 1
>                apparmor-2.13.4 | 1
>                collectd-5.11.0 | 1
>              freeswitch-1.10.3 | 1
>    gdb-arc-2020.03-release-gdb | 1
>                  gnutls-3.6.13 | 1
>           gstreamer1-mm-1.10.0 | 1
>                 libdrm-2.4.102 | 1
>                     mpv-0.29.1 | 1
>              qt5wayland-5.14.2 | 1
>                  rsh-redone-85 | 1
>                 wayland-1.18.0 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>    sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/af93bf6eadd64476e8f1055feb83bd2c89323402 |
>     arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/1d4469ac6354ce0caa20fd458788ab782c4e63d6 |
>   mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a8033a8b65d90cbd8aee426a8bbe6aad440b9dd9 |
>   mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/7e444db2b445c9cc2e50c470d0514e1966f8bfb5 |
>     m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/2cddf31dd448e046b28998f42e05ff430d87b516 |
>   mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/26d747f5b498079bc33956ab8b1faacf36223ad6 |
>   mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b162ff1decf55f42f2981ff0bca0b18b92cf111b |
>    xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/5dfbf798a82c67a711b22b62390f1477edfcbcf8 |
>    nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/a4a48f2d3988b46a7b5853359857889244d45169 |
>     i586     |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/85eb9b201be75d20f9eef4fe7df7ac0e77f937bf |
>     m68k     |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/e7e32cf2c5dc245fbc3364a705932ca30e1c4afa |
>     arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/9897edbe90bfc6b1fc827b2733492a432e81cfc2 | ORPH
>     arm      |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/911b962b149cc99dfca78b67ff446d8e2aa3e7b3 |
>     m68k     |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/91385a34c80c5043519e96395e203eef662ac18d |
>     m68k     |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/5c86bdd5ef34377a5ba06fef830539a72d83395d |
>     or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/b3cfecb8514008d41d7f0e6fe830f1614154e7fb |
>   mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/8083a94a4956d25fdcf7fe6e6979d89f9091a063 |
>    mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/04b632581ba6dba47590ebf1ad37d2d8db3ebf57 |
>   powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/718de2533fd6d19d1f36adfcd654d0ae690867af |
>  powerpc64   |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/30aa40014e0743670bf28ec7a4bfd84d2de9f01f | ORPH
>   mips64el   |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/1a19ea698d45e138185b23597ec28442ea2f7bed | ORPH
>   aarch64    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/4eaa03d35c0499eda7ec4690a0956e8b215840a1 | ORPH
>    mipsel    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/080cd386311f86877ddd88cd7265a72332868091 | ORPH
>   riscv32    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/e12158a424b1bc73871d87e45aa13d1f2cd52671 | ORPH
>    mipsel    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/dbfcc213ed2d124949edfba64ac02ab7df4f4fb3 | ORPH
>    nios2     |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/ca6d3540d67d59fb955db725ecc3bd789aeee199 | ORPH
>   riscv32    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/1b00e84add5d956a2362e64154173e31dd681248 | ORPH
>     arm      |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/5ce8bcf7ac1508d90fb8b503925408019d73ea97 | ORPH
>     arm      |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/4bb6187d1faecc4ccb71b99d0db2a5b90a5b9360 | ORPH
>   mips64el   |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/aa0e908182ba28c648b51a89889c1d43054e9d0e | ORPH
>    x86_64    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/d9b2af327aabf76c5e1ab241ee5b8f54a43cc462 | ORPH
>   aarch64    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/c203a97b4c8365dc39b61dd33beea83c1767ae1c | ORPH
>   powerpc    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/de40af3ee3c7b13a5c0e9fd02f24916cd33b953b | ORPH
>   aarch64    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/a6cbf3c1838aec5c3826d2852687b9e6b4e0b6e4 | ORPH
>    xtensa    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/7b0e2800e5a6b346abf548ede6ba76c5a834a7a3 | ORPH
>   aarch64    |        host-qemu-5.0.0         | NOK | http://autobuild.buildroot.net/results/a093b1928882f9c94668ce8830b1e3492fb81894 | ORPH
>    x86_64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/ae3e21ba37a7836c44408b30d33472cc0fcbbc14 |
> microblazeel |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/41754ddc16937919c9d6408d6ab98bc5343b4cb3 |
>    x86_64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/50e9e7604217dd06316667fffafd7a7bdd105a04 |
>    x86_64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/f2e59f4faf24ac129743db1d94cfc959eab9e274 |
>    xtensa    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/34c1bcf2e885841b4dad171ddf9cb98a59140ac8 |
>     arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/64479a70245e2f033de9553cd5f2b3062ef1a4d4 |
>     arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ee3c65b16bd15d190bd4caec24695e4d8e110e8b |
>   riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/dd82125e509bcd1ba52053bd43de3fe0befcfb54 |
>     arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/0e9e8578af8ad9eea8dd0efb66fedd957ced152c |
>     arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/b142fe37087cdff8a8eed98145e8633b468c27d7 |
>     arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/e4455caa33a618ea0b8f723ef70a694c276d45cf |
>   riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6f8f056c5d82e078478c83fd343f070c2b01a4e2 |
>   mips64el   |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/2051fc74f9809de0e39fff155fd88b71b9578a2e |
>    mipsel    |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/f64af62b733493dfd49565ee6f1c277acf86073a |
>     m68k     |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/e6fe7f82551c324640fcf7cc7c2eaa1490e58db6 |
>     sh4      |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/1c93a375a80026780f346c7b0fc9a9c1a24030c3 |
>     m68k     |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/298ed7d12ed4a14ed76748629fe8c6715dc6e73c |
>     arm      |           qemu-5.0.0           | NOK | http://autobuild.buildroot.net/results/0adfb031c243709b0bac71599ed419b64cc514a4 | ORPH
> powerpc64le  |           qemu-5.0.0           | NOK | http://autobuild.buildroot.net/results/2f5186088324d31adfcc4039a901c8ad15324310 | ORPH
>     sh4      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/9a10c716bbeb11ea3fd82a9d494007bbfbaca9dd |
>    x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/2d765ea047922c6f5e225bb9a721e165ba2793de |
>    x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/dc1216554703f581084f7b49604ebb096c403052 |
>    xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/aa6c984dfba1dec45bb8c607d910e9ea0caa54bc |
>   riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/63d416b415d1aa875ed1a810115d8d9a77e81fb3 |
> powerpc64le  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/6e282daec9b765e9ec77896f52765a78d3c5e999 |
>    mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/be6c544fcd3a5e865c54733821088cd74efd8e47 |
>     mips     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/7dab3bd5491b9e8c774acedb91ffe0cf1c4d09b6 |
>    mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/3ce0448f704d5fbb722a92305c60603a164b18f2 |
>   aarch64    |       qt5wayland-5.14.2        | NOK | http://autobuild.buildroot.net/results/ca182b96d495fce09b2025eb580babb9cce6ef05 |
>     i586     |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/859c1ee6abaac76bfd2ee45e023da2a6683f2bd4 | ORPH
> microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/117d8aa1ae8a9349f666b79d8ea771a711fabda4 |
>
>
> Results for branch '2020.02.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>           host-checkpolicy-2.9 | 1
>                mongodb-r4.0.12 | 1
>
>
> Detail of failures
> ------------------
>
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>   mips64el   |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/7c0666b53e2b41d794eefb7d0970e4e1fb71dc7c |

Needs  50de52ae693b4d22e1275d98382de7b66baa0d78   cherry-picked in

Best Regards,
Matt
