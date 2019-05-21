From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 May 2019 06:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-20
Message-ID: <20190521060047.5727A8780D@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   2 |   0 |  22 |
      master | 201 |  13 |   2 | 216 |
        next |  39 |  12 |   0 |  51 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 3 
          oniguruma-legal-info | 2 
                   netsurf-3.8 | 1 
             openjdk-jdk-12+33 | 1 
package/oniguruma/oniguruma... | 1 
                 powertop-2.10 | 1 
                    strace-5.0 | 1 
                suricata-4.1.3 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/4b85304688d0d44fa1385d24511d74622c4a9f97 | ORPH
microblazeel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7e9caaafdef915f845833d9e7961eae38ffeefb1 | ORPH
        i586 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/061eb0deaa5ca3cee12078d16fa25f1ac65be7ed | ORPH
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e0dc522b6c25e6f9a52a72d7372d90514df677c0 |     
         arm |           oniguruma-legal-info | NOK | http://autobuild.buildroot.net/results/321e46eddcf87c4a54420aefde6b8e0d2eb0f8ea |     
         arc |           oniguruma-legal-info | NOK | http://autobuild.buildroot.net/results/87597859bea7c94440ecfc9eb897dcff45d2f5d6 |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/9c8a066a7ef7866e76e70eba063aeb0dc2f6c511 |     
         sh4 | package/oniguruma/oniguruma... | NOK | http://autobuild.buildroot.net/results/be5300c86abe9775c89805a1d03fb3cca882d6d6 |     
     aarch64 |                  powertop-2.10 | NOK | http://autobuild.buildroot.net/results/a0b3337cf4a827e6566f8b15b6bb180f0dcef7a3 |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/5e3b011dd5482abf566967843bd04f69ffbe7813 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/e5966229755ea21356022cae94d73945c026fd26 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/05082220bd3bd7359c304c84198e6ad37852a4e5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 2 
                  brotli-1.0.7 | 1 
                      ddrescue | 1 
                        glibmm | 1 
                      gzip-1.9 | 1 
           host-mfgtools-v0.02 | 1 
libcamera-ab0188fc8bbb6f397... | 1 
                  linuxptp-2.0 | 1 
                   mpd-0.20.23 | 1 
                   mutt-1.11.4 | 1 
                qt5base-5.12.2 | 1 
            qt5location-5.12.2 | 1 
           qt5multimedia-5.6.3 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/c8c5edd2599a37085315abf4677bf71e210a98ca |     
microblazeel |                       ddrescue | TIM | http://autobuild.buildroot.net/results/6138596e90fa8230cbbe012ba451012806c54363 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/68ff78a9712054317a9b55140cf6e82a17888d01 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/c8ae868a11affaf54df06a5624b75a86e1132c25 | ORPH
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/6fa5615c4f8c653549a4ac6dff965a4022aecef3 |     
       sparc | libcamera-ab0188fc8bbb6f397... | NOK | http://autobuild.buildroot.net/results/f81d3e821d0ece82e2e4e060f35bfdf18f82c1a4 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/921004f77f91a07dfc6c9493295811dbbfd0cb8f |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/814dfed89e5a67f0c9ff766d574269a8f04d3617 |     
         arm |                    mutt-1.11.4 | NOK | http://autobuild.buildroot.net/results/7309a09e257abd389f1da7f60b4f2895030b37f0 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c90b10b4ab864665b0a6ae9c3dd15c30e6e2a562 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2f540b2003cc8e283f99c6598ddac3e7584ba597 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/739f9d462bcd36b49b7bded43a3a0eb5b443c6f8 |     
         arm |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/1384d44673519df1b315aa6d3f05ebfe0c5051dd |     
      x86_64 |            qt5multimedia-5.6.3 | NOK | http://autobuild.buildroot.net/results/78886d375b6b02f020154cbcf3698f614c35193b |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/171d79220ca0e511141b45e12516405eb8574166 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   botan-2.8.0 | 1 
                   netsurf-3.8 | 1 


Detail of failures
------------------

       sparc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/b4f84de5bca0d670096ea5610fc685bc6c903ca1 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2cb648e920343525a4540f06f0ac4cf86a3b8002 |     


-- 
http://autobuild.buildroot.net
