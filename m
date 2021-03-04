From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 04 Mar 2021 08:15:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-03
Message-ID: <20210304081519.C821B4B530@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  1  |  0  | 12  |
  2020.11.x  |  9  |  2  |  0  | 11  |
    master   | 87  | 31  |  0  | 118 |
     next    | 17  | 24  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 4 
                 dc3dd-7.2.641 | 3 
             kismet-2020-12-R3 | 2 
             libopenssl-1.1.1j | 2 
                      tio-1.32 | 2 
toolchain-external-linaro-a... | 2 
                  zeromq-4.3.4 | 2 
              asterisk-16.14.1 | 1 
               belle-sip-4.4.8 | 1 
                  dhcpcd-9.4.0 | 1 
          fuse-overlayfs-1.4.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libgeos-3.9.0 | 1 
             libopenh264-2.1.1 | 1 
              libostree-2020.8 | 1 
              netopeer2-1.1.53 | 1 
                openblas-0.3.9 | 1 
                 rt-tests-1.10 | 1 
                   strace-5.10 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/24c0a6ca3b272711a1e6ceaa033925182d0d49c4 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/71f26fd81db8e9b19b3f18f3f3cefd9c768f094f |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4829278085da2409bb2902161f9984708411166a | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3b145a99a1f7498ee7fcd445f3cc319f548e9a81 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c1cb2dd0b9e7547f3858e62281da3bd45b9a5b17 | ORPH
   sparc     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/fba538d2ae4a1c53440ed73ced4023be27d7e9c2 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/cfef18f3adf51edaedbbd193efbff19aebdfe508 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b1c5989a3a09b39e504c21201e3e07c0afc2a1ea | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/739d625673f9b2ce2d915ecdc21910c62618d145 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b1779a7d46f6ee9c06864c3ca252f1cdad47cf08 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a5fe402e3f4e538eb4584f345b029ef12ad43348 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/abd3f886335f146ff6f16370484106bd8a205bda |     
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/1c2885d75219aabadbb66ab66fe0dc4b4346ff1e | ORPH
    i586     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/3a76afdbd8b564579bfb08a4d75b438dbd73ac2e | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/06cce5030766fcc789f0ba4a76d2cbaa091300d0 |     
   nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d | ORPH
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/26837f7c80a84e5ad31d5b15161848ebecc59917 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/e7bf5db7745c56c4533c225260ff6c3fcd2000f5 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/5b4834023eca039be59b969e3037bb23feeed6ac |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/d42bce7ef9cf0f807b9ba7021af4a11f84e307d2 |     
 powerpc64   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/49efc0e93ad8fe30e5f32fed8a1efc1d2afd830e |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/d530db0f37e1e0462e3af1e1787e15f94ff21884 | ORPH
  aarch64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/c6a3cdd4a07f8918b164e0e1e85c92d8b14ec228 |     
   xtensa    |          strace-5.10           | NOK | http://autobuild.buildroot.net/results/6c679877e1a3f50d5e0bc4db3237e0c699bd7243 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7cbace3ce72bbcce8ef36f71cba8071bfda9fc26 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/b9a671c46fa41875c1fd6a16790b314c16ef989b |     
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/d9b9a4b7c3660bd730a19ab09e44f24bc29e3f40 | ORPH
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/13f9a551f5ac911e7daa2a382b0683d81486cffa | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/159d2c07060c235080711d1d0da0b2eae995d4bf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ed105d321c0bde99c293ab7328d57c3764db6f27 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ce351e0e97c2cacc17d4718d39941548c7558559 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               host-go-1.13.15 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.13.15         | NOK | http://autobuild.buildroot.net/results/e48396969f14799833eab7602950cb15d25b4072 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/749a4cdca12f7d365cbec16028ccf3a3de671e05 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/a5f1c874b3e4827cf46706e6a06106d05811aa51 |     


Classification of failures by reason for next
---------------------------------------------

                     mc-4.8.26 | 4 
              netopeer2-1.1.53 | 2 
                 openmpi-4.0.0 | 2 
package/ruby/ruby.mk:88: ru... | 2 
                       unknown | 2 
                  bustle-0.8.0 | 1 
               capnproto-0.8.0 | 1 
                  dhcpcd-9.4.0 | 1 
                  janet-1.15.0 | 1 
             libopenssl-1.1.1i | 1 
                libshout-2.4.5 | 1 
                 mesa3d-20.3.4 | 1 
              micropython-1.14 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
                 pixman-0.40.0 | 1 
toolchain-external-linaro-a... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/f33b0a0a18d1b88d5ee726ec67aeff534d51140f | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/69907885dd5e8e7a292ba8d61cb7dbd6962cf32f |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/2bc9fb26635e44ef4aea143983b50b54ae40f626 |     
  powerpc    |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/355e0992338a8d132050517f83a3884606b00529 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/376c65488490ef385435a3e9d5a568893acbaa3d |     
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/a9f89b24a7e4a5090b26a5dfdfca47a58ee6a353 | ORPH
   x86_64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/16ee8417f8d9192c91340e023d8e0b7ae0c2623d |     
  powerpc    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/f512d0367f8522fc22a700de41c1ef2f90a08b2a |     
    i686     |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/f3acd30494869eb78d2b65a02e5ee8ac7602d3a5 |     
    m68k     |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/92dec890cd1d91aa673afd557be3edaca10c1f71 |     
  mips64el   |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/870acf5f007255d6ce7a7941addcbed6c90c381d |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/b0d14dbc599aa121754f5dab9035ec042e9ac545 |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f6432a77b33cb4b38201211d5f2f2564c05d1457 | ORPH
   x86_64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/836445f4730704322cd7bcc3c083dacef7bf48f4 |     
    arc      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/2f5b80cac4c12d8425ff38be6aaaa345574f7710 |     
    m68k     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/704f39a651990e3d730ba4bba3e10bd96ea23489 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/0e575756592cc28bac0da8d9418e75ff7e2d51f7 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/80be3da007d250c4780d51bb8afa6085b8512bd4 | ORPH
   nios2     | package/ruby/ruby.mk:88: ru... | NOK | http://autobuild.buildroot.net/results/faa9fcfa701ac851fa6997fa2af1b0bff613dc54 |     
    arm      | package/ruby/ruby.mk:88: ru... | NOK | http://autobuild.buildroot.net/results/7cd907b97811c0cfb89d8d402e4d974b9550e60a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/71418ca732156baed0650c6aa9f5fd8e7251cc2a |     
    arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/6ba6d7a8786421678209a29010f4713938efdc7c | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b125bf54937f86aa07568de0040b960620ea4802 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/29e72418a8cb5cf821d8f139479b245c66bcaf98 |     



-- 
http://autobuild.buildroot.net
