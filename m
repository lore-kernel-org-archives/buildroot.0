From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Jan 2017 08:29:42 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-01
Message-ID: <20170102072942.DBBB020765@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-01
================================

      successes : 176
       failures : 79 
       timeouts : 0  
          TOTAL : 255

Classification of failures by reason
====================================

                collectd-5.7.0 | 27
               libglib2-2.50.2 | 12
               sdl2_ttf-2.0.14 | 8 
                 gnutls-3.4.17 | 4 
                       kmod-23 | 3 
                 jack2-v1.9.10 | 2 
               skalibs-2.4.0.2 | 2 
    xserver_xorg-server-1.19.0 | 2 
             berkeleydb-5.3.28 | 1 
               domoticz-3.5877 | 1 
            gesftpserver-0.2.1 | 1 
                    git-2.11.0 | 1 
               host-gdb-7.11.1 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
libasplib-f7219142e790a329b... | 1 
                 libnss-3.27.1 | 1 
     libphidget-2.1.8.20140319 | 1 
             libsidplay2-2.1.1 | 1 
                log4cxx-0.10.0 | 1 
                 midori-0.5.11 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.22.0 | 1 
               openswan-2.6.46 | 1 
             rabbitmq-c-v0.8.0 | 1 
              sdl_mixer-1.2.12 | 1 
                 synergy-1.3.1 | 1 
                 wavpack-5.0.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8fa411b73d9c96d44019def3b762cd35794ea5c7
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ccf04b434d60262e42efac6eaa2543b20f07a5dc
         arc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e8e7234f1f2a0b41d3503b653a1ccad4b622f709
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ed1f8b831967e4e2004b3130268cc94ec82224b1
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b50af33d669da736b427c5f2b4b268a1b138826e
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/cbeb2347e4f1171c4e3a366e5129c08ecaabb52b
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/cbacd7ce8dd3e201e7fb8e7b5fab57508e2cca24
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/551fcb7bd7ef8ce6c7d87141e2a2f7a1fd482331
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/05d779c354d8c81e45f8edc0c87591291e8adbc0
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e685ce8b7f85c490832cae2dccb73020105478f0
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b403a2337b160858560b944c0c7f3d8d7b614eb1
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1343907bf06b291d9189a9c617d5662c0ededd06
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/812ad712dc23abb2220d8b452ad224e757489949
   powerpc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5d80eed639f73a5ef4d94129a7612dd2a4b56472
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9e5a542204c89e04d86aaac494c4f083d5a023b8
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/558cbe7ea53ad4cdcdc141019cf164ede202b815
        i586 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c034b203a202dc8efca25d5a501858c1deda2f1c
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7e96df8cc44fdc0804ae689bc762ea0c197fd158
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/dcff6bcb83b8c793026776af151b7585771d1557
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3270c3b522775aa7c6ac523bc3884211d0be89e0
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c823cfc3cf2e33296164e7444dd1678f29161077
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bd9bd564501e1a9c648a61520a73564ed6225329
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a65999e19911964ce3e33bf76548e398d25bbb24
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a5a3ac12856cec1a3d4a1a53188be86fc947986a
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/10ad7e6b52203c7df0a9f3742723a1fb71dea77a
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9b46dd5ca6bcca2d5836ef8015445349d2c3b3e1
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e6a3c31eee624de470108e8aa1903337d7301599
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7897a6b0ca9edb18e1d797b12544716b0fa2fbe5
        i586 |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/1e3d07db51f75cc5068cc4a77118285caa3a811c
         arc |             gesftpserver-0.2.1 | NOK | http://autobuild.buildroot.net/results/73ffe435c609a1400155ab46c90d01de078709c7
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/b091ff8f5201d87694ab89c1f9a2ffd661f947e8
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/f891704915181bb413c05bfebc7837ac9035adb8
     powerpc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/306b4a5f9bd7de7c7fe0174d83df03a06f266dd7
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/c71777710ba227bf203266f0fd07036e3ac589dd
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/f2ad25c3bbe967c5050b62b4dae2420cfff3c07c
     aarch64 |                host-gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/fd004383141316eba5b74fbac737cda23facc20b
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b5da8fc54af5346d85755acc2d9db9ad25f9b7b5
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/efe6cbd46fb358c0cc8754571a9e83c1f830fb63
     powerpc |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/e869c872ca02e3b22785f41ace0b40c8ca2ac9bf
         arm |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/61353cf474267a80493eeed67907b932be5c0cfa
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/c88a6234a03a53f9c2f3f7f5ce790e138cfe3c73
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/73e8568f0d11fb410cb9f1040dab1de0c2549aa3
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/354a5125fe9b75743693bcc1b249ba566ddd1482
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/df84e001a4c1ef92c6918d71aab4d1b9264f58ea
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f27156c496e04e5a127240792907a6d056efd4db
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f96c6a1e08b8a50e7785264239af91f4e9aa5396
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/16450516b59aae5c691bc6797ece59bcc609b75f
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/b7fe275b17c71851f00202a448b10a2c568c7bda
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/ed7b9d2d95213f3f791a3729c1903e612eb7bf08
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/7102b99ae424d23179c54d8417a2c313dbd91d66
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/206818127e3eb333c660131bce665521ec596e21
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/0ae9a4a55ce2b79f7226b0219362658592624bae
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/150dbb9788727bb7fa7cb31643579034985ab9aa
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/de45740c2240d03d6af7ae41c2e7cae1a9e4b1f7
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/04fb23b4ea5df92bae20c25237f497fe2d561a63
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/5bac94edfb02166822f25ba3aa3f3b183e8df257
     powerpc |      libphidget-2.1.8.20140319 | NOK | http://autobuild.buildroot.net/results/4ae4d64f373b442220145fdc8def2c825b1c452c
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/7c1dec85d249ec59cb8c28f62c2bad0a67fd6361
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/f6f0ed22ccbea7ea38f4599e1d982517c54c5fbc
    mips64el |                  midori-0.5.11 | NOK | http://autobuild.buildroot.net/results/f56e9981c4c1a375ec1f607b58b389dd3ee464d7
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/424e67e30d4e2e26b738bde32b73f83a869797bf
 powerpc64le |                     mpv-0.22.0 | NOK | http://autobuild.buildroot.net/results/498f8c2f8f5e18b8cc7fc07e2dfb38ecba9e5e93
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/f784034f47ce92964672741c42ccf43052756980
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/11ebfcab502b68da5e9bdf5b270226c7b4434661
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/24ad22547ec6afca46d42affbfa025f2817d0ef6
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9abaeb16e7af7c34a56f465184171c74afab2126
       nios2 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/c60414f5811547785a9d2fbc7e03e1af7e048a23
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/750223a0a3b32b9ec353987433065cbc73de3493
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/32dbba80ba6288b7a92650f05e7cdbe5a2303b29
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/7e440b3d48c5d2774c36befd90a3b731d80a96be
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ef133a100bb00277609fede5feb11ef3c4e37312
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/7888dd59b72156f46aa24828cab423cb65d3c420
      xtensa |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/fb18e2a63d65814a3f302a5e428c68e77309d10a
      xtensa |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/9fc330b4973dcad91bdf35d93b296659a99874b6
      xtensa |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/6f99b0311fed5613b0a89e7be908b48996e00f89
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/08ebbc12b36ae7fadc3787799a0617caf8147330
     powerpc |                  wavpack-5.0.0 | NOK | http://autobuild.buildroot.net/results/4741fadbe2fd31b55a54d6400816343241e72ef6
      xtensa |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/6d1445bc408d9f8061a6701b6097c1e464dfdbd0
         arm |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/39758844d672797aa6e5a1f72eca79bf49af35a9

-- 
http://autobuild.buildroot.net
