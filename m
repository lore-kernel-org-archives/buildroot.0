From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:42:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-04-15
In-Reply-To: <20170416062816.2956220830@mail.free-electrons.com>
References: <20170416062816.2956220830@mail.free-electrons.com>
Message-ID: <20170416104232.5723c4b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Apr 2017 08:28:16 +0200 (CEST), Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2017-04-15
> ================================
> 
>       successes : 198
>        failures : 60 
>        timeouts : 0  
>           TOTAL : 258
> 
> Classification of failures by reason
> ====================================
> 
>                     mpv-0.23.0 | 25
>                  xenomai-3.0.3 | 5 
>            uboot-tools-2017.03 | 3 
>                 busybox-1.26.2 | 2 
>                 libepoxy-1.4.1 | 2 
>                     mpir-3.0.0 | 2 
> toolchain-external-codesour... | 2 
>                    trinity-1.7 | 2 
>                   arp-scan-1.9 | 1 
>                  binutils-2.27 | 1 
>              bluez5_utils-5.44 | 1 
>                     ffmpeg-3.3 | 1 
>                hiredis-v0.13.3 | 1 
>               keepalived-1.3.5 | 1 
> kvm-unit-tests-5731572b2ac2... | 1 
>                  libdrm-2.4.80 | 1 
>              lttng-tools-2.9.4 | 1 
>                    lunit-0.5-2 | 1 
>                  mplayer-1.3.0 | 1 
>            oracle-mysql-5.1.73 | 1 
>                     qemu-2.8.0 | 1 
>                qt5webkit-5.6.2 | 1 
>              rabbitmq-c-v0.8.0 | 1 
> rpi-firmware-4b24a81a2ce94a... | 1 
>                syslog-ng-3.9.1 | 1 
> 
> 
> Detail of failures
> ===================
> 
>          arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/147bc05a6cc6800f21fe6b8ad915baddb84bc7e3 |     
>         bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/658dbe9b248ef3d6f8b5a1e02b26f480769ca489 | ORPH
>         mips |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/e19e6486e1bc54a80cf446c5be052b4409401322 |     
>          arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/4133cf35d6e0d12b1408735b22df836b345362c1 | ORPH
>          arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/3e1cbaa51fcfa413017b39b7a6c00b4a4af27a9a | ORPH
>        sparc |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/69d33792f2e7ec62bfe593eb4bbc8fb2652d7011 |     
>          arm |                hiredis-v0.13.3 | NOK | http://autobuild.buildroot.net/results/0164dd0d0c4bbce35310e65f01e5ad1af85d99bc |     
>         i686 |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/70b31547e51ec7213372d2ef07bec34c5df77560 |     
>       x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/42c565eb4b9d47507ffff36fdb14ff6e2ed83681 |     
>     mips64el |                  libdrm-2.4.80 | NOK | http://autobuild.buildroot.net/results/8d7548e1f41c941ddcc1fc829b27fd4aa6220035 |     
>     mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/7bf82270b3612ff22dc095899c2418878a918443 |     
>     mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/ae3fe12831170d696c788082fe33feb4a3628962 |     
>      powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/f5cc4844acd09a3f8328ed6b85e0b8f0c14e5ec7 |     
>       x86_64 |                    lunit-0.5-2 | NOK | http://autobuild.buildroot.net/results/dbfab0c7ed7e0e4c76da2d3a35ea30f5437b4f03 |     
>  powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/49b4d4b8d8afc3e0353529146270ee8b289dc8be |     
>       mipsel |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/95abfb4a52ca6486681d9c24396a24ba5847fad9 |     
>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9a1f1cd1e113b36ddb79066c64efe1e5f11e4e6e |     
>     mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/2ec8d8b7a28cc8be001fcb0cd7a63c9f192198e4 |     
>          arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/46fcff64262898540670e6226b7d2241dd4e44fb |     
>     mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/9dba8542442c5b3c5069404c724055353ec80e24 |     
>       xtensa |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/326a9c3b7901fb0c8d6279b47c9e3e68da1690ce |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/f386b56a7b3dc97c03339bfb555bb1846653c5ae |     
>     mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/79622245fa2481d1688198b04fcb9113679e7ab2 |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/14f83eef4d2aa13c15c46a9f5aee677b992b3c28 |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/5709e014e7b653427729773893327326075961b2 |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/9d6c4b7bdd6672c7750ac9c143ff79c944fc9783 |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/06fc4500db80399d98628619994d5887ee696c3b |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/715eff69cabfbfb917a3c0c4d0fc7a34ba861903 |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/c0b77d3d0b65aab259014e0f39f88aeef8b2f55c |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/742e32aac1edb63d7166d58515ba8636dcc85322 |     
>       x86_64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/349d63c0206e84ed520216dfd1d8e32320aaa341 |     
>       x86_64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/507456abb0f6d1610e1a9fce206b226aa84d94ea |     
>         m68k |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/64f913738494b0885a95359756032b1d34083581 |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/27a226dd29acabaa0ee5c2960d0bc22f35184bdd |     
>      powerpc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/29738ebf58f210d5d3d2ee6de89f4f91045f46f9 |     
>         or1k |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/03ada20b325b0caad79e898a939db7d565970adf |     
>          arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/2814b42d3ea7a2ce688424bae66311d8b533d603 |     
>          sh4 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/f92ef5e0af0bdfd6440b0cf82671639892aab908 |     
>     mips64el |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/daaa846d0a3433828c86d6a9041315b24934f8a9 |     
>      powerpc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/337b60dfa5a147a40ab6c072912181759195e924 |     
>          arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/5cb2dca9c90d98f01004dba15411566b8e98c69d |     
>         i686 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/ea197e88fe69206b921b2c4104ede89226918703 |     
>        nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/42c56197d18e10c11fab999eebb050644e3b8541 | ORPH
>          arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/bcf58f55857e762653dece1986dfee15988ed049 |     
>       mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/76d7b18bb291a8eb194f013bbbeb20aa0ef097a6 |     
>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d64f5c29f03cecf1f557373d83d2983a72723888 |     
>      aarch64 | rpi-firmware-4b24a81a2ce94a... | NOK | http://autobuild.buildroot.net/results/f42df720da02fdbc5e4d6669c0a1e14c55bb0f3f |     
>         i686 |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/89a57c2bc59e573b07bd22807f7069ced2bb356 |     
>       x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/769c38944e9cc00a4b207835840d44d234e239ea | ORPH
>       x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/152bb251bad635f8006fa48cce2f33f778a69038 | ORPH
>      aarch64 |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/1d3dcb908b7bb4559e1103e09907ab043ed44679 |     
>        sparc |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/269e1c125094b97dd9dfda0e174d2c9f3b103c3b |     
>    powerpc64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/e9974daa71d59053c98dea2ad3965bf5ea1b0c3f | ORPH
>          arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/9d07d22e0ca6d056b2740c285de47436dfea153a | ORPH
>          arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/d28c6660eb8a834f027e32e93e4c5ac9f3a4fbf2 | ORPH
>       x86_64 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/5623e351a57d314f1104f62ac8472a0b25118902 |     
>         i686 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/04dff3257345e522fe4ac275f66406e40e011174 |     
>          arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/a2a6329a147d885fe7a641c2e8e362099159c7ad |     
>      powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/ae9d9a9bb8d3705a1751f2f4745daa802d3b923c |     
>       x86_64 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/4a331cb7ab05c0a152c62ffdbdb4d1877adbe0ba |     
> 



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
