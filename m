From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 03 Jul 2019 06:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-02
Message-ID: <20190703060045.D50A687B94@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   2 |   0 |  20 |
   2019.05.x |  13 |   0 |   0 |  13 |
      master | 120 |  37 |   1 | 158 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libcap-ng-0.7.9 | 6 
                       unknown | 6 
              libsodium-1.0.17 | 5 
             xlib_libX11-1.6.8 | 4 
                    atk-2.30.0 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
/home/buildroot/autobuild/i... | 1 
              domoticz-4.10717 | 1 
                    efl-1.22.2 | 1 
      gst1-plugins-base-1.16.0 | 1 
                     gzip-1.10 | 1 
                harfbuzz-2.5.2 | 1 
                 hiawatha-10.9 | 1 
              iputils-20190515 | 1 
               json-glib-1.4.2 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                    proj-5.0.1 | 1 
                 python3-3.7.3 | 1 
                           znc | 1 


Detail of failures
------------------

      mipsel | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/7d2708a328dc0a8f323c5c093c6709b2ac822957 |     
    mips64el |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/1fff81934de4f4773cffa1b1b4fe2b1f17a5bd6d | ORPH
        i686 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/67367706de3b38f31b9f59a7cb98cb2186e8ee6b | ORPH
     riscv32 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/9b4fd9d628cba2b93ffab7e545a1dbc783f2d263 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/b3748aae6568007c79e38c40108fb8e243affa82 |     
         arm |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/6ae78799072b12aeb63001c737e2e70043ef1a59 |     
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/1bd16fbf5e0f2ac2492507fbc8445040172c85e1 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/6fe3cd4bb0f44014993a4693530c8ba9e501f9c2 | ORPH
     riscv32 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/3171400b25db2af17debaa0d97f88ee31996c18c |     
        i586 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/a41c0927f0fdf44a141cc40e2c36fde981ba852f |     
        or1k |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/a9515ce8acb2d13532d0d43f8f61fa890a4705b3 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9dbaadd11fde57313c450b00b19ed8d966f20377 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/cc9d51ce7df6da6035b0a21e694468bc16424384 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/74ff82cd6ba2a93ae1ddf600af38fe57e5055b33 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/f81b66fc8665f9d37e358fa66a233e7076bde401 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/163a53802c615c0fb5657bfd5eb144f90b582698 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/b5aca08ceafeaf8130e7010db4c496d502e6c050 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/bc4de847f85c75fb2d5bea2f90044e283acacc43 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/0093e4d5967c3ba7db1afb9e2eb0cf72925575f0 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/dc420211d75c9c45d9417ee95e817261eda0fd4a |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/648a045da85073086f231190695902144f59ec44 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/f690ba67a0ba71af1408c6b4c773caac524ba411 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/475937baeb24a795532a57b396e15e22bacfbbe2 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/760a1a6cad34cf0315ac1f0a70f459129127dad0 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/dd2b69b78f087265a6a378c412f6fce681d4642a |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/19317b6af7215f404698510e75f2de3e4439ec11 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/c9bb101159e5ec21bd42876b507ac540c7f83206 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/b2d687dd2a97e618b547012ca15ecea000cf1f84 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/bb78d33ee43f41fabcc2bf1df40a50c5adb58f41 |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/3084f9443c96149b978b94179c3da8b7cc19f349 |     
  aarch64_be |                        unknown | NOK | http://autobuild.buildroot.net/results/0f55d95a040ac05a9783e955c2079868091635c5 |     
   powerpc64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/8849f632fcd81fee0f477e3af4073e38e906c66e |     
    mips64el |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/ac037bc3122522abac864e071f2f0533575262f2 |     
      x86_64 |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/bea2fea29bfe6f3422e3f14316de2038a6065c81 |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/6b70274d98a6d23fceb0688110359cd309b34781 |     
     sparc64 |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/bde8afa00c18521e6ab7c5039f207b5d30230efb |     
 powerpc64le |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/a9a2302ee3070c9fa8a13c92d7fb5dc904e2b499 |     
      xtensa |                            znc | TIM | http://autobuild.buildroot.net/results/745795191f62c26af8e486fc24c735b16616960d |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
                 qt5svg-5.11.3 | 1 


Detail of failures
------------------

         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/f682247fd32ad082a64312b12c478813584c6e87 |     
     powerpc |                  qt5svg-5.11.3 | NOK | http://autobuild.buildroot.net/results/9e093165f53dfe63dfc7aa09a7b6dcf87b8485e8 |     


-- 
http://autobuild.buildroot.net
