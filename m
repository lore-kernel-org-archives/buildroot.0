From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Jan 2020 07:17:04 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-27
Message-ID: <20200128071710.53AEA203D1@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-27
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  9  |  0  |  0  |  9  |
  2019.11.x  | 10  |  4  |  0  | 14  |
    master   | 98  | 86  |  1  | 185 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 17
                    brltty-6.0 | 12
                      bash-5.0 | 7 
          libpam-tacplus-1.5.1 | 4 
                       unknown | 4 
                apr-util-1.6.1 | 3 
              host-grpc-1.25.0 | 3 
           host-nodejs-12.14.1 | 3 
                 libnss-3.49.1 | 2 
                   mimic-1.1.0 | 2 
                    olsr-0.9.8 | 2 
                    parted-3.3 | 2 
               acpica-20191018 | 1 
                  cairo-1.16.0 | 1 
                  cc-tool-0.26 | 1 
           host-doxygen-1.8.17 | 1 
     host-erlang-p1-xmpp-1.4.2 | 1 
                     host-llvm | 1 
host-python-setuptools-scm-... | 1 
                      icu-65-1 | 1 
              jpeg-turbo-2.0.4 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
              lbreakout2-2.6.5 | 1 
           libwebsockets-3.2.2 | 1 
               mongodb-r4.0.12 | 1 
                    mpv-0.29.1 | 1 
                 opencv3-3.4.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                    proj-6.3.0 | 1 
               protobuf-3.11.0 | 1 
                    sox-14.4.2 | 1 
                suricata-4.1.5 | 1 
                thermald-1.9.1 | 1 
toolchain-external-codesour... | 1 
           uboot-tools-2020.01 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/0c07ee284814cfe31566f1ea3ba73d284fca6b40 |     
  riscv32    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/0566dbb365139137a39d55cadf2101c3df4d2eaf |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/5eb5f9f825e942d1cfe75da4c296064d7e72cfa9 |     
    i686     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/73a0ff0cd2565a57c02738cb9b3aeafe1a514683 |     
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/af981f253ee01f58aa8cc6f459b940a9abfd7fcb | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/ac9f6a7e2085e757a99a64cc1fd8df2c06f0789c | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/763f7e580b93c97a5c950c89ccbf3be7ac8ac10b | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/0f4d24c7e0eea1817ce979ec4021476df35df54f | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/6d2142781ad303d5aca0126b822897e786cf1cdd | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/66826642ceae7f252e72c0631b5f2b1bf1ff303b | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/ad43eb74fee5ba5058b2326e24c94627104d7467 | ORPH
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/38add83ef1686a25433e6f1b754622d11e0c75fb |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/07d30d7537d296d3d3a9a371094501c5721960a2 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2dbfa0ca81c87371b6cce9c49de09914d972a548 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/24004170bf4cff1f40af421ab89c688427682fed |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/152daec143b88839a505a1794a171f594491cb7c |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c39275ba3c514444abcc79ae3a5c0cd4dedda77f |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9b78969c891a693c73cde9e95bcdfebde49a1a2c |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4c6239a37cb5b3793f53cecaca0f2cf7e5c5142c |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2bf48ffac4c5726e6708453b856a59f935f517aa |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/11bf3f941c878a61513ba546a9cf9dee4c48e584 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e808a6c26c7e6878b020c29e4a4d549f6b145f4f |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7d3e820a8dfb2f77aa596e2157a3eccaca69510f |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/2d4b23a4060c2d557cbbdf4cd0faeb53f1f1d8e5 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/9bf1b622c8698840bd14b7175ff7dde3291c118b |     
  mips64el   |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/8fc82d75e3e60f26cd8e27250d78a36a235cf729 |     
  aarch64    |   host-erlang-p1-xmpp-1.4.2    | NOK | http://autobuild.buildroot.net/results/c3cd915c479b631b05d724b13ec6ac0ad97aaa5b |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2ec236b7c93566ef892d3383c5daa31560ca8ec5 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/68d77167996d5109a99ca9d8a9652ac9f5953e15 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a3c4d2d7ad60d0d7a9868c8fe68e28cec6c7e82b |     
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/88f486b915d3048dedd253867c1857dea1177ef1 |     
  aarch64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/91c9efe7ee6aa002bdddaadde175923fae648bc9 |     
  aarch64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/cddde805048ac074f88bcf2bb165d3c4317dee8c |     
   x86_64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/dc3514e6d3fe6da453207a8cb434ed12d846edb9 |     
  riscv64    | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/28eac5b614bbb8d0ad46a80942e4e0299d2551f1 |     
 powerpc64   |            icu-65-1            | NOK | http://autobuild.buildroot.net/results/9905f42f631fdba4e0eead479eec5fa0e64247ff | ORPH
 aarch64_be  |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/0adf5be740cb3e523267149953eb3abc61d6ee04 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/1371fe5237ec61c806f6c1ef55e94a00ae9a4fd0 |     
    m68k     |        lbreakout2-2.6.5        | NOK | http://autobuild.buildroot.net/results/e7acb877f5debbd8f1dca59d6601f4c9233f83c9 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/4fa1d42eb436a4defa34c0e83be71b1bd783e337 |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/4dbf4f86e03391b5fe2000976f0cc3bd86d5c27f |     
  mips64el   |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/0f56ac96067fba0eaddd1073f97bfe4727f747d0 |     
    arc      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/6957f8e65acc0bc8ae557b794d6ff8f803dbb206 |     
    or1k     |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/c56e44fb5b32dcac078d6753cfc35be975fa2193 |     
    arc      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/4cd63815367e693967d1ee15d4b01bc78a87cd1b |     
  powerpc    |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/8496d578cda5d653f3fe191ef74403b1da339bf3 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/3ea64c75fd647bcbe3d9faf9bc67d451bf27ec59 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/323c7427952337a746bd5163483c48d842ad7be9 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/7128d48f5612e878ec54ef7ff871e23fa4184c12 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/05794a39ed782d155c52d54d04f491dbb6168d6e |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/221658d543f6f1b810ecda344bdf3639e6a6c991 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/da616f553f59fc11d994cf804ddc709a29b88d35 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/5e9b7c83fc2460b1b56152deacac4d47c08d2ae0 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/db8bbf437587a42b13413094e5e64694f82b395e |     
  powerpc    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/c34e6ac630466f7bd20466f7c099339e9846b415 |     
