From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 May 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-03
Message-ID: <20150504063015.B1217100B7E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-03
===============================

        success : 191
       failures : 44 
       timeouts : 3  
          TOTAL : 238

Classification of failures by reason
====================================

                  cc-tool-0.26 | 5 
freerdp-770c67d340d5f0a7b48... | 4 
               linknx-0.0.1.32 | 3 
                host-gdb-7.8.2 | 2 
          google-breakpad-1373 | 2 
                ipmiutil-2.9.5 | 2 
                  boost-1.57.0 | 2 
               host-mono-4.0.1 | 2 
           libfreeimage-3.17.0 | 2 
                  bcusdk-0.0.5 | 2 
               libecore-1.7.10 | 2 
                  weston-1.7.0 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                tinyxml2-2.2.0 | 1 
                       unknown | 1 
                libevas-1.7.10 | 1 
                  guile-2.0.11 | 1 
                     php-5.6.8 | 1 
               libcap-ng-0.7.4 | 1 
                numactl-2.0.10 | 1 
                 rsyslog-8.9.0 | 1 
checking whether pread is d... | 1 
                      qt-4.8.6 | 1 
                    wine-1.6.2 | 1 
            python-pyqt-4.11.3 | 1 
                pinentry-0.9.0 | 1 
               mongrel2-v1.9.1 | 1 
                   zmqpp-3.2.0 | 1 
                  python-2.7.9 | 1 
                poppler-0.32.0 | 1 

Detail of failures
===================

         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/25cb21dd5a0dad318c498fcf7a889ae2ce93c697/
         sh4 |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/181f12d3a46ef10113ab47f75ccf57cfc1b6210f/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/4272eb3edf54e90417b7d8d2fed015730381e6e5/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/cc140f8e14a3906037376196e41e30db8e4a82e7/
        bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/936b0b0a7d513fd2d7610343e5dd842ca9cca3cb/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/118705bc1a048c35bc8e642e6df01db8969a8e3b/
      xtensa |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/6c65a0971392d32f4ff668d150a511543a73cdd6/
        i686 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/9c828b1da8983577f93bdfae5275fc5122ae874f/
        bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/617ad419303d1f2b9149427a4427b705acfc631a/
     powerpc | checking whether pread is d... | TIM | http://autobuild.buildroot.net/results/6c3bb324aaa670256ae2b55712fcc30aef65e36b/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/34e602681cc8fbd1d388947faf57ba4e02bcf314/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/49996469b047c819e235ebe928c3423727771be1/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/ce2192e6cd8f5a31fa716e8ea5bac4f49e39390f/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/bda53fffd4a0937fd4b2313cdf2d12ced95cc7a7/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/d9613c9f791157e1de3a34923f1c91b35cec693f/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/d53d8b8ede133b0105e4f9828d93d99006109ad1/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/04118cae45f8b0c7f3817afadf526f0117ce06fa/
     aarch64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/64c3af12e791f0c00ffdeb7094df353beba7567d/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/dc33c6d58188e82ab4535f46000fb9a5c9eec609/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/deb284ccaeac9c2de409adccf41ee888577621b7/
         arm |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/72c19d34fa24e7673f2d1f818a7246e66efc743f/
     powerpc |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/b97543b26f8bc25a9e997bb66434ae9660a2f198/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/8445b741b266261bde078de44886e895ccc91850/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/d2191cac1ad43346b4cc6cfe6f049383d1e2c31a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/971d441055724c266f0b9ca6cd176334b4acfa02/
        i686 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/c005de0a3fc48719a699373ce392b8fb019b2bde/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/8d9a023397bfd326847638b71d65707e36b225c7/
         arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/c5ca02cc93823541316b432e7daec6faabdc5a49/
         arc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6dadfe2d672822c77058666808c7d3e5bd02bc51/
        bfin |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f3bd6be448cffed3caae7850233168e6d0f6a5bd/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/465328d0aa6b5f4b36903e2a4bc41d4ddd343db8/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/b27c4b0822494fb393a5e28b8febd063222bd83f/
      xtensa |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/9db2cc9fe6ddfda5663251872fdba00998020fce/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/2e98fee4a337054111572d7f02c36ee73421a1be/
     powerpc |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/4259715dd89651a2b575706d69b0ebc5ebbf4176/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/33b16ee0c57df8cd168ea2e43df80ad9734d0b6f/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/93363dc9409a35bf0c3dae9ebbb09e06507f1209/
        bfin |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/be78957dd852233c81bd364ddf664564ce8f0208/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/f0662cefa5a0a62cee5480086e921ac1c146ef06/
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/27f447d1978c398d134eacc935d88857dd26094d/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/8e1f3d467cca548c45658c9d59f0555adb2be156/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/dfe7317ae8cbaf608d858cb44e16626ff855590b/
         arm |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/f49b7d0f19af7269146383f401acc9563090ec8a/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/42956ddc38467f336e740a79dd4fe646c6eddc03/
        sh4a |                   weston-1.7.0 | NOK | http://autobuild.buildroot.net/results/1b44caac14137c6c5bfd980027d60f1a620c7c5a/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/35d73be7a43c09b7cf9ab01fcc8ea3de67a0aa5b/
         arm |                    zmqpp-3.2.0 | TIM | http://autobuild.buildroot.net/results/9f35fb84084fa85af2dca7974e0f1ca7c5a00b82/


-- 
http://autobuild.buildroot.net
