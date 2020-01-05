From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 05 Jan 2020 07:17:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-04
Message-ID: <20200105071804.38B4D85A4B@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  2  |  0  | 19  |
  2019.11.x  | 10  |  4  |  0  | 14  |
    master   | 144 | 51  |  2  | 197 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         host-ti-cgt-pru-2.2.1 | 4 
               libupnpp-0.17.2 | 3 
                  snort-2.9.15 | 3 
                       unknown | 3 
               wireshark-3.2.0 | 3 
                apr-util-1.6.1 | 2 
                  cairo-1.16.0 | 2 
             freeswitch-1.10.2 | 2 
              host-grpc-1.25.0 | 2 
                libgdiplus-5.6 | 2 
                 augeas-1.12.0 | 1 
                 binutils-2.32 | 1 
                 exim-4.93.0.3 | 1 
                  gmpc-11.8.16 | 1 
          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.0.10 | 1 
                     host-llvm | 1 
                   libnss-3.48 | 1 
             libopenssl-1.1.1d | 1 
                         mimic | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                  polkit-0.116 | 1 
               protobuf-3.11.0 | 1 
        python-alsaaudio-0.8.4 | 1 
           python-bcrypt-3.1.7 | 1 
            python-cffi-1.13.1 | 1 
              python-pyqt5-5.7 | 1 
                 qt5svg-5.12.5 | 1 
toolchain-external-codesour... | 1 
           uboot-tools-2019.10 | 1 
                    wampcc-1.6 | 1 
             xlib_xtrans-1.4.0 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/76d42b4cafb3c71a958f0e96d048eb36d00d343c |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/5cc3f7ba6ffd758729efef5a588af7a4fcddf17b |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/9175f017d64a7b6c095372a5f188c0364f7d91fa |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/8ac4abeb855b6e864599c931b7b526480ef75467 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/af6aa1df50480e6310a0dd82a599ba310d6b4de6 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/da613a66fd2449edc9211263e140313748710afd |     
  riscv64    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/5a765f0e65e20266c7203412a46c684a40b66ea3 |     
   xtensa    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/8c6671f64b2746033750ea043d9f96030ac5591d |     
microblazeel |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/e97df5dcd8f508b86ebf6771a2cf67e933c4ca30 |     
    i586     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/e73a16f2f7979405f8f8efaa2ae2e61e54998d14 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2c50a7683e5626d910437da2590609179521c693 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/9da45bc423fdf47096df0a14af82e9e6c0bdc62d |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a69b2439c1df834430e301d7b960f2bd127d8f96 |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ead7b11dd002bd76db3ba16184c32cb3fd13edf9 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/89e55ebbb802598c4d49c2ae01e9306c73e0fe04 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/f5016427e780bdee6a625ab0328c19d60eb490e5 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/17f6607f8cc91eee3acff53845f02922ba68918a |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/159cd8914ea63b2c7095dfcd246eca3c7acd4384 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/38635fdb308f18f2ec00e5374ef0913042745ef7 |     
microblazeel |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/846a6f8a25af8b9681a5ce5401d9f6043db70d7f |     
   mipsel    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/0d7c0a53f44b821e513ef880983865d65f16c8fe |     
  powerpc    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/062ec857cca4daf4ad5aac0a3e527387903bd533 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/8719118d7995199339b59a8e4b60b5f2b8319f79 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/a19a90963daf92d10f2eb6f903eaa58ef9613543 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/cbc0f5e70b1007e186ffac571366b0f0ab3914a5 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/e17ddd0a184c9651db8a44654fe10a7482b5cabe |     
  mips64el   |             mimic              | TIM | http://autobuild.buildroot.net/results/126b869c35cdbb62fe73c68911f0af7e2544e91a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/be842e3a5f52b62c49e2a96c3ff0b12412663f1b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/10aaa1d53e1e8309c1d4e0cb304d5285e3f9d8df |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/69b0151a4bba1a71374fcdd6528a4f84251a182c |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/d480f977e2f19d8000d3f26438c4887270282dac |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/94efd85a21ec0fc6fb36e53c8ba4a643f7285cc3 | ORPH
  riscv64    |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/cf8c9c964d6d6da079f08fa0880dbf9fc2ddde22 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/9084cd777aefe0fa8235514c33767d8640ad7a5b |     
  sparc64    |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/664885257cc71b0d81d09ecf8f76a09cc1fb3b29 |     
 aarch64_be  |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/3e5ef892875af17bb65bc49502c54bcd70eefbde |     
  aarch64    |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/13139b24444945bd57259d231acbe94864c2ddbe |     
  riscv64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/f7061ca41871747c859bf0c82fbdcdfa934f45be |     
   x86_64    |         qt5svg-5.12.5          | NOK | http://autobuild.buildroot.net/results/a2d793c5bc22f8092a7a85129ad8d94456f988f7 |     
  sparc64    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/7e0e370e9e1df7ccc66e6239777a5ec4d78ed9a7 |     
   nios2     |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/3ced0330e1b86068a8a2d19058fdefd1043a4e30 |     
powerpc64le  |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/a556747400cd25f78c8ab166fd7d901c5a2ea0ae |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d5e8925f7482227d8b31a77c847566dd1f0f2f29 | ORPH
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/8dfa2a792d5f92c9e358980cd56654fc9c323d6d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/058bfb360be7f81c615df2fbd0ba9264b6e85465 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/85bcc9e825c777a113bf3b66bddd3f6802d174ba |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e300e1957614f3fd35df94cd3f665038e0277efe |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/51fac509aaa98f9fe634c574d17d98f92212ff57 |     
    arm      |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/accd6bb937bc7e2fdb1649fdc6ff38727a26d9a1 | ORPH
  powerpc    |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/74d638d5de679bd68bd1101185d0ef6ff150624b | ORPH
  powerpc    |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/bda8524d1babf16248ea56753e40d1602e37353b | ORPH
   x86_64    |       xlib_xtrans-1.4.0        | NOK | http://autobuild.buildroot.net/results/1c94ab94926b2fc44aa33f2c7618dfa34204f776 |     
    m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/86a9bb044ee4b693975c3db499a1dc5e6e469615 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
                  libssh-0.9.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/dedd5c0021d3988cc64928c222b74b3428a07c75 |     
   xtensa    |          libssh-0.9.3          | NOK | http://autobuild.buildroot.net/results/cb86f553f9d053dcb52fb96c9fb8b900f29ec583 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
        matchbox-desktop-0.9.1 | 1 
                qt5base-5.12.5 | 1 
                    quota-4.05 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/d1e74bf8ad2e00cd3434de40ae16377d50c0437f |     
  riscv64    |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/d1f9075d5720735ef9a64b8eb4b4dc319750349f |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/22ae89d3a09660a1c4db9baa0783ee64aa51edb0 |     
   x86_64    |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/836132c93acffa232327772f64e4088e24c76a39 |     



-- 
http://autobuild.buildroot.net
