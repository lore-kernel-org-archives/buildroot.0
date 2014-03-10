From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-09
Message-ID: <20140310073009.AEC0F100D35@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-09
===============================

        success : 60 
       failures : 32 
       timeouts : 2  
          TOTAL : 94 

Classification of failures by reason
====================================

                     wget-1.15 | 7 
jack2-37976441044d69b91d61d... | 6 
                     php-5.5.9 | 3 
                    crda-1.1.3 | 2 
                 cairo-1.12.10 | 2 
                   systemd-207 | 2 
                      qt-4.8.5 | 1 
                           CXX | 1 
                  libcdio-0.90 | 1 
          libpthread-stubs-0.3 | 1 
                 host-gdb-6.6a | 1 
          enlightenment-0.17.3 | 1 
              wireshark-1.10.6 | 1 
                 fio-fio-2.1.4 | 1 
      libnetfilter_queue-1.0.2 | 1 
                 qt5base-5.2.1 | 1 
              host-scons-2.3.0 | 1 
                 lib/cpp/test/ | 1 

Detail of failures
===================

    x86_64 |                            CXX | TIM | http://autobuild.buildroot.net/results/a1ae488761a41e7e737c14622f9604f650ea72b8/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/15708a6de7a3ef39bae945da0938b0a873fb9a67/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/99c856200bdb87585a93a28c454429293999214e/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/e9caf31ea174641073aa8cf827707a892d48328d/
       sh4 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/37ddfdad4d856b31bc19115ea570f30c9d4454bb/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/2aaa78b99dd8e5b17d2d67b666bb9295cf4a89f1/
     nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/f9e5fd9f398bceea1a06989af6c37e11aa10c794/
      bfin |                  host-gdb-6.6a | NOK | http://autobuild.buildroot.net/results/b4b2676979c957edaa5f3d68c3c02daa0932b390/
   powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/832841a1cbd8d1977c2ff7a013366794acea72c6/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/1617178d21b38f54cf7a09afdce729bc8775a064/
    x86_64 | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/29c19ced7f6f5d4f261dae2005884852ae942567/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/d9e565ded7261fb100405a1612dd5e6fb36850b6/
      sh4a | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/e91f50cee86dccf61159ea7985a73e57c65cb262/
   powerpc | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/da20b01aea88da55137bc5946d85e0b1c03a513e/
   aarch64 | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/1e94b742950c0721046374768c84890d44d6aae5/
  mips64el |                  lib/cpp/test/ | TIM | http://autobuild.buildroot.net/results/11f058372a7a219b5f41bcd15246284a2c7bc8fa/
      bfin |                   libcdio-0.90 | NOK | http://autobuild.buildroot.net/results/a11fa3acda9bc54ba758d2b5be3fbc6934273555/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/1a88ca9c47807d38f775b46ec77a4d0ec36b95c8/
       arm |           libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/d148a1e4d39d33f7299d40bd3681aebc53e15beb/
       arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/c8b7c309e4c55fbdfbb7553198addb72a20c1cff/
       arm |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/5279251abdb20881168e22e0d31550012352f2aa/
       sh4 |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/bd10609e16eb57d4bbc6f3c9b3f8362241c36fa9/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/91529e932e3f553518cd1e7a2a4fd2b46676e0e9/
    x86_64 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/e09189d119f72d49a01685768c3cbdbc264a7ffa/
   powerpc |                    systemd-207 | NOK | http://autobuild.buildroot.net/results/4a049f1d16b71d300e380ab14fb136add8687c08/
   aarch64 |                    systemd-207 | NOK | http://autobuild.buildroot.net/results/6c44bec512ae388d1f412a7c5cd3e38b24994cc3/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/588c4b62a5e39122dbe55dceca7f231cf5a77616/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/07fdb90d97fcc01028c5a0db4a9461dc0ef8ea5d/
   powerpc |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/7ff570cb46a145941724355060f34bae787f2280/
  mips64el |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/f81b3d1f8e2805d17ac0e258b720abdd43e257cf/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/1ec453a85b1e379153dc9ea130e0583047235754/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/18a730632e912db746fba7f81aa34265ed8ce668/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/1e699752bab5a508dc00a67b8da2ff45f2ea21f4/
    xtensa |               wireshark-1.10.6 | NOK | http://autobuild.buildroot.net/results/258d74befba1a1ced727d25600cf32ce88ee1c01/


-- 
http://autobuild.buildroot.net
