From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 06:00:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-19
Message-ID: <20190620060053.6F6DF86A70@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  32 |   0 |   0 |  32 |
   2019.05.x |  12 |   0 |   0 |  12 |
      master | 208 |  36 |   4 | 248 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 14
                       unknown | 10
               libcap-ng-0.7.9 | 3 
             iputils-s20190515 | 2 
                   cups-2.2.10 | 1 
              domoticz-4.10717 | 1 
                    efl-1.22.2 | 1 
gli-559cbe1ec38878e182507d3... | 1 
                      gzip-1.9 | 1 
                host-libsodium | 1 
             host-ninja-v1.9.0 | 1 
          libcdaudio-0.99.12p2 | 1 
              libsodium-1.0.17 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

      mipsel |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/cf4fbf8bf96c6bc2a68340e7f909d0967d520dae |     
     riscv64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/ca99cb11b05d4d70bc3a1427c715d2317f81dd94 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/5d05c3885444f36f1574c7b7ec499b41436d1fe4 |     
      mipsel | gli-559cbe1ec38878e182507d3... | NOK | http://autobuild.buildroot.net/results/e60ecbcd612027409d0e2f090c36178f60e34f09 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/5012555b5f9c03bc5aacbba60da01786c8134f7c | ORPH
 powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/3585c38b8d0ca23e410d0b3e0f85a051578bfe5c |     
      xtensa |              host-ninja-v1.9.0 | NOK | http://autobuild.buildroot.net/results/8d83c3964ba64f50314516febbc9afcbbfea10dc |     
        i686 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/af45cb6047ba300ca5877e57a47b245492eca3fc |     
microblazeel |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/694efa965d29f9b38f4e711ae07756a037787303 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/beb050388c631d7a9e5e5e8f1cc8c9a32702e988 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/f3dc2479adbfad4d05496699ed2f8e15856e1fde |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/a84a753b7d65129a2aa528f4e828b2e2773dc339 |     
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/f725a41ef992c42ceef7514d1a8dcac99e6b9114 | ORPH
microblazeel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/1d458ae53e453aa2d68bb94d123c959106fe7f0b |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/ab4c8b2ba3fcdc95f6d518400efb8904b8a3ddff |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/75b943ed7a6f8436f87d6add8c5e78c8b5665f2b |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/319f2687a8b6270855c455fa4e09fd7b1ee5d2c4 |     
       sparc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/68dc53770f3ae51d5b7dc3f38b8721b353f2264b |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d1196c6647cd1f9361d12eea71832dabda5c9a8f |     
microblazeel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/b6b20bbae1df02fda2b44e76f5b74179bb858576 |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/8aa52519b196e50b6e075c0ec5977928380278ab |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/735d0a06637764935450dfa36a7a65e1517f421e |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9099c915d7529d84c6c49d951f48cf0e16a2a1e1 |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/bf1fe13be097e00e2efacde73b14d34601149cfb |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/f7e2f62f66010bc729c71fb2fb9aecb81da1d75b |     
        i586 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/86430b99440de8f61d8693a1a1a8e9bf49abbb3d |     
       sparc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/3170506fa60ab947e9f307d3b09f3e6105bfc258 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/2cbbe426be70328ef9da68d5f57bad9f25377125 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/31e087c204dd2e3b844e052cf5031d264f7da2ab |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/299f548750eb04f3dabba4fb2f424961034bc0db |     
     riscv32 |                        unknown | NOK | http://autobuild.buildroot.net/results/4068c9d3c1617f41256c711e01f94e4a050cd819 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/426f8871a417525da80b730557db5bca259eeaf4 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/cc6713cf707e44eb7394176ecb2ac783f27b0145 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/d919eb6ae5f5edd6a170e4ae6f600f6fca6691ee |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/a3956245a2a4095aaf564d5cadac156b9a575960 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/bdec012b9f7c02918fe17fbc0906cb0c7f6afc58 |     
     aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/48d4532bfcbe37f8a39455edd02859245217f91d |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/a7a6eea31e10d0dd0935bcb4c3c82ae1429da513 |     
         arc |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/f1b6dd4924c73ef33a047da6734004d1fe9a6447 |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/7c517b9652fa79e2e18522d5aa9cb0d28201fa64 | ORPH


-- 
http://autobuild.buildroot.net
