From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 May 2019 06:00:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-14
Message-ID: <20190515060039.F045C22920@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  32 |   1 |   1 |  34 |
      master | 246 |  15 |   3 | 264 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                chocolate-doom | 3 
  vdr-plugin-vnsiserver-v1.8.0 | 3 
          wpebackend-fdo-1.0.1 | 3 
                suricata-4.1.3 | 2 
           host-mfgtools-v0.02 | 1 
                   mimic-1.1.0 | 1 
                mono-5.20.1.27 | 1 
             openjdk-jdk-12+33 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
              wpewebkit-2.22.5 | 1 


Detail of failures
------------------

microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/9b0700268318eb273d1f354fc3daefabd256102f |     
microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/e570839576be8963dc6bd36342e2f857da3c6146 |     
microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/5d537f9458641a3c512a4e665c0d29b55943e895 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/469f6da7a80b44fadf30b72ea5be4a080cbeb1d0 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/62bc12ea756a25155c5dec29a22c862223453f01 |     
         arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/dbd64c89815d393a4e28b312d74fd80ee6de92da |     
         arm |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/2bb330e431c50e0133b2073b997f3d682cebe94c |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/d4d99a49303e5149365d7e7564d8b021fca1754d |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/f0e5c2246cda27b918b50a7c55bc7c8dcd3f33df |     
        i586 |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/16c0ed79f4eb2516461afa34d160b9bde14f0a19 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/1c7729e774b6564750f7ec9f8665a275dcbfeacf |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/079202947c71de3c108d89db06d629dff7b0f49e |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/fa63ccd99ad84f5051eefee1a3d595ec7ad57796 |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/7de28ffa6ee05ce6fa98cfb56952d03e38cafaf0 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/39ccf985b3121342589167fe8bc0f88735318c28 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/fa8341c0b11c5ef30a4692927e90f64de5bf4e11 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/790c239fee8a59682927cb87ea9c1908a83d3c84 |     
         arm |               wpewebkit-2.22.5 | NOK | http://autobuild.buildroot.net/results/645be27edc31037a9b1bb7ce0dc85440949b0846 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   mutt-1.11.2 | 1 
                       netsurf | 1 


Detail of failures
------------------

         arm |                    mutt-1.11.2 | NOK | http://autobuild.buildroot.net/results/bbdabc088f839195e336baa1dfb765844aa325d2 |     
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/eb8ebdd069973e37c5e32beaf84a5e7dc3c08bca |     


-- 
http://autobuild.buildroot.net
