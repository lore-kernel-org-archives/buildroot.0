From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 May 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-07
Message-ID: <20150508063015.D69A910108E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-07
===============================

        success : 284
       failures : 45 
       timeouts : 0  
          TOTAL : 329

Classification of failures by reason
====================================

                host-gdb-7.8.2 | 4 
                 rsyslog-8.9.0 | 4 
                  boost-1.57.0 | 3 
                tinyxml2-2.2.0 | 3 
                  cc-tool-0.26 | 3 
                 cdrkit-1.1.11 | 2 
                iproute2-4.0.0 | 2 
                  zeromq-4.0.5 | 1 
              wireshark-1.12.4 | 1 
               host-qemu-2.3.0 | 1 
             transmission-2.84 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
                libedje-1.7.10 | 1 
               libcap-ng-0.7.4 | 1 
                   ncurses-5.9 | 1 
                  snmppp-3.3.4 | 1 
                 jack2-v1.9.10 | 1 
      host-gdb-arc-2014.12-gdb | 1 
           qt5multimedia-5.4.1 | 1 
                  guile-2.0.11 | 1 
               qt5webkit-5.4.1 | 1 
          google-breakpad-1373 | 1 
                ipmiutil-2.9.5 | 1 
               mongrel2-v1.9.1 | 1 
           libmemcached-1.0.18 | 1 
              xmlstarlet-1.5.0 | 1 
                      icu-55.1 | 1 
        gst1-plugins-bad-1.4.5 | 1 
               host-mono-4.0.1 | 1 
                  fbterm-1.7.0 | 1 
                   ntp-4.2.8p2 | 1 

Detail of failures
===================

     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/6a6ae8caff155301f94401eeb950788423acedbd/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b266a6eb279f3e5d958eaa9bffeede174461bd06/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b395990ab22cc05b9453869b3f9fd819ac10de44/
        bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/9a7f03443b5c3c00ac0c216953bf9e27a5aeaa97/
        bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/9be2bbc0f77b52b176714ffa3871f517c6bb4d1d/
        bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d91ab162eba16d8c9738a0020676eb41adcfdb01/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/dec29861875eadb8c351d0973813c4d40525da6e/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/5ac71ecfc92f80ee83ef171d5b8da88ae4a878c5/
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/43a34d8b64f536caa579709508bb5e00633ba6e7/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/57b7b290763c351c97c018d909a875ac1e0bb923/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e62170cfc01788e23b7b8eeeb48817b8f0d53aa6/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/3fac8caaf09907f93fa8410003ed4993e78800d9/
     aarch64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/9fb5ed1dbfb0c1a66f77c8bfb65a6ad0b50df92f/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/0072e358fd2e5a461cb413c192189bfde6b342fe/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/cc8e0924d51943a8d7187d7d076610acfd4528b1/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/3b236d89eeba26c12ea29056cf085de47346f2bc/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/6164258c17e0b71083e476a42f9a0df7023f39f9/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/49182aaa50b8d05bd39324d0faefe6b13cea6c41/
         arm |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/28569f6912d1bc9aeceaf3c0088820ede87d60b0/
        sh4a |                host-qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/dacd95eacb5e58c64747b1cfe75b5c2e650ee9a6/
     powerpc |                       icu-55.1 | NOK | http://autobuild.buildroot.net/results/16fc4eefb257c3b2e2232de574a7db15215b42aa/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/4cf8d2fe38d72c9b42bbd45d71f965debfbd63b4/
      xtensa |                 iproute2-4.0.0 | NOK | http://autobuild.buildroot.net/results/a107ac3252ad48732069ec0de6ff8692b32c6a71/
         arm |                 iproute2-4.0.0 | NOK | http://autobuild.buildroot.net/results/e1fb014cac40bc2b4e8c63e75bb6368b1528375e/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/1e651462397fa2237e8fbd5833a4cf0f8d9e1bae/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/fc7bc050ef769716dedb0ad81a51e33a12deec47/
         arc |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/a609987237f4fef3208844ef5f8608a111b09efa/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/87c99d363e4663f6de4d161550c45b640702e453/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/14ca7c50e53f5878e655c88edc8d661902c26cbb/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/917efd5464439773754c3287474cba203ebc5bb5/
        i686 |                    ntp-4.2.8p2 | NOK | http://autobuild.buildroot.net/results/371f82f2fbbb4b7d2730b0bfb2e453ba258bf7e3/
         arm |            qt5multimedia-5.4.1 | NOK | http://autobuild.buildroot.net/results/67c34c10e6d6b9dbc64d0b6fe6a618babab3ef63/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/36f2fdeb26234dda3044bdb950edc99c64d47b17/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/6c6d9d6b37ba3aefe92b10f7f87a9cb7e4ecf156/
         arm |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/24d442787859e6acbe244c66d1423640d7ded564/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/f55e306df5e4e87fa05338ecba20dbd5e911db4d/
      mipsel |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/b78b06786975499e910212e7fc72b45e57f0de52/
      x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/d6d8b2931dd6d51e599e380761a11719ef82b1e9/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/e568d81030087f66f8ac4ccd4f496b550930cbae/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/22cf78816a541b150a945b176123ff1733a229c8/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/6186e2bcc7d812bce3918ab660fcecb2a7b1b7f3/
      mipsel |              transmission-2.84 | NOK | http://autobuild.buildroot.net/results/ee0a957d019613ce1ccf1af80c41cca8669be497/
      xtensa |               wireshark-1.12.4 | NOK | http://autobuild.buildroot.net/results/9b6e4c47965e9f7eccb9a51ca60161f6defddfb8/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/8cfe8bcc45975d3459f198d8a489e2a1d23860d0/
     powerpc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/2ceff1494011998e775683f72e7e488130b5502a/


-- 
http://autobuild.buildroot.net
