From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 04 Oct 2020 07:09:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-03
Message-ID: <20201004070954.EF37687054@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  |  4  |  0  | 26  |
  2020.05.x  | 25  | 11  |  0  | 36  |
  2020.08.x  | 31  |  9  |  0  | 40  |
    master   | 149 | 107 |  0  | 256 |

Classification of failures by reason for master
-----------------------------------------------

                harfbuzz-2.7.2 | 24
        host-sentry-cli-1.57.0 | 14
              asterisk-16.13.0 | 11
                  cairo-1.16.0 | 7 
                   libcap-2.43 | 5 
 Makefile:753: target-finalize | 4 
               apparmor-2.13.4 | 3 
                 dc3dd-7.2.641 | 3 
             fontconfig-2.13.1 | 3 
                       unknown | 3 
                   eigen-3.3.7 | 2 
             kismet-2016-07-R1 | 2 
         libcpprestsdk-2.10.16 | 2 
        python-m2crypto-0.36.0 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
                elfutils-0.181 | 1 
                   guile-3.0.4 | 1 
             host-cairo-1.16.0 | 1 
              host-guile-3.0.4 | 1 
                  imlib2-1.5.1 | 1 
                librelp-1.2.18 | 1 
               libupnpp-0.19.4 | 1 
               log4cplus-2.0.5 | 1 
              memcached-1.5.19 | 1 
                 opencv3-3.4.9 | 1 
                  pango-1.46.2 | 1 
                rocksdb-6.10.1 | 1 
                   sdl2-2.0.12 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
               target-finalize | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
                 uclibc-1.0.35 | 1 
                  uhd-3.15.0.0 | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/82620ca6485a9910a14f39456b8e5d8908aed35f |     
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/15c47055e378df52d602641e35c78d4bfe5a6675 |     
   mipsel    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/fd53f4a034769e0b719f5ad6a865ac33e4c6ad4f |     
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/e590acd2a96950b2e2fead135359c7b9d6b3c8c0 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f9a73446231c99bc5d90a9347a139a5a4aee0b4a |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/ba92c180edf9563de3eb4eb02b3092e3b1704657 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/9ae282e3b3cddf1e0e1c2c2a3b964e1cec992250 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/8af9abef56b5b14dae1894c815a1545fff0d2edf |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/bd0714e794b194c7fc5396c936ee7a4d57b51e02 |     
    mips     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/8790a769b1417b8dc6307016fde3d6135d739acb |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5d4b8cde1584b90611e3ce23e07ed68e393d1ef2 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/398deacf6c425353f9c34be83e0cd727f1e1b8dc |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f1b8b0c96c8e224b6499e685fc97af07200f7036 |     
   xtensa    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f863bd59221dc297a39155f5345df07c33379a59 |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/d780cb7b7cfe65c0a48935be96eb011c3aa6abdb |     
 powerpc64   |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/349d0959c4c6c24bcb0881b7de218df2a6616261 |     
    i586     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/99729bcbf536425baf8c12faffbb7433f7b9b5c2 |     
  mips64el   |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/caa747fcdd658ef6aca43f4ef03e6b6cf70288a9 |     
   x86_64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/f3f7d7c5b4e7929751d8cbcf53327e0001386e60 |     
 powerpc64   |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/b870b1f682c6085091625dec5c001e52f188c376 |     
 powerpc64   |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/ce7413c87e53bd901e3e7ee89f1aa89c67dc3dee |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/329ba35f25628021a494fb474e736c38527baaa9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a9034ac82f7141ebc09b4a9afb3d25911a38bb21 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6a00f2e29618a05c5a6e11550df3ad8d1682a47d | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/deaeebffb715a2dac0c3b3b296947e91b9b24195 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ec1d43282c6bde29ca7fb04797b1d2407daf975c | ORPH
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/43a334d355b643ba76fb1cd6a5370faec8e3c992 |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/2fac37f7919a0172dfb60d6c0d9188db8959f620 |     
    arm      |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/1c818a50530816ba80864efaacb724cb4bdeebf9 | ORPH
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/ec86185a7bb5786302734f2288319e63b211582b | ORPH
   s390x     |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2994e6db595b9135b3624a2e94793403a5bdee82 | ORPH
   mipsel    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f1a47114cf097583eb645b200ac074c9b2d84804 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/40f188ab23f435734e388aee63f96655170031e9 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/acc73307fcd2487137febc163f4f48e7f1ff302c | ORPH
    arc      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/cd71042192a803611ecc07c04f8178fae5e4e135 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/18a045b19bef91c849ffe8daa1e95de1845b83fb | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/accc75fdb2d0ad1d765cb19860e6a38fa808eca8 | ORPH
  aarch64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/7d0a510993ea53e209d0ed15da9043e54224cbf3 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/d02d96a059918d4baadd4b0ab08e0d3e4893fbe1 | ORPH
   xtensa    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/02f8de7b6f47b9e6dcec9ecbc9a4712cacb3aec0 | ORPH
    arc      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/9d8670d04285de332b16c86ffdce3660ef4e23cd | ORPH
    i686     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/81b603ed01dc53a5853dfa4e51eea1e67cae25c6 | ORPH
   xtensa    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/cc5ee29ff853aa01b0a99c841d9cc5e7c7f48a37 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/1d0979d95dd109dbe4585acb99583bec8202d2c1 | ORPH
    i586     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/65314736909ba084f4b9ab1ce484bc2fb86b2422 | ORPH
    mips     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/edec4f80a7191eaf52607cb9bf25342016e679f6 | ORPH
    arc      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/9fd117857fe9843199e4f886f25b995f3c637d72 | ORPH
    i686     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/a973a5cc69000794d4f36ea61088df32087ef9d1 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/b6b2749ee79bce67432a5926702e09544a1c857a | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/b1e19cc16d72f5bda1ccf27f547ec0c8bef4f620 | ORPH
  aarch64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/db2a0556801a3652ba4c9495e8e9375d3104f55b | ORPH
   s390x     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/d2c80318f8c414d9eba9f0987a743b999dfff3e5 | ORPH
 powerpc64   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/182c8ae4de412f374f3f46ec2f363851aeb53e48 | ORPH
   nios2     |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/60466180a038188bf4403a6963b25dc92c2b4d37 | ORPH
  mips64el   |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/425e744809c53832e65ff8d455278000f8035f30 | ORPH
  riscv64    |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/8ad4d942dac33c68c0ea9bd35d92bb821986abb7 | ORPH
    sh4      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/4557255178e1fd83ce99b213de816bcfe196b18b | ORPH
  mips64el   |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/32108ec6fe98892eac6891a304b8cb4809efb979 |     
  mips64el   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/f4e98a38c974ce5d0503772518294db3f8c220a5 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e3463cb55a6d2b914cc5b6f219d4f1b3ad27e428 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/02377200f12af3be65b135a46c909961f7ccc965 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/020402a35a4741e5f2ffaa3d58f2c39c7c639e06 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9e27d206c83c47edad6cdf453ceba95eebea10f4 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/76ad4b3f6f20f9474eb12adb41c103e95469c535 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8de364811ef9cf79d17c66c4e65d1beb5de8955a |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aa1fd5a370aff69467a73e0f45bf0e8f50ab399a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82e2418ba82e00b26a311fa1095f2dcc652174de |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cbf2bc7a6fd9c5d2ed9ea2f75c38a9a640a08b0d |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2f8699da78e9d73e75bdaddbba4a87ed3d6fb559 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3e2d353c648b730c9a1d58e1a13bdc8256af4cf4 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a73afbb405039264bc5a94fafb10fc02da074311 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0ef51339d328f52f0252b32eb77f7a530fa57c78 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1358242badc38fa0463413c766711a305a15449d |     
   xtensa    |          imlib2-1.5.1          | NOK | http://autobuild.buildroot.net/results/5f94d40441c34ea8260ef981af732b87a0d86a86 |     
   s390x     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/937c3657bd08d6c55ba824ccad5936601ee91f6f | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/4677ebc818f1de37ecade3292daff52e3962de43 | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/3e4943577cdc5290fec1b27bd8c269a5dbc0db14 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/328d3745ffd2ef81946dce3b286aa17f1d7476fd |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/f9efe8aa7d81bfa6c2b36863b74d6b27c8a20010 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/f1d5c94020ddfc909dbb3801b1b9f60ec396ab77 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/f25eba3e6fb6b0781a62645eeff4640d115e7b23 |     
   s390x     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/a2929afce4447a4ec9e990e03bd38e53ddfcbc8b |     
  riscv64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/362b21352d3583fda4635e00c74ea5a6b1e13ab3 |     
    arm      |         librelp-1.2.18         | NOK | http://autobuild.buildroot.net/results/7cdc9400d401c13d8ca6e0998b0adfbb1b32fe79 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/f5c93d9bb31c2c23a2dbf5d80352981f2041c2c1 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/ab74079ce847a4ddb9baca43a38808eb3302136c |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/2cdc210d9edd2dfa164b4911ece621094f17c70c |     
    mips     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/dddd7b7a772a1793f8a6b2811f194bcf0514c44a |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/433e21bb848fe0225d753253a8a8d3a3b9d732df |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/0c7ff72deb637e708f05b66e328deeb3cb30c29d |     
    arc      |        memcached-1.5.19        | NOK | http://autobuild.buildroot.net/results/0eb3d887df8413110db9865d87f817d8da125e8f | ORPH
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/577cbf232672ac4c4157c453a4820892b51ba99e |     
  riscv64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/a2ef5f938343f14d5594ef52ef52e684323c78b7 | ORPH
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/50ea055ef6c922464488b022cac7ef7d5c0af1ce |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/845f4428e714d142d27ba8aee5f1f29d1ddf1d57 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/4f56a27d57fa5b01c724ef78d4a5dcd7523363d7 |     
    arm      |          sdl2-2.0.12           | NOK | http://autobuild.buildroot.net/results/47a6cc1e18874ec9ed583b3805fbaae815d787c1 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/0538a24bab65d8aea0047c9fcea7251347b7d62a |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/ea4e1db734f7b06e402a5853e4132a4ea897bcc6 |     
    arm      | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/e96c70910544085dc5299fa59f80ab9c5922fde2 |     
   xtensa    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/9c97683eb20b4486c8e21e4059e30c02f090a081 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/fccde15fb744ba59d781629c91effe1161f40cb3 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/c99328071f782b9788abed597cb694f4568bac71 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/36a3f2cedff100408fe5bf418b40f5f00e9e5b14 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/11e2be720b1e94e2b2b72122056f165779c9443e |     
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/1091d019c385963db31b9144045217100b8ed56b |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/1ac597577d3ff5def96edc487d6923749d19d86d |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  cairo-1.16.0 | 2 
                coreutils-8.31 | 1 
 Makefile:753: target-finalize | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/119e60800054c26a2a0a10a6518d667da91662cd |     
  riscv64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/fdf3954599761516b0faa55a20a11aa6ff27f8e4 |     
    or1k     |         coreutils-8.31         | NOK | http://autobuild.buildroot.net/results/85eba0de9670a45e99afc255f928bc1abfb4d19b | ORPH
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/455f3e09a590f7a6724ab8cd1b86bdf2bba8071a |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                harfbuzz-2.6.4 | 3 
               apparmor-2.13.4 | 1 
                  luajit-2.1.2 | 1 
                minidlna-1.2.1 | 1 
                    mpv-0.29.1 | 1 
                openblas-0.3.9 | 1 
                qt5base-5.14.2 | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/6852e30ec43241e87d6130fd92136a42d690db57 |     
    mips     |         harfbuzz-2.6.4         | NOK | http://autobuild.buildroot.net/results/3fa05d6111523344ab6cdf8587d89723587e1056 | ORPH
    sh4      |         harfbuzz-2.6.4         | NOK | http://autobuild.buildroot.net/results/69c33038a7fae26c3e519bb30aaa2c1fc3b72303 | ORPH
  aarch64    |         harfbuzz-2.6.4         | NOK | http://autobuild.buildroot.net/results/981f75e1742e96fe184c4560587da18b195559d5 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/8feba3b1b4178ee02a5d752ce3753dd62e21482e |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/b4f2e3a21b0188648fe3c61cd752f169ac46e8bf |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c9dbcf8e9fe619f31f3fd53ec5690ebd6e6b139d |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/6aac231e7630dba1786b737eb5ab734dcf717732 | ORPH
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/493f7b3fa0ac0ac6d18596e59d753f649eb7e88d |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/03233bf3359f63cf9622283548b8d2133a02d620 |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/aaeff6f7d955c3a63b9184ebfc352ced09361a13 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 3 
               apparmor-2.13.4 | 2 
              host-grpc-1.30.2 | 1 
                 openal-1.20.1 | 1 
               target-finalize | 1 
                       unknown | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/b7f8e520ba3f51f225704a13610d6f4961651b09 |     
   x86_64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/ddb11ec944412666de1003190978716a24d75f05 |     
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/8403d561f87171b6fea32a7be86d15591105d4b9 |     
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/57d4a9b8faddd5fbd93f746a2c0545e6358975f1 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/f204f9c6e1dd24f3b3ca5b516c6063b11dda7d52 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3f6932d02c6566ae41d5e77a6a71b78bd9e11861 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/7cbf6639ea1eede20940eefd665a60ec2491b456 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/0efd42e3b3ac9bd7cec5b3ccd2568ce20acb89a0 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/bbac940450ee0032083de7c279d97a1792d14a53 |     



-- 
http://autobuild.buildroot.net
