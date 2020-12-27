From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Dec 2020 08:16:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-26
Message-ID: <20201227081641.CCA848545D@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  3  |  0  | 16  |
  2020.08.x  |  8  |  1  |  0  |  9  |
  2020.11.x  | 10  |  2  |  1  | 13  |
    master   | 49  | 30  |  0  | 79  |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.25 | 5 
        host-sentry-cli-1.57.0 | 4 
               capnproto-0.8.0 | 3 
             timescaledb-1.7.4 | 2 
              asterisk-16.14.1 | 1 
               belle-sip-4.3.1 | 1 
                  bustle-0.8.0 | 1 
docker-proxy-55685ba49593e6... | 1 
              fetchmail-6.4.14 | 1 
                   gvfs-1.44.1 | 1 
                host-go-1.15.6 | 1 
                    htop-3.0.3 | 1 
                      iwd-1.10 | 1 
                openblas-0.3.9 | 1 
                opencv3-3.4.12 | 1 
            quickjs-2020-11-08 | 1 
                samba4-4.11.17 | 1 
                 uclibc-1.0.36 | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/86ae9e056600a8095dbdc4d684717bb10ce909da |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/f0943b55daa7396e5f07175aa3905158edf9b5fa |     
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/05244ce119d52f8c4bdaf54446e016370fe3e087 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/0cff5e77750837312c9d3194d6554615c78d73c9 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/e1669f3da052c0708f5a73092d5976d0b251f896 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/7c1adf6daacbe065b81ccb48300587083988de21 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/a6a6f82aa73d6c35211fc8f55953dcf9fe632f6b | ORPH
  mips64el   |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/a0fa2e7fc6d9821823de7bb8cb5d394a2529850a | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/95b1e5bc38e72ba13f52c8406b3ee7029b6a823b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1dad0dbf2a35ddc9df3f2fb1501825fb0534eeb2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/48be3ad31269f4f38a00f21c44e2e21cc2fb7cc8 |     
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/03f2f03bd125278e08cf8f8a95bafd66a856ca7f |     
    arc      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/a8f98aae32ff7692cda264bbc8e394ae9dadc384 |     
   x86_64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/fde682067b06bf8d39cbf2b245eef9d5f06fcd87 | ORPH
  mips64el   |         host-go-1.15.6         | NOK | http://autobuild.buildroot.net/results/3530314f37f71263a95fe9e8e7f11a38dfae7c9d |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/637a3b41f8e0d3dae6b747b4911e76c447dabc47 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cc90b3b58345872c370f0fd86afef4d63061572e |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b99c7388065c6a8d5cb611f618c0569d1f4e07ca |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/709385d54bde03405790b950c78badb7e341909e |     
microblazeel |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/0a5cc795cf9b1291a7f2a07beaf3ae183f064685 | ORPH
    arm      |            iwd-1.10            | NOK | http://autobuild.buildroot.net/results/26c7536b95cc475bc10d4283e93ea9ccd6ced665 |     
    arm      |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/8791945f357d9140e5aff0f802912d8c00f3fdf0 | ORPH
    arm      |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/cca0abf37650d9c4a917228ea23f24c73f73f703 |     
  nds32le    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/a738ddf0216b7d7740c8b1b80fb26d9a07f828c0 |     
    arc      |         samba4-4.11.17         | NOK | http://autobuild.buildroot.net/results/2ceef1b861fe952b2c053da70540bd830014bf7a |     
  mips64el   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/a9ac00e05f8d36a190592a10075c04315a6cbc20 |     
    sh4      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/bed20d936f97b0c41cac9846a921533a851b654c |     
    arm      |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/f221cf22bc582140657501a178f6a0ef80368685 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/07ec19491b223523797d960bc2f45c74181fc404 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/d42036d6f83cc1819e40563c8f83729227dcdc03 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                nodejs-12.19.1 | 1 
                      pdbg-2.4 | 1 
                qt5base-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         nodejs-12.19.1         | NOK | http://autobuild.buildroot.net/results/f10850b104de41107add72bbb8dcee56503c7577 |     
    m68k     |            pdbg-2.4            | NOK | http://autobuild.buildroot.net/results/6db22f865ee791394b6501899c1733e9bcd6b1ba |     
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/182fb2516e92eca7c991a733a0338f0cdc3345f0 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/86cdfe5109d91432ee1d141deb0d035b6c73595a |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                  boost-1.74.0 | 1 
 glslsandbox-player-2019.08.23 | 1 
                       vmtouch | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/fec9e20314e6757197ba4d3ef053c51735ecddb5 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/73d0c9820304e18842ff4487bfd0f16663dbb096 |     
  riscv64    |            vmtouch             | TIM | http://autobuild.buildroot.net/results/7899683365fa4f704231fb74627c0fd423209135 |     



-- 
http://autobuild.buildroot.net
