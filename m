From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 06:00:27 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-13
Message-ID: <20190714060033.7DA75878F7@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  14 |   1 |   0 |  15 |
   2019.05.x |  17 |   2 |   0 |  19 |
      master | 124 |  30 |   0 | 154 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.3.7 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

         sh4 |                      php-7.3.7 | NOK | http://autobuild.buildroot.net/results/dbe5e706553f13c6a3e4ae585b28b3ee8412b49d |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/5d7312fd2c9785f550b6797fd2a71c4f330f3241 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     glibc-arc-2019.03-release | 7 
                       unknown | 7 
                harfbuzz-2.5.2 | 2 
               host-efl-1.22.2 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                   dvblast-3.4 | 1 
                    efl-1.22.2 | 1 
       gst1-rtsp-server-1.16.0 | 1 
            host-mfgtools-0.02 | 1 
               libgtk2-2.24.32 | 1 
                libvips-7.42.2 | 1 
                qt5base-5.12.4 | 1 
                 qt5base-5.6.3 | 1 
                    ruby-2.4.6 | 1 
           udpxy-1.0.23-9-prod | 1 


Detail of failures
------------------

         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/08208e211c581dcc88b93021066f3295e0afedc7 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/5ee8379397e9a710438f32fdc5f19fec802391ce |     
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/16fd6d2aeac1b664a5dc8aa8f1543f103da698ac | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/4cc9f313f56264cf3c03d8ba1d545676e30c91b7 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/cf700626054eb9b1fd9da1692f92915c4f2ce4f0 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/b5203b4934492ecac1e8a5f8e370a3a63289959c | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/34ce3dc69c73b326fa0bd3efecfe8245d4861de8 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/7eae6b93773a005db5b81f65b7e7a1607e4b28ef | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/baaae1e5c193a9ebce6cbb4cd7f828f87ea919ba | ORPH
microblazeel |        gst1-rtsp-server-1.16.0 | NOK | http://autobuild.buildroot.net/results/1effb155ffafeb274c811eae7c2542961e6ba5f4 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/0a2456be0829816a2ce0f77899ef49916f185652 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/078f7a9dfe79bb73c9bd5354f3fa86c3276cb9fc | ORPH
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/7a0efd20a45489902392e31ac5201529012c129c |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/c17c6f18f773db93cae576ab6ed5647ca7334304 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/0588e1b9fbaa0ccddcdd7e6d39feb7efe25be37a |     
         arm |                libgtk2-2.24.32 | NOK | http://autobuild.buildroot.net/results/20644475a745c04fec4a87c639bd13e4f333805a |     
         arm |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/169b3271a2b1f426cc1bd0ea0018472a36130496 |     
         arm |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/97d7529f2ea11680182a5d22cb5d8b1c79c3c27c |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/aa465935af2de70adc08fdd7fbeda328a499963c |     
      x86_64 |                     ruby-2.4.6 | NOK | http://autobuild.buildroot.net/results/18a611a3268cb300509cb38db01605439be5abe1 | ORPH
         arm |            udpxy-1.0.23-9-prod | NOK | http://autobuild.buildroot.net/results/66b870f433479ba99252b90917158f97e1525e51 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/be148e9e3b3e504cdb4b65015e7de70c15d28c42 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/5793d38cbd75ce71aa1dc3bceda7a0f916749cc4 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/0be1533a106969dd513e69dc4eaced3a7e90fcd1 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/7fd28f640d919fe28902e17b4adecb3157b4c469 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/12487b993ffbed64d4f9487ce6f35f03dc15a554 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/fa498e57ce8345f77fc24def54a944906d6c86bc |     
        i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/9b8afe56eb4644e3bce5884d6d74c85353335ecf |     
     aarch64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/fc00bbeb426b1043470a1d13a2324e861e3289dd |     
         arm |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/9b54162bef24eceaeb80c7ca6932f560131e3078 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/efd1f410babecdef0a02596a6bb25907a8f53339 |     


-- 
http://autobuild.buildroot.net
