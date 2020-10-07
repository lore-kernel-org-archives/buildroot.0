From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 07 Oct 2020 07:09:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-06
Message-ID: <20201007070922.66A088725D@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  6  |  0  | 18  |
  2020.05.x  | 14  |  3  |  0  | 17  |
  2020.08.x  | 12  |  4  |  0  | 16  |
    master   | 103 | 60  |  0  | 163 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 10
                 fwts-19.09.00 | 4 
 Makefile:753: target-finalize | 3 
                       unknown | 3 
              asterisk-16.13.0 | 2 
  gobject-introspection-1.64.1 | 2 
                host-go-1.15.2 | 2 
              host-guile-3.0.4 | 2 
                   libcap-2.43 | 2 
               target-finalize | 2 
                  uhd-3.15.0.0 | 2 
                  xvisor-0.3.0 | 2 
               apcupsd-3.14.14 | 1 
              bitcoin-0.19.0.1 | 1 
                  boost-1.74.0 | 1 
               capnproto-0.8.0 | 1 
       docker-containerd-1.4.0 | 1 
                     efivar-37 | 1 
                  ffmpeg-4.3.1 | 1 
                      gd-2.2.5 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   guile-3.0.4 | 1 
                harfbuzz-2.7.2 | 1 
                 jasper-2.0.22 | 1 
             kismet-2016-07-R1 | 1 
         libcpprestsdk-2.10.16 | 1 
               libupnpp-0.19.4 | 1 
                    mpv-0.32.0 | 1 
                openntpd-6.2p3 | 1 
                  pango-1.46.2 | 1 
        python-m2crypto-0.36.0 | 1 
                rocksdb-6.10.1 | 1 
       shadowsocks-libev-3.3.4 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                 uclibc-1.0.35 | 1 
               util-linux-2.36 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cf276a9590e58902a37b0f1df73be3d3c2e79f3b |     
   x86_64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/3a3c6f9a0396bffe4b678656894dfc1751aa21c1 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7f74d6e5d3920439153bb81834f6796b37011eff |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/722fd7c84ef4b9c001729acb458f736ee02640e3 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/ad218132f3ded436360b2845a97ee6c109bbb4a9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1439b85bbcdc39a66bcefbcf5ca2e4782f08500e |     
   x86_64    |    docker-containerd-1.4.0     | NOK | http://autobuild.buildroot.net/results/ceabb6aa421bab0e364e8dff363e7964a5b7a3f4 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/7fe2b19fe8ee59fee4e594eb5070cd8622edc208 |     
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/fc76c80d0658cfb564c3500831b34c358a65783e |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/d324a362c079eaae376b2ef99257132595142b1a |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/0f4fa6a4de17fe6a39cad634c24692b1cdd37cfd |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/673ef1e6aa6bf005cd0715c14082a0d452a49853 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/f8f50ab8b4e6167867bda005e95b71697e6859d6 |     
    i586     |            gd-2.2.5            | NOK | http://autobuild.buildroot.net/results/ec76d9316822c83f9c00602893bf1955b24e58c8 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f07cce065be94cdf1e79e5d4c66bdedcf3e8bcdc |     
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f2dbdb7140f9abbc08a970aab1835293394c8aea |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a7c6ab01da00b46cab4bb2191807ea059352da2a |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/ccd9c518745dba1a4b97c929ec9fcda207a1958c | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/774a4210955966ff712f938f9fd46e644a63881d | ORPH
  mips64el   |         host-go-1.15.2         | NOK | http://autobuild.buildroot.net/results/eaed394b85aee3c1e54e10f68767960a5fed6aa3 |     
  mips64el   |         host-go-1.15.2         | NOK | http://autobuild.buildroot.net/results/d6a274e662ac50bbfcf12d7c1e29227bafba5f2c |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/8f728b6e4d7fa5edfac2ae7dd2e7cc7d884e037a | ORPH
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/553d65eedcb64109a30cd580c04d12320a6bcd94 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c32d20cb6418016602c08bfc440b475875f7706b |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9206e0539ef6575898853f690cd93de773c449d6 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d3299fcdd40299e95e0ca7a630a6d7ed1ef16507 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/66ac59c45da0b1aac7d7cb0ae6c033f078bbf5e4 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/74a854c8689b3788faac63c569a5215c6cb36ad7 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/75e4127b9f29e718bd79941903779b94dab558b3 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ef59361e8dd1ee736b62293bec2ca916402b3a13 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4cf92da1b493df6106247c498cfd8798282279e5 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/58c996cf562f97d234abdba98dd57932003eff15 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dbc747b81ed52f68fe7d3b7cf529000ca50d1d3d |     
    arm      |         jasper-2.0.22          | NOK | http://autobuild.buildroot.net/results/1356d309d45b5eedeec375e2fdc0cf2ad7839a55 |     
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/c95364c45c25f54189757e69820e87d67ae2a47c | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/883abb3299c32ace10f5fb1f595b8818415f34a8 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/a30f304d35c215d6434f5cf5bb880ed21c8cc5d8 |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/29a3649413e7b36f9e4cf664e671b40c7cd222c6 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/3d9b7bd23a2de3256a8b85a26c1612b81aa2eeb8 |     
  riscv64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/d271e01131d76434ae4f2dc1573297c5f4b3ee76 |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/8d7e3055f51c1f4cc58e7861378a2b00e8af6e84 |     
  mips64el   | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/164d268ba2ea8d5beddc80ba8c53ccef0aa087e2 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/2429ee7032d836afdf2c3f4d6457a216faf6975d |     
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/4259dc7a3f21bf15ef6e425de2697f26fc761fd3 | ORPH
  aarch64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/e49e5a04a2cae837a16f056de4d64679030daef0 | ORPH
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/11a136488ffa7a424bc6e3b599e8929e4672e2cd |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/4464fe06faa3c0a4547c54ab5557838cda45758a |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/29d50aaa2c2036e21e9217e7850c5556a8c58178 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/857764987a2debd9debd89188484b29244e3f772 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/2ea1ed0084eec734f31aba03246b3e2bb558e11c |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/9585ce3dd004c29cecb0d8c18584ed58128261ba |     
    arc      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/f91c2a09a7c3ccb4d89389fdbb1f96d02cd4c05a |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/097d69839a83cd96b51a9773f21bc8e357555929 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/865904ae459685383c3a5ed166b10813333f54cb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ee7284b0df15002a22d8a3ce1ed10adba3f31355 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b3ef8b96266ea0897c34d979254b6faeb8395626 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b0bb6c634448fe35a9d2adcfc85932721b2b6a21 |     
   mipsel    |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/e58b0d42a726489f01140bf82f94bde1742fffdb | ORPH
    arm      |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/b6070c0721b33824e71833ce53423979980aa598 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/0ea7ee37074b7455f880a6f51a16179f5149b59f |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

         libcpprestsdk-2.10.14 | 1 
             libnetconf2-1.1.3 | 1 
             libopenssl-1.1.1g | 1 
 Makefile:753: target-finalize | 1 
               target-finalize | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |     libcpprestsdk-2.10.14      | NOK | http://autobuild.buildroot.net/results/5d128923f2c95a62449b29736f4b9a51e276479c |     
    m68k     |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/c6d59705c8c384d2ca2d3186ddfabb0defde4f29 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/289d19926c05f5bb7198636ff5f74f52487190e7 |     
    sh4      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/732595201f1f2aa4357a7c8002f9ee74dff85729 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/6601f3b59df422498d901eb685f070bd057e23a1 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/020411b77e65591b4cc4d6ecc8c09a68b2bfcb6a |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

             libnetconf2-1.1.7 | 1 
 Makefile:753: target-finalize | 1 
        qt5imageformats-5.14.2 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       libnetconf2-1.1.7        | NOK | http://autobuild.buildroot.net/results/01ab85b50c62be16836cca19167e782e8145c100 |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/abaf881b5cfe2263e0818e031c3466c1255beb27 |     
  mips64el   |     qt5imageformats-5.14.2     | NOK | http://autobuild.buildroot.net/results/ca2cd75bf5328d3bc397e5fdf295d325631596a6 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                host-gdb-8.2.1 | 1 
             kismet-2016-07-R1 | 1 
         libcpprestsdk-2.10.16 | 1 
 Makefile:752: target-finalize | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/d9486f5e653f6f1579314a4df3c1ed648ec5097b | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/488d5b8291603e3ba5a7e6860b7699c7a0a50b4b | ORPH
  riscv64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/396dbf8b76ab1fcb72dca138bb2d4363dc1a8efa |     
   mipsel    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/a61d447c4509dccfaf2709a1879773906a5a0bfc |     


Gitlab CI results for 2020-10-06
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495365  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495367  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495370  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495435  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495451  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495453  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495455  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495459  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495373  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495375  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495376  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495379  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495361  | ORPH 
TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/775495362  | ORPH 



-- 
http://autobuild.buildroot.net
