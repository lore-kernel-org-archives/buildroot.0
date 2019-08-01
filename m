From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 01 Aug 2019 06:00:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-31
Message-ID: <20190801060037.AB81E8798D@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-31
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |   7 |   1 |   0 |   8 |
   2019.05.x |  14 |   2 |   0 |  16 |
      master |  57 |  41 |   0 |  98 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 
                 openssh-7.9p1 | 1 


Detail of failures
------------------

         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/b379be4ac56de1dd9d0b1167d37e22c824729f5e |     
     nds32le |                  openssh-7.9p1 | NOK | http://autobuild.buildroot.net/results/f1a271b6ff93526884cf9554ed0074c344431fc7 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libmatroska-1.4.9 | 8 
                host-mtd-2.1.1 | 6 
                   mpd-0.21.11 | 3 
                    mpv-0.27.2 | 3 
                harfbuzz-2.5.2 | 2 
              iputils-20190709 | 2 
                     mtd-2.1.1 | 2 
socketcand-df7fb4ff8a4439d7... | 2 
                       unknown | 2 
           can-utils-2018.02.0 | 1 
              domoticz-4.10717 | 1 
                  flashrom-1.1 | 1 
       gst1-plugins-bad-1.16.0 | 1 
             host-cargo-0.26.0 | 1 
                     mdadm-4.1 | 1 
               musl-legal-info | 1 
             openjdk-12.0.2+10 | 1 
                 python3-3.7.4 | 1 
          qt5multimedia-5.12.4 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

      xtensa |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/ce6ad4f1e1ed71e3ef70a52966d78854f49124a2 |     
        mips |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/b0a4dff5f94228268b81bf01aa0977da462ce322 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/c59fabb252327c48608fa6e731bca165c3c17e2b |     
         arm |        gst1-plugins-bad-1.16.0 | NOK | http://autobuild.buildroot.net/results/1d2d4dc2b5f821d78a58564d88cdac97dbeb95b6 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/137dd165f2ebc5571fc5dd2facc69bff9c552dcc | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/054c9fc691883eee432018bf83508587b3363cb2 | ORPH
         arc |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/dbfc54c2a39933b142044d104554d1a4d77cad3d |     
       nios2 |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/2b31e91ced7f05eaff424b11b43650e93b766076 |     
      mipsel |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/bdea34d700adbfac6fca2a1d2fb544dcecdb8a59 |     
        mips |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/53e2f6a6345cddb46ad1257cf90487fdd1985308 |     
      x86_64 |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/f04afb91426d5019147a2bea7a03469e585e346d |     
      mipsel |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/0e8c912a8fdd766d39d14edb636096d7cf87e859 |     
    mips64el |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/23615c06313eb615e19b60d8c60652de6fa4cf08 |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/10652b7bf6a606f0dd802916006c44abf3e5e059 |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/9656af1aafbd2624fb75bf5fc1dfa13b6175c10b |     
         arm |              libmatroska-1.4.9 | NOK | http://autobuild.buildroot.net/results/e742156786babfeac5ed210d860e849c2a25f9bd |     
     powerpc |              libmatroska-1.4.9 | NOK | http://autobuild.buildroot.net/results/ffe415bf6e6bd6954d81dacba9385c89f1750585 |     
         arc |              libmatroska-1.4.9 | NOK | http://autobuild.buildroot.net/results/10f31f555688c198bcc57909f81925a39dd3052c |     
        i586 |              libmatroska-1.4.9 | NOK | http://autobuild.buildroot.net/results/fe97984c0a4870bb29a8547d14ee033c2fcccbe5 |     
      x86_64 |              libmatroska-1.4.9 | NOK | http://autobuild.buildroot.net/results/d74d2237ed4fc566a6a862688a03cadf4f5d6ed3 |     
    mips64el |              libmatroska-1.4.9 | NOK | http://autobuild.buildroot.net/results/5c9bd3fd8fa5a05a2e3aa736fba77d085b853e0f |     
         arc |              libmatroska-1.4.9 | NOK | http://autobuild.buildroot.net/results/7eef9c6c8775ef88901bfacc30986ae4a8fbdedf |     
    mips64el |              libmatroska-1.4.9 | NOK | http://autobuild.buildroot.net/results/148ba335dbf51cdba19185fc23f0d13b707b54f9 |     
         arm |                      mdadm-4.1 | NOK | http://autobuild.buildroot.net/results/7a66b1e6c7104d7d07c2b54c3b4e37d418108c09 | ORPH
         arm |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/8c25c4849db6b3a28adb71bfa159080b62803c6b |     
         arm |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/a4dfa33af149654aa789c7a3c31ceb8f2ab95234 |     
    mips64el |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/a7dedeb450d59b2b65d740e868a37301f23fd9f4 |     
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/649a1a080e10e9c1ebfba05b122dc2cee80095c2 |     
        or1k |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/960f45866669eb1e09a7515172e1918e10f85dd4 |     
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/0d2a63eef50f9d874771060bdc714f56fefd1a25 |     
       sparc |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/0162b325872a5c1eca13fda60192547c4952a2f4 |     
         arm |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/6acdde42f33ce8295c40811dc8c1fc15eaa771ac |     
         arm |                musl-legal-info | NOK | http://autobuild.buildroot.net/results/bbf81a9f44768894c1a55bb1bac6728aff6f2431 |     
     sparc64 |              openjdk-12.0.2+10 | NOK | http://autobuild.buildroot.net/results/c48c2e69fb316298ce7d267e704a8defd45ce5c2 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/dbf07ca56bc1e36fbdc1f35f1c0ac21b55815601 |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/ee378d700f7dd986f365a207802d5023c234ef5f |     
         arc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/483fcfbd86620216229596d185562e01d2045468 |     
      xtensa | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/5ed12c181f12c0d21036527b1b94e1d511271b72 |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/e3829ec3c7f7f5a6537e44dbd4ea929e8fea7190 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/dc3d8a9c700ca3d19bd06479f438cbc771a978af |     
         arm |                     xen-4.11.2 | NOK | http://autobuild.buildroot.net/results/0630f33497db86e3a37b71d45ddc0279196fbdbd |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/59cb0986a3d8d440f910d9fd0de1f3318372d6aa | ORPH


-- 
http://autobuild.buildroot.net
