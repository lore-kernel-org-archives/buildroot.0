From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Mar 2021 10:19:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-23
Message-ID: <20210324101945.10A0F405F6@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  3  |  1  |  0  |  4  |
  2020.11.x  |  2  |  1  |  0  |  3  |
  2021.02.x  | 13  |  4  |  0  | 17  |
    master   | 63  | 18  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

                     efivar-37 | 2 
        host-sentry-cli-1.57.0 | 2 
                       gdb-9.2 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
libplatform-a7cd0d5780ed80a... | 1 
              micropython-1.14 | 1 
                 openal-1.20.1 | 1 
                 pixman-0.40.0 | 1 
       python-matplotlib-3.0.3 | 1 
sconeserver-6b932d7d8dbb700... | 1 
sox-7524160b29a476f7e87bc14... | 1 
               target-finalize | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/839b64fdad881c3a81165eb5cbe49e66e58826d0 |     
  aarch64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/9a2edc78511ae03f33a1cba2c84caf559d1dc3a9 |     
 powerpc64   |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/3ccf1585dda73cd41b4afa4734ccc4238944fa7e | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f6568dfe4fd41cc13901080997f611939d92eed3 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/66e9fc967e176255f94bbf0961e4ae6b5ecaa3a2 | ORPH
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/edc0356589af482725fb09ba8838ca06d2425032 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ea7cd60b262f598935c6352e455434cec84dedae |     
    mips     | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/6e0618483f93fe35cae6daaaa233ff2327961725 |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/e462c992540ca5cb016d45a457c9cc034a5b2430 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c376da635c6a613f96a0a6a765b153211fec262b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d7c249aa9edcbf5a26087159876ae4dd8d5dc660 |     
    arc      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/2931bc8bfe27e4b861a0e3d79e945a6ea39625fb |     
   xtensa    | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/374d7a33e1bc74938b563c737005369c7fc4dfa3 |     
    arc      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/4c511c02e4c63b35ecf77a2658f88e8a0d9dbb4d | ORPH
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/6b91b6fe57ab68dc14ff9e23f4efba85377a873d |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/6b7d62107b1b8cddf1f57eecc141f9351fcc5663 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f9fff7541d4d94cdbc8b74a372a1030951250c8c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2770ef4c9b957b29b32c0642bc32dae9b1ca74e1 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libmatroska-1.5.2 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       libmatroska-1.5.2        | NOK | http://autobuild.buildroot.net/results/892aca0aea295a74ccaadc2184be82b6723758d8 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

       shadowsocks-libev-3.3.4 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/ccd7cb4f105d59d51ea047c0c49ee05e4923b36b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                 mesa3d-20.3.4 | 1 
            quickjs-2020-11-08 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b4254c91fde92aefd58c7addd134c46885ae63cd |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/09b02ddee20d2560e582e752efbf073cca274db5 |     
  mips64el   |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/0b2d7f3f29b0cbdf1604de71b1b050d7eccf3c60 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/f7bed1c25fb44aa19990005f8597779e7e9bfd4e |     



-- 
http://autobuild.buildroot.net
