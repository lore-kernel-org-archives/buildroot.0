From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Aug 2019 06:17:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-24
Message-ID: <20190825061734.A3CFE8675F@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-24
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  0  |  0  | 12  |
  2019.05.x  | 16  |  1  |  0  | 17  |
    master   | 189 | 19  |  1  | 209 |
     next    | 14  |  8  |  0  | 22  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                   mpd-0.20.23 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          mpd-0.20.23           | NOK | http://autobuild.buildroot.net/results/e7dccd16e568dd3a181a3e89eb7fa9bceb817ffd |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 3 
                 libdrm-2.4.99 | 3 
           host-harfbuzz-2.5.3 | 2 
                     host-llvm | 1 
           host-nodejs-10.15.3 | 1 
      intel-mediadriver-18.4.0 | 1 
              iputils-20190709 | 1 
                 jack1-0.125.0 | 1 
                  libssh-0.9.0 | 1 
                    mpv-0.29.1 | 1 
                qt5base-5.12.4 | 1 
              qt5wayland-5.6.3 | 1 
                suricata-4.1.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/24979d45e28f04eaa1185c85eff72cfaf1c410ca | ORPH
  riscv32    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/c0b424580d18ba57dfcd4d205caaceeb6f4cd892 | ORPH
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/12a8e58eaa133653d64b8fed1952af1e4f4128a6 |     
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/3af813ceea1ca512efb8a8156dea98c63b6bbd9c |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/14b032dea1f6f2bb468aa0a93a3ab0ffb310c37c | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/06acf3757aeef53737b5c4dcc950e19edbdedb91 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ab45ba0235956364de03b5435d793f405ee41d8c | ORPH
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/4a37fdd850fff93a0552d77f253a6c7b44cf0fe8 |     
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/ab5f8eb8aac4026002e3c6c862943251f0c81aa0 |     
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/73a16ca817034ab6557c7baddfd8c76815c906b6 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c21d8039a74798a2def5ba47c60b235e4b784a40 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/1a280b27bb53f1c01774de6a196fef719a1fdae6 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/1ef665b8385bb65fddbe21d41d26e32ba938c537 |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/8db15b0f67f718ada902d9aa2e0178f651d0bc1a |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/52bd8f7c36a6aaf4933bfffb47e31238a678aa7a |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/6c73996c51812f337ea76deac032542db86546e9 |     
    arm      |        qt5wayland-5.6.3        | NOK | http://autobuild.buildroot.net/results/b2890e19e856020aadcb451699e958c8ae7dca7e |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/1505ee1f9cfca38c7012ffd1a2e35ee753e39358 |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/0ef91c5216fae93aaf7c35baa8df03466c1e98f4 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/9e152a46ec99f621af6771ed8d8e6b493489b637 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          host-capnproto-0.7.0 | 3 
                    dhcp-4.4.1 | 1 
                     gzip-1.10 | 1 
           host-harfbuzz-2.5.3 | 1 
                      icu-64-2 | 1 
                   mpd-0.21.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/3c2d8c936f858942517befa2a8a744d0d725bc2c | ORPH
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/53c77b057f0410a4e00c5328514f867172c2097a | ORPH
  riscv32    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/01efe12dc805475b2ba3cf613e97a4cd5d7c1b9e |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/48f55db5ad04585501518ebfa05e02c5cd2de85c |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/fee0b88e4a24da84fd1a954028ef928771647153 |     
  powerpc    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/6957caf6c2eac7d8e8df8e81574c2829a86f3c94 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/594bbed47f37b392699d543d70cdf58711ee757b | ORPH
microblazeel |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/564cd9f509eb7cb503966bedff117e79c8885f2a |     



-- 
http://autobuild.buildroot.net
