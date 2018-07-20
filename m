From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Jul 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-19
Message-ID: <20180720060020.D881B207AD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   4 |   0 |  20 |
   2018.05.x |  20 |   2 |   0 |  22 |
      master | 140 |  45 |   0 | 185 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

        wireguard-0.0.20180613 | 2 
         libcpprestsdk-v2.10.1 | 1 
                 python-2.7.15 | 1 


Detail of failures
------------------

     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/8f7870bdcb039387cdba8362426ecf43f17ecfdc |     
         arm |                  python-2.7.15 | NOK | http://autobuild.buildroot.net/results/e771f459c1dfa20fa2d8bc8c20cba90d4b31dd01 |     
    mips64el |         wireguard-0.0.20180613 | NOK | http://autobuild.buildroot.net/results/fa70e258716f21bf793105b85b33f8c702d3b4ca | ORPH
         arc |         wireguard-0.0.20180613 | NOK | http://autobuild.buildroot.net/results/41041508a97dc6e99af6c556aa1bc3698610936d | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-gcc-final-6.4.0 | 1 
           uboot-tools-2018.03 | 1 


Detail of failures
------------------

microblazeel |           host-gcc-final-6.4.0 | NOK | http://autobuild.buildroot.net/results/b13e24b2fe439e752f2ad87fbce99de6cd389514 |     
         arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/f26b17a20b9c5fd2d5ebbcfdc35ee7fbc5d68d0c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   bind-9.11.4 | 9 
             gnuradio-3.7.13.3 | 6 
                  boost-1.67.0 | 4 
                cutelyst-2.5.1 | 3 
               mono-5.12.0.226 | 3 
            perl-net-ssh2-0.69 | 3 
linuxptp-303b08cbf55096aba5... | 2 
                  samba4-4.8.3 | 2 
                  zeromq-4.2.5 | 2 
               asterisk-14.7.6 | 1 
                busybox-1.29.0 | 1 
               domoticz-4.9700 | 1 
                   erlang-21.0 | 1 
                 expect-5.45.3 | 1 
                     gdb-8.0.1 | 1 
              host-erlang-21.0 | 1 
            host-python-2.7.15 | 1 
              python-pyqt5-5.7 | 1 
                      qt-4.8.7 | 1 
              wireshark-2.2.15 | 1 


Detail of failures
------------------

         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/14b880e870066011cae9a0d1709ac8e8841c01fe |     
         arc |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/a7f3eacb4f180ea47b7c383fa055700b938510cc | ORPH
      xtensa |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/cc64c921e0187be4964beb8c5960c4baa06c7e72 | ORPH
     powerpc |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/c3c2fac7822aa7c265cc6a3c36b064faa5befa16 | ORPH
         arm |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/fb8ffbbb034fb87f8a89ba76de13aa8089f01415 | ORPH
     aarch64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/3c5cf81da6bdc539b9c67ad45e1cc2b78485ac86 | ORPH
  aarch64_be |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/fd875f5a23cdc9af5e58b2c4cf1779fd0e88076b | ORPH
      x86_64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/5360f058d30cdae2619c4dc58847df22c692b0e5 | ORPH
     powerpc |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/fe263d1f8bdc6b56bbb33e08ca36a45030c71908 | ORPH
         arm |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/48da16870b19af30c9901ea703b70fd65fd648a8 | ORPH
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/19d7f1c85248b2a001882ef55d7d58e5856561b9 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0921fae5cb8846bbfb1bb684a68e24d10ef48bc5 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fe63280eceab4c76f844b005ffff81db13995923 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6702ee6e2193274193068af70d6941f10d868999 |     
         arc |                 busybox-1.29.0 | NOK | http://autobuild.buildroot.net/results/8bb7dee0c3dbed2e70a9f3f80a85cd0478415629 |     
         arc |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/ed2d387e1a80dc7d5db519eda7fa75a856374206 |     
      xtensa |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/9fd2f645ff9ab3150ff1cb7082571111a80dc2be |     
         arm |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/84c29fc0d6212f33ff1efdf8495cbb84e4eeed65 |     
     aarch64 |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/775b59f5dad080bbc0a40d809085f70ed63a4ce8 |     
         arm |                    erlang-21.0 | NOK | http://autobuild.buildroot.net/results/d7a64e3784ef86068b83c21acf0a4865d98e72a4 |     
        i686 |                  expect-5.45.3 | NOK | http://autobuild.buildroot.net/results/df42fac58cf0f1408f60697f88604765c76f3039 | ORPH
      x86_64 |                      gdb-8.0.1 | NOK | http://autobuild.buildroot.net/results/44681879858e712ae940713930a59b510a8ef88a | ORPH
        mips |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3c3a82f4252f48e18bd8f9337d2e81442c5621e6 |     
      mipsel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/024880dce5b69804619b9f5040185a7799df0cbe |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/8e89efc1899578278f55994e6e13810933d6c733 |     
microblazeel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/aa827b7045da34b7787772caa6a33af389823e65 |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ca05386f8a2d25d1cd875b0334599361b572326b |     
        mips |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a6fe7166eab2355460a1822fd65637bb3ea1da63 |     
     powerpc |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/bc5648ae086c8653026b56ac4db5dfc96aa00515 |     
        m68k |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/f6cc66d863ca37c277ea13733c93ea3afd91b271 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/f66f5aa0480fd815773b9fe47cbfbaf33dd5fb50 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/7ff273bd42f3f12d12cca7e25f5e3bc89d2007e5 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/a0004999d8159c841254f9405c6dfa8e328a5891 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/0e421b99b6923e24994e6fd9192a0918f9598c34 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/f5793d2958cb1b0cb4a0f6ff4e659a76c5ee31df |     
microblazeel |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/8313dd572bef9d54e97885e2ae287af1f69b91f5 |     
         arm |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/7b3ddc6c0b10bd53627e0d56a38a43cb3a726244 |     
         arc |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/9b0e09391fd9c618c2172fe2e3b3c8b6c595dcf8 |     
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/50f771b003af3af0f89f06f29028d60690d0d9f2 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0983ccdedaa130a9e6fb8916de2e5eb432cabbe4 | ORPH
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/216a8cad75a3eb817a7f09730381d962a3cfaeac |     
        or1k |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/b2b0f04f0ad99e2f29bd6e30526e5e2da59ec23b |     
      mipsel |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/b83a40d66b0716dbb7e5031784ada47071f9ff8d | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3bdc2a0376843dd760326cfd8094165c87c4af82 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7c8b4021939be376984fe804e59330cdcbbf440e |     


-- 
http://autobuild.buildroot.net
