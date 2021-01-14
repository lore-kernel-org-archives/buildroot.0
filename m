From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 08:19:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-13
Message-ID: <20210114081945.61D1486AA2@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  |  4  |  0  | 25  |
  2020.11.x  | 15  |  4  |  0  | 19  |
    master   | 157 | 70  |  1  | 228 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 12
        host-sentry-cli-1.57.0 | 7 
                      ell-0.35 | 6 
host-c-capnproto-9053ebe6ee... | 5 
                mono-6.12.0.90 | 4 
    trace-cmd-trace-cmd-v2.9.1 | 4 
             timescaledb-1.7.4 | 3 
                  bustle-0.8.0 | 2 
                    olsr-0.9.8 | 2 
                       unknown | 2 
at-7c74fa1aece6bc6db351763d... | 1 
               capnproto-0.8.0 | 1 
                coreutils-8.32 | 1 
            erlang-jiffy-1.0.6 | 1 
          fuse-overlayfs-1.2.0 | 1 
                gkrellm-2.3.11 | 1 
  gobject-introspection-1.64.1 | 1 
             host-cmake-3.15.5 | 1 
            host-libusb-1.0.24 | 1 
                     host-mono | 1 
                    htop-3.0.4 | 1 
             kismet-2020-12-R3 | 1 
               libuhttpd-3.6.0 | 1 
                 midori-0.5.11 | 1 
                    mpd-0.22.3 | 1 
                    mpv-0.32.0 | 1 
               qt5webkit-5.9.1 | 1 
                   rhash-1.4.0 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
                  waffle-1.6.1 | 1 
                xenomai-3.0.10 | 1 
         xkeyboard-config-2.31 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | at-7c74fa1aece6bc6db351763d... | NOK | http://autobuild.buildroot.net/results/fd186fce71fbeb2cc3b52653bedc15d3b25ed5d8 |     
  powerpc    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/90e018517dfcaeda19a7a365baa6b9fd5bcc3916 | ORPH
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/25b7e23b3cd39b26a4d2e0e2df2f9f8c162e93e3 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5b0792827e613398c1800d47bee80768bb601c7e |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/046eb8fddfed4cfdd0ab722872245068f255e48b | ORPH
  aarch64    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/3f451c219b764a3b4902fd76c690313d10936d7b |     
  aarch64    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/ce22dd88371b590ee6240ade8b9e21c33d4b7d71 |     
   mipsel    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/e754b6908b19fc3e223903cd1b99aab1195223f9 |     
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/7b836de756583a9ffca0fc328e3f79afc6000c77 |     
  mips64el   |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/7b89a57993b8ad92c59e79d9f94ec2c85f40376b |     
  riscv64    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/2b239281e935f6bb3499c25f3382f88d2f1dad3d |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9ee5185c759288843f6726b850c9b0e05e56115f |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/c90dcd70591cfb2b96506f10109aeb4c5b46f332 |     
   x86_64    |         gkrellm-2.3.11         | NOK | http://autobuild.buildroot.net/results/98d0eda546b09e60eebbd3c3a28493f09dff7e62 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/cf3561082d4cd1be3b374904263c62c8b7210d2a | ORPH
   s390x     | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/cc9ab62191f42c668bdcb29cee65ce440f089752 |     
  mips64el   | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/ef28ddf031445aea528600390d09b2f86c50e376 |     
    arc      | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/93798a1d4f67d08065ad2e63a96bbc60ac5c791a |     
 aarch64_be  | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/bf7a3b434455c77b2d82ed975cd910c82657b122 |     
   mipsel    | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/07a5d962d91b95caedf06eca5ef9d4098a57bdd4 |     
    arm      |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/95bcde479ac2584739626c4a57dbc24a2da32e40 |     
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/e64f4d388125c550333b51b202b6297363c6b0d0 |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/e484b1ca240b9a959e98bfb5c262163d05656b18 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/948918cba2ae6c79407d6e41e1723677670d331e |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ca74b929d9de97958569f82c4c01927522a8b0e9 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/58969092258d6c86f6fd05926f7f502cb0738d3b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c1a146fdad948d331a1a3eb154b1ca51276d13bb |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bef8b85256b335afe509fb90cb22088e0fe42974 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/225031fdf34a3165f3f6c6ba2bca10700e38f3fb |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/81aa16d69d0a53ae3e6cc2d1a25c7c3a421ed61a |     
    arm      |           htop-3.0.4           | NOK | http://autobuild.buildroot.net/results/374003267b8f43659c4497b5c7983d53a516dd3c | ORPH
  riscv64    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/c76d7d32c52eb3a86600b4ca606afbb00dd79b29 | ORPH
    arc      |        libuhttpd-3.6.0         | NOK | http://autobuild.buildroot.net/results/5b6a3b0a94f9dec347b27a5fdc1c7270a267b55e |     
  aarch64    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/ecbe69a124f74affc2658af60a009483a56fa57a | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/39658e2ba6ae5afbdf806247ae2dab0a3f9cce1b |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/17f1282abda00aedaea1f3edbcae1b216b70552a |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/5d64d8b64d855f371f5b0528cbe1ae3d1b703053 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/95b87dd776f0184a6cb22e07bccfe6a522cb6bd0 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1394ffb36c52c607be57fc831324423794d54e95 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/91efcbbfd5491876a1ec8546716a4444a3fe691c |     
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/cd803b9dfe65d51da1f0bbb962ade8367a892656 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0e1708d3410031f769865eb0af4119eb1fcb23e5 | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/18e91098e5182f516f907c9fd5ccf013e4d7f5ee |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/598ca65cf0c7ecf9ceaecb75868b656570ae00d2 | ORPH
    sh4      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/80a68e39fe8c7d1f69a4c3be894a8645f540ddfa |     
  aarch64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/1efbf5239505d14903ab15096667ae3bd683c4b6 |     
  mips64el   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/4434949310c6302256e4aea8477cb3467e7cfe0d |     
    arc      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/4afa6e07b498d261c69eb7fbe726cf9dea9334e9 |     
   xtensa    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/c3912acb938f7bb2c026b346417263be8370db61 |     
