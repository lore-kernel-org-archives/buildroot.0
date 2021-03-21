From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Mar 2021 10:20:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-20
Message-ID: <20210321102058.C1C6B60649@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  7  |  2  |  0  |  9  |
  2020.11.x  |  6  |  4  |  0  | 10  |
  2021.02.x  |  9  |  1  |  0  | 10  |
    master   | 67  | 29  |  0  | 96  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.183 | 12
                 dc3dd-7.2.641 | 2 
                 pixman-0.40.0 | 2 
               apcupsd-3.14.14 | 1 
                apparmor-3.0.1 | 1 
                  boost-1.75.0 | 1 
                coreutils-8.32 | 1 
          gstreamer1-mm-1.10.0 | 1 
                  janet-1.15.0 | 1 
               luasyslog-2.2.0 | 1 
              micropython-1.14 | 1 
                mono-6.12.0.90 | 1 
                  ndisc6-1.0.4 | 1 
                 pcmanfm-1.3.2 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fa186e04c4d4c619d71bf6080127f62a77f8e4af |     
    i686     |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/580635cdc1ae1a7ccea7387c9832a1adb4d39e82 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/c360c66bfade1ef0b35877813ed89369299e898f |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/5d8fd8d89244c1310cb6c316cdcead2e55f0f422 | ORPH
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1e05677aa3435d4122b7b579a1ae823fa6d94753 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/27dc91cc1ce2f9e9fe5703a3c0bdbaf79534aec9 | ORPH
  powerpc    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/39275225b89363ea7893b82573e0fd8b7438b884 | ORPH
    or1k     |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/d72db57c6070b29362be827258ec381b748f239e | ORPH
    or1k     |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/234c6ad53c8448680ceaea38337844cb3df07daa | ORPH
  mips64el   |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/8b49c7c76fad6b7c0d377a7cf2a300ab1ac75702 | ORPH
    arm      |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/a508477fb18b911d52934006aae0af18aade8fe3 | ORPH
  mips64el   |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/742a1935dd87b50744d55d7b03becfa21b0cf69a | ORPH
   mipsel    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/cccd7a45c4225e9b063667ce6106ca872f8750ec | ORPH
   xtensa    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/8a83bd4aace00f8cdf14a6e25987b093dd20e4e8 | ORPH
   xtensa    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/b42a11291a6574d537046d84bb7e154076ef479c | ORPH
  riscv64    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/5e542c09fb975ae2f4a0bc80cb9b925016b224de | ORPH
    arm      |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/a4da24da2c2969658a24d28e707a6bd32a64e284 | ORPH
    i686     |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/77cbf8e343d54f452d69446da1dcb12d7945e8ae | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/5a4aff35dc5b9200b289baed2c5935c161d78369 | ORPH
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/1d4aea1761d925f96632c2a4e0617f7d03d4051f |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/d679f1cc13627a64a01b2bddb62cb21c17ab5fd1 |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/ef6e10a8c4a601f1eb9f72aaf1e4f8d66af46797 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f9838ab3fcf9c559899d177d4b00dbc974340f25 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/13dbd9cf9e4acfbfbf40959268ae4c514db284a9 | ORPH
  mips64el   |         pcmanfm-1.3.2          | NOK | http://autobuild.buildroot.net/results/9562a83823f26eea3a342a9ef1d986f98733d423 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d8aad675df372497f35e4ebf3d7d3246ea60eb3d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1855a7429cc348af82f5aac959cdf86177847a53 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/681a61558c4c241414c81e4169ff34ed556d8b42 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c4b388601bb177c3d4f9bb492106dd46d68de2fa |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                       unknown | 1 
              webkitgtk-2.28.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/db65d6b0ca25bc087843a57708561e540db8cd87 |     
    arm      |        webkitgtk-2.28.4        | NOK | http://autobuild.buildroot.net/results/f808a533f17c36e14936ec986fdb2ec51f69d36f |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
            igd2-for-linux-2.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/39d4ba588c823ac9bae50315b5811da5b6366884 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6051ccc9c2b748c6f830ebc4e89602c5fbf3a244 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/92271a4448c65448b689d23f10bb7243e3564f3a |     
    arm      |       igd2-for-linux-2.0       | NOK | http://autobuild.buildroot.net/results/666d0512706242f0d304dcb14ed1da21410ff65f |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 pixman-0.40.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/864693f0a06738920cfd499f2eae18b7508d9017 |     



-- 
http://autobuild.buildroot.net
