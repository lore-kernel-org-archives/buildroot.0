From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2020 08:12:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-26
Message-ID: <20201027081225.2A3A02034B@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 32  |  5  |  0  | 37  |
  2020.08.x  | 22  |  7  |  0  | 29  |
    master   | 155 | 101 |  0  | 256 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 18
              asterisk-16.13.0 | 7 
         python-intelhex-2.2.1 | 6 
                       unknown | 6 
                  boost-1.74.0 | 5 
        host-sentry-cli-1.57.0 | 5 
        python-m2crypto-0.36.0 | 5 
      libabseil-cpp-20200923.2 | 4 
                libcurl-7.73.0 | 4 
               capnproto-0.8.0 | 3 
              host-guile-3.0.4 | 3 
                   libcap-2.44 | 3 
       docker-containerd-1.4.1 | 2 
 host-libabseil-cpp-20200923.2 | 2 
                   sshfs-3.7.0 | 2 
                  zeromq-4.3.3 | 2 
               apcupsd-3.14.14 | 1 
                  autofs-5.1.6 | 1 
                clamav-0.103.0 | 1 
         conntrack-tools-1.4.6 | 1 
                coreutils-8.32 | 1 
               domoticz-2020.1 | 1 
                     efivar-37 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   guile-3.0.4 | 1 
                   httping-2.5 | 1 
             ipsec-tools-0.8.2 | 1 
              libostree-2020.6 | 1 
               libuhttpd-3.4.0 | 1 
                lmbench-3.0-a9 | 1 
            lttng-tools-2.12.1 | 1 
                  luajit-2.1.2 | 1 
                  monkey-1.6.9 | 1 
                    quazip-1.1 | 1 
              sigrok-cli-0.7.0 | 1 
                snort-2.9.16.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                  uhd-3.15.0.0 | 1 
                    wampcc-1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4659d7abc0325498a430b752c6437b3d5f6aade4 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5b82dbf611a9eb40a272b4cca9e6324f836601bc |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/1aa83fd033b03d8d70b5eea1c11d1c6cb51ee33a |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/c9ca3f2ce73eec91732d59b21e7d1ccc8c346569 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/b6ed1ed3e4226b0d3c5acc96d4402bb670168809 |     
   x86_64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/a35d1137f3b20b792fe8ebcf7d1a30a5bc704244 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d089a2089f671ee1d10dc2a225040d19b14c3750 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/c9e6ea71f6723401a62a3ad09a092be2707d13d4 |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/5f493dc447e244713cd0e7792fe7190d0504c631 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/7350ad55a6e1e1b5b5ad07561b494f6d99c9287a |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c863cf81439f69a218a68f6bf25c029004ad0c9d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/a22d5271de9bec1df88266fe7b27f13eb68a6b6a |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/85ec371fdb6b05cdeab257c0c49a292d96d87f74 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/675ef5de97a8834fc335451b2b3fb48dc5194790 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5ef3473d9d7f2bda96d3c7a09b82efbddd3ea99d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/85100eafdf0830eba8e40fafb0b96f600326450f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/eb78bc87da81bd88192f944e8c3036b8367f18cd |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/80b7d19903e8f134afb917ec4938b01b0f31d296 |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/4104fa64341acaef77a3b266a8dec72aa6e08ad2 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/16b95d1e5686334fe24d50b3b9305f27924b011c | ORPH
   x86_64    |    docker-containerd-1.4.1     | NOK | http://autobuild.buildroot.net/results/e9d01a6f01f6fc7b211e1ff585caf131a3736001 |     
    i586     |    docker-containerd-1.4.1     | NOK | http://autobuild.buildroot.net/results/35d00a7ac53be33c3f3a61ad9c947ec18f59b932 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/a4c95022268980a4ba5340c8b5dec1ba668008c0 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/f15ba6b8ab16a0ee98cce71636d8e6b5ef98b166 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d24e8fed87dcac4a90c7b04080307deebbca2a6d | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/bd832c27cedc1d128e1cdf3b47d3d79cf2dfbb6f | ORPH
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/4b6fa1321270c41a3d6cff637ca4482fd4f2c43d |     
   x86_64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/31c18f5e9c16850bc968706a6d48f9ea993dcea9 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/f7f6c1aa9d8de7c0b9b976f45b08303c963fc6f5 |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/f7aaab9beea759c926238a2628d278f298b87be7 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/34de291ab612fd6d4a256e2c96aa3c5a22c5c45c |     
    mips     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/456ea91346169ba6bbd92907ced612de3a3e2d48 |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/ca1ca4db63f819126d5366a27913a91c514a84ac |     
   nios2     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/a03bc59c098d34af2ce8309e63ff3a6a9fc6d24f |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b1cde3c09126a1fc529bea3a6eb5b001061a3734 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9a05d98dd21b19f895f4026d077be94fcf80bec1 |     
    sh4      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2c3645356a61260684e51fe48d417eedcc582dc7 |     
    sh4      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/4e0c0b5411bdcafb41391dd32230013eb4b64441 |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/6144a36b86d089f2efbdd47b0a8efdc15d39b68c |     
    i686     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/24805dd2f102b8ff79e95d0423f9cce08fd69ffb |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/31ac0e594a320acd89335330d1c39c406173b6c6 |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/cfab162e511fae7bc5c14c919338d94134e52ac4 |     
   x86_64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/7b83c655b1a34f08a4fbbe846b853e2e9b106d7e |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b8eeb6515778496f1633bd933dc4f67d3565a300 |     
 powerpc64   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/1483c3d62854ab89efb1c0f86aa3b3d72caefa03 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/6b56b251b0898cd4cb5b90f7496ffd4a86b9d335 | ORPH
  mips64el   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/e46d73dfd6f61b7fd4cf8b96c27e5c7983bb3a00 | ORPH
  aarch64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/5780d5e21e5e9c0ba86cc422ef995f45dc83cc4c |     
 aarch64_be  | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/8138c63fc13940e1b97f07f24752b199f88ccfa8 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/973b4b725e2a7fd43b8bbbf302162fcca5c4ba2f |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f0cf52639c5c5e833de65d8e0f94c063ee7d579e |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b730319b1942bd72d654e16eff4509e7197ebbd9 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3f14d3a0ad4857f4566712b6190e387d9b362e55 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9616eac99d89bbd02e34ded65665f76ffcbd6c99 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/d8c89d5a95864e7af58c46cda90b15410866960d |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/e898d578fe716b604979cb53b4e69a5239fe0cb1 | ORPH
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/f8eda966c6400c242680db378c8944444d89d5c5 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/38e9427d995e16bc4876f9fdc890c42e4fd04c06 |     
    mips     |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/4e99415728a6f3c6b396a9872924262652f77996 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/1830577843772bdfd6e310b4d361aa1edf5969d6 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/bf5db95cd72375c8e93de27efba42af549f977c4 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/a548c518a7453a8494a04ec68bfb151621acb66f |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/b4e645b580420ddb134db63a042283386086127b |     
   xtensa    |         libcurl-7.73.0         | NOK | http://autobuild.buildroot.net/results/a5abdcc6a12d2326da0fe3daf9ecbb96e5c6cac3 |     
    mips     |         libcurl-7.73.0         | NOK | http://autobuild.buildroot.net/results/113407c1721b601cf2b721d0b78392622000cc3f |     
    arm      |         libcurl-7.73.0         | NOK | http://autobuild.buildroot.net/results/63e6f2a2c43277582b221081d7a59a032994df10 |     
    i686     |         libcurl-7.73.0         | NOK | http://autobuild.buildroot.net/results/59eb43395b39b8a2687656bd403d9b27da962534 |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/3f30f40d52145489f6101ed234d2204f980bd99d |     
    arm      |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/eca9cba5af5c9a8f7782b419a1c38b96d2a2dc7b |     
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/03360f411fe6f793d28d8ca94f7333730327c085 | ORPH
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/3423ceb44d71e69003ae173ad8dae3abe92fdc61 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/e70a9303535dcda982d7a6ea25cc14f2f287c4ce |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/222a5891a7e67e5d584b57a0bc52690450bc0b9f | ORPH
  aarch64    |     python-intelhex-2.2.1      | NOK | http://autobuild.buildroot.net/results/4b4f5b1fb2e6defcc0b939249959930b18c90636 |     
    sh4      |     python-intelhex-2.2.1      | NOK | http://autobuild.buildroot.net/results/b259c6b9e0386fac9cb55ccd736763a3d5b92b9b |     
  riscv64    |     python-intelhex-2.2.1      | NOK | http://autobuild.buildroot.net/results/7e03463b0e937edcb4d750bb8edf6b321b05b413 |     
  riscv64    |     python-intelhex-2.2.1      | NOK | http://autobuild.buildroot.net/results/88816753dbd6b11781efe4326e56a7bbefed7b96 |     
    i586     |     python-intelhex-2.2.1      | NOK | http://autobuild.buildroot.net/results/7b98c69dea9cfd4ee8050132f3e0af1e02d7fbbb |     
    arc      |     python-intelhex-2.2.1      | NOK | http://autobuild.buildroot.net/results/0b6a3e3ae244c4aa667a49f7ea1d6e25c5fa1edb |     
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/87a02d73b31bd5972548c91a828af10bcb9638b8 |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/85f11b65d0ff889f0219b1a1d3bba13c1d6fef1c |     
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/37f8a32e4db188cb684542fcb7afef0ede8a9f32 |     
  riscv64    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/70a1687f8cfe5b145d53ae98a4fa220d085ae2a3 |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/6eee206382969c7b288c8756f3a41557470204ba |     
   s390x     |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/a9a0453157d8aac3e1a964eb659d490a24a459bb |     
  aarch64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/fe6801962c836a29fa5634f4620b232c0dcff0bf |     
    arc      |         snort-2.9.16.1         | NOK | http://autobuild.buildroot.net/results/304a81e330694a218708c7d6a3a48b6f644fbbeb |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/8a6909f852b064373bf14aa1132bde3798de0cc1 |     
    sh4      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/bef1a48852e1d85358a48f72e914c525ea398c2b | ORPH
    i686     |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/0b08ad287e474c42328793efa33d861dadeae906 | ORPH
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/7d7b8738dd0a1525bc4effce2c737d77c7479ad9 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f7ae898c6ecdfa568eb97f7cae6447e97ce306a0 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/9af22fb572e3385793a9f741cb9637b23957c8f3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/07b52b2e78f4a626347b80701798586b1c1b720c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5881776af6eb8ef9a3565f6708af4fe8e51848fe |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6643a4418fbff868916e30bbd286c733bef3b8bc |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/55583cce46d078593368aa8a4f481e010d12e5c2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/87769227d234a097d69f69b9a56f9449acc96473 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/3e4cafc52184159884de943c876b343376bcae9e | ORPH
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/e1178f1b3377676e5db0b1ced3fb45eee8a0291e |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/90a8f75e66584ef7a8c5286b9cfe1593ab78dd6f |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