microblazeel |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/d74075bb7c8564a83a367f79c37c22b60e7068ac |     
    arm      |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/04612697204cdfd39e0aeb5bd57039db48c339a1 |     
   x86_64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/ef3ad74cedf50e36ea97aa448339cd500ddf0251 |     
    i586     |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/4aa2574f820c85c01ff053c6c92dd97dd8437c99 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/3eb3739ad19bdfa011f7d2cbf7765dcc376b2508 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/c17125067e773cc7a7e9b8a171d4f846f8cb93d9 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8a4387f365ddb3175168d79bbd5d9965f57a9f8e |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f907a18f512d469a5ad5a9d3f149361180a40ae8 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/b648902a11e30a184659d3f97f82a69a1d7d8a78 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/dbc409dee6380fa20f6bc4431ed6411a114aa278 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/bd38569b138124f2204452bbae8ad34718c20dfb |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/839c316112d0d8cb3477686c30f0558ea4dfebd1 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f33810d2aec0b33705bb293b9732246b27ecba7c |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6feb66653d959c13bd25fda7c56432766276352c |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/ef860588a9965ee343e88f8e83c0298b2cc0b489 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/85ca07f0f73028271cdfafcb8fdb107c53749591 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/38ea39f94de64db7a79bb039a9f55987eab3505a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/84de49deb5ce0629b8d224985547c5ef81216d3d |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/19bed239f298bdca214e85da817f0d1cc87b2236 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/098080b79a346a40206361ea1e1187ec87e8969b |     
 powerpc64   |     xkeyboard-config-2.31      | NOK | http://autobuild.buildroot.net/results/4d561170e2c906e0a7ad4c50d57b49c5962ce94c |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/c6d4e37946d3b5cd3c9bcdc892945c23811c1792 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 uclibc-1.0.32 | 2 
                 binutils-2.32 | 1 
domoticz-0f411f781ae4fb4a82... | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/fd50c3346856c2c7ca857afe4f6edfd9502ec28f |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/1369ea9b55edbc57955f1b476e6bbf1107915658 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/211f98c85d58a0c3e469e97c1ebe96b0d11b36d8 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/8d5f1bae3a441ca2ac3e7606b827781b8de7a541 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                 uclibc-1.0.36 | 2 
                coreutils-8.32 | 1 
                snort-2.9.16.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/7bf88a826e8ef043810969ba9f258b747d902470 | ORPH
    arc      |         snort-2.9.16.1         | NOK | http://autobuild.buildroot.net/results/7c033fe0268f0305f9214d9d8bb64ce4314ebd96 |     
  riscv64    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/3c7dd7bfd2c89f20b60da20769ff677437570817 |     
  powerpc    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/442d12731f0d1a3ea9e766d563adb494a7aec180 |     



-- 
http://autobuild.buildroot.net
