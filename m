From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Oct 2018 08:00:53 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-29
Message-ID: <20181030070053.B4EF1207F4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   4 |   0 |  27 |
   2018.08.x |  25 |   3 |   0 |  28 |
      master | 183 |  26 |   0 | 209 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 1 
                     gpsd-3.17 | 1 
                 mesa3d-17.3.6 | 1 
       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

         arm |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/3176f451866040a565fc0ca036bb6e37c9539ea6 |     
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/a0312b74919670d45bfc36903ebde81f67653988 | ORPH
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/45d8940766167cfabb4e1ab48d76515f60c71910 |     
     sparc64 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/4a3d18954ec75cd2fad781187975345afcc34f0a |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 
                qt5base-5.11.1 | 1 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5ab8dc35e8bfc6a980f9198945ab7ee5f08a63e9 |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/4263e7abfb7f09c7aeb96b7dae0296c56c675c19 |     
         arm |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/73601ea5945ac36338f81bd1468bf741aeac54b8 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 7 
               openswan-2.6.50 | 3 
               boa-0.94.14rc21 | 2 
      docker-containerd-v1.1.3 | 2 
               postgresql-11.0 | 2 
               valgrind-3.14.0 | 2 
                   dante-1.4.1 | 1 
       gst-plugins-bad-0.10.23 | 1 
                libmpeg2-0.5.1 | 1 
                   luvi-v2.7.6 | 1 
                    pppd-2.4.7 | 1 
                   qemu-2.12.1 | 1 
          synergy-v2.0.12-beta | 1 
              traceroute-2.1.0 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/bed7a2fadc94acc9adfa28a70e03ae96de63f618 | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/80244ac66b09d4d353386a89fb174069e23e4a13 | ORPH
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e3dcdae2f0345146c7f3564f914025564abb3ed3 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/29b18712df63a8add7dc2b1119ba6b2e04b31153 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/2f78fe2be62f27b5a1d9b248a0564b4f9d1c2724 |     
      mipsel |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/edb05f47aa75c5b81bbe8d3ac002af96c652547a | ORPH
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ab971a7607ede3e1b7847016d5908aad9069a2c6 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/02719e821806dd836ff8433e8c2e8e9af7ded0dc |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a92356241992773197a87ecbe9e743bebac13d2d |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0be6582822b243733467ff88bdf83b6fa03ee8a4 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/833d8f500c3bc3893c042696b35685a025cdd5ca |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6ef31d764ff6fea83cff6dc5781bcbf9437d00ec |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/126e1336e8d40cbdea0b96419c1e5e729c1414e1 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/a7e2a623b675cf18674783209fa2834af04560ed | ORPH
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/f748979caf013c0ddd62df94c53fcb8caafd2f6b |     
      mipsel |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/4c74600294deed0671cf35bb5dbe078ca84c2640 | ORPH
microblazeel |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/0df6b168e66ac4ecc27ec0db3651f53eb50974bf | ORPH
         arc |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/f53a93de90a6be8acbb61d509569fdde26cf2da2 | ORPH
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/ac96b25c1e6de65bcbf1e121b9cf27deeefaa55a |     
     powerpc |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/469f8badc18637bf68f9138668bfa614efefd72a |     
     aarch64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/c13ca8b8afa8de700caf8cd2fa1812b8552b3f4a | ORPH
         arm |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/1908d2d7de8d3aff11ed6fbb8fe4cf3eff54b5a5 |     
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/7e123c55f29db45daf4c7e946b43a9a023ad2241 |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/f0707a609476c25160163730b9e38f764b3461c1 |     
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/56d7c9f26aeb9234908445686fdbc35d444392a7 | ORPH
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/e6e56cd238228f1929fe9ae5e9d403e1e92ad28e | ORPH


-- 
http://autobuild.buildroot.net