glmark2-9e01aef1a786b28aca7... | 1 
             libopenssl-1.1.1g | 1 
               mongodb-r4.0.19 | 1 
                    mpv-0.29.1 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/fc0a02383d0d86f9640af226e59d253395b535cd |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/419ec80cb43d838a60d12bb5280bb47f9f48ef15 |     
   x86_64    |        mongodb-r4.0.19         | NOK | http://autobuild.buildroot.net/results/1fbd97d04a2178d20a3c40087dda55580759bcbf |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b78b12d849fd6edad882ed1a454cc61dc4cde1ac |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/9feab51f6e4c8d83f97ad14a4974b847d91f1228 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 3 
                hiawatha-10.10 | 1 
                  luajit-2.1.2 | 1 
                 openal-1.20.1 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/95d6bbd9283ffb4e1b47d196b24eacbc097c8ae1 |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/2d77e831862f53ac7c1be561eb0fe1e1f824ce33 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/c730fb6b68181afc5fb8bd678be8b5cbe8c4ce42 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/7d434e1f3203de480ce0f88915b0344cbf083438 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/87b6568bfdef223208b476b7a904935139407a56 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/16d1b362299581281f3bb3f55e5bb3ebfc840483 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/c8d8e38028aefa556dc1177bdd7dee68072878b5 |     


Gitlab CI results for 2020-10-26
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282596  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282146  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282147  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282148  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282193  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282194  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282195  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282196  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282197  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282270  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282363  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282380  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282149  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282150  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282151  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282152  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282141  | ORPH 
TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/811282142  | ORPH 



-- 
http://autobuild.buildroot.net
