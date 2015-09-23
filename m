From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-22
Message-ID: <20150923063019.57F001018BE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-22
===============================

        success : 210
       failures : 70 
       timeouts : 0  
          TOTAL : 280

Classification of failures by reason
====================================

            shairport-sync-2.4 | 25
            micropython-v1.4.5 | 7 
       kompexsqlite-v1.10.12-1 | 5 
                busybox-1.23.2 | 3 
                  mono-4.0.2.5 | 2 
xdriver_xf86-video-siliconm... | 2 
                dbus-cpp-0.9.0 | 2 
                      qt-4.8.7 | 2 
                 sudo-1.8.14p3 | 2 
                  c-icap-0.3.5 | 1 
                 mplayer-1.1.1 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                 mesa3d-10.6.7 | 1 
                   czmq-v3.0.2 | 1 
             lttng-tools-2.6.0 | 1 
                directfb-1.7.7 | 1 
                   zmqpp-3.2.0 | 1 
           libfreeimage-3.17.0 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                    ruby-2.2.3 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
          openpgm-5.1.118~dfsg | 1 
                 dropwatch-1.4 | 1 
                moarvm-2015.05 | 1 
open-plc-utils-1f6e7e372b31... | 1 
                minidlna-1.1.4 | 1 
           libvncserver-0.9.10 | 1 
                 iperf3-3.0.10 | 1 
rpi-userland-b864a841e5a459... | 1 

Detail of failures
===================

       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7fc7214da93802479108e444c1501b39d0300b3b/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c2efc5f3b1a3b2abd5df9b150825957fd2e09860/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2dedccdbe6101349f7e7c535e6dfc63e9152334f/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/c559cdfcd28968fd0a268594250346da95b830b0/
     powerpc |                    czmq-v3.0.2 | NOK | http://autobuild.buildroot.net/results/9452982fc14f579c61b45a1a189db5f89aab3b80/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/025b0913a6a609eb9824f6bdac2023c4cc31a749/
      x86_64 |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/d82e02cd148c224eee9dc922f9ea13a4bdbf1fd1/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/a4ed827e5aad5184526805866b70240f61c8ce0d/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/1c42a017ae2ceca4bbc863425ad0fc3911757120/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/bb1c98d1a1fcae5b5468767dbb879a0b9b2c9677/
      x86_64 |                  iperf3-3.0.10 | NOK | http://autobuild.buildroot.net/results/6b675a31545629cce5c8b6e3b11a0279e6088fed/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/c1ff24f21595ee50672248082b98546adcc10807/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/5fd7865e5f7b883368d86540c4ed6822ded6aff7/
      xtensa |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/d52b83a274874cbf85a111bb095a192202673891/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/cd387978d9a906c7d5530afa170d2830e9bedbce/
      xtensa |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/12b1ade040282d80de0ed3beada398e5efebe5a7/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/2d287f03663edcb8b286ae0643ff30ef21c0a912/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/6af12713bf25201fe1e9e5449ca6688e4a9bbc2b/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/8821521f2e2d98f6e123f6a3a020aeb846b00e81/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/47468f610d71a8fcbd79daa975a31ab5dac18b05/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/22110043f4731e54cdf9bb9ac42050912226b049/
    mips64el |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/269c7056285b4f32e6d0857392107375983b49b0/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/8a64eceaf8e2c4e064aa7a72a3846779416ef45b/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/e6ef45f6916583ad0b009026fd9ed136f4374cc3/
         arc |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/534dc83637efd43b4f5e32248ad366c2f0b360e3/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/904551bb36a34e5a8f3ae83e570c2f8a262309ed/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/35a02db7c8130807a45ab0cf62e8f0b632aaa9af/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/d10e1b6b75bbacf2c28a1acf08f411b86ce25eb5/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/ef9f5e8c4fd2d28ccb8d07e203cdb16128c1a000/
      xtensa |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/bf3464be9a1b8ffd7f28af8604abfcabb2ed610c/
       sparc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/83500f092749a9bb9d595660272c95fda11349ce/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/77fd0db30a47cac18dbfb583642e25db32f28083/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/ebfea20cc096030fa1ff5554f8dcf1d1c285c1ca/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/5227acf929d6f44b0e2ac4f8369bd9c1e110171c/
      x86_64 | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/797ec14d3fba4210c36d24fcb781a979fac26e31/
      x86_64 |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/7caf9acea9d6968d352a8ab047182c420240066c/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fdbb945464afb7bc9b86b0f3b588e65f263ff487/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c056e8781558267f6971a5f017f47e90dcf24e07/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/5889c7db42dcc8bf8df9feb3596a3613fd44e3d1/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/53cdddb40345eb87c256ede7dd90e9bccc3ec070/
         sh4 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/35425866b47da273d0bf44292c6b7fa0b52b4c89/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/d8a539b470fbc8bd86ae92d04442c4207e3848cf/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/d4230407d7ab14acb4ceb29921bb84ff4027cc33/
      x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/5953592fb25400b484310daed384c8b5cb269581/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/4bf43f6ce1e3eda2e0357905bf58590a04a315d9/
        i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/1394dee1565d4fffebdcd3b0c7e6271b09721547/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/3f7353e2cfde51b9c3b7903d2ca4403a4b831ebb/
         arc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/41362050b3c54b1e1910e5bcbe88b2129a71fdb0/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/30bf6a3380dd2ecddac29d9c286932a6a8e46322/
        mips |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/49926ed2ce8f4ceca3dd650b80661c7f93c0027d/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/f533f53bdddb816a37323dddfafcff9de59a64fe/
        i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/af46bf1199fd1d76dcfbabad020893880ca4ce68/
        i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/33156ef05a8a3ef72f6e5c4e2eed16cff98ee359/
    mips64el |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/ae33925815165d985c84577bc9431f04342c3090/
      x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/c01faded797993c00b30e3228eb74766d1ef1d79/
      x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/6bd392edd8e15ed2725bf606886330cfc793194b/
      xtensa |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/c4eb82e507e63a38f5e15ee07c6d17657597dd1a/
      x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/a197fbab98c63efb228c87cc86023b9885d92c00/
      x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/42e24329ee669a9e09e66c91e3b6917eb421a608/
      xtensa |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/1f146be2ba0801e4e5a6154f85558f3affc4b112/
        sh4a |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/8ebdd1581f42aacaf011d9b1c2e7e4b5d0a34b8b/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/e5c72588536f9af5a6ee89a7706d832dce0a6fcf/
      xtensa |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/0088ec43cbd04a52ecaecceea02d088b98b87be1/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/620aad0513d1173a2e726ab07ff22703f64664b5/
     aarch64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/d84e5445c17e90c11f18d4076c1fa3b3f268c395/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/db3e395e360144a10f241ae65e0160e861805ca3/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/aa8966310c07e9807e854540c593a6bbbc51e85d/
         arc | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/44ebf9788de7b542ab7f38992e81bdc79e81d482/
      xtensa | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/01805d60b8b046122d357e2559268e8a45dcf9d3/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/d9882d2ba00da16f76cea6d86a84cd4815ebbba2/


-- 
http://autobuild.buildroot.net
