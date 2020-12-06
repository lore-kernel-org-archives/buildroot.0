From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 06 Dec 2020 08:13:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-05
Message-ID: <20201206081325.85545874F4@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  1  |  0  | 20  |
  2020.08.x  | 10  |  2  |  0  | 12  |
  2020.11.x  | 10  |  2  |  0  | 12  |
    master   | 79  | 50  |  0  | 129 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 24
                   rhash-1.4.0 | 4 
        host-sentry-cli-1.57.0 | 3 
                       unknown | 3 
                  boost-1.74.0 | 2 
           python-pybind-2.6.0 | 2 
                  autofs-5.1.6 | 1 
                coreutils-8.32 | 1 
  gobject-introspection-1.64.1 | 1 
                    php-7.4.13 | 1 
                pipewire-0.2.7 | 1 
            qt5location-5.15.1 | 1 
                 qt5svg-5.15.1 | 1 
            quickjs-2020-09-06 | 1 
         s6-linux-init-1.0.3.1 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                    vlc-3.0.11 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/5b22d33cf5ecd4b8500bde9f9703edd172b95f99 |     
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b97de3184fd81deb44d68c93093f9568e1416e84 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c5c207fc3a554e23fe42b5be0f343183c85514e2 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/30f5724e171fc2ea7b02844b36e9999eaabe20a6 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/967ac6cc6c5b575a1564a2c5f848d64c68bb8a0e | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ce118cdf79a3f02428c09307680b70c7ab4f2793 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8d4f927c6c772bd02a3af417cbf61fc1777935a5 | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ee2363d30f30e392380ca1ee75dfb390b3d2f750 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d56025ec2b0dafb7b8844023010d04f9623ed717 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2e98d268a1cd80b2458cbb504490ed0e0f622819 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/dddbaebc5d37b2e3038831437e122a3a926eb1a2 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a784dd2ad28d0bb904366e5020af1e18c675c524 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/cb834f0ccda76142ea04069ea5021ef0c5aeace7 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d5fa7ffe401b91b7dd9c77bf431a163136a13251 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9c304212cce3d65bb1b0b5d3654f265cb930e13b | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e506985cdb9103188d1c7368f619b000c8dfb2ac | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0c0d0263768c2bd504be0b9dccae70dcdf7f649a | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c49d5d9fe2f6abacd32d82608f03e58051aa12fe | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/64c131c49cfa244d12a211ab4ebb5f8ab6a8b3ef | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/475fbf214c4b6981777782014902b6a5f4d7faf1 | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9e140a3180d333340508c53032460f6f246a055c | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2d89da059e3b9993bc16ac4a9dafed38d0fd195e | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/cefcea368520e314704e6b40be5f2654c972274a | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e33eb177b3d0aab2aa8f4c68f92b3526cfc7b5f5 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4a942db28a9edeeb49fe3111efc45372317f067c | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/4205ae6e4f3382cc5d786b4d8eba0a4fac40f4e0 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/a42d3bab05d3b19ba4577ff4a1c2f39f9e204a19 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/e22cace4d84c0d4cf1173354e1914c6243e3f8cb | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/e9ef2b87bac3277a58d05c1666300b3bc0cbb9fd | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b987a8264a259557af944d8b479047ab93526ca2 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5cfe8b0c8da40f7c21e49a4c39bbb58e1dfb9bc8 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7357bfac42dad0f3e0576a35e8a654d0c7ba7ce6 |     
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/06f8eb05d9f529d8d1b23c6be329151697bb9518 | ORPH
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/311cb6b3886d0d0088aa884d82514e7be795097b |     
    mips     |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/5029d7f0bde6e9eae502a6519cfaa7bed482404f |     
    arm      |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/ecf128dba82b51eb9c7cdeef794b6e3deff6bd21 |     
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/9b0246794a6e70043aa88f8097d04eb813428ba2 |     
    arm      |         qt5svg-5.15.1          | NOK | http://autobuild.buildroot.net/results/a0fb85920b4cc40751f816eea4de8b1fd1b6aba9 |     
    arm      |       quickjs-2020-09-06       | NOK | http://autobuild.buildroot.net/results/73e77f6e99ed62f94d89b4fd83a13a762c4bf69a |     
    i586     |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/bb016d359f2b8d3a61abfef2826703353376bfbb | ORPH
   x86_64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/8ec7694617dfaf1998fb482d9891d8d4a2cdf013 | ORPH
  riscv64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/ba76738b44e38a479d709e41b9aeeb87d708c9fd | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/3d6cea207b9361c4ceb94301aca53a2522cd50c4 | ORPH
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/87a12bfd4f7f6d61cd65f05b15f7d8d94a987141 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/55b09999be871c6b645da25ba6e8b5eb3ba419cd |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/57ad67668fff7f42f6d8740725b4e6c7f0cb177e |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0862f472f3a6deeacfd6baa359df600698b4e1dd |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/0adfdf5f8f4ed1e6f7845cea0a06e6a705a0462b |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/4525ba6bbc716b08bcbe07739eeb51376c88cb13 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/9bf064e5a9910e0936604f6316dc8e670ffd9a46 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6d895935198fd3483900d05221d04b5ece0a36c0 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                   mimic-1.1.0 | 2 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/2b8e04c543f7189d023a65666eb74486fe567322 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c50add0a663968bcc796f50f7f2b804290b53864 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9bb589fed42a69b347ad7cbefaeef0f3b2aebc1a | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d903989ad7f58646ba00d1bee662f32f72ab0db0 |     



-- 
http://autobuild.buildroot.net
