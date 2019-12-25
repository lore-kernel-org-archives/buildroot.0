From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 07:13:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-24
Message-ID: <20191225071320.79509845FD@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-24
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 26  |  1  |  0  | 27  |
  2019.11.x  | 12  |  4  |  0  | 16  |
    master   | 142 | 62  |  1  | 205 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 8 
                   dante-1.4.2 | 5 
       alsamixergui-0.9.0rc2-1 | 3 
               libupnpp-0.17.2 | 3 
                  apitrace-9.0 | 2 
                apr-util-1.6.1 | 2 
                   dante-1.4.1 | 2 
              fluidsynth-2.1.0 | 2 
         host-ti-cgt-pru-2.2.1 | 2 
                 mesa3d-19.2.7 | 2 
                   mimic-1.1.0 | 2 
               protobuf-3.10.1 | 2 
           uboot-tools-2019.10 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                  flashrom-1.1 | 1 
google-breakpad-7515ab13768... | 1 
          gstreamer1-mm-1.10.0 | 1 
                     gzip-1.10 | 1 
                host-go-1.13.5 | 1 
          imagemagick-7.0.8-59 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
                     lxc-3.2.1 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                moarvm-2019.11 | 1 
                       mongodb | 1 
               mongodb-r4.0.12 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
           oracle-mysql-5.1.73 | 1 
            python-cffi-1.13.1 | 1 
       python-matplotlib-3.0.3 | 1 
                    quota-4.05 | 1 
                 ripgrep-0.8.1 | 1 
                  snort-2.9.15 | 1 
                    strace-5.3 | 1 
toolchain-external-codesour... | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/4d30f77708d6c3167a62207e9138ae7cb76a74b9 | ORPH
microblazeel |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/31903d20be2e9363d5f1579af78927fd282c58e2 | ORPH
  mips64el   |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/9a5c5aa4429eb1f3243ff206e68818482fdac0b5 | ORPH
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/4d60477cc46e4071dd3da21abfe7082e0d12cee2 |     
  powerpc    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/d5a12c35ecd712c54aa0cd64f9db54bdcc66eafd |     
    sh4      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7e30efcbbd9f2f1820a2e98df424ecb0a600fc60 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/346a41b8bdbf1d746796a772b02e1fd06d5aa50e |     
  mips64el   |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/edacbdefb6bd7eda29e80dad468c1151a417273e |     
    m68k     |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/c2de9d55a37dd90b2761a40f952682f8f99ab01a |     
   mipsel    |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/9be8a0d5af85370ecb52bcd315aa73cacbc95abc |     
microblazeel |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/78ffb37363f949012a36c75d040f72d58ecb2168 |     
  riscv32    |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/f2288c464ba3662df214812c0acd6442df72f95c |     
    arm      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/b84ec2c653c85de171cbf6900213cf567a0fa522 |     
   nios2     |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/fae9ce0f14af74d8d8aaff3dc559a503e4d701be |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/f87ca39aad102f41cd545e251a8a744167e43318 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/0d7e04002e74aa747ae77931bddc7c10f0706721 |     
    arm      |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/8c8149a7cf87f24271fa6af8a6c81d2dfe241bbe |     
    mips     |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/d7b05205b0bb45d927b5bb462e06fd8c345ebc42 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/8547fd6aa1bbfe2890d2852636a4df44ebd70223 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a73877b796ad3f369d4c7f5a501d19088279805a |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/9efc451a51b4ba1154264492768f8b6f605b7c56 | ORPH
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/dd6330cb3f5241eb18e88311ad770357ea5cce71 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/a76148056139443540feb1a927a00ed5b79a9ce8 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/32a61d0f4096d98688a4a20065e42e94c24da71a |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/42f4b4881569779162d3efe4628b934f965913b9 | ORPH
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2f053fd993615df4858092855d8bf8584b1457b5 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b1f278f793befc805aefac33796b481dd5e47d7e |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/75e4db5c420ebd19e49ef693b42951004b7fb1be |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/58d05622bac297a194706345b9f3b0211c852c3e |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0767850ef329a1a268ac6052544e2cb6ecd82852 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/3553816ea8b62ce055b64af7aa86664436fb6bb0 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f454c0659637b8bbd6c4f9c294b55d8c9fdb4004 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/bb6d6d1258168fac28a6fa54939a26167eb981fe |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a3824f73ed7469753c80d696859b73ae523821b0 |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/ef80dd0b14519f35be8926cb35797ece9a6b3df2 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/71ec5e93311fa961994b91228166d2c1f2c2d5bc |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/cc63edb660f7e66521aec8f1e6f8100581bb5435 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/973e0e46c60ef970707ac6fc477b44e0e3a9e4ff |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/25c0405872532eee2562ef9d006b537f44215836 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/260f7cb05110c28b7ee5dcf22314a248c631964a |     
   x86_64    |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/e044609e603ca68695d842d08809fdcb35bc8127 |     
    sh4      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/7fd428f34851960a124c895e18b37f6be07ab1cd |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ecf5857ac07c7a749a73380a9a418f0967fc44cc |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c0f7eefb963fec09d4c0d9c9f7ccfa3514b6c99d |     
  mips64el   | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/a1e920f022b8e3bc264a8207cf0bcddea88a7a99 |     
    arm      |         moarvm-2019.11         | NOK | http://autobuild.buildroot.net/results/876bd94d160608fc287c11f34d69c18ad39e5dff |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/a1869bf8f9ae673195dfc4ceddda98de7925ef23 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/680ecee94ee52c83c1abf2545941d4cfcba91e0b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2b2269cc9ff6a0f3a57a2d31ae6ad266c22a319f |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/53a074d3f36fe07039b5005517329ffcb19b3f16 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/a7c3d99e8fc66db01164ec8344d19f8ec49aa06d | ORPH
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/092b0d1e44207c9d3e3ae945bae8533327264339 |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/d60d4ddaa944137ec46fd368c56f52df7d733afd |     
  mips64el   |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/cec2370644c28d56f7b60f9f52caa00521768150 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/88277b8a1a4025165b1e0d88b1c19e2338871b62 |     
    arm      |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/15f2dbfbafc91719ad1f5209811300ddaa5cec91 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/2c8dfaf46330df61c6743c859fb9dd9d59962708 |     
    arm      |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/08cda1e557c988386dea973002c7a775060c38ac |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/69ae10fcbc652832288508233acbbb481a7d1493 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a830bde664cc3bbe56cc3a650b5e34d1380929fa | ORPH
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/9e3422d1a7362ef6d113300a013c1c794282d23a |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/2b88695bd9845658f5c6c6038c5e29772e324316 |     
    i686     |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/742c71de97415a579a70bfbcd8bf48a31fc47509 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/a608fcbf4bacd4ee9e46c407754c22da94cd2d70 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                bitcoin-0.16.3 | 1 
              host-grpc-1.23.0 | 1 
                     lxc-3.2.1 | 1 
                snort-2.9.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/30db87c4226b425cc4140339d1a196366e5807c0 |     
    sh4      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/6fb0d7d246cf8b2c7dc8ce78928b1293b8373543 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/b4bad413b85dbe266aa78db3d4e7a4d906f73b70 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/4173c74d8c1381e3803d5918f4704b606af1475c |     



-- 
http://autobuild.buildroot.net
