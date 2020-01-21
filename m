From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jan 2020 07:16:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-20
Message-ID: <20200121071656.ED1A8863FD@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  0  |  0  | 13  |
  2019.11.x  | 14  |  1  |  0  | 15  |
    master   | 70  | 64  |  0  | 134 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 9 
                    parted-3.3 | 8 
                 libnss-3.49.1 | 6 
                    brltty-6.0 | 5 
                     vlc-3.0.8 | 4 
                apr-util-1.6.1 | 3 
                      bash-5.0 | 2 
              host-grpc-1.25.0 | 2 
             host-pango-1.44.6 | 2 
             libopenssl-1.1.1d | 2 
                 mesa3d-19.3.2 | 2 
                       unknown | 2 
                      atf-0.21 | 1 
             fontconfig-2.13.1 | 1 
                    git-2.24.1 | 1 
           host-doxygen-1.8.17 | 1 
           host-nodejs-12.14.0 | 1 
host-python-setuptools-scm-... | 1 
              jpeg-turbo-2.0.4 | 1 
                    mpv-0.29.1 | 1 
                   ncurses-6.1 | 1 
                 opencv3-3.4.9 | 1 
                oprofile-1.3.0 | 1 
                pipewire-0.2.7 | 1 
               protobuf-3.11.0 | 1 
               qt5webkit-5.9.1 | 1 
                suricata-4.1.5 | 1 
toolchain-external-codesour... | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/b9848b83722f34478e45f4f75a3cc435f102bd7a |     
   x86_64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/4a2b4a372a7c21e1c2a9daf6af99c9078ba41b2e |     
microblazeel |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/98c3d97c3e77609135179da0424fbc1f9e6e5889 |     
  mips64el   |            atf-0.21            | NOK | http://autobuild.buildroot.net/results/6b38ec7408f77e8001a25739a8e5875714e5a36a | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/2c4eb9cd293ff38e6b3f6b411ef838d952d62519 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/7ebe7eb08b464c71723601dad5fbbf3f36729c47 | ORPH
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5264603afb1185c3db8b1d63cce569cb9a350a17 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/121850d7101b5c5302c9738961e7e09b0aad4bcf |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1cd2b818f10246256c1757955d48c6fce629f991 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4b8efa3a4d2f1e8ebcb69c56821b44dd56b9d657 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/87240119ec57a6fc1396b9a8eb9482728603bf7c |     
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/c65a163940a2be808281254d523bd723552e0914 | ORPH
   nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/75d2651578675e8c7cd2e135d1f57b5af6804578 |     
    arm      |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/3f61ec16077ede43ad7e274de2fae57abcdbb75b |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d86c9256df77814374236306ec48258b98b9dcee |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2fbef7193fabdb2bc6b18adceba2973ac77ca454 |     
    arm      |      host-nodejs-12.14.0       | NOK | http://autobuild.buildroot.net/results/1ef947553ec762dba6a6202b1cfc84ceed75dbb2 |     
  riscv64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/9475c1d8f1a8edf9051a906a93d5c1d5b1829fe9 | ORPH
   x86_64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/b0061e38b1cfc2f2a9b71514a80ccd3ce2546317 | ORPH
microblazeel | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/34e8ee682663cc2be4930ee8268b4301a12bf7c1 |     
 aarch64_be  |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/e35150688eaa0dd8cda339e6db402c317c5aae1c |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/096651d9b20363f6ad0294c8182fffe8c09feff3 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/f1bb8664632ce53dcba900e3a7c2e573b69c6154 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/88a8e7fc5cd1fed3d2d75fccf34378ddf50d9673 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/9bc9c26dea0baa9d4f14e36b5d16cd4b509bc1c8 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/ed418e37e85bfd14ba9f6336b23e3ff47d40ad73 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/9732d230f3c8907dfb786900512cabaefa89f356 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/a42e0bd909310ff00b9fdcccd2c7c35689b4e672 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/305fa92c0e8715603c4b922677eb33295939622c |     
  mips64el   |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/ce8711420bd0e1248189d8f8919e04884c3e5297 |     
    arm      |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/730bce7014e66ffea8526b12fe875f03afee2784 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e75f285c3b42dfc44d08807b473698041c281ae6 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/b54ceb44d53c19e0488f8dcf99b87208a8b848b7 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8cde5a6e09979b4b32557cd9d3a2e07e651061c4 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/bbbdeb91f66dd388016cb3c1f865f81277101907 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/5197721afc0e68100eb931f8c8b9633c19824646 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/c45305096f9081273d6a0a3c721ab496f7e5ffba |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ba166716fb83fe7de22919b0c415af9436685517 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8b7252ee64d202a61587640e83760f7d62a0136b |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9011934852a4857d4f00feb7a19e0d5b734294ff |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/44f4f5438904f13c8b8406f994e21a7ec9156c2b |     
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/0facfd25ba487bbd1542f90e3c74dc852b20fbbb | ORPH
  powerpc    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/5bc9959db9ad953a2a23536c3962082eed7fa73c |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/849db94c01d5ae901a230a6d921a821d26abcd93 |     
   x86_64    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/881996172ff2d8b171b2a6d7a68f29a27954b4f1 |     
    sh4      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/9ebd1bc57fd36adfca4f2777c3dc31083544fb7f |     
    i686     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/d56f8cb209a9ab8f064ad37e476b347eff077545 |     
   mipsel    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/2663920e7c1985d80454066672d4ba7d0f7e3c8c |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/69159ffaf3cbd25648499c368453f216da508e40 |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/953edf145af1e2f6421d58b6af4b6a606d2762ed |     
    i686     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/a8965d6998d80c75185161c9c3d995171e1101d1 |     
   mipsel    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/a8bae76c9a5a9ca53d8966724c9fbf5b6df543d4 |     
    sh4      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/60751fcbe500c8f839eeea4494534d3792329f8a |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/151ee09377987cefac9787596a16ac8847802cde |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/2ae48dc2d547c51a54c7cb54fe0f302cd8003780 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/3cb10041841effd01e2c9b6c85cb894df78c84a2 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/516e6c9c4823d8bf2a53948b023ad1724186433a | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/19de490ace4327bffed8769338b4bc7dae43f415 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a17a5515b81a0bdd941faa53af9b6366b2bea3d8 |     
 powerpc64   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/06475bc9f30ffcdf2db55b56252b2a7252ba5198 |     
    i586     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/c6949d5f4a90e9d545e8514eea119b505578f9b9 |     
  riscv64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/a0310e5eeac0960b2536ea05cd15cc0df4f616a3 |     
   xtensa    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/0b2c6b57aa5b969a285700bd4805fd2ea19e6989 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/f110cda8f66909680e91f9d6cbe8d0c7186c52b6 | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/68bac8fc616b6ef375f17f423e5af178eafcf324 |     



-- 
http://autobuild.buildroot.net
