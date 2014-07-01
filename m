From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jul 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-06-30
Message-ID: <20140701063009.D2AEC101311@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-06-30
===============================

        success : 83 
       failures : 18 
       timeouts : 3  
          TOTAL : 104

Classification of failures by reason
====================================

        perl-xml-libxml-2.0116 | 4 
                    sdl-1.2.15 | 2 
          perl-net-ssleay-1.64 | 2 
                  opencv-2.4.2 | 1 
                 qt5base-5.3.1 | 1 
                  cppcms-1.0.4 | 1 
                oprofile-0.9.9 | 1 
                libiscsi-1.6.0 | 1 
                    parted-3.1 | 1 
             util-linux-2.24.2 | 1 
                 libnss-3.16.1 | 1 
make: *** [core-dependencie... | 1 
                       unknown | 1 
                 omniorb-4.1.6 | 1 
make: *** wait: No child pr... | 1 
       opentyrian-2.1.20130907 | 1 

Detail of failures
===================

   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/16e17b0e140e4554968f8230a2d45294ee0afb5e/
       arc |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/92d9cc2dcbbbe24dc61bf50c9fd10d593d1f7a80/
   powerpc |                  libnss-3.16.1 | NOK | http://autobuild.buildroot.net/results/3f1afc1b58cb6fe53c438b55f169e2a78238806d/
       arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/e8f660cd5a4e57be1353bfdbfb1bc9d708225896/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/ded56d6e94f88d918db96f388d0d5b60e0d37ac7/
      bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/f4c191bbf8d1a5e96302679faa0498c26177dcf1/
       arm |                   opencv-2.4.2 | TIM | http://autobuild.buildroot.net/results/f9e8864f490a579ab2828d13d8056a3d68c42d85/
      bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/ff14ff8a6888c8f9e766994573cf4d470a21de38/
     avr32 |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/cbd93f8d11daacdeaed972893298e597ee760529/
      bfin |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/d9a9baf0c1bfdb7f7d03ebed084a80ef3001c86d/
       arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/6e7cdd8ab55d229293a664fdca6d0828b8c81c70/
   powerpc |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/805c2ec54ec8dbf208beffb10f6bf820d65895ee/
      i486 |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/f2a2b7bad37fd4635cbedb838d126466b4364f40/
       arm |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/a17449c0e6f32b40fbb42142261c01bc7f96025d/
   powerpc |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/f436e35aa7815acd687d901deb394a652558be0b/
   powerpc |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/3029835c551c0fcb976f6e2574cad6d7b158df21/
       arm |                  qt5base-5.3.1 | NOK | http://autobuild.buildroot.net/results/62f4eb3820cc0f2b6228f8ebb80bbcf5196afa9b/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/3567a30dd2492f2b55c0c4c40892311a1d4d3e84/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/5d236211fecb7fee5321c7271046665d22da6c85/
       arm |                        unknown | TIM | http://autobuild.buildroot.net/results/967519ae3b966625115e75273b20d5d922b2ef7f/
     nios2 |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/bd3f5219948c925b33d5a15ebc136e577cfdd4bc/


-- 
http://autobuild.buildroot.net
