From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Jan 2017 08:29:34 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-07
Message-ID: <20170108072934.DAA4F2077D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-07
================================

      successes : 163
       failures : 96 
       timeouts : 0  
          TOTAL : 259

Classification of failures by reason
====================================

                collectd-5.7.0 | 30
               libglib2-2.50.2 | 15
                    flac-1.3.2 | 6 
                 gnutls-3.4.17 | 5 
            lttng-libust-2.9.0 | 5 
                 libnss-3.27.1 | 3 
                      mpd-0.20 | 3 
               sdl2_ttf-2.0.14 | 3 
             berkeleydb-5.3.28 | 2 
                  lcdapi-v0.10 | 2 
                log4cxx-0.10.0 | 2 
                 mplayer-1.3.0 | 2 
                    php-7.0.14 | 2 
                    sdl2-2.0.5 | 2 
                  apitrace-7.0 | 1 
                cifs-utils-6.6 | 1 
                  cppcms-1.0.5 | 1 
               ding-libs-0_4_0 | 1 
            host-heimdal-7.1.0 | 1 
             host-nodejs-6.9.2 | 1 
libasplib-f7219142e790a329b... | 1 
               libepoxy-v1.3.1 | 1 
                libmad-0.15.1b | 1 
        lttng-babeltrace-1.5.0 | 1 
                    mpv-0.23.0 | 1 
                poppler-0.50.0 | 1 
              sdl_mixer-1.2.12 | 1 
               tcpreplay-4.1.2 | 1 


