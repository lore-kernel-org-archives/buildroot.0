From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 09:32:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-25
Message-ID: <20200226093233.5499820113@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  0  |  0  | 12  |
  2019.11.x  |  9  |  2  |  0  | 11  |
    master   | 118 | 38  |  0  | 156 |
     next    | 16  | 15  |  0  | 31  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 5 
                    brltty-6.0 | 3 
              host-grpc-1.25.0 | 3 
                  cc-tool-0.26 | 2 
                   libnss-3.50 | 2 
                 opencv3-3.4.9 | 2 
                     vlc-3.0.8 | 2 
                      bash-5.0 | 1 
              bitcoin-0.19.0.1 | 1 
               fail2ban-0.11.1 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 haproxy-2.1.2 | 1 
           host-nodejs-12.16.0 | 1 
                 json-c-0.13.1 | 1 
           libsamplerate-0.1.9 | 1 
                     lxc-3.2.1 | 1 
                 mesa3d-19.3.4 | 1 
               mongodb-r4.0.12 | 1 
                  ndisc6-1.0.4 | 1 
                  pango-1.44.6 | 1 
                    qpdf-9.1.1 | 1 
                 qt5svg-5.12.7 | 1 
                 raptor-2.0.15 | 1 
                 ripgrep-0.8.1 | 1 
                   sdl2-2.0.10 | 1 
               wireshark-3.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/412da2bf81f0393f64aec97b2145873157882915 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/721d970f0d3dace78cb84b041186dd76d6fab7ba |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6e43ca2307c917c11203a5a070b98c04fca3f7a0 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9eb7f0abc501aeb44e74b4e68e18a7ba1ce39bbd |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c471d47ce6bf77d96c902f9711c6505779047f9e |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/78dfb4dc47b4627e7fa9d0e2014e276bfa15beac |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/a5186dc04457791011ebc03248486e55b5976d92 |     
    m68k     |        fail2ban-0.11.1         | NOK | http://autobuild.buildroot.net/results/3b0cb0e83eedda371dfae6dc4cfc0611159faa9d |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/6c21d88876b9aa0d7164e3223061f71ce7287b61 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/f2628c90945745f04004ba3c4743b87e0d38342f |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5539fd12b7ffd0e91574e71944b4f7ceda824c42 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b7a7d95844aee2d1133cf8c84bf64b1e8a37c3c9 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ea60f82f3423a9cdf820b5ad784728476edc4fbf |     
   mipsel    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/b28f2e0b1b14f82f578282b73a9f897700fbeec2 |     
  riscv32    |         json-c-0.13.1          | NOK | http://autobuild.buildroot.net/results/1f0cd6a8327f81c1a74523aec2fd90f836ce4a5c |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/a63c8596614c2aa945c176c40a66d590382e0b49 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/d5b7456bbb1cc5035bb7b5ce28469da703437a63 |     
    m68k     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/9c98b2595203be05d181231d84de0a322bf9a0cd | ORPH
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/21f29ebc19668e5b7d9abb739def48977a13c89a |     
    or1k     |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/7f963bd0a3367a9a9b74a053813b8a9f5213c4bc |     
    arm      |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/85a5b95824de45b78848cdb4326b2d09fbaa1ebb |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ec454870f3e819e1a85ca41a177362d18162e697 | ORPH
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/dfded80da16fb11a79eda5eecfa902aa02059e5b |     
  aarch64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/cf6b6b49dd51bd17e09a2d45e0995a6f81e85773 |     
  powerpc    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/cdc94fb774098df9776b2259e3a05522bd915552 | ORPH
  powerpc    |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/44c70c4ef2bf3a99c141d04c182f789466fb967c |     
   x86_64    |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/3d78c64634a25f5b2e477cfab1a31901fee1f4a5 |     
    m68k     |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/7862a80fe50dd5e9243028271f9544c3a162df8f |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/89b8b2a0cf1b3b61e9e1c8b032947a89594b2cc4 |     
    arm      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/7e317781d4302d2da8cff0afd8ea75859206d4d3 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/6c6e59695f7e3d79b6a124b27d61741a2f9dc2a1 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/695150498e5f1bd68dd4ee53464669d91b43a16b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/852f340cc2345d2009960821e6cbdb9b4ced2674 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fc7c8960041fb418855d60aad512d0a7945aed98 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/81b8c362b5ddc322ce98ed6cff105fe8d801768a |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/bb3a174761e09b0383b00cce51f3af35f55a34d0 |     
 aarch64_be  |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/6d64b2883f08aa0581624c628e177d3b39ae852f |     
  powerpc    |        wireshark-3.2.1         | NOK | http://autobuild.buildroot.net/results/80caa191ef91e6d3ff6d61801881719c74e64ad5 | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 2 
host-sdbusplus-4212292bcf13... | 2 
               libglib2-2.62.4 | 2 
                linphone-3.6.1 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                   erlang-22.2 | 1 
           host-nodejs-12.16.0 | 1 
host-python-setuptools-scm-... | 1 
                     lxc-3.2.1 | 1 
                   mimic-1.1.0 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/71cac3eeea226dc6685c814c2803ccdf9e5b2653 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/941b4c978cea80a5224debe9f9fa50379c36095b |     
    or1k     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/7b638cc47f0afc0e6e561206b0a94a0c844c531a |     
    i586     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/ed17bd712a409b2820c5ae5bacf96cc0d74438c8 |     
   mipsel    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/43fd75e738f0d24ed4e08361bfffe1f5e26366c2 |     
    m68k     | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/61f1b2146836afaae9f5e325853a41bbea880970 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/894ce5d05c407ac206308a74fb56d917d793e552 |     
    arc      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/665a5142374fe1b64da58e6f6f2f6eb00940b496 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/5a32844fcbbd449e69fba63fe7aef3dc42d7a0c2 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/64013a79cbf09bdaaad33f0f12db0de7a8d8d895 |     
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/da60c0cd5be0bd4940e67f19b95e60c1e3d63b0b | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/b381a60dc685d4ceb2e96f3a47d640198d08a5ee | ORPH
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/28e711b11d3c47d92b6435d4c9bfea3067e5f5d1 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1cb65ca6e645b5916e925cdd0dc820a74c9ea7b0 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7edda58d16c8d01918cfc68edd0426cc84092a4d | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                libgdiplus-5.6 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/f2d024cd7469776381479fda0f962493092412b5 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/04f455021bf00a63dce49229cd3d1326f2235dbf |     



-- 
http://autobuild.buildroot.net
