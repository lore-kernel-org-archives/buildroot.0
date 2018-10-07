From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  7 Oct 2018 08:00:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-06
Message-ID: <20181007060025.B29052073D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   0 |   0 |  21 |
   2018.08.x |  15 |   0 |   0 |  15 |
   2018.05.x |  25 |   2 |   0 |  27 |
      master | 159 |  62 |   0 | 221 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                    efl-1.20.7 | 1 
                qt5base-5.10.1 | 1 


Detail of failures
------------------

      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/4e3b570b45835d7919f52fbf0a77e0e10f2ebb76 |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/ee465474ae251cb01730b6a5fe9ad7e88de3b087 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 11
     linux-firmware-legal-info | 8 
              ptpd2-ptpd-2.3.1 | 8 
                     vlc-3.0.4 | 5 
          synergy-v2.0.12-beta | 4 
                blktrace-1.2.0 | 3 
              glibc-legal-info | 3 
                libmpeg2-0.5.1 | 3 
                   luvi-v2.8.0 | 3 
 Makefile:709: target-finalize | 3 
package/linux-firmware/linu... | 3 
                  boost-1.68.0 | 1 
                    brltty-5.6 | 1 
      docker-containerd-v1.1.3 | 1 
               findutils-4.6.0 | 1 
                   netsnmp-5.8 | 1 
                qt5base-5.11.2 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/8577c20c4083590389678e7e754b52603aa59c55 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/1818fc0284c3dec3f24fad057d2572dd8d9131df | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/f76df117ab73e0804b6b07eff68125c6b239d224 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/60c234a05dc6111116ae9c27093569109b84e8f7 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/4f43d78e6febac93a147ccb592e3db0126a0daf3 |     
         arm |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/4e30bb9c09ab9ef333c3eed00d6347ce3cd5bafb |     
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/4c9d4ddc77ffde19119c554c64a432ef45ebdf3b | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/3664f65a0321550e9fa663349a805f591cf3ede8 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/b6833946526f6617436cdf188304955c24c1c30a | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/c58fdaccb8faacbbc6f392fc0fa788ea332e0aa1 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/40efb375e3fde479933847e863ffd2d9dd86ec41 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/8f7429a65e34f10af0b018e43502c91349b0b61d | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/d8a066545f0a594e1e0132e3a7a72c36c36505eb | ORPH
     powerpc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/24423237bc0500566079b6ffff18204fa1d96307 |     
        or1k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/a8981076e4c239200055083e3375aeefa9bb3aca |     
  aarch64_be |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/17e65f8b46eea609f16c0a04dbea22be183e44e2 |     
     powerpc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/a49f456de8a0dadeb769c27d16666cc2347715fa |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/101e046fd70e59d4c3d523dd13ee7f9f023b7b8f |     
        m68k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/ff456d4c171a931afbbd927558748af3077dcf4d |     
   powerpc64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/cb65a0c314bc27c2f88fd4e1454d94ce84c0cdd6 |     
     aarch64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/a53ab67f713db933605d81ba6b637dd9c1668cbd |     
        i686 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/0444329ad2518f9fbc24699b7b7bbac9680f0cd8 |     
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/559b21b91009ea41a085b6ce52cc5145148135ca |     
         arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/8dcebed408bc49c9c63e45dc840c609797e185cd |     
      xtensa |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/cf3b1f68c5e6cfe13f5c7149d8e4b603056da654 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/9ba71bfd5e9359e7dcf1d1cc991590e4e9a5240f |     
      mipsel |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/9178ad313e6ddcd5fa8ad68a4c7f408321408770 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/ab6d1224497e58c75a29280b5f795d187566b8e6 | ORPH
         arm | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/7d5f400a62d0f9ccfcb412a4dc43ff58717bd45c |     
         arm | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/5345e8a3eadaf7ec4b60d315edf3637d2afb02b5 |     
         sh4 | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/de1bbd43dfef8e05cd994fda44fa0a7e5f4db875 |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/013e5ef4fbc15460b5803b6f3cafeb7505405a59 | ORPH
        i586 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5a7c84d17c10a15a056ce530b934deae09c6e5bf | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/a52720ec9248d7a3e799a4b595ad5f2d4ac240c0 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1b9f63ca765fee792967cceb6ac9382f9243a22c | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4857bae5cc463394e628777e35a04959f54d2329 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/83dda53958e160f98362b5f90ed2d11b8a305b97 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3c038d0657fc7eaeadc31256b426c47c200c0287 | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/57058cea393496cfe9e0cea70d68d5c2945512f4 | ORPH
        i686 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/1612985a1eb90f7446dc8b3ae2787754b7ef4310 |     
         sh4 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/98c222bfa0877ac99a2dd4617ba7ac31b64c88f9 |     
         arc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/c96cee34a99b006bf78dde35c25c77d544665d0d |     
   powerpc64 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/a3e68cc5894f6515536fb2e24f2e7673e97731e0 |     
       nios2 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/c3fc0580e456f830c7d5e63034fe0be82fa6259d |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/cadf5688420a474433b73df3438404103bf4b471 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/78e4b059b42ed3ee097e2f903746cdfe6c5c2b1d |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/3455e4c20f8cb29f82ef575575691fa073f097bf |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/e8281c8354b64fb9a035bb98bb3963661a0e5a56 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/a62a80efab474ff9ff3d44b9bdeb8fb6317bbbf4 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/1efa86d137203934530a8c4c68d76c119a60c194 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/189e6ffc6722c915f23ddb18cac64bc0f1c65332 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/63460266b46b972687ef5c68cf08ccdf417d929f |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/48fd3577ff3491e89ab6da22441c41e9e328c32c |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/c905e5139e57304ca73d0db486de60f36bbf80a9 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/2d915badd30ce1613527252085be17506b44a879 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/322ab3f284d9df6ded665550e2bb03c7fa5a2cdb |     
     sparc64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/e2c5fcee2445bc39f3f7aa95b1ef3444a6e84073 |     
 powerpc64le |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/54578c204debc7998b237b59e6c0d93ce9f2701e |     
 powerpc64le |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/fa856c6366471e1d17c8dffbbc5322a5e23a0cf0 |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/aaa033dd70db2e7b21e231417f5024f06d1ad50b |     
     sparc64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/a008fdbf797c3e30ce1f1253b2d6c3154638961c |     
     powerpc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/2a40fa488d91a374897e416b456c8b9f292dc7f6 |     


-- 
http://autobuild.buildroot.net