powerpc64le  |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/db9e1a4484ca85a4ab82cf3920cebd075236b1a7 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6da8e0d670ab4fea2b1925e6244587085bfe59a3 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/3947974e547ce78b0c15cfbc297290ffd87cc104 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/6a2b5dddf3753b414795aa795c132d6ef71a2138 |     
    m68k     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/a363f8642efe58d5dd0099d698f6c6d5602fe9d7 |     
 powerpc64   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/75b5f80c23f1b466eacbd9ce2ff9da4e6613228a |     
microblazeel |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/a4152fec887f4e4cd9dc9768a2b95bb2eab9f299 |     
    sh4      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/58d65c9afd83da18b2d7d715eed79dfed2ffe506 |     
    or1k     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/1f4fe6c022e8ae86561f6858902d6563ce2c3b96 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/56c4915b24465aaa01785a9db9f63cf6b81976ca |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/5a8fe28dc8dd4810fb0c12ba9c6aad1cb5541328 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8bd70be5f64c66cf04f6fd2481ee699eb97cf1c8 |     
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/717c9d7a4fc700f49d3f7ac1f68f3b2ab834c3a9 | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/4ba6091a01834b1b056d38d4167b770923f7cdec | ORPH
 powerpc64   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/34e62e7c9392d72525682311034cec9bea672bf6 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0edc76bd3773a532fbfe525c202ce3ed49206a36 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/e748518a4cefdadeff94907124ccbd99b34cd29c |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/c33236a527e932ffeb0eb0fbc94c25464deeadb8 | ORPH
    sh4      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/c770e4a4f72734c0abbc73f98d675fee79c6b0ed |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/99acb0c400746df7734d3a6a5c26b5aa145aafcf |     
   x86_64    |           proj-6.3.0           | NOK | http://autobuild.buildroot.net/results/12fe8d441ce47cf4fdcbaf296cf3c9ed1f520f67 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/7def48c8a04ebdac604480b8efa757edec0cdfbb |     
    arm      |           sox-14.4.2           | NOK | http://autobuild.buildroot.net/results/873e106bbe2defb7a343229196300949e8e36114 | ORPH
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/391383ff2c6eba48bfae3649afe8d4daca605c84 |     
    i586     |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/a87f458aab6a6e0c2d2e23c454fd45a9cc888891 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f6afd9fa13c5605cf2e115d39245108aaf441c63 | ORPH
  powerpc    |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/9ccf808ef3fffc84245cfda4911384512580f697 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e4f2e3bbf1abe8dfb29d6a27da9eee7ec6728d62 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/9c112f62da9c475a6d9634080f749d9df6fc02f2 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8282407a4fd945fd3b821c855376786b7db6f0ce |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1940b5b3b481fdf4a8ddc8100bcd9b0c1402bb46 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3ffb10916e24b513e50b124c85bda40d8d09aef9 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                haproxy-2.0.10 | 1 
              host-grpc-1.23.0 | 1 
                snort-2.9.14.1 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/eecf1e27a0fd06c99b8c0e7183b33fa4da7b2e82 |     
    or1k     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/418d947959f02c15187b3f91d4fa98b4807be99b |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/4800c46d60ba1d43d803b3d0f80daead9f86def7 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/bdbe374c1822c0dafae3b92af5a49ba9bdd3aae0 | ORPH



-- 
http://autobuild.buildroot.net
