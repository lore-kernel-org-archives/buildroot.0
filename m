From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Jul 2019 06:00:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-14
Message-ID: <20190715060053.6811685BAE@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   0 |   0 |  21 |
   2019.05.x |   9 |   2 |   0 |  11 |
      master | 107 |  48 |   1 | 156 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                      gzip-1.9 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/295f2c28004ff8bf01beed4de060ec52bcb33538 | ORPH
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/c2304e9fabdb553ef7ae1fd130465c0915109c42 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         xkeyboard-config-2.27 | 8 
     glibc-arc-2019.03-release | 5 
           host-nodejs-10.15.3 | 4 
                       unknown | 3 
             bluez_utils-4.101 | 2 
                harfbuzz-2.5.2 | 2 
               host-efl-1.22.2 | 2 
socketcand-df7fb4ff8a4439d7... | 2 
           can-utils-2018.02.0 | 1 
                  dnsmasq-2.80 | 1 
              domoticz-4.10717 | 1 
        glib-networking-2.61.1 | 1 
gmrender-resurrect-33600ab6... | 1 
                gnuchess-6.2.5 | 1 
      gst1-plugins-base-1.16.0 | 1 
             gstreamer1-1.16.0 | 1 
                    host-clang | 1 
              iputils-20190515 | 1 
              iputils-20190709 | 1 
               libgcrypt-1.8.4 | 1 
          libmicrohttpd-0.9.63 | 1 
                 libv4l-1.16.5 | 1 
                qt5base-5.12.4 | 1 
          qt5multimedia-5.12.4 | 1 
                suricata-4.1.3 | 1 
           tesseract-ocr-4.1.0 | 1 
      tesseract-ocr-legal-info | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/dbdde0d63150665e6d8da64a4e3c3696b3815c9c |     
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3a3d89e81cf83d0ff1b08fd3b2cde3811979bb02 |     
         arm |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021 |     
microblazeel |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/95ae9c7ef6a832072ef07d2b12a886dd8334cc62 |     
     aarch64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/1c111df2eceef67f45ac155c71df59b9244a507d |     
         arm |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/385ab1e09f821facc3d97b7dda6bd8d4a2c98eb5 |     
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/adec2483dcbb16c8f3ccd28fac23e57a0735bfaf | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/6aec663e65a9e3cf666fe9cf1a388f6d45b11ac5 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/ce38d7c15988cc972ff18ba96ed0895b831733bb | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/c9c5e0ea881eaf15a8e3a0973a4e9296840540ab | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/6d46a8ee8fb55a560406815ca657a3eb626b367b | ORPH
         arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/a2f205fec10d6ef27dffe5a7144bb251300db0bf |     
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/306241e5a2c172ac70bc29ac525f0cb06e382e6e | ORPH
         arm |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/9f92b180835df9ed580fe2420687a3632d08b3e4 |     
microblazeel |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/175ee3d3e6d2d291066232dc65f53e569d904a62 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/edcdcb51eb27c102a1ca6b29ff051d8f5171806f | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/4a4576ffbf51e06eaffae8e2ae12e0c7e0e63eed | ORPH
     aarch64 |                     host-clang | TIM | http://autobuild.buildroot.net/results/4b7977d9132cd69e622c5cd3648550e08a08eeb4 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/9e801828c62afd777dd58be5c97dd864829fa276 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/c64b2b22db88ca5fce63100e60b7cc35c6a67d9d |     
     aarch64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/a077542c56e53cc8af19615385ad02e6abbdbcb2 |     
         arm |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/b4d83bf233c398a35e3146959a6487797c7f387a |     
     aarch64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/551e1acdadfde689b98ba46e566b5bcc820fe078 |     
      x86_64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/4d6a799b009bf82372c78600805813ca3b3dcfc1 |     
    mips64el |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/9219a3bfa4ab2194aa2df67716545758b499d30a |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/10e83a5f36eb3d6c1be7ec7f4d5e025ffd46f790 |     
         arm |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/624832b1f6a773aa4ea7953fbb223470936f8293 | ORPH
       sparc |           libmicrohttpd-0.9.63 | NOK | http://autobuild.buildroot.net/results/59c92706457a9da29dd44425e546a7c80c18b454 |     
        i686 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/2f4d319629c9d6af865e92f8e696d1260defae2f |     
      x86_64 |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/e76c2d608989b50246656ee39b88d71fa5bf9081 |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/0a129d78f1f813b1eb57734173915dcd28307948 |     
      xtensa | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/3c8cbb3a4f538437d80a5c7f0bf3e67d2d5fb43b |     
         arc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/3112b1ad77e805cd3ca61bb79560e8e13a466589 |     
         arc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/158c44986561d2aeb3988ac4f82e796a62757923 |     
    mips64el |            tesseract-ocr-4.1.0 | NOK | http://autobuild.buildroot.net/results/c2eef88d1042374680201821c8a6eff5bcd48bca |     
         arm |       tesseract-ocr-legal-info | NOK | http://autobuild.buildroot.net/results/1a40ddedfc8fe579795f7ab71a6486367f5ee238 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/45c034de79aa7fd7b622fcfc83746c432e03170c |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/eec78358eb952f6d7e7f454f4ee228e8fede9bb7 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/eafcad302cdb3ccea888d31275d8dd05bb61c633 |     
    mips64el |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/99ee8d037a0a99da0994c4663f13054ba06a3334 |     
      mipsel |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/176f6e954ce0fda9d3b100757af136c00ee27304 | ORPH
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/e4251f10e053496b50ca993486703b1ef8a538c9 |     
      x86_64 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/ca41d17c5562d76bee95305845af047285655f7c |     
       nios2 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/0b5b33c582ae2f5f539b88ed61bc100ac0d92bd4 |     
     riscv64 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/d6d688f45eee8fc869869ddd33f77fa2ecb26b12 |     
     powerpc |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/6afcadda1008771fa32055de64285498815bc4c0 |     
         sh4 |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/d2df42c89164a52b51034fd3782b6b38dcb5cfe5 |     
  aarch64_be |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/4388108bbc7a608a16e3daee4748bb36729f4f09 |     
         arm |          xkeyboard-config-2.27 | NOK | http://autobuild.buildroot.net/results/9a46225f4f02771bcbab72d8cf3bb12fde1d2a94 |     


-- 
http://autobuild.buildroot.net
