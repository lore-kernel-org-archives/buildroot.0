From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 Feb 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-06
Message-ID: <20140207073009.C5A85100E3A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-06
===============================

        success : 80 
       failures : 39 
       timeouts : 1  
          TOTAL : 120

Classification of failures by reason
====================================

                    mpd-0.18.7 | 5 
          sane-backends-1.0.22 | 4 
                   open2300-12 | 3 
                     vlc-2.1.2 | 3 
mmc-utils-11f2ceabc4ad3f0dd... | 2 
                 cairo-1.12.10 | 2 
                 libpfm4-4.3.0 | 1 
                elfutils-0.155 | 1 
                  pango-1.28.4 | 1 
                     gdb-7.5.1 | 1 
                  nettle-2.7.1 | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
                  weston-1.4.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
             util-linux-2.23.2 | 1 
                 webkit-1.11.5 | 1 
        ltp-testsuite-20130904 | 1 
                       unknown | 1 
                    gpm-1.20.7 | 1 
                  libeet-1.7.7 | 1 
             dmraid-1.0.0.rc15 | 1 
                 mplayer-1.1.1 | 1 
               alsa-lib-1.0.26 | 1 
              e2fsprogs-1.42.9 | 1 
                 libevas-1.7.7 | 1 
                     lxc-0.9.0 | 1 
             alsa-utils-1.0.26 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b25590e19d0e638dcbb2855a84e82ea7b2703460/
    mipsel |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/05d3186bcb74c905bbc689859522b88db78c2f68/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/1f79be918cebc29c306db6444908b20c6ada5683/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/91310c4da3541b9b8b447f0876d1deff2fadc19c/
       arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/ef6a0e2d382ae202bb8f0e9fc9f5e48c90119faf/
      bfin |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/284f2a161d110d4c561cf89c052ce531b4edc173/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/7bb5b317dd35d8b3dd2fc9a777a5d65bd143348c/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/1996d259baffdfed52a56b93c67904df97fe5c53/
microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/5915af9e00fc29e48764778916ea6f806d6dceb8/
microblaze | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/42da870722f24e4202d8265597771a0449e74cfd/
      bfin |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/3eaa07dc462b5ffa34ccf527dc921d3ad5a2c4f8/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/ca25323567324fb9082e3c0f318ea8b961fad3d8/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/59cefaba9d382f0de17b5dccb2d88fc74d36f520/
     nios2 |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/9aca518bf53aea62bc4bb437976f0223113c26ce/
     nios2 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/f592a011321429426be81bd1ecf664ad9a2c0161/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/6d97daa1754aa4380b2fae23698da24a9790b61e/
       arm | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/828c7a686736710c4fcb152230d0fa6b5f4d6ad3/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/a46b4c97fe126b23a96051a8bf1243a7f4935434/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/ac2d0808752ef5e31dc7121b9f00e1968e8a3621/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/232dfa5c786b0423dde4fdb3166fdd8e746bb34b/
      i686 |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/799f24846ba800500243bb69e85a1d6b10960ef3/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/77f1b0d537d6d2aa1eea066d15f46fc492ff160d/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/a2da603abd4ce895c2515e687882c63774c20749/
       arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f9863fc6b285c76cb3c9926f96b970b98d3203fa/
    mipsel |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/a57b67bc905a3381cf6f1f86d7af588aecacac60/
    x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/8108d1b8c524c415a4101f527aa34d8db9df5aa8/
     avr32 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/514f7fe52b17e28966e95adb1e0b13de12f2488b/
       arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/3605675ef8dd03362670ba33ef003b15326bd440/
      mips |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/7552c9c4106dc5dda8a54178d2ce0dccb40267e0/
    x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/b241b930f109f68bec3e250e583a934e6d32b565/
   aarch64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/dfeda680f6f2b44487cd0f79a47b79a6eff9108e/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/7b2924aecdfd6220caf523765693fd8fe3bd3853/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/463f2d7d4becda8338a806597094204dde8adf36/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/399e62acf2c452653cb2ee9ca150a0cfe7e33326/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/a9fbda1006db0ebd8961ee582151aaae7d7e8fe6/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/b5972ecad4e5004dc23a2366066ce45346994f58/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/d41d2f36a4384289e300a3cf91d51960df9fab00/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/47a6a7f419dc76a0a3864304e7335b59a0c89b4a/
   powerpc |                   weston-1.4.0 | NOK | http://autobuild.buildroot.net/results/aa54b1aaf0ac89531d7a1e7dd3900b35605ae3f5/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/fd296ba75a767556fd1a39c5552a6e00cb59d867/


-- 
http://autobuild.buildroot.net
