From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 06:16:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-10
Message-ID: <20190811061654.0AD212042C@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 26  |  0  |  0  | 26  |
  2019.05.x  | 18  |  0  |  0  | 18  |
    master   | 191 | 51  |  1  | 243 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                collectd-5.9.0 | 6 
                   mpd-0.21.11 | 6 
                    mpv-0.29.1 | 5 
                      icu-64-2 | 4 
                 libdrm-2.4.99 | 3 
           python-numpy-1.16.4 | 3 
   vdr-plugin-vnsiserver-1.8.0 | 3 
                    ffmpeg-4.2 | 2 
                  flashrom-1.1 | 2 
           host-harfbuzz-2.5.3 | 2 
          qt5multimedia-5.12.4 | 2 
             freeswitch-1.10.0 | 1 
                harfbuzz-2.5.3 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
              iputils-20190709 | 1 
               libupnpp-0.17.1 | 1 
               log4cplus-2.0.4 | 1 
                       mongodb | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.12.4 | 1 
                  rygel-0.36.2 | 1 
              spandsp-20180108 | 1 
                    strace-5.0 | 1 
               wireshark-3.0.2 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/d1c88b21883d9a6af54cd9a99bc4b0125f08095d | ORPH
  aarch64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/2e13f9fb0d1292a2f6c98ce1c08b43a7931b7be6 | ORPH
   sparc     |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/c0517442172ce4fbf3e71c771d886435723ebaf0 | ORPH
    arc      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/1424c0a93e1a29aa219d0e8eff64bc1ad90ab638 | ORPH
  riscv64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/11ac7e72f5fd95215ba7e15b0590a49196658a8f | ORPH
  mips64el   |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/c512d2e086545f0987beb81c704d2dd99eb008cd | ORPH
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/aaaad494b0150692fa0923236262d78182ee899b |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/187893827c3aaf71b2f3e8ba4b5941bdef847dcf |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/babb51db38f280737229f347ecef7e879e391d15 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/7da19f35b25d21898545cad08aa53ca7c70ba5b2 |     
   x86_64    |       freeswitch-1.10.0        | NOK | http://autobuild.buildroot.net/results/a9ae2ccc2715b1128755863b3e7780b72e0bb246 |     
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/7f0a37f8a1fda871eb0519a0bfdb2b5798f66d3a | ORPH
 powerpc64   |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/ab4886248f28c545145c8b67ecf14dab07a18837 | ORPH
   xtensa    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/5b7dc5e539bedda0da203d72e2a843e520808d43 | ORPH
powerpc64le  |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/04ae5ec428557d4eb54e5445d21f68c1f1c8f647 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/9445d58c21d4e8c7dcc87785b8b6b984d5803b6d | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1d0768e667086c71fd0bfba2937cd4a614c9f982 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/2a3eef7070fa50fc8bb51d1677141b8d3cf92ef8 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/cb0d9e95b93a57f2131c72c3adc341b0b0569766 | ORPH
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/3130e45d4290f9ef35598ae7ad318aecf742d6f4 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/f388db729adced6ffae3e0695a026a641c5072ec |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d5da4835db05a4f0bad8d3fb14203b564efcf9ad |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/bd2d4f2692ca576fd3c4d7e186deadfa53fc918c |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/1092824639c1cd2945a1f14e913d2ae7aaa08ec8 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/4030ed330e76113b0b649ee19e7ef0db9a000324 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/f54394eb79805c2d1241c0b97b078c223965bed8 |     
   mipsel    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/97604045a7dcdfd4e9583932ae89e6c6bc58d371 |     
  riscv64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/d16365e9fa672513ee123b58a8948b05f5efb4af |     
    arm      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/e956222d106b64bee1ebbc279ef45ac9e23ec8e9 |     
microblazeel |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/5a6b30ee989b6d833444f2f4d223ba0f9b786a4d |     
  riscv64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/5813f6ce0dc85b2eed0edd7fd46984750fb3b2f8 |     
  riscv32    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/c528b277eabf76170b4d79bcb5fbfd4d373e4a8f |     
microblazeel |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/772ec01be89bd4e7c71cc029f13a345cf4137a35 |     
  aarch64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f37f7d33eb989f3a40ca69eed58854dd6c01f994 |     
    arc      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3c49e01417419d8f3675f66ccf40b36074b7518b |     
  mips64el   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9274cd0a6490b9d55013509ef2bc71e4901b85e9 |     
    arc      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a0c80fbc4138fade34bb25ab23d306a63baed81b |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/8d2677730bfe12216c3bae2d6dfc00a168e29099 |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/054eb5431996ed2dd13ab07d7b599df0c41bf4ed |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/91a69fbf14878f8ab6bf073426ca4eb622363111 |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/c605b4c7c7959e24ec4a1d9b006934b8142ad941 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/05d377ff03230604a60e381ee7ac494b735402f9 |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/4033de94267e1e4edcbc5d81aea68ed2b3f8143c |     
  mips64el   |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/2647e396d91abfa669afcb12ba39fdcbbcba9077 |     
    sh4      |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/79d255595128fea799006e04d30158e8c55be43c |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/5f00583b2de017c3ff687bcf2991590bea26ffb6 |     
  riscv64    |           strace-5.0           | NOK | http://autobuild.buildroot.net/results/920b3706afeaac1d6cf833e4796b1ff9af6e06e8 |     
    arm      |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/c38f4c37e94329e27f3aeb3ce4eb2462dc2b3bbf |     
   nios2     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/fdadc42cd39d8a14791815b8f5643c2d68b23294 |     
   nios2     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/37ebd774baa73fc74bd4cb5b96f44d0d9d559f29 |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/8ab06e25b6f1dba8ea28da76d0bcc30ecd0d5d3c | ORPH
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/a9546f7cc1732ae1adfae54a3c491d57446060fc |     


-- 
http://autobuild.buildroot.net
