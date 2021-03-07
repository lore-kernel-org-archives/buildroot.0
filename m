From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 07 Mar 2021 08:13:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-06
Message-ID: <20210307081356.945B46060F@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  3  |  0  | 19  |
  2020.11.x  | 17  |  4  |  0  | 21  |
    master   | 89  | 27  |  0  | 116 |
     next    | 25  | 15  |  0  | 40  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
               capnproto-0.8.0 | 3 
                 mesa3d-20.3.4 | 2 
                  boost-1.75.0 | 1 
  gobject-introspection-1.64.1 | 1 
                host-go-1.15.8 | 1 
     host-python3-pyyaml-5.4.1 | 1 
libcamera-ab72e6641c56e876f... | 1 
                 libgeos-3.9.0 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
              netopeer2-1.1.53 | 1 
           python-pybind-2.6.1 | 1 
            qt5location-5.15.2 | 1 
                   sdl2-2.0.14 | 1 
                       unknown | 1 
             util-linux-2.36.1 | 1 
                    xen-4.14.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/45cc8fa93524f9d547b585513ce6fcf51304b75a |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/58148c2588248fb40080e8fc24efaf4a11d9dad6 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/56f4b3016971c44c079561d94799ab339c56edc9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9a1dc07ae746138d994e6462020b617be8649128 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/3be0bf1dc5e05bdc7927a026a6e78e289d60eb9a | ORPH
  mips64el   |         host-go-1.15.8         | NOK | http://autobuild.buildroot.net/results/0f63dc25e7656137894c8b6e29de7a3a659c1d94 |     
    arc      |   host-python3-pyyaml-5.4.1    | NOK | http://autobuild.buildroot.net/results/51b58950a36caea5350bf5941f0fcedab6768162 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c266a2e2d0e81f4ddd9ee582c7a877bf87d1f333 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d66274b17eea07e00db2573584ed6d2e6502e75d |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/93a98fe240234cb431e9943dd52a68d676c02486 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/74bd477d14abe41484f811f3fbf7669eb4d2b9bb |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ac465b0960a4b4f617c59c0b26c9ec0ef5a9e801 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3fc7da403635f32bfaaad2b7a9f57d1d060c6748 |     
  aarch64    | libcamera-ab72e6641c56e876f... | NOK | http://autobuild.buildroot.net/results/2724b0d3da5c41ce215fbe79792e164ba527efda |     
   nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/760cbe5b074f80e0c3fed134f31d015882e72ef9 | ORPH
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/b09963306cdd71a6b7e6ac123cf2ae73fd39abcc |     
    mips     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/17ba44a3d44bca458636a853b492610059531d4b |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/1243512e7602a7b50d0bcb8160a3695a7b0155c9 | ORPH
  mips64el   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1955d6932103e56e2053e16d2cb1cde50504ef3b |     
    mips     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/01b48d3988184b3c0ebd1aa67cdfaf666cc48e56 |     
   s390x     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/a89d5f42a6753446a9beeefd8e8513d14ac019f6 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/168f6f359332e33cffce458b3c7b64318435d933 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8dc3a7a7d3dacf58375e02f900257a8b92ff37b2 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ee1ca23f082550a64dc3e169d95cda0f251c6fc1 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/a33d0be3e28679127970299556d048f441abc831 | ORPH
    arm      |           xen-4.14.1           | NOK | http://autobuild.buildroot.net/results/2f8d1e52a85de61900e2b1d303f99e4d1ecec7b5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fe4e64c805e8e33cc78111fa6fb81cdb2fecaccb |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libopenssl-1.1.1j | 1 
                    mpv-0.29.1 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/2ec3e6df356156c4433e3eb38b6316379231f34b |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d6d863e0a6d3991f7556336b8e938c2acd1a24fb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5010aa59d590073e2851af0a9ab4dc9928734a2b |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                  ndisc6-1.0.4 | 1 
               wireshark-3.4.3 | 1 
                    xen-4.14.1 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/406e9138c479a000b54815d65e08ee3a898c32c5 | ORPH
  powerpc    |        wireshark-3.4.3         | NOK | http://autobuild.buildroot.net/results/4275103e380bd147a216f33651e6ebeff9db77d1 | ORPH
    arm      |           xen-4.14.1           | NOK | http://autobuild.buildroot.net/results/ae441d614ff3e218f35270a6a83f164b1b8c3343 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/6098f4f2430e0322f5661557b5a612290f3935ab |     


Classification of failures by reason for next
---------------------------------------------

                    brltty-6.3 | 1 
                  bustle-0.8.0 | 1 
                   cegui-0-8-7 | 1 
                clamav-0.103.1 | 1 
                  dhcpcd-9.4.0 | 1 
            erlang-jiffy-1.0.6 | 1 
                  janet-1.15.0 | 1 
             libopenssl-1.1.1i | 1 
                     mc-4.8.26 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
              netopeer2-1.1.53 | 1 
                openblas-0.3.9 | 1 
                  perl-gd-2.73 | 1 
               ruby-legal-info | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/0896e0a82aac90a8e2335979f50f1b6386ecefdb |     
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/60269e217d43404464b00ee1cc09ea59af504b72 | ORPH
   x86_64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/42dd532cf62c40a3cfc228910292274b97680e7c |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/887ab4ab3e106b3e43efea16df2be3cd60bfa7bb |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/b04ffef4fa3767ab3a7c8d87978a05875ca85872 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/400f754cb916f7d4882504a7b5c83c0bdcf6da0d |     
  riscv64    |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/507194276015e6030adab76c127c4965fed296b1 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/11f05634a236a35f4399b69cbe8055e0ae80c54d |     
  powerpc    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/95050e20561eec50f1cfb8d10835f6408cc1aab3 |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/ae62c5b49cd54e72d66f7add878a65ab4d0be60f | ORPH
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/0c8b3e378bb37287e7f3f2924dd6185acb46116e |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/06e636616f12ca83093d7f5d0918c673a9317754 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/fe5b13b9420022760b84c3a0ee961ae9bdaa6ce4 | ORPH
    sh4      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/2bbf593d675ab1d5477d23feddf6c2fab7e60519 |     
  powerpc    |        ruby-legal-info         | NOK | http://autobuild.buildroot.net/results/c60e5923159b3d66b422eb988f5d49e1c73e8710 |     



-- 
http://autobuild.buildroot.net
