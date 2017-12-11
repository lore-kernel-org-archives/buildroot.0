From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Dec 2017 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-10
Message-ID: <20171211070006.B3DAC206E8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-10
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 202 |  16 |   2 | 220 |
   2017.08.x |  12 |   1 |   0 |  13 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mpd-0.20.12 | 5 
                  boost-1.65.1 | 1 
                  cc-tool-0.26 | 1 
             fswebcam-20140113 | 1 
                     gpsd-3.16 | 1 
host-am335x-pru-package-5f3... | 1 
             libostree-2017.14 | 1 
make[1]: *** Waiting for un... | 1 
 netcat-openbsd-debian_1.178-3 | 1 
                     nut-2.7.4 | 1 
                  physfs-3.0.1 | 1 
                  samba4-4.7.3 | 1 
          usb_modeswitch-2.5.0 | 1 
      xproto_xcmiscproto-1.2.2 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/c6b041f9816f0066e4cf5ad614e72a77ca5e5232 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/930f97ed6cc3faaaf70840be551d5a1238624eb9 |     
         arc |              fswebcam-20140113 | NOK | http://autobuild.buildroot.net/results/2db779b752c382f17429a8193880e2e31604310c |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/e33ffc026e52aa59e0f560d160e79e10cc7c85da | ORPH
         arm | host-am335x-pru-package-5f3... | NOK | http://autobuild.buildroot.net/results/16b06fd0410c0cca7f4b5c81a5f1d4c16d7984d2 |     
 powerpc64le |              libostree-2017.14 | NOK | http://autobuild.buildroot.net/results/9179b65a5a90d53490d9e109c45341f1104406a3 |     
         arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/d0fbeb8f230255325b3c255ef73c3360f90ce4a8 |     
        i586 |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/1dca4b146b17b576c0c2186e3381f403eff653c0 |     
        mips |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/3a5b7dad1f9dac96e0c81bc1aa574eaee8244369 |     
         arc |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/9ebbc5be53898187f21ac705b9e3ee5c9835afc0 |     
    mips64el |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/9d780951ca25c94e30213a08ee0dd356e7168e16 |     
         arc |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/faafe5475a6022a51fdf7e76523e21a42e414d82 |     
    mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/5676477dd5ffd7976eaa2b06f448688b436d6beb |     
         arc |                      nut-2.7.4 | NOK | http://autobuild.buildroot.net/results/5231ff39a0839ec5e1962662004214d4b0773068 |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/e2a02a4038757842affeaee8190a5feda8e6e1d1 |     
    mips64el |                   samba4-4.7.3 | NOK | http://autobuild.buildroot.net/results/e7794a7139306ff6b8da562edc0dfebd07878d58 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/afa30e78827836b7a422df0ca646f2f62e1cbaa2 | ORPH
         arm |       xproto_xcmiscproto-1.2.2 | TIM | http://autobuild.buildroot.net/results/d2022a745891edb4deb5fbf51bdaf3028234bcea |     

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

                libressl-2.5.5 | 1 


Detail of failures
------------------

microblazeel |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/6a2ae7f63cdc156041a29307a9ed4eb81ca7103b |     


-- 
http://autobuild.buildroot.net
