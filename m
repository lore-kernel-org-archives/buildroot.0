From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 04 Mar 2020 07:27:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-03
Message-ID: <20200304072759.8F71085C52@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-03
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  8  |  5  |  0  | 13  |
  2019.11.x  |  5  |  2  |  0  |  7  |
    master   | 55  | 26  |  0  | 81  |
     next    |  8  | 17  |  0  | 25  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 3 
              bitcoin-0.19.0.1 | 2 
gr-osmosdr-46698a67e7e06419... | 2 
           host-nodejs-12.16.0 | 2 
               libglib2-2.62.4 | 2 
                 opencv3-3.4.9 | 2 
                     vlc-3.0.8 | 2 
                  cairo-1.16.0 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
                   libnss-3.50 | 1 
             libopenssl-1.1.1d | 1 
           libsamplerate-0.1.9 | 1 
                    mpv-0.29.1 | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.11.0 | 1 
       python-matplotlib-3.0.3 | 1 
                suricata-4.1.5 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/92eae42ef0b1d3b49d0a74d4008d37234695a9e7 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/5ef1c7b6b29b70458a75ab6be8557df238e667b9 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/69d2ece60541c3259b70377dd0ee52933218ea59 |     
   sparc     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/a59d527b58a9dc038e6825061d7bbb78fe12ebe6 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/d1ec07e138e371a88daf93ed0243aeb48060677f | ORPH
    i586     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/7790a89b214db9ce310e13999d208184243d6625 | ORPH
    arm      |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/2afe4334186bb048b451bd3ce9bc3f53896e9551 |     
powerpc64le  | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/5ad01958f7b947e18e144a88013f14769708d28e |     
    or1k     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/8c83be00843c737207978ef2c98b8ca77508f76b |     
    arm      |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/9d3545a76c4f5c06debf319687498d662a53fafb |     
    arm      |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/301f2c1167f2b013af1cfa7fb2d6607926ae18a1 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/c15dd8834d4c7fb63d39fa6464f940a35217a937 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/05bc7b2d00f964de25b5c7c50999501f3e766729 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/8c314a42470f2d66ceba62667104d1cc8b928f8e |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/2dd7cab645b9b94e1e2b154d247123706ff07a6e |     
    m68k     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/1ab941f4e279526150fa7965b1564608ea03f1d2 | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e16781c4e153994dd7046a36260d011d6ebcb4bc |     
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/65e3436a29a99728279afc31426b36521d5fa20b |     
  aarch64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/4ae80a32fb1437bec28dc509e2e3508526bf4b1e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/f9904fc07b805c2bc51983aba312bbb558a69e60 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/d0bb3800c40c062d9f3c8923c72f56a01eb76675 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/14ede1824fa18b9c693460c4b4e8728c77010706 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/a425e0e2b16f83d1c8c5482be9584749393edfc9 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/a42d237fc49942578a13a86bea64cc089b908f06 |     
   x86_64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/01cc93c91b8a2628345769dbd47752ba53c89bb4 |     
   xtensa    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/83b7464b109923bc451c4c35632948101c6d2a6e |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 3 
                    brltty-6.0 | 2 
               libglib2-2.62.4 | 2 
                linphone-3.6.1 | 2 
       linux-firmware-20200122 | 2 
                   erlang-22.2 | 1 
                   libnss-3.50 | 1 
                libtirpc-1.2.5 | 1 
                openblas-0.3.8 | 1 
          python-jinja2-2.11.1 | 1 
                 ser2net-4.1.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b1ff9c9a17b777fb0b7f3b578a8a2ddf0ccf48f1 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/762d30d115b57c9b8733419834009f21256bebec |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/13526b98f31e63e5edd44797e6a6c19d58c887ba | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/ca69913ce76155cfb5ad8d7a9702adf9be5bd622 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/05ebad224c1384ed74735f212c86d0a762cd4025 | ORPH
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/1e8a97c9020d6bacf19a3d6f9229b851ee3b123e |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/50611cda2a449e1bb3d314a2ea06e42d7699ad94 |     
  mips64el   |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/21ecf0117ac5578e63cdeb001466efba43a7d21a |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/4c9c8d466fdbc39e6047ddec421275534884fe2a |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e81144389d9d5ae00492e219c5e88f35cccece48 |     
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/a8bd1c780cf897da214e14d8e886eab9dbbac9a4 | ORPH
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/a896df213a905118db8927362bc2f40ff4441f9b | ORPH
   x86_64    |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/c324d1943dca3e278689798642a36ab07c451b41 |     
    mips     |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/227edc24c7f683a5d0642b4e7b08c25017b74c61 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/726b5c258426f8b46d7b77aac6d9ff96152ab6ac | ORPH
   x86_64    |      python-jinja2-2.11.1      | NOK | http://autobuild.buildroot.net/results/5952e115a4a5207a49ed95e850931876254c4d9f |     
  powerpc    |         ser2net-4.1.2          | NOK | http://autobuild.buildroot.net/results/6e5f7bc0315c039e3c03ed90129f5bb6e05645ed |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
                classpath-0.99 | 1 
             host-grpc-v1.16.1 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/4e840698d542203b459cc2a6b86e52c3fe2335a5 | ORPH
    arm      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/31f6c924c6988ba1bbe43ceae3211de3ee0b0bbc |     
   mipsel    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/cbe5bceaa8e6ffe39e767cd055f7158970e9d865 |     
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/c985eb87d7c58ab7cb5fa1d49f31a7869bbb84a9 |     
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/e9ad1b1287956fa26c7d926b61f311400632c3b6 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 1 
                  flashrom-1.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/8852140ceb82f8c988ca249e66e31ce10cfb1bdf | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/cd5912e0fbff20328c73ee27294cab2b2df6b2de |     



-- 
http://autobuild.buildroot.net
