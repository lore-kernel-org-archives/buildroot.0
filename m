From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Nov 2020 08:10:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-10
Message-ID: <20201111081022.947B1214FD@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  0  |  0  | 13  |
  2020.08.x  |  4  |  2  |  1  |  7  |
    master   | 45  | 24  |  2  | 71  |
     next    | 10  |  3  |  0  | 13  |

Classification of failures by reason for master
-----------------------------------------------

              host-guile-3.0.4 | 4 
                  boost-1.74.0 | 3 
                        bustle | 2 
                   mimic-1.1.0 | 2 
                    vlc-3.0.11 | 2 
                clamav-0.103.0 | 1 
               domoticz-2020.1 | 1 
              dovecot-2.3.11.3 | 1 
              gnuradio-3.8.1.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                hiawatha-10.11 | 1 
                     mc-4.8.25 | 1 
                  ndisc6-1.0.4 | 1 
                    rpm-4.16.0 | 1 
             s390-tools-2.15.1 | 1 
                 systemd-246.5 | 1 
                       unknown | 1 
                       zip-3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/346b744c4c27cdd800a8c7d96e6d113a3e9c8991 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/3282e2e540002250bdf4482c9876ccb65005fe11 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/accfc788a3fe957c38dc06a836e86874ed1cdee0 |     
    i686     |             bustle             | TIM | http://autobuild.buildroot.net/results/43c455978a6dc79f43691d436822f8692e2628b2 |     
   x86_64    |             bustle             | TIM | http://autobuild.buildroot.net/results/a55ac78ceb94056504c5df706124f755130c98ad |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/48fbea8af2931367704ccc69c45fddfb079c076d |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/48f2708f3847a47259d22ff898b6bc6d96ccbd70 |     
  mips64el   |        dovecot-2.3.11.3        | NOK | http://autobuild.buildroot.net/results/096ad00d66a354a759fa2cc41dab27a4fb67dd75 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/46e722726f2f86517ab900a00bc88b3bca9c81b0 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/546a3313dff0dd52de6761511f3b212f2f2c9e43 | ORPH
 powerpc64   |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/e2201930dfc1c14403424f1d5e13b703af87074b |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/a1a10eed013d70af84bd69c4dbcb80c946f3f069 | ORPH
    mips     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/16cf6a30d25ce467b893b5c8b2c635520bb1fbdb | ORPH
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/1215fb076075b5a015cb217270b7b8dfd0b6f934 | ORPH
    mips     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/dcd17e964594f7b07423c2dbde53d3db38d56c23 | ORPH
    arc      |           mc-4.8.25            | NOK | http://autobuild.buildroot.net/results/e87eee4c6e197df0184f1e13a4b27bc84faf2e10 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e707110c36e306d474870692681354707f04b6ae |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ad74a1ace0be588fcd469988a98702d3eb47b12d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8ab047fe4f3afe0f4e91198bcc6f8203d5782dbb | ORPH
  mips64el   |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/ca2fb86a022ed2eb043d08c547db6ed3757311ef |     
   s390x     |       s390-tools-2.15.1        | NOK | http://autobuild.buildroot.net/results/d41bca3be35d1a48f962be03920f2b81c3e9bb9f |     
    arc      |         systemd-246.5          | NOK | http://autobuild.buildroot.net/results/4fc3c044740836b01e90b556817d42ba9ac89fb9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3bea357cd55ff9f3ff57ed0c9d6e3fb28dbdfd54 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/f8571221cfcb899a98fa82f657acda9b3cd3abc6 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/29d90565768504aa58498e47eeee3c043274cc53 |     
    arm      |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/85f230fc9703828e7e0dd8ee3a56d6aa7c226cd1 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                       unknown | 2 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/352baf3934892491ed9ea7591e5c2a5f362ebfe6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/1b3e988d613c4182763f82d905689ca3a164d7f8 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/0228b3fc2ece057d7e486954638623e238a82e2e |     


Classification of failures by reason for next
---------------------------------------------

        host-sentry-cli-1.57.0 | 1 
                openblas-0.3.9 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/506bddd1f428394f3217b2ab5b4505cfd01b6f1f |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/a6c8a8a4cf41bb02ca983774656ebcf1ff6e93e8 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/448438be2385939973a8b3ed70f2e9ac9a6699f9 |     



-- 
http://autobuild.buildroot.net
