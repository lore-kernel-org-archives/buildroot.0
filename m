From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 08 Jul 2019 06:00:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-07
Message-ID: <20190708060115.05D6E204EF@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  22 |   1 |   0 |  23 |
   2019.05.x |  15 |   1 |   0 |  16 |
      master | 147 |  28 |   0 | 175 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.2 | 1 


Detail of failures
------------------

      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/0abcacb248ad2664e9418983278696056f61a339 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libcap-ng-0.7.9 | 4 
              libsodium-1.0.17 | 4 
                       unknown | 3 
                    atk-2.30.0 | 2 
                  dnsmasq-2.80 | 2 
                harfbuzz-2.5.2 | 2 
              iputils-20190515 | 2 
          modem-manager-1.10.2 | 2 
      gst1-plugins-base-1.16.0 | 1 
                   gvfs-1.31.4 | 1 
imx-uuc-79e9798eee9cd972d92... | 1 
               libgpgme-1.13.1 | 1 
                    mpv-0.27.2 | 1 
                 python3-3.7.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

         arc |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/0f1a2dc0d8ccc32ca3b6778a335cadcc56306772 | ORPH
      xtensa |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/436ac69e81df900ac70b1e5b1f7db19700159d35 | ORPH
       nios2 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/43335fe7356d11ddf05f754b5318d14526770fe5 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/17e4a6de68080e09cae1375cca1f00c551d47a74 |     
         arm |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/0364b872a50a7824ad6389378974f78929b89861 |     
    mips64el |                    gvfs-1.31.4 | NOK | http://autobuild.buildroot.net/results/e59ffd6751c26f680034d3488015f07b26123c54 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/fae63658a1fed3493638d916846f23ec98072a53 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/6ee2900df4fc7d4ae5aee34d7b92468b916bca6c | ORPH
         arm | imx-uuc-79e9798eee9cd972d92... | NOK | http://autobuild.buildroot.net/results/12c08173f83315fb68fe3c3d34a78ed919ba5a79 |     
microblazeel |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/e3d75a5a39f4419bee03afc5db09d73d141ac120 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/15989b9af8b1a469a44267ee828c8d825c4d9ebd |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/dcd7d04ca3d5001b5ed81fbc5cea0c63585fa74a |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/64f6cb72770a4df42faa1891cd08de864e828fbf |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/3165b2f423f70d428dcd1c31b8bdd8aa595e868d |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/cafb6bd6525a2352f71472bb399115d04e35a5c8 |     
         arm |                libgpgme-1.13.1 | NOK | http://autobuild.buildroot.net/results/1807e49ee076bcb945627f42f98cc8565b50c309 | ORPH
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/92a6b2257df66673dc93cd8c6cf18381d471968f |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/f7681c5c706a1a7eaf9a11179674bdb1fc3ecad3 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/18c17e68bf83c5d8aa2c202b8833f092a54a10f7 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/812b25206476e6b549b8fee92dc2d5ffa57aa8e9 |     
      x86_64 |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/dbe235284fd3b4a4a26b6c97d2a87c8799166b8d |     
     aarch64 |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/32e1f8c0ce6184fab301dccb1c8923827970350b |     
     nds32le |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/d949c48245917b7ebcc1420da057d8dda11458c6 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/d1f4cf5168b3f776ce6139a35ac812d23ca043ae |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/fe9989471ab51cdf33f51ca997d151039fef22f1 |     
  aarch64_be |                        unknown | NOK | http://autobuild.buildroot.net/results/9fbe7cf46ab1daa508c31d9ecee87f8d46141b38 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/5fb3862542b94c71644a7f8295d3aa20a0e48e22 |     
       nios2 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/a44668af97fcbf5194d0d072a444678af69e3212 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                    vte-0.48.3 | 1 


Detail of failures
------------------

     sparc64 |                     vte-0.48.3 | NOK | http://autobuild.buildroot.net/results/30a8032ebba5a30bacd321c407a1d0734fadf757 | ORPH


-- 
http://autobuild.buildroot.net
