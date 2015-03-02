From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Mar 2015 08:30:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-01
Message-ID: <20150302073011.CFFD4101225@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-01
===============================

        success : 302
       failures : 17 
       timeouts : 6  
          TOTAL : 325

Classification of failures by reason
====================================

zmqpp-36413487f05b165dfc82a... | 3 
                poppler-0.24.5 | 2 
           libmemcached-1.0.18 | 2 
               qt5webkit-5.4.0 | 2 
               sdl_sound-1.0.3 | 1 
               expedite-1.7.10 | 1 
make: *** wait: No child pr... | 1 
               host-ruby-2.1.5 | 1 
                 netsnmp-5.7.3 | 1 
             armadillo-4.000.4 | 1 
                  python-2.7.9 | 1 
              host-mono-3.12.0 | 1 
              libarchive-3.1.2 | 1 
                   lite-0.8.10 | 1 
                 webkit-1.11.5 | 1 
checking minix/config.h usa... | 1 
              lbreakout2-2.6.4 | 1 
                 gnupg2-2.0.27 | 1 

Detail of failures
===================

      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/8aff1b57d8b50f2da6b11a7d697ef91bef50f9eb/
     powerpc | checking minix/config.h usa... | TIM | http://autobuild.buildroot.net/results/80233e4f3e502865dc21c47a6d8294205eed6389/
      x86_64 |                expedite-1.7.10 | NOK | http://autobuild.buildroot.net/results/1a9273f2f35566f4551d77d2a5bb8f31a802ceb5/
         arm |                  gnupg2-2.0.27 | NOK | http://autobuild.buildroot.net/results/d2fc4cfb0c42d352d1119d8196d6df5fc2ab4be2/
     powerpc |               host-mono-3.12.0 | TIM | http://autobuild.buildroot.net/results/0c8a621651b190b028a697d31349a24e45b210ec/
     powerpc |                host-ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/7b08ad8fd0133eb463f726e31bc972173382fe48/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/7dddd06e3d0b79e21edefb7c2b130b297c76b0ea/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/e8cd6e500c32ec4cddbde919f579ff63aa1419ae/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f6eb28014e72c7d3a3aaf6a2dde186b7a344f852/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/83654e5381e8502bc435cff320cdd468e8d2be06/
        bfin |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/fa8cc6d71d449c9e13800f7c8e3a1331d0a123c7/
     powerpc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/a8a3e04a95d128f3cfd46aa83e529ae03b17984d/
         arm |                  netsnmp-5.7.3 | TIM | http://autobuild.buildroot.net/results/964ea4f3151a7e97846dd8ae5a5b874b2dae7d25/
        bfin |                 poppler-0.24.5 | NOK | http://autobuild.buildroot.net/results/9b6c7f62c28b399756fcf0628e7c01215d8f8740/
        bfin |                 poppler-0.24.5 | NOK | http://autobuild.buildroot.net/results/2e033b8edaedd2e03432bfda1abe5d5bc1afe0ec/
         sh4 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/96648a3a4bdd41819d22a08c190c3af91333f2d9/
         arm |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/d81cb8621092709004dd7562cd10fb15a691e5e4/
         arm |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/51f4b5bb4d108ebb337179ee14a9ff7d8885ed53/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/5330772344d1185a4cf6209e2ebdf6542bebc8a5/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/fc1da58a35c3c5f14313e50d7f56a38abdfe476f/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/81e92451275424d9b967adcc35d58d3f57198d5f/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/cc7e85b8f454e87c8912ad597766c197fd4875c3/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/ff4387e9cf6607f49fe8dcbf16fd548ee2fa513e/


-- 
http://autobuild.buildroot.net