Detail of failures
===================

        i686 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/fde4702cd574d29c3fe5aa9186d81410a61aaf66
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f7ca152c5d58602d6430fe093f97605ca719d63b
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5b65e349023124b1408b9f583bb40dd03fffaeae
      x86_64 |                 cifs-utils-6.6 | NOK | http://autobuild.buildroot.net/results/38356a6489a5bbb700254dcbe0180ff6e63d299c
         sh4 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f1b088297046231e3105002043b224a8c89d415b
        m68k |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/93f3b07d489dc09d2afab71600d4c128a92cea05
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/2294876be8d305ed2d46e6eca1bf85e763a7c8f3
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d30ab27445a16a9ecbff7ee3087f7de87692cdac
        i586 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/acdccc94de81b82794b96b0cca5e410b0fb6cb88
 powerpc64le |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a3ed2d800d96f63ed7e2c0fb0927ef95772b1382
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f22594fc61f5fae7b6735f51e5c918b8da38991a
        m68k |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/92481252d444bd27c5724bfaf44c8480f0f36755
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e7120c5e0b315beb0058fe405a96115b27b6c3fd
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0610001d15100d64f8d0964c48599acbbf968409
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f9f764e2d05cf1f05d52881849526afef8a9bce8
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/78102477ff1c2423b93338fc684dbe8b8aac9ff0
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0c7024c9e63cb3f549a76a5361c71c6bb7b7eff1
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c545dada22aa4a1a57b669ab06171360caf5c67f
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0cf831d0d0165f8aff922d7813d9e78c49f0a36f
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/686e4f23255970cedb71d0d9002250bb7d8b060e
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/430c0bbe847c464ad077b3d0c9a28323f0eb3157
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a005b8a1988b6efbf7683227d8264c39bf696d5e
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bb8d92ad8e8b8003a2c9e3654712617e259c86f0
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7fcbf08f8fae5cdaa0daa236fb4e52dc7f5cb25b
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b8987d7c56d113d84b1d1fba63a84aa3ca21915b
        mips |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/894827012b4bbd31f0479b13f5b95d46ecd6a003
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/45fc53784a2c3dd9f3d0b3eb371f1e64104f0d1f
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/29860431aa586c9a2354da7b6bf9299523c3b79e
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9b8dbe87603bef2d8b30c0984066d820fe231981
 powerpc64le |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9afdf70570838c05d84b3cada0356ab4766fad98
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8f243d0483c109412661181530edf1d5a5e42fd4
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1515e02b7133bfb23f980107616d530d869f6ae1
 powerpc64le |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/770e32c03e503d33a8c76900cac693c1db278fc7
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9816c0f5a016986b6b8b2b6d4162d49ee8f33dd9
        i586 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/84d8e322ca2097926aa2d16d4dcbce102d88724b
         arm |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/ba54f2908e1c05d7c9efc7b9bdedca1637409d63
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/dd8673218d774c3e78238f1a46e79cc7e43f2a70
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/30afe1b2142523229ecca6f4e48c1572e67379ce
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/db7f4a97ef221bc95a711befaf6399fd8cebf93c
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/019b328f9e7aca6d3c662ca86af112ad3c75e9e3
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/b47ed25803620ab3f2ce99b968ce10db479b0e28
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/a7e7fa2f9cbe636b1dbb496bc7e9e754cf5ef01b
     powerpc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/bf086a67c2ab346673d17b859df64882b8a5c976
     powerpc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/8dd36ae4d308b584dc22f1f0fb4a46dcfa8eb7ff
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/3d6e5f35af3c188b2c8279eb5e077276df298896
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/21aef113b5be172c9ad7001698ca649d1087c3d7
     powerpc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/9289e064a4ec6435fd053a2ad9397e6ea2996af1
     sparc64 |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/9191267470da40411ecb37809d1fe32c487e57e6
         arm |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/5c49ba1a068a9c2bdd99af1492f0d1bdb9d368f2
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/7a5d47aaa674f0bd7c4572c87c8a32bac78824f4
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/fa61d1ff179ee4bc1c4736f25e327979266a99e5
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/ec2af6fabae69597c8ad6997d352d9530c1f6211
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/d3e7459d166a4f428f7c97515c277f3fe62763da
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/c539f6b79eef7aad05bdade3aee5facb879f70ce
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d10ae9fc19a4223b9e013f1284563bbae2031a03
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/1637125613cba52a9431e3a51962ee3830b6b7ae
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/4d52653fde173a585984ad601ad173d12a961130
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/08016093b1a00525ce92c3076bfbcbad99018bf6
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/5b3ca79b69bc67caf8967fc9ec20344e6e439d3d
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/518dd94d42e0f400c6e567f7be0a64f8b662d77f
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/89b53f6c600cc61ab81e0880cabe0ff70c471a59
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/fbf77d2c03eb3ed516885609afe074ce4249c6fb
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/5521c78aa8dcc695de79f2e76922c4f2eeed0404
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/819ebd52d3eb26481154632e08f90ed26f5b4cdd
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/079e5ce4694dcaf9f44d90b7cbf63b29301d3ab4
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/6eb4839fbfd499bdeebff55558041006db21b9e2
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/c9716df29eb13ff77bb66c9e3119796f1ae42485
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/02f8cbdea98db6f358e106dcd676dc331bdfd8aa
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/8d4ea8613487297f2c33f3b9cbd8903cfb96e4c6
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/eb9720a54ecf7e96d540add71051d4c2b2469765
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/9facdac0846298b78a355db2df97a56d474c28ff
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/17f5b792718e4378e6bd757beaea3f40bdca919e
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/7ccd5afeeeb3efa5d727661290cf17b66e1d1228
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/28b527520173b848709ae9c63f6160fc6537aebc
      mipsel |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/b7c509edd656a2e43fd5957ee04d163985c27cea
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/27ecde474c46ef09e0f22c6f17fd349bee0a025d
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/8581c500f5dfcbc8eb7ab9c6d0b5e1cee24f53ee
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/ec5df4945939d2879df62df02289b7fa1762d344
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/d910d89e436b1333c6efe1a72ecc9790b806f129
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/8ec4064a569f2415de7127429b61318a91e3a183
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/95592684877b9ab43efd0109259889f82e0706e7
      x86_64 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/ae783d75fc5fe8c2b8f6353d171fcb06099d821e
   powerpc64 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/5bac42b4481308ce03b1ca71899183515727dc16
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a227e048d037c1eeac601580ba566ab400e0e519
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/47c47a29dbe81281d6b4a9496d8000cd04759802
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/aed6c481964e7f8ef39ad5b2aa634e4e82c6757d
        i686 |                     php-7.0.14 | NOK | http://autobuild.buildroot.net/results/993b04a1142ed22f3cb066caf39ee28a8867de92
      mipsel |                     php-7.0.14 | NOK | http://autobuild.buildroot.net/results/940fb541e51834bf06308ce79d0e630b6ad9ca66
         arm |                 poppler-0.50.0 | NOK | http://autobuild.buildroot.net/results/1e0c63b3937881d547d152b2b953412a82dff4d7
        bfin |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/25f3c0b56058a5aaa7ee4247567d0d1f346a26f2
        bfin |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/0a07f0595d9c293fb3f777dc7aaa6b3aa77583ec
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/4f542a59531066bc09ef3940f1383f56a897918f
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/77bded23f56494ae2e4ba6b9e74346f52ac74231
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/bdf2e66807169b2469c61d1aff7b8e0980186789
      xtensa |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/eea772107643696d98fd0a45709ab69fce058a2f
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/a768ed8edd9e4cab75fc8211d3e8094661a0dd17

-- 
http://autobuild.buildroot.net
