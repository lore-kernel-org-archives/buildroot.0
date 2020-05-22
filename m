From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 May 2020 06:27:01 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-21
Message-ID: <20200522062708.F042F2045E@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-21
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  9  |  8  |  0  | 17  |
    master   | 96  | 52  |  0  | 148 |
     next    |  9  |  3  |  0  | 12  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                qt5base-5.14.2 | 6 
             host-gnupg-1.4.23 | 5 
                       unknown | 4 
                  assimp-5.0.1 | 3 
              host-audit-2.8.5 | 3 
               host-efl-1.22.3 | 3 
              host-grpc-1.25.0 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
                 rocksdb-6.6.4 | 3 
              host-erlang-22.2 | 2 
                      tio-1.32 | 2 
               apcupsd-3.14.14 | 1 
               asterisk-16.6.2 | 1 
               collectd-5.11.0 | 1 
              ejabberd-19.09.1 | 1 
       gst1-plugins-bad-1.16.2 | 1 
      gst1-plugins-base-1.16.2 | 1 
              ibm-sw-tpm2-1563 | 1 
           libusb-compat-0.1.7 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.9 | 1 
       python-matplotlib-3.0.3 | 1 
                  ramsmp-3.5.0 | 1 
                    vlc-3.0.10 | 1 
xdriver_xf86-video-mach64-6... | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/02d71b15f0aeedf0c71743ec7da1a8b05dea69d7 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/2cc9718f619e114774db1f0c11d2f50040e9096b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/84d19617f75766891ff22b8ccfdfd9b983b18bf8 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5f147960865e60ea9e2b935c52bd57444972f130 |     
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/f3adeada9d687a7ac7bf3d3988f24e78c0a433ef |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/1c21515bed3b0f55eaf57be5cfb61408b86128bf |     
  sparc64    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/855e6b5b976ea2a561053a3b97e21ce10c744cb8 |     
    i586     |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/a7710ed256e8e8cb3a7fb3fb237717317739fab7 |     
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/6ed86dec337c47fedd014ceeb826bda4f1aa6ffe |     
   x86_64    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/ad5e7d7e0be47d3eca937f34fbaee66c58bb42dc |     
   x86_64    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/5dd19051fbe2e76faef7108f4378a7c8fc7b1d27 |     
  riscv64    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/05514a50283279f83962df80d3641798d339a8fc |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/6c1cff4d956db9f6e4f7cfd286af36175979e36a |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/98b786aadbece41ae10ac05d29bb1d27eea88edb |     
  aarch64    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/0c0fa0f4d11516e944488aa51111146a3627beee |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ec621b18c67ca67856584267a233474632383f71 |     
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/dde53680a4d8a0012c2ab6a1ff174adfca1855ba |     
    mips     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/1043141498b0342f24ffc574c2e59970946d455b | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/7bfaa7bd76693795fa32cb08a05a8712e03788c6 | ORPH
   x86_64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/04f18023963c4605db1b2e34c504d6db36a91051 | ORPH
    i686     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/db186fa1942d2d2d780a1d6037b8e2400782b584 | ORPH
    m68k     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/435c96cec18f009d37452c5f79637f27165e63a5 | ORPH
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/65d757a8242e59010c5e9a63d51ceee5a09615e2 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6d6fca7166ea95e32ccef192ef1b2c9dcca4970e |     
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/918679eff09cd0302c0bd80f1c46c2f48edb47f9 |     
  riscv32    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c6b89b40c3d50e37feaee23c18819197fc82d65d |     
   x86_64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e802038c6adab5d28edf8d6622fe47a896803d95 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1dfdc65f0fa786b82d5af5fc0861d5dde456aebd |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/7a317dedcb29d046c0bd963aa2692cb75bbd3c04 |     
    arm      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/7f916f60979ae2fe74d5e8f085b05d3d7b9b1eb1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1c9f6b8816cc7c96389b0414d8de07620b1176f0 | ORPH
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/a0cc80ac8876e059c45ff82f34312141c3345cc5 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/27a14f66e6c6ed7abf9f5a1d0590341e3b39dfca |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/de660a30bb66f11f361785ec01c75e8601f0ac44 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/9b1f2eca2382075b786e0f02ad9b9bf074171a53 |     
    sh4      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/15b4192dbe362fc76eb27b082206f87c159b15a7 |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/f3409407b04e70c0cde7739d956e1776115d0ef3 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/89a2695c64a307135a7ca6e1337b0ef811a8667e |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/9d3348b508eccad8cdab3385afe7dfc5fc856572 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/99674fda1662077c8b9389e6db396090b7255fb9 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/02c940faa88fe3ecbb1403be9bdd404beb077e1b |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/aaa601b6a94c9a772df947cade09a152f0bf4f51 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/15512977e8464a6e6b010321e70cfaaac8b9d538 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/26e20a7621f252ddf3ac149b48b5a7e291024848 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7f3842b62e3e7176043ab7c5fb8c00843a0ea563 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/abe1b4fc471cfd72292a45f540ddbefca1954d2d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/65a0f76f02ee9805e07cd2d27094d84569874cee |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3b45a5c9798351e463c9e830bd7c2dcb077e22fc |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7bc4d5138a485b16a04a324021c515ecbbf56df9 |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/1770fd647e3a197bffcd069213834a555be81331 |     
    arc      | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/582ad8f9da0b9da1ebbd2f832cef5bd5d7984d93 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/18a6b48dc2ad078b6b641e5a65bbc5a7bb3e504b |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-checkpolicy-2.9 | 2 
              host-erlang-22.2 | 2 
                  cairo-1.16.0 | 1 
                host-dtc-1.5.1 | 1 
              host-perl-5.30.1 | 1 
               mongodb-r4.0.12 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/ed00dcfeaeba62a79719d95b9c0f1f198d6e5f57 |     
  mips64el   |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/d0f44e96ace228b5961e22f730b98f26b2adfa61 |     
   mipsel    |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/da8f7da58b7515c8a07876c0d4c28ef0b00bc087 |     
    arm      |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/70fe4472a008d70c12bac61f69c74676ff9ce2a9 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9b5c64d69c11729c5274bd5cc092caa184b6710c |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/338c50d7e65961c8863cc9796246414c0078734d |     
   nios2     |        host-perl-5.30.1        | NOK | http://autobuild.buildroot.net/results/0b1fc220dfae10278054d2c7d855a274f3618b84 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/dcc9b9096a19b6468af212df7fb17471e7724ca5 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    atk-2.36.0 | 2 
     python-argon2-cffi-19.2.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/993c1fb3dc8770505e10fcb40626da9ea657c2ee | ORPH
powerpc64le  |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/b21bb6f0f8932335706cff02d71ffdd35d80e3f5 | ORPH
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b4f3bb0e8efed6ef120e4a57e943ffd2041bc8aa |     



-- 
http://autobuild.buildroot.net
