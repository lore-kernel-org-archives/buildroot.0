From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 09 Dec 2020 08:15:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-08
Message-ID: <20201209081558.695FC86CE9@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  2  |  0  | 14  |
  2020.08.x  | 12  |  1  |  0  | 13  |
  2020.11.x  | 11  |  1  |  0  | 12  |
    master   | 62  | 61  |  0  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 27
                   rhash-1.4.0 | 4 
             timescaledb-1.7.4 | 4 
              fetchmail-6.4.14 | 3 
                  monkey-1.6.9 | 2 
package/nmap/nmap.mk:89: nm... | 2 
           python-pybind-2.6.0 | 2 
                       unknown | 2 
               capnproto-0.8.0 | 1 
                coreutils-8.32 | 1 
                 dc3dd-7.2.641 | 1 
                hiawatha-10.11 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
             kismet-2020-09-R4 | 1 
            lttng-tools-2.12.1 | 1 
                 mesa3d-20.3.0 | 1 
               nmap-legal-info | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
  xdriver_xf86-video-mga-2.0.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6dbb7c28ffb52b31e081047626efe660a07aa42e | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d439d9a98568a8ffb9159b0b882d969bf54942bc | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9ff377e75eba1463cdbd3cb791abb62b9aba548c | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6ddcf68b1ffd8c98ec85ee9f6b2e2deee387cd66 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e9f2cdf214337bee9a7a8ecd9ee15691b50dd6ed | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b6b491f00a6acc9be355810dbd245b30e70cd212 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1de464460692170a962c3c50bc11ad027dd32065 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/74983b6f4f8b24f37b882634eaaa44f74d3abc71 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6fdc533045eb380ad9761ed851bf54f81d69f872 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0157def2d8005c485958536a1bc579a86ce1ee47 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d5da6262dfaca07d5fd02b1d68c16a0d0b11acc4 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/47626a1e46cca5ae4df70f83d12247a09a964a2f | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7f4a2f7bbc2b049c10a297c4ffb8ca35444f7218 | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4d9e4539b9a00e33b232b18685260f70d60b7af6 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a083dc3c5c8aac7ca7bcf4d52f26c1e9d9981258 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b168c6123ce3b0f4ba3ece07c7214123c9d70117 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d6b212156a38b6f9303c2ee482931e197a1d6b53 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2e0579dbbbda9f60774ce2573d0234f2ab2c1095 | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/590820045c56e4e108ca268f87342c9998c5dd78 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/05625edfee21a08ec00f629297ecc93cf684c519 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d45c104b5160eff07320a1b3ac876e42802c1b40 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/534ee759abd896794fcf5ef24eef86c34122facd | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/82392e0fa02e2227f21a95b8924656b36fba39b9 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0c4fc1a3c7975ee7da1286e75256522f73a79cf4 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/817a820fd37827998cc258e016fc67f5ba1f79e7 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a3afe7c327d76cf4a7c2fc52793e8dc903623a6b | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/820bbc12804571083b6dab6ff098e545d646d904 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c0ab5b63616c4b3f681398883d96129a8f551de3 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/49c945d316aa689c71570ca6d8424d956c0d28b4 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/54b87d07ddc4712e97c4e4f82b596195e527e544 | ORPH
    arm      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/664e2f8bc1f387f6aa836f92b1075e46a9f5a36c |     
    arm      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/6497fe9b0d904e2879272eb57aba2e9a82aa6928 |     
    arc      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/a1314937ef521cadd02d9bb21bfd9fcb10727a5e |     
    arm      |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/7fbe2b515571cfe774bc689767eb1659e6350a4e |     
    i686     |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/f16cad94a0ad502968a02e36e666b6c31897a8e9 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e5b0052c3d35b0d79ea5ca761a8e06d0341f8578 |     
  powerpc    |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/8edefb3d349003b7da4d4f00c87bac6910891505 | ORPH
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/9657e9ff82134cb2443ea24dd76a3ab09967aa8b |     
    arm      |         mesa3d-20.3.0          | NOK | http://autobuild.buildroot.net/results/c0e8d97ef938cd1774d2022cb91c0cc057d26118 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/bc3486ee28c0a7b63b2c2c9d1c68d898505a7078 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/54f7a6e6ceaf725934fd36a6e949c83b9fa7efaa | ORPH
  riscv64    |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/e3d436e94085b9565efac93fe327a369c668d1c3 | ORPH
 aarch64_be  | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/9a86af7f697a9202d942dc93550e97de7e701df5 |     
  mips64el   | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/b703d93bccd147e8d9c80050fccfc99fc81e38ff |     
  aarch64    |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/eae597e6de9068d6821382690807037c4c994afa |     
  aarch64    |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/9242e50507fe674c2661b18a30a08bd783072233 |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/3482a6ffe59235f02ac081a6b3ef148bf86726d6 |     
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/2c3aa40c7cf025331521bec74c75ac720798b275 | ORPH
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/96080d732ccbd0e9d3b3e82641ea6b991f2f6e18 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/83737c3cac8270a4a76ff5746761f9e4a729f7f4 | ORPH
  powerpc    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/3b731986c8b97d8951f99a516eaae646a2dee751 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9e95c063322bfc71fd2502d59f2fe383c0062968 |     
 aarch64_be  |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/da1777907ccfec46929c92deb2b4a24b52181f00 |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/e303ef92f1bd474b1f8bacf5ebc1779865134638 |     
   s390x     |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/41b7f3e367b9059a77ef3f1ec7c18d09adea1994 |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/cea900570ade068c9d8bf5662cc5980455dab833 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/4859075dd99c70af427b4f7a1e55dd2955654e32 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cd212b30e586671e21ac5d8e4ab545ab4b2d443a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/08e7f09003fb439996b505f79fe201947ba42e3d |     
   s390x     |  xdriver_xf86-video-mga-2.0.0  | NOK | http://autobuild.buildroot.net/results/31f24d48b9c423cebc3462d928605b95fece4bb1 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/23a1322a02d2f3c6bb65fba1fb05945fb418e453 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             qt5wayland-5.12.8 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       qt5wayland-5.12.8        | NOK | http://autobuild.buildroot.net/results/d651d97c743311dc50bc6ca13ec30c8489417216 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/aa017b5b175fccd1980746dc4a6c3f6a60ee811e |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                 dmalloc-5.5.2 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/6b3f9b4f3348601172caa152c1eba0b66fbf71fb | ORPH


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/65cc498928f19e7c46981ab635709a2533a2e2bf |     



-- 
http://autobuild.buildroot.net
