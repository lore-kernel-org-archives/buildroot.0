From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 06:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-27
Message-ID: <20190528060049.1BD6885FA3@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  10 |   1 |   0 |  11 |
      master | 228 |  11 |   0 | 239 |
        next |  42 |  10 |   0 |  52 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                      ell-0.20 | 6 
                    dhcp-4.4.1 | 3 
                   netsurf-3.8 | 1 


Detail of failures
------------------

       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/2f563785372e0400dabe1c08f9940628304d299c | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/447abcddc8b45a2c9f6c324614d7caa2ead56ea5 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/af421f71ba97a2fcee04d2223cf5644e0369781d | ORPH
microblazeel |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/0a5e9ca2bc5929094b2ca10446b4839845972100 |     
    mips64el |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/281cca94c7cb00790facda34823122be4d80c5d8 |     
        m68k |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/61ad9f8f43fe295ec67720a4fe5a04f28c9c02f3 |     
     powerpc |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/b0c5c6f7566feb722b22428c7e9dd71404c5781b |     
         arc |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/f9c1f022ff6752149a8f158b605001b554cc37f2 |     
     powerpc |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/ecc4cea9200e9658bc1d92b8cf2d7eb49b4c0d7e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8a8a7bd361fb8540d99bab3140da43a74434fc67 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 2 
dawgdic-16ac537ba9883ff01b6... | 1 
                      gzip-1.9 | 1 
   host-xapp_mkfontscale-1.1.3 | 1 
                qt5base-5.12.2 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.3 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.1 | 1 
              wpewebkit-2.22.5 | 1 


Detail of failures
------------------

         arc | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/dcce54a65aa902910e0364deb0f64a7d92c3e1f0 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/cc76f77050f0edda7ef3e57b5b8c7554a583ffe3 | ORPH
     aarch64 |    host-xapp_mkfontscale-1.1.3 | NOK | http://autobuild.buildroot.net/results/5ab1bd86bf82daa9f6aa2cf06b7e69f62f88791f |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9e66469eede22dce60dd6c3182a9432221747b15 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0ef832f77e6976c447836d5b83328062aad08868 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/5f8165123f42d350578ab904af80038914239b76 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/87c09cf3eccfa2d94b1e55eb4495341ee67b6de6 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/5f6de2dc5289485beb010089f1b189c91607aede |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/61f6e94cd5d0f907a942b2b91196f993383885c8 |     
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/faa65da84ace974426e220205f4665fc0a73bdfe | ORPH
         arm |               wpewebkit-2.22.5 | NOK | http://autobuild.buildroot.net/results/c703d45ab691641beabc3440f081a8bc195b4a23 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 1 


Detail of failures
------------------

      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e1191f675272529e4c4fc880f51d3b4b37ba1d65 |     


-- 
http://autobuild.buildroot.net
