From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Sep 2016 08:30:33 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-02
Message-ID: <20160903063033.788551028C6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-02
================================

      successes : 174
       failures : 36 
       timeouts : 0  
          TOTAL : 210

Classification of failures by reason
====================================

                     lxc-2.0.3 | 4 
            micropython-v1.8.3 | 3 
             util-linux-2.28.1 | 3 
               binutils-2.25.1 | 2 
                libxslt-1.1.29 | 2 
                    cups-2.1.4 | 1 
                  dbus-1.10.10 | 1 
           dmraid-1.0.0.rc16-3 | 1 
         docker-engine-v1.12.0 | 1 
               domoticz-3.4834 | 1 
                   erlang-18.3 | 1 
                  fio-fio-2.13 | 1 
                 jack2-v1.9.10 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
              libarchive-3.2.1 | 1 
                  libcdio-0.93 | 1 
                  libffi-3.2.1 | 1 
                libldns-1.6.17 | 1 
                    mosh-1.2.5 | 1 
                    mpv-0.19.0 | 1 
                  openjpeg-2.1 | 1 
                      qt-4.8.7 | 1 
                    ruby-2.3.1 | 1 
                socat-2.0.0-b9 | 1 
         systemd-bootchart-230 | 1 
               trousers-0.3.13 | 1 


Detail of failures
===================

         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/e1e2acaef571627a6dd173010450c8b7d90116ee
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/d733d2fa34c9b1e70453c6445254a4f0c7c040a3
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/28adc429b7e60b2eb4956504d109d17ccb5643d9
       nios2 |                   dbus-1.10.10 | NOK | http://autobuild.buildroot.net/results/332f31ce9c5e9a6e405867c3cc5b1f260ae7fdcb
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/1f0a1de0bca0c18843c363c626c4e708d65a1cd1
     aarch64 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/5f2b62a67920052e303f74f1830202ca61c0f569
         arm |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/62ec0d348153dff0efd4c1975a9198c17f01f1fa
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/d86348207b3b2a9fcf68453be337b17a860d73ae
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/bab10f2c9a5104458138dff8cbd01d03e8681d9d
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d4518dd467555ce209ea914e0861859a5e1a3be2
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/9fca6356c07874e01e53f85f2f1d7ef56cd3d2f3
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/8128e8b4d2808bd64d3806b9ec8a11e1ae63e36c
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/a7f12c8b48c7036360f22e4e4a0c142f442c85c3
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/61cf744cd2829e2b025197f2304fb20c64cf3b2b
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c9476154e2e63ee50ca72639b04a51e81ef61a87
    mips64el |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/b2476f5aace2d1ee7aef72de8d50ae6f4f6709a3
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/3bbfcb072077438e3cd0535a757976f1e441a9e8
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/580e248c13fa60f6e8c747aeb1767b456b6f4dee
         arm |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/b1cbca6d0396863654b1d09ccc3163c5f6124ab8
         arm |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/fcf2834ad74b95548d25dad2274704ea401f9665
      x86_64 |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/048be2fc702c9dba9ca4439ff687d71b30c10551
        i686 |                      lxc-2.0.3 | NOK | http://autobuild.buildroot.net/results/939246c9a4f433dfd0dc414988f5957441b8e9b4
    mips64el |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/061c66987e9c33a6641c8183f5e0badae516fc1d
         sh4 |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/62e5b5c6d9dca0f41fb4e7d462ebfbb02f8d29da
        sh4a |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/a6437a49659a7b2983269e758dba9fa5a29240d7
        i586 |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/a148ce0c3db85630d915ea23de6206b830c86403
        m68k |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/98bb9b57faedb9cb33505d230489e2ae62bc2d2a
      xtensa |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/c73c7985e5768adb6a4ffe6c4debb8bf1d570c44
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d8694878c87a5e5658bfb3e03b4beee65469ca13
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/013a5e09a38a881725491c464467610c01079ef9
         arm |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/b9d9dc20049229aac3f4e9ef8cddb73233ed700f
     aarch64 |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/ba0b23d7f4402efab29ccff9d0d9a5c730aa36b8
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/45ff44ca54bd561933733190e5fd59fb02818544
    mips64el |              util-linux-2.28.1 | NOK | http://autobuild.buildroot.net/results/e45931629ee3f5dc45de6940a2c0983435f77e00
         sh4 |              util-linux-2.28.1 | NOK | http://autobuild.buildroot.net/results/b3649dedd048515844675cd48b84bab74eb897f8
      x86_64 |              util-linux-2.28.1 | NOK | http://autobuild.buildroot.net/results/26b3a4de1fb8b366727299ff5de7d59b3e521c23

-- 
http://autobuild.buildroot.net
