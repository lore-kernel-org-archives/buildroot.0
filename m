From: Martin Bark <martin@barkynet.com>
Date: Sat, 01 Feb 2014 12:31:56 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-31
In-Reply-To: <20140201073011.152691019BF@stock.ovh.net>
References: <20140201073011.152691019BF@stock.ovh.net>
Message-ID: <52ECE93C.4090706@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

The axel build errors look to be a failure to download axel-2.4.tar.gz. 
  Looking at http://axel.alioth.debian.org it seems the download is 
broken.  The package is available from snapshot.debian.org  and using it 
fixes the build error for me.

I'll send a patch

Thanks


On 01/02/14 07:30, Thomas Petazzoni wrote:
> Build statistics for 2014-01-31
> ===============================
>
>          success : 70
>         failures : 80
>         timeouts : 0
>            TOTAL : 150
>
> Classification of failures by reason
> ====================================
>
>                        axel-2.4 | 14
>            sane-backends-1.0.22 | 7
>                pcsc-lite-1.8.10 | 6
>                    ltrace-0.7.3 | 6
>                   libhid-0.2.16 | 5
>                     minicom-2.7 | 4
>              libvncserver-0.9.9 | 2
>                        icu-51.2 | 2
>                 alsa-lib-1.0.26 | 2
>                     open2300-12 | 2
>             imagemagick-6.8.8-4 | 2
>                       vlc-2.1.2 | 2
>                      mpd-0.18.7 | 2
> tvheadend-c7d0335eb10d02b78... | 1
>                    avahi-0.6.31 | 1
>                  sdl_ttf-2.0.11 | 1
>                     lftp-4.4.15 | 1
>               alsa-utils-1.0.26 | 1
>                    samba-3.6.22 | 1
>                    iozone-3_414 | 1
>                   cairo-1.12.10 | 1
>                 libsigsegv-2.10 | 1
>                  cegui06-0.6.2b | 1
> mmc-utils-11f2ceabc4ad3f0dd... | 1
>                 libglib2-2.38.2 | 1
>            enlightenment-0.17.3 | 1
>           host-elf2flt-20130904 | 1
>                    nettle-2.7.1 | 1
>                   mplayer-1.1.1 | 1
>          ltp-testsuite-20130904 | 1
>                   dropwatch-1.4 | 1
>                    zeromq-3.2.4 | 1
>                   pixman-0.30.0 | 1
>                   netsnmp-5.7.2 | 1
> ne10-88c18f02199947b2c8b577... | 1
>                  poppler-0.24.4 | 1
>                 audiofile-0.3.6 | 1
>
> Detail of failures
> ===================
>
>        bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/94a419d74afaacb8395f0553f114998d79b62a23/
>        bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/674ea296e1fdd8f4fee278b8fa7186ac8f1f3ba1/
>        bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/fb625d1b7da40dcfdd3e25015989dccf26d57b61/
>         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/fe8f5dac047684ad3f33a0e84aeb7e5acc0ccfa6/
>       avr32 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ef519636421e981d1193815233bd7f166ca27a3a/
>         arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/717a72791ab0fdda0d1808662088e219eabe2eaa/
>      mipsel |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/fcdd11b66cac172104e006220b920f71f8525e87/
>      mipsel |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/66c5bf112116fa338e319f9988272c931a1b62dd/
>         arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/3843e6563ce61f9814418edde75e24a711b5e319/
>         arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/614457d3dd410288a75d6fb8f5e6e9b7c7f35732/
>         arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/75650bd821bdd264aa8425a0bcef6ce753546e54/
>        bfin |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/6540bc17c942e6fb7ae708a546671aaf85c80b41/
>        mips |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/cd0f3f2dcf85d7d5787f6280b2d3295df8ba8a6b/
>        mips |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/645131258b975b39d913dbb467e51c57b158bbbd/
>         arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/e352c63a8e7041df7a4f13de8cca5fa7abb055b5/
>        i686 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/4a08603441d944a0f801a180c5f39e1835109cb7/
>        mips |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/0190d8b60fc7c8148141eabc569e3f2b92b0eb53/
>         arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/618a55f5013c9dec6aeab1cb9c189ad4a0b451ab/
>        i686 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/051b49143293f655d5e6d2e5a73bf5745e9600f3/
>         arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/8c18c95eebc0a5890e5c4483bd4493be62eee982/
>        bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/82736acaeda2ee9c03155e8a84d633e28b1632f0/
> microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/fb01fdb4ee666e1e3a53eb0311c44ec60968d9aa/
>     powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/939cb65a8c736bbd1baab7ef0c8490d0c9f513f2/
>         arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/402338fe047526b2e9e0be63db1e962b40897e83/
>        bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/be1c023d8f8ca5d33334c5142f4f581042b95cbe/
>        bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ba50039604cc19f4471cd8bac573f867027cc130/
>        i686 |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/ca46b2374e5f09f995a0d89dcc9ca4c62b4b5485/
>        i686 |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/fc9c740980c56782834c122959c2f292856cf67b/
>         arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/822414cae480477714ddc4d4139522b9f3866b28/
>      mipsel |                    lftp-4.4.15 | NOK | http://autobuild.buildroot.net/results/b419e29321bef974af8b09eeb79821a49f8b48f0/
>     powerpc |                libglib2-2.38.2 | NOK | http://autobuild.buildroot.net/results/b1fb4b6aba36ac48b9060c990aa94b96166ccc1d/
>        i686 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/f7b34898cf6237af42f8a9d77142bca1b741432f/
>     powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/c0bca3d6c1074a07ef166cd5fec04969d91a5c57/
>         sh4 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/0bf44b2c29d8523583cd341b4a6b798742375cb9/
>        i686 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/f98f789a8a8621ad1cb142af6683b4cc134145d6/
>        i686 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/dd616d568b18f385bb8a2e7cfbbe150715fb4b27/
>      xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/50dca15688b0c7aaed48850c0f4864c35ca6d986/
>    mips64el |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/d0d6ce090557dd593b61f1e7cf934e92205fc2a3/
>         arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/3e04f18c6cad095fc2014e79aae34781ed62bddc/
>    mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/4a05deb32381964f3e132eba64e319116e3e0926/
>         arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/3f4eefd63868bf623a420994220a2407c582b769/
>        i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/a67267ec6316f1a70b3636578ee842fcb989d581/
>      mipsel |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/15f57709c8d0789504268741a91380c1744faede/
>     powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/8d8dcb0ea31556e66da8a4f47cf0ee59caac17a1/
>        i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/5830ec5dc319fd5fcad558976b179edd9ec21103/
>      x86_64 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/b886f6b7faea62bd78a3902689a16c31a6ecf189/
>     powerpc |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/eef4c4eaf9124c0ea7f8db1027198bf0f9c48481/
>        i686 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/a6dde911a9a2beabd008efbc8f079e8ad300b15b/
>         arm |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/e8118afe9d73429b10a78bea175f9f8ee2cbb07c/
>     aarch64 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/fc7439390dd493c32ff0788956cb9d92b345d108/
>     powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/74ae3945eb8b590d5f2ea63bd2bd3bd0449cbcc5/
>     powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/8c5c44fb769971ce5b131d9cbe5ce66ff784d12f/
>         arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/58b1158d25a01254b25680b781bc172e0cd767e4/
>      xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/7cb8b7add0b80d74da9b52218e442a982e9f276f/
>         arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/089cd89fd2371c51783eb0c4d35dd7375b8413a7/
>     powerpc |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/0db7ad181a6064bde3980023734704254628ae75/
>      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b72ba865a83d143d4cc9ed6206a05b9099e488ed/
>        sh4a |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/ca7b8146488c0127e7fc8cb50508d834315039bd/
>        sh4a |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/91a6acaf5cf50e2e1fac449af9d71aa87b8bdf54/
>         sh4 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/222c21b8570623a25c7413aa3007d0728704b650/
>         arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/072889a68829ebf5280d8c0f1c6fd6941ef040b7/
>      mipsel |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/62bfb6fd87d080e97024a2fc0a4f65e6b2de0f15/
>     powerpc |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/aa05d03ef5795b1483e5cda47a4babf1038754cc/
>         arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/632beff70fcaa874f62194062abdae33875271b4/
>      x86_64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/8e1a29bacf38270ad792668a3313c02f5197e141/
> microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/59b333f683dcc2223103e2daff78208ee43b6da2/
>         arm |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/0b597b5e1c5741e21c3b80d1dbee3653a6f22407/
>       nios2 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/b43e8e92a5ab24dc47beb1164bcb40f953269520/
>         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/4ac44dd207ea9f207a9294aeb3b1339bcd5c51bc/
>         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/072110d6aaeab2b7e2d1bbf109c76acf5c8cdf76/
>      x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/b78ad957d44cf3461a647175d4ec242c26428c89/
>         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/a4ffd68656fb02652384f96f7f4990a1f8cf20b3/
>      x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/f6f18ffde891415f14a597cc0b265c472c30677e/
>      xtensa |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/0f575214a9beb0fa9fa3f364651736a4c44973ea/
>        sh4a |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/288e6a729d0278182ce2e2d5e679205257a45b28/
>         arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/9318c942e8200076bec4cbfacd8f1158c52b1201/
>         arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/b9156618302316e734e812460c354d6e44189b1a/
>     aarch64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/cff2ba58cb98facf319aaf5d97d9f4122f7171a6/
> microblaze |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/6c4db1d2c21f147c5a24dc90264f96777dab3c80/
>        bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/556242ed77cab33555b086cccdf4001d7d177956/
>
>
