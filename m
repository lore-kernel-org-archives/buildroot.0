From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Nov 2019 07:16:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-04
Message-ID: <20191105071605.EDDA32047D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  0  |  0  | 17  |
  2019.08.x  | 15  |  1  |  0  | 16  |
    master   | 121 | 53  |  0  | 174 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 acsccid-1.1.7 | 6 
                  cmocka-1.1.5 | 3 
am33x-cm3-11107db2f1e9e58ee... | 2 
                  flashrom-1.1 | 2 
              host-grpc-1.23.0 | 2 
                libdrm-2.4.100 | 2 
                libgdiplus-5.6 | 2 
          python-web2py-2.17.2 | 2 
                 ripgrep-0.8.1 | 2 
             safeclib-17102019 | 2 
              spandsp-20180108 | 2 
                    dhcp-4.4.1 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  gmpc-11.8.16 | 1 
google-breakpad-7515ab13768... | 1 
          gstreamer1-mm-1.10.0 | 1 
               host-llvm-9.0.0 | 1 
                libselinux-2.9 | 1 
               libsigsegv-2.12 | 1 
        ltp-testsuite-20190930 | 1 
        matchbox-desktop-0.9.1 | 1 
                 mesa3d-19.2.2 | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.12 | 1 
                    mpv-0.29.1 | 1 
           oracle-mysql-5.1.73 | 1 
                    php-7.3.11 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.12.5 | 1 
                 rng-tools-6.7 | 1 
              sigrok-cli-0.7.0 | 1 
                    strace-5.3 | 1 
                   sudo-1.8.28 | 1 
    systemd-243-78-gef677436aa | 1 
toolchain-external-codesour... | 1 
               wireshark-3.0.5 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/0592491196cfec1a759e012be05cfa6a1e19c7fc |     
  powerpc    |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/02ff8c8854cca802c68a7f29c70c0221e610033e |     
    arm      |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/e216bd0713c39e37bed3d37bc5086380840abb52 |     
    arm      |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/98d7f40be790fc7740f0842ec55f2b5b31f3cfdd |     
    arm      |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/9aecbbd73ed054e4a38b56d2e52bf3aeaab2eab5 |     
  powerpc    |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/64046ffb66f1d9f0e585534650009a0ae1c044df |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/947333b4469e416a7fd2a67e4c636ec5b48380ba | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/b1eb7ab74da86e35b5a3e8b80c044128f4d56eb5 | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/175ce25ac880cb1508cd4229eb4fd9ec66c9526c |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/cbc91f2ba40e2c4dfafdc994404bcd8a64c4c3cc |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/347b171824f9589b3c1c924cca630836e6e1c314 |     
  mips64el   |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/eac1e7b25128476eccf40aece612e13a1e0637dc | ORPH
  riscv64    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/bbde97f0fa96cbbb70419b7eed418c9ca2600ef1 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/991b49b293bad4b3609f9598bb553bab07226be1 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/eae6e47f690c528ccfdc05e005a1ca7480483e1a |     
  sparc64    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/c7c2c7bc700cd5bbf760bd9c2b80d2db9ef75e6b | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/33dad3615b3385b46e79570df90050e1a798a336 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1e07c31ada7db1d6f8291d10d5f51420f75c82dc |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/1dd65794bb604d1d38c539e1c7ef408bf738ee60 |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/59d25cfa77cace61b51a59212a9e25d5755e39c3 |     
   sparc     |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/b46b3a0c263263c8838d19dc25dd97313718ec6f |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/4aeae0ec616ab9d9b49a3ba300cb2ed8e4510ff8 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/03210905b7a56e7e706bf0c2648928f526a18a28 |     
    or1k     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/6ce897d179a5a6ba76e0d1e82ef6b6d07a493587 |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/c136cea8ae9c6e527698f920619c44a26dd6c8a7 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b5c560778dd277da9449bb02fe196e75aa7bc931 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/3956be952b0667424bdc529fb43b19248e4d879d |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/be42a2d2b2c4a73feae6ce767a866edb228cf3c7 |     
  riscv32    |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/2362fcd300ab98d58fd84401084b3d904b88e8ea |     
    arm      |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/9a9b13c7ab24830aaaa25b94d71f91714c7b4c70 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/cbde2b44a342a97d1d6c79435994e4661ab90eb6 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/616fa2cad5305ca94e0e32fae2aac2993efd174b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3fc577ba9647d314b6802057c45f67e88b0454d7 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/2829e06b0343f957636eff228265c5ced8780fb9 | ORPH
    arc      |           php-7.3.11           | NOK | http://autobuild.buildroot.net/results/d00ad611629acd006e69ebf35766e25047644504 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/e2a0734f36d163792ec6f698d6c1573f550cb383 |     
  powerpc    |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/719188e9c1a9cf19513436a3c37e81a1de6d2fe3 |     
    arm      |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/f29dc2195b5689a64f06268a8d51f0d625c469dc |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/e6c82c5bf7c562bc5dd09db758489e27cdcebe7b |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/e13b5e94e3896df645d980fffdc53ec41ca2a4c3 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/a5e29a827b31710a232d7d3623a306623446a7aa |     
    arm      |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/6f58d9b92e61bb0eaeca9e677e3fb025fdf26854 |     
    arm      |       safeclib-17102019        | NOK | http://autobuild.buildroot.net/results/94761ad67be2f0d22a8947bb5c2ebaabfb6cc0d8 |     
    i586     |       safeclib-17102019        | NOK | http://autobuild.buildroot.net/results/86eabc78e15858312dfbf6702ca13e027e0bc46a |     
  aarch64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/36c32221b874a84d07fd2e5ff2cad84f01357ae9 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/cc4f7e3179b80c2aeb082c8baf78516349ad50a6 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/4f701c28df94a9e58e50aedf350be323abfce0f8 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/acbe9fa8256ebb03cad3bb81e52c2e1fb3e00cfa |     
    arm      |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/3ca2781fd4f3e84047270c238ab5d75134e0ebbe | ORPH
  mips64el   |   systemd-243-78-gef677436aa   | NOK | http://autobuild.buildroot.net/results/9644e0733afe089e68fe1eb12374cb3bec5b6f72 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/6ef383a692dd94156c802581da1bc31736f6d2f2 | ORPH
  powerpc    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/346c2f413b9143c15232119f4746b593ccebd725 | ORPH
  mips64el   | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/8c675300aa7e7f2a5a2f0a2ac0f191b8d2ff8c42 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

       python-matplotlib-3.0.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/ecac1658284c1f2689c06a9193cd585ba3cc8258 |     



-- 
http://autobuild.buildroot.net
