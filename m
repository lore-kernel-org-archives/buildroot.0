From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 08 Nov 2020 08:08:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-07
Message-ID: <20201108080841.CB9A220414@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  6  |  0  |  0  |  6  |
  2020.08.x  |  8  |  0  |  0  |  8  |
    master   | 46  | 18  |  0  | 64  |
     next    | 11  |  4  |  0  | 15  |

Classification of failures by reason for master
-----------------------------------------------

                  boost-1.74.0 | 4 
                   guile-3.0.4 | 3 
        python-m2crypto-0.36.0 | 2 
                apparmor-3.0.0 | 1 
               domoticz-2020.1 | 1 
     dovecot-pigeonhole-0.5.11 | 1 
glmark2-c493520253fbfe3676c... | 1 
        host-sentry-cli-1.57.0 | 1 
                   httping-2.5 | 1 
   openvmtools-10.3.5-10430147 | 1 
            qt5location-5.15.1 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/6a14d16009fdad68fd5c797195cd875b3e03d505 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/b441e20553d108886a4d8303d60079681f25c73d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/0cd932e75c90806f88aa77c89b7483a159d3156f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/05ca26943c6d9b91bcad729334245d7ccf8a5387 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/525631d7683375baf1436e31ebe88e593580ba5f |     
    i586     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/46610899d65935d0cccf33fc83ee3f1f717bd2dc |     
 aarch64_be  |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/5fb1cd57bc3fdf4f75019c7b25d65ef887eea539 |     
    arm      | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/fea50f0d4045c3feffbf0410c58b7efdef5214ff |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/ba051bb00a6cad3cfd5ffeb197de20ea0eaef33e | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/03483083b766035223d685f450e8185145ef38cb | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/37ef970c3adcfb2747cdf2648117a3e9ac4ed451 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d8df89ce0510bc4f7c6d2e1c3c6744bb45104164 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/48f76cd24e72180696079be93b60f0a902d34bad |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b6f160b267cef03fc4932c5ed9d2b7a8defc049d |     
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/d115a082418321e7dc4715c635f94b30b3cad387 |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/7f63e6a2d8681cc3408f344556afd5dd16eb7368 |     
   mipsel    |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/fb23e12473da9ea682695d03cfcd57d86cec1bc9 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/a34f8183ca754b5f65def96de931c48eb5757e99 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 2 
                 mesa3d-20.2.1 | 1 
          modem-manager-1.14.6 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/902fe575ecbbd0bb71bf1ca483c4d44807113682 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/efcda7a736f03de7d84ccacf5708a13c33d7a4bf | ORPH
    arm      |         mesa3d-20.2.1          | NOK | http://autobuild.buildroot.net/results/9e99ca11461a04fe239f1c413e897e9d096e04ee |     
  aarch64    |      modem-manager-1.14.6      | NOK | http://autobuild.buildroot.net/results/66be9dd23cfe6c243193c888992a619a0f4c4ad1 |     


Gitlab CI results for 2020-11-07
================================


-- 
http://autobuild.buildroot.net
