From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  6 Mar 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-05
Message-ID: <20150306073019.CE42C101373@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-05
===============================

        success : 207
       failures : 66 
       timeouts : 4  
          TOTAL : 277

Classification of failures by reason
====================================

              host-cmake-3.1.3 | 30
                  uclibc-1.0.0 | 9 
                  snmppp-3.3.4 | 2 
                     vlc-2.1.6 | 2 
freerdp-b21ff842ef3de583751... | 2 
                host-gdb-7.7.1 | 2 
                 cdrkit-1.1.11 | 2 
               batctl-2014.4.0 | 1 
                  nfacct-1.0.1 | 1 
   libnetfilter_cthelper-1.0.0 | 1 
         conntrack-tools-1.4.2 | 1 
      host-gdb-arc-2014.12-gdb | 1 
             python-lxml-3.4.1 | 1 
                 apache-2.4.12 | 1 
                 mplayer-1.1.1 | 1 
Resolving ftp.gnu.org... ta... | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                  thrift-0.9.2 | 1 
                      qt-4.8.6 | 1 
       erlang-p1-iconv-dff5ee5 | 1 
    libcec-libcec-2.2.0-repack | 1 
                host-ola-0.9.4 | 1 
can-utils-002f8eba8703e88cd... | 1 
                    wine-1.6.2 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                collectd-5.4.2 | 1 
               host-gawk-4.1.0 | 1 
                   systemd-219 | 1 

Detail of failures
===================

       nios2 |                  apache-2.4.12 | NOK | http://autobuild.buildroot.net/results/1b75f52c70af7880d523185565b7aaf59d9f9b3e/
        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/503c06cf9e123b801d6996276697ac4c0b81b3e0/
     powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/42b1061958a17727aa81563a56187da6a6d7dfe5/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/ab3532b2688114d9ea14c769dd103ccdf017cf0b/
         sh4 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/c160ef2a2cd75dbab0ef942b6310c2d7b8781ac0/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/cc04b8a1c30b290e38d50df6880388f9aa3da04c/
         arm |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/8a40cc7349dce9cd18a43c671b0bc685cc773153/
        bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/6e7b48ad9768349d983985c3067c4267cde80541/
     powerpc |        erlang-p1-iconv-dff5ee5 | NOK | http://autobuild.buildroot.net/results/a0549c6ce411fc3dbe26c575b114a0de19e72ffc/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/75c4f990570e818bbc7fa37ce2db5ddccad3c6e1/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/aee5e536cb4bb3d5483f63d0360aee0c9433ab0a/
        mips |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/8ff273b76353e941b7f9ad383ee1487985b6fd24/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/a11f12763f75b4e69e987d3e75b5a7bb8e783477/
    mips64el |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/408a4885109fa095e4de9f92734066ad715a7da8/
        sh4a |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/18a744f6d171d287ac0d6b1c5e9e4916c3310548/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/29b3a5aecb4f7e08f0d207e43bc5eeffa9a0f829/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/10f9896af3d1c79d1f21ed0c2f7d67a174ca9c93/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/b823704de131c9222a4ba81c921b45fc4b00537c/
        bfin |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/07685b0acc663ce1990431e36ae9e2a8427bd142/
microblazeel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/80937b0d6b10910ed467b98a3adc070248140034/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/5070533360fd5f060eb983a55dc7e4709e6d8130/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/24086603eba301dd1acaf3c7b2ee24aa8485836c/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/94726e78f921db2370e5bf417963508197a02ef8/
         sh4 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/2bb30d070d4447e325d7ad646d6b06f984072498/
    mips64el |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/8a2a8246969797269d47e0f0a8fb4af924e58950/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/ebc6e12f0d3b176c64728e92e4daa03593da3393/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/c29fe7606d1095c09ef0174dabefe9e7eb533129/
      mipsel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/27637142c867631334bd37fe32a7b364e73bb7a2/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/c50b13b2bc1df8dca544003859e7e80fefcd2699/
        i486 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/2586e970cf211011b1bd59a952662fe600dd2966/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/e8c69d245686da11b17a3026c9d8b82c66e172f5/
        bfin |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/91b4f5bd58e134db8e8fa8b842d12f5b558e95a7/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/378d6f031cf672aece061f400524faeeb05155b4/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/ac2b4360ea9894bb8bbcf4ef30ffa54f6257901d/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/0eda8e0df610709f98df10600809fd93ab3dba2d/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/9fd44a43c2fc614a8e00b9bb1b1af5a69e4a1cb3/
        mips |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/2065f492964602ba9210bc3cd202c8a0c5dd9745/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/6ceccacc6504496e942c4887152268b791567d3c/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/b8dc4868d3b364d24500e809e45b0bd6acc9d31d/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/3b075f2bcf9f75a4f6132bc535e667e362297d98/
      mipsel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/61175fc50ae1e5f326dd0e1c53c7398f60aceaf2/
        i686 |                host-gawk-4.1.0 | TIM | http://autobuild.buildroot.net/results/1ebe20f296d2142991435a4f4e716742d11491b3/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/cc774ee536c34030056054af3b5fe9b4a7fc3860/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/d4c8aebd908efe1d2bf3edcd7a6a2eb51895e234/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/4ff903429e87842de616d740a118a4db6fd54f7c/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/3cc9c9f6f7c5f513c9357b125a879eb864f8ecd0/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/a7fc40e2ceabb2a235e213531a8dd22a60ddae39/
         arm |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/74f0f4ae30afc35c651a42e1538466f425dca6f5/
         arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/dd23390ba9a949365333fb1ff0f2b925dbfe1e88/
      x86_64 |                   nfacct-1.0.1 | TIM | http://autobuild.buildroot.net/results/c0c787cd475b1a035a172ad7d1896b10837f6c13/
    mips64el |              python-lxml-3.4.1 | TIM | http://autobuild.buildroot.net/results/c0804f55cd0bceab814d7ec80ec79461c3ed9a1c/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/19af89335840fa2cf269950ff7fa66941aadf376/
      x86_64 | Resolving ftp.gnu.org... ta... | TIM | http://autobuild.buildroot.net/results/003305ce4b008c1065252234686d43b8ec436d63/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/6084957b5b5719fb704ca35f59f9c4d9041757c6/
      x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/d733aa6a43aba80f7fdca9777e2c3e9c67304ea1/
        i686 |                    systemd-219 | NOK | http://autobuild.buildroot.net/results/cbd4a40576bbe44a95a3ae6732ca3430c4f82ae1/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/b31089832193a0d6e612685576b6edf00c4d58a5/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/2271beedb64aca47ca6383e1a0d0e985870306ea/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/2d71bad8cf68b6bdfdff83ae760bfd481cb04a74/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/b1e78b9aec89538e2536704789ccf951ea3a79eb/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/2c1042365b71f48a7c770cc458ba8699059729b6/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/73c8e975f1a1c74174ebbc8a92e9d956e7a4f68f/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/a7e61340e2bd1cf1edfec826cd1669698bed59a7/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e0d4e31bce517642f6a079e8f93f9515c1b9cdc2/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/acd46c4438e9a6dd599ef58627f26b11d3cb4c89/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/6170b33d9c9bdc1975f82662f427ff79014a8ca7/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/55c4bdd4b089ebfeb309ac969ea4a9c136af9200/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/e491ad85a9b6ff06ce36d5cf2209c0f44f494627/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/78f9aca07e5d23f12a2d43da055eb60f9e75ff72/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/00e42384bdb2fcb964966f62e90c0a80600d4e89/


-- 
http://autobuild.buildroot.net
