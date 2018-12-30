From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 08:00:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-29
Message-ID: <20181230070023.58EDD20A02@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   2 |   0 |  19 |
   2018.11.x |   9 |   3 |   0 |  12 |
      master | 154 |  43 |   2 | 199 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 
                 qt5base-5.6.3 | 1 


Detail of failures
------------------

      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/2be4c942489387fd413ea27e84dad1f2bd104bd4 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a9958c53da5ae8265884689b60bad452d3a2b4ff |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.2 | 1 
               qt5webkit-5.9.1 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/8fb4636f4a196d920963f832e9fb9cdafd63d48d |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b417c89c8350c74e2be925707cf0c964ca69ce6b |     
         arc |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/9e2b90b557576fd0b633a19b335ff1a7ee64ce69 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 14
                  libssh-0.8.5 | 4 
                  grpc-v1.16.1 | 3 
    json-for-modern-cpp-v3.5.0 | 3 
         libcpprestsdk-v2.10.8 | 3 
                collectd-5.7.1 | 2 
                  ffmpeg-3.4.5 | 2 
                  linuxptp-2.0 | 2 
                   netsurf-3.8 | 2 
                 sngrep-v1.4.6 | 2 
                 dmalloc-5.5.2 | 1 
                        glibmm | 1 
                host-libsodium | 1 
               mono-5.14.0.177 | 1 
                     pcre-8.42 | 1 
           php-memcached-3.0.3 | 1 
                php-ssh2-1.1.2 | 1 
             stress-ng-0.09.47 | 1 


Detail of failures
------------------

         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/6e764eb399998e76b7d9428263a40289d37c6798 | ORPH
         arc |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/4fe99a6fa2d363b16a82b10177b62e8f8d9a2496 | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/0c286b19f11c71dead0e1e8218b6afe28e575afd | ORPH
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/a2a4f02e11024cdf44df80aa1ca4b7a36974de3d |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/c2b212e715a06ab044c05e50cf5f069340e216d1 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/efe99a518ddb412c7894911607f4b4c3c0e8de14 |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/aafd01c1778c2c553272d32aaa9f238ed42614dc |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/c380aa16aa28f3b3fcf4dbe27dd318753eb0f9aa |     
      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/9ffa4e4e2a252c334aa66395d422c04357efe6e7 |     
        or1k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/6a961599e72d7aba66a9d97c65c21ffb0c73edec |     
      xtensa |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/a79574b4f402843011c518cc51c108f4910cbd32 |     
        m68k |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/983343473480c0f05d4a92e5e25eb60ebd8f19a1 |     
         arm |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/f9acb9a84ef7f4cddb6db640ebfbdbbc4a6ce077 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/ce2c97b29b8a0cc444aaccd5d66197f6d067588c |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/13379fc717fda48b4478cf5bb77983ca33610ed3 |     
        i686 |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/fe3f7d9d576d5e3ac0194532f91a45c6378f98ad |     
      mipsel |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/b658afecdb3bfc56e807fa04e497b741f93b3b26 |     
      x86_64 |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/500d8f7c932b2addabd786ce2c796fa6416c4eb2 |     
        or1k |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/2ffb7050fb2009e3d352eb8cbe2be81e3b373959 |     
      mipsel |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/39bdce4744c2276f73d2b9950e0e82186f534536 |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e84a57ba162eaf46c97ba0fe33a4aca0de2cfc20 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/7b1bf5aa898c7a6c58be29a2fb4a0d98993f5cf9 |     
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/a1c5687d10fcc703fde40e60af4a6ac58822ba6a |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9e1258d02e3c25d1c86cbfecb1ec82926f74aa53 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e7a8e25054e8a5b6ee55c309a467c33f75d994f6 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/3cd9a682d1122ced9420dba4aa97a81c6dbd1a08 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/80f9e5381c214997a76e6c4cc249ac305c11214e | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e6dcfd8be227c84bfe5ad268276f9f769b89dbfe | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/5594e6fc3173c142e76a143b8fe225987e2c6491 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/dfecb7c02e4664ff1430e500b8618ef07b25f06e | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/223ef589936ae8984399e891825d4c345d2ecf36 | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/9f81674c9b1747ed593c1e0cbe148961265b941c | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/a7eec3b3cb1161d91532a386720cde19b8fb6c56 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/58cb44e68917a732e874f45a4f8179df87fa1822 | ORPH
         sh4 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/57bd5cd7a2f12b972cd0bf3878f3865c7013e5e8 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/d2c7d5cc9bdf920bfe7d7179530470ed5ba4c2f8 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/abdccca341c4283c75e60e2c00177603bb975713 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/717081fb3ec73d6112c4ddbd38f174e38e7c94f1 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/21022d4298f0b231b19fb556a90abf08c6aa8c78 | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2062e812d2645848bd64dc13a15e4458579b94b5 | ORPH
    mips64el |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/6b0a9cbe5cdfb0a1e54b4238670ffbc7dbcc398a | ORPH
 powerpc64le |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/98f86826ee81fd1c992bf0f1ba20d6a47b2201f6 | ORPH
      x86_64 |                  sngrep-v1.4.6 | NOK | http://autobuild.buildroot.net/results/eb0630c053e1e7ac4bfbb2b587f3a6ca4640fb84 |     
        i586 |                  sngrep-v1.4.6 | NOK | http://autobuild.buildroot.net/results/205600d5c997ad7487796e0b4b33caa79f6397ff |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/1885c64546726e96c453446f9c092fa03f58276d |     


-- 
http://autobuild.buildroot.net
