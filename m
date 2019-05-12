From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 May 2019 06:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-11
Message-ID: <20190512060056.B444922836@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   0 |   2 |  20 |
      master | 191 |  19 |   1 | 211 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 3 
                qt5base-5.12.2 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
          wpebackend-fdo-1.0.1 | 2 
                gnuchess-6.2.5 | 1 
                      gzip-1.9 | 1 
               libsigsegv-2.12 | 1 
               linknx-0.0.1.37 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.27.2 | 1 
                       netsurf | 1 
                 python3-3.7.3 | 1 
              qt5enginio-1.6.3 | 1 
                suricata-4.1.3 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/2b3627bca47d586cd7801f731402b878e1d125ac | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/0d20cc752cb75794930575263a9adcc14bce30fc | ORPH
     nds32le |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/aabff7b55283706e35182be72f6fe045aac63f8e |     
      mipsel |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/1863f8f27041bc15ca68e786ba3b8e4764c40574 | ORPH
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/5281ad0ee101100d706382ab07ea96c961df7b39 |     
         arc |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/532dfd6325dd9c9ce9045fd003b1934b5dff6172 |     
     riscv64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/7e7f2d3979192ce73811da23bdcb5e1a4c9b22e0 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/fe69751550b226b0385bd6ca3dff7c005efe594f |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7d577d0a5f8075f3db450513e1cd9ddad361ce3d |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0b92bc7f1d08d071fefeb2a3f3cb804ede2754c6 |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/9552d9d37bad5fc572d1dfe1c1a79790a15bd7d6 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/8ac1a737e57d24187768fc1ee640b4be404dd83b |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/c3c65bc0b40b8d6526fcb03a7cdac3ccc8a34fda |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/bdc68715507b75e1d5afa8b852f5043af67088c2 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/78e12186a7463bc633d85423d1aefe72f75dcc88 |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/16921407d5f13bd1638bfc3453f5fa86e9c4888e |     
         arc |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/4a4649d0dbc506beb52d713ae46a62927f75f0fa |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/ae8bf83fbe08e68326f0a86012d63668416b41e5 | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/9856858af15f1924af0c86a02aaf385a961162e6 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/0ab556bbf95c6056f71295b7c8a6c853c34c4a0b |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       netsurf | 2 


Detail of failures
------------------

microblazeel |                        netsurf | TIM | http://autobuild.buildroot.net/results/765c5ab07a7e62d437e300f2ae9cceaae73ba79b |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/3aae6866393b74056c4216f71ca58f0d76646f64 |     


-- 
http://autobuild.buildroot.net
