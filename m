From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 08:00:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-26
Message-ID: <20171127070014.3C90B2055D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  20 |   1 |   0 |  21 |
      master | 204 |  14 |   0 | 218 |
        next |  55 |   6 |   0 |  61 |

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

             dbus-python-1.2.4 | 1 


Detail of failures
------------------

        i586 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/adf4f26ef904f3a5614c5096a84eaf1d845b9f11 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 3 
pdbg-527fe54e1c95e031efd3db... | 2 
                      qt-4.8.7 | 2 
              host-erlang-19.3 | 1 
host-google-breakpad-7515ab... | 1 
                 libdrm-2.4.88 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.5 | 1 
                    mpv-0.27.0 | 1 
                     xen-4.9.0 | 1 


Detail of failures
------------------

         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/445c770d4ec91042851616835ddca2b371ca399f |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/37d257cc4fea14e3304364990a55a24d4bd7e9bd |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/a886f0d8f75cc1ff291e0c43e57962b28980f253 |     
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/439905ef3babf6233ffc0cfbee2e7eca6d965f77 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/b84a6e39fcca70c56bfe49d54c385dfe6da82422 |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/d24e6ad58832af08bb84398c48a73b5560f8ea19 | ORPH
        bfin | pdbg-527fe54e1c95e031efd3db... | NOK | http://autobuild.buildroot.net/results/2bf6f56303453fd2ba7e86882168d406ded4cc80 |     
        bfin | pdbg-527fe54e1c95e031efd3db... | NOK | http://autobuild.buildroot.net/results/9271a2c86bfd204edc8da680cb170d7d7a4d6586 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c060af040e373ce0dc7f8e57827f57055a5c07a5 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/23010393abe482cf6deb734ff886e1e22f7fdb6f | ORPH
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ffbee3ceb0f5409af73dfa4173d1db80f926f150 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/e4a711050a4f62aacdfc5093f2ef498c00fd7bbb |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/76ee8a86ca70062e8511c4a9755396edbd4a2c07 |     
         arm |                      xen-4.9.0 | NOK | http://autobuild.buildroot.net/results/dc3e05398a34f410d7a03ccf4295e9e60533befe |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              alsa-lib-1.1.4.1 | 2 
dvb-apps-3d43b280298c39a67d... | 1 
 netcat-openbsd-debian_1.178-3 | 1 
pdbg-77158819158d1d7053a737... | 1 
           qt5multimedia-5.9.2 | 1 


Detail of failures
------------------

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/acfc26aa544a91d280db260ad82c0e9aedba83cf |     
         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/c193327b3433a3029867d75a730948b1d3d97fa4 |     
         arc | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/1dbffbde01e22953a2ed625e73840c9527388222 |     
    mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/0a0aa739cf2b0769ef729c40d056ebfdf121fe8e |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/d6cc3379650bc31922a546790199b3e19b9b8d45 |     
      x86_64 |            qt5multimedia-5.9.2 | NOK | http://autobuild.buildroot.net/results/293db359a10e492af3bc97f68dba60e198643e20 |     


-- 
http://autobuild.buildroot.net
