From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 01 Dec 2019 07:17:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-30
Message-ID: <20191201071740.055948A945@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-30
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  2  |  0  | 18  |
  2019.08.x  | 21  |  1  |  0  | 22  |
    master   | 99  | 42  |  0  | 141 |
     next    |  9  |  3  |  0  | 12  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 6 
              host-grpc-1.23.0 | 5 
                  gmpc-11.8.16 | 3 
kvm-unit-tests-kvm-unit-tes... | 3 
                     lxc-3.2.1 | 2 
                oprofile-1.3.0 | 2 
       python-matplotlib-3.0.3 | 2 
               wireshark-3.0.5 | 2 
                 acsccid-1.1.7 | 1 
                  flashrom-1.1 | 1 
                   grpc-1.23.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
host-google-breakpad-7515ab... | 1 
            host-mfgtools-0.02 | 1 
                   i2pd-2.24.0 | 1 
                libgdiplus-5.6 | 1 
                  libssh-0.9.0 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                 ripgrep-0.8.1 | 1 
                snort-2.9.14.1 | 1 
                    strace-5.3 | 1 
                suricata-4.1.5 | 1 
                 systemd-243.4 | 1 
                  xerces-3.2.2 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/4fdb78399928302ea57a5b0909702dc241ef1327 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/619914de5dbfb10e2426cf56d2dd79ef040e628f |     
  riscv32    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/748e138b5c70464375741e5d140655b339425bf7 | ORPH
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/7bd784ae14870e122c20c349a9b8ea36fcb779a9 | ORPH
    or1k     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/7e28fda794bac1cd6e7e8f534cc2460409006e47 | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/8145c2986100fa5fbdbfcf566409a8a8113473f1 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/58bc659a213ac78c65dac0714db427501093e7a1 |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/db44ddd069d56e598cf83f3f41933edb1da6562a |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/892032f9168e55964d81f100cd21b1abb60bb7e7 |     
    or1k     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/37b9be76dbc500e848295fa6e7a52dc3d09e3d0d |     
    or1k     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/085d5beb6fa754683853b93d1a391b0ea63a3c18 |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/6c3bacbae8014d342b5cb3d1aac6afb71f5197d5 |     
microblazeel |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/35f44ab0efd35e0112dec54069eb851e274dbb83 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/443efe07ad7dbb2685ac07b1898d9ce85f643744 |     
   sparc     |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/dfffe21fab65b3fc81f449004a6771fd00efbc57 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/55b478479de9e115b64b902ecb899eeee99cb789 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/6bcc2cdc882f7e3238cfca9bc23e04530eb27156 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/249bf5c3c9688d7cc848d19b2c6bfc1e1ba0df0c |     
    sh4      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/05a65153f06ffc07dd2108199bdb1359b02e6951 |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/7e232cb279664f06d25a931e8680729465464479 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/eadab869a038a2cdd35187833db693785c9442d4 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/984cc7fdfb2347ba9ff804fa9df80932c84fec2e |     
  riscv64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/928bb4b7f3f3e5ae273e05e5d9696fe2030e051a |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/356acb4a4df2e7ff8fb9d72c2dc073fbd883c4bb |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/058073aea01821f578e1c401c8156bdeb15ab252 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/8b61337fe19d787a1f38b543eb252b16211de0c8 |     
    arc      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/bd63a5985b72402f2168eeb8e4f04eef9f1d5988 |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/abb1223339f52b3eae5ba98aa3c409ceba0e0d61 |     
   xtensa    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/5166e6794e0cd9453e7e501c99b34d7d594ac5c6 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/6b4790cd30e3f8834874e305e1f8e8cac52f1ff8 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/b1acf9a74c1f1728b7fc3c081341d4ceb462aa69 |     
  sparc64    |         systemd-243.4          | NOK | http://autobuild.buildroot.net/results/8bebb4ebdc22336c8555d41ac844b3940f6d93ec |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/b61c9a768bf9b8d5a17a48ce008f92006a76e6bf |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ef39f4f7220caf854513f2d7f34aaa692cd1786b |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/edcdb7d0deb1ebb3ca23273a492698d1f696fc26 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cc47d2b737084c8af04cbf792d3d961208f843cf |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0eaff66ffda309a185690fa48de2e0ed5192b86a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/c19f4d91bde8aae15925dda2117a5835ebfd66df |     
   x86_64    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/73f78e7dc1ec7c7fe7f03e77ab6d5a8dbd85f275 | ORPH
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/480354184367d4dc53436999dbb82cec42f476a5 | ORPH
  powerpc    |          xerces-3.2.2          | NOK | http://autobuild.buildroot.net/results/77ccdfe33815d9a9d97565b2fc70679a7c79cbc1 | ORPH
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/bfee2857e92f797d25197a8eac786b3af8645a6a |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/a4dd9b32ffd0abe4873f6ccda20c9242b99e08fc | ORPH
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/61f331a7371182da6501950662fb3dcd0c1fa5bd |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7189834831b56594027719e6da4a86dae17b8b40 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 1 
               protobuf-3.10.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/83d688d9ec63bbb0e43a0ebd25f78416aa557814 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/907b3fa415e1367f745181a9fff61799e7b1e844 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/62a8f641f1bf4e2a6ea35011964c5eabe7a78e0a |     



-- 
http://autobuild.buildroot.net
