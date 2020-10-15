From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 07:09:26 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-14
Message-ID: <20201015070931.95E5388286@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 17  |  2  |  0  | 19  |
  2020.08.x  | 26  |  1  |  0  | 27  |
    master   | 118 | 67  |  0  | 185 |

Classification of failures by reason for master
-----------------------------------------------

                apparmor-3.0.0 | 6 
        host-sentry-cli-1.57.0 | 6 
              asterisk-16.13.0 | 5 
                  boost-1.74.0 | 4 
                   guile-3.0.4 | 4 
             libapparmor-3.0.0 | 4 
                 python3-3.9.0 | 4 
              host-guile-3.0.4 | 3 
             kismet-2016-07-R1 | 3 
        python-m2crypto-0.36.0 | 3 
         conntrack-tools-1.4.6 | 2 
glmark2-c493520253fbfe3676c... | 2 
                  host-frr-7.4 | 2 
               apcupsd-3.14.14 | 1 
  gobject-introspection-1.64.1 | 1 
       gst1-plugins-bad-1.18.0 | 1 
              libblockdev-2.24 | 1 
               libupnpp-0.19.4 | 1 
              micropython-1.13 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.9 | 1 
                  pango-1.46.2 | 1 
       python-matplotlib-3.0.3 | 1 
                    quazip-1.1 | 1 
                 ripgrep-0.8.1 | 1 
                rocksdb-6.10.1 | 1 
                    sslh-1.21c | 1 
                    wampcc-1.6 | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/de8ff6b0ca96b8348568ef0a3bf5c4456003daf9 |     
    i686     |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/f1b673c5faa9fa2286fe408ebb14cf975e7703c6 |     
    arc      |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/9fbd4c5e776d2d9d1271fbf5aa0a3c433a7b540c |     
    arm      |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/92672fecfe303e01e462366975adbd20b50ad001 |     
  mips64el   |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/fdeca123ddcdb8eb69fcdb3654750bae138b4133 |     
    arm      |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/c01c374a6cbfe8e3eb256b1a6832ab71f049c6f9 |     
    arm      |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/ee3148a69e6ddfbd642aced1e4c069a45b5f8194 |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/570e7896046e5b1a6c9421e2f92e3d7aaee311c4 |     
   xtensa    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/2d89959f4a7f4d7682d0979cbd849375184343ad |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/26fd32bb0eadea06671d878ae8f5382af6ba64b1 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/649dadf2768013d4dd50d93e4a924c8f3125bfc7 |     
   x86_64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/19b5f88ed12d674ba2e64159589722576cbb113b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/e2ca8e4d22d5bddf6a13f0a55ca1c78435fadd00 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/0321d7fe4359a749d6b06362751319e7df2e5d1e |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/20bb45cd6aa7e47cc696e9ba7f133fdfe86ef5ab |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/ab6361add00ffdc651dd6f98ed92a015a62c602f |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/da3a3a227bedcb2f1a8fca641dae55dd347940c2 | ORPH
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/d7e33f52c6ccd709b82b1fc04e6bba6cff7eb956 | ORPH
    arm      | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/722277e31311128d610384a0956f69c22b4c1e5c |     
  aarch64    | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/96ff74e620b81bad69979356682d076bd884e996 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7d827e388e4a62b57a7fbec212de670c836f0826 |     
    arm      |    gst1-plugins-bad-1.18.0     | NOK | http://autobuild.buildroot.net/results/63aeabda6a114bbc0062cbcda913a07de3866aa0 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/e9b6420dc797c89f4b36d42eff661e6c5f57758a | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/0075c7622ccbc88238972691a4e5dfe317ccc04a | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/0f235695c09c969829fd5f9722b2cefd2053612e | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/6fdcc0b1459c8ca302ad3c83d8db9b7ab44f9a96 | ORPH
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/8f2103026100f73cdcf34433558c9e6bbabff10f |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/c40d2020efeb2d3b085c4cd63aa2abb374015f80 |     
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/3546cbc37ce7e15c4bd109ab9d43344fe7abb073 | ORPH
  mips64el   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/7f908ce9acb4ecd87bbbcdff3ec4d2333813a3e4 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/9e6f621380d0f1aec6810b01b86074953a34dbb6 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a168ae32fc0899edb63ce0e69b146c70f377a8bc |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/70471c950cb24dc6334b69f2f51ac28a0ac91feb |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e588d6fee77ed10886eb1ed23251e8e2988aa5c7 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f0516efe4398259e666a4d58f9098c4392ff8a4f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5bb93c5cd966442c8f3353f12a991d281b5629c3 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cb93412733e3dd346f95bdd0917b66cb2cf77020 |     
  riscv64    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/50038ac4537c573e38ff96df7595766220f3eae8 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/489d5ca80ac4840196a31680f27ae0f4b9472af8 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/add85c4563307a96036db5b9338b4d4eb1f172bc | ORPH
    i586     |       libapparmor-3.0.0        | NOK | http://autobuild.buildroot.net/results/129ca8ba388e9077b270fb566586543e4674eb95 |     
   x86_64    |       libapparmor-3.0.0        | NOK | http://autobuild.buildroot.net/results/fb426e77e7981cfdcc7e389f6f359aad3a7039f1 |     
  riscv64    |       libapparmor-3.0.0        | NOK | http://autobuild.buildroot.net/results/967a934aa156f9b85d278278215b2550c47eff79 |     
  riscv64    |       libapparmor-3.0.0        | NOK | http://autobuild.buildroot.net/results/65a94b544c744f6dac6244d8279731df19428737 |     
  aarch64    |        libblockdev-2.24        | NOK | http://autobuild.buildroot.net/results/1f83436a84046da753a2ebf2aac7c0f0cc188fe0 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/df6262e3428fd3e1476cf6424385cf647d87175f |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/174b825379b0f025b0512a3fafd17235c9914a03 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/c24c97415b83bfe5c4c462dfd5af039f651c2e1b |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f8273056fc5f98a9c92461d78cd2600ddb16c1a6 | ORPH
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/337386d6b6b9b4477364ef3ef1cb6a8a91e93cc7 |     
   mipsel    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/e5f865753b8b976c5a8380829af27d7ce4b9671c | ORPH
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/751cc0a07fa6608d3fdc8bd33b24c1642ef006dc |     
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/5402495a61aa99a8002bd0dead09ed2da3233a64 |     
 aarch64_be  |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/0e54140e67e585da6760866985676ddaeca7cd0a |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/797cd9313e095d9039be96d76259692677757185 |     
   x86_64    |         python3-3.9.0          | NOK | http://autobuild.buildroot.net/results/5fd488c82a87dc4abb2b3b889a07353522f85b9c |     
   x86_64    |         python3-3.9.0          | NOK | http://autobuild.buildroot.net/results/c8de54cac8d34e24ec889b905134a2905473dce2 |     
  aarch64    |         python3-3.9.0          | NOK | http://autobuild.buildroot.net/results/3a8d03377c3ec977a468ed1a0b636e2e6397cc07 |     
 aarch64_be  |         python3-3.9.0          | NOK | http://autobuild.buildroot.net/results/6d6601f630fb8320365ffcb5f923ac995d9836dc |     
   xtensa    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/5d848a46109aef448ea1d1b857a500d9461dc2d9 |     
 powerpc64   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/21f9493733949470eb779557040ea3f82fd773fa |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/b4ea777cd3562301c224c9d6c39b9d9146c36e9b |     
   mipsel    |           sslh-1.21c           | NOK | http://autobuild.buildroot.net/results/a601824fc0c205a6a940e0f9f079ce2c39840605 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/60622f0661cc61c91979ae6a208c0b6e43242b3f | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/606e9953e8379257f0e5b138300c98ce80cc5116 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/a4da63d662b0c4dfba3d725b356659b1b43be3ce |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/304a281a8e32d405f0e5527638e84bd29f9ca511 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
               protobuf-3.11.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/0c82b3265290cd60a670ab707ea22f4e3b1e32d1 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/53c0faea0f7ce9284d14d851ada51210ca37d626 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                  monkey-1.6.9 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/4bd320e11a7e83d7a9d4815b2a66d7ec0c3c81b7 | ORPH



-- 
http://autobuild.buildroot.net
