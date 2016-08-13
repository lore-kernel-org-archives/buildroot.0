From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Aug 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-12
Message-ID: <20160813063028.EE564101C98@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-12
===============================

        success : 210
       failures : 65 
       timeouts : 3  
          TOTAL : 278

Classification of failures by reason
====================================

                     gmp-6.1.1 | 6 
                  connman-1.33 | 4 
                  fbterm-1.7.0 | 3 
               tinycbor-v0.3.1 | 3 
                 mplayer-1.3.0 | 3 
                pinentry-0.9.4 | 2 
              squeezelite-v1.8 | 2 
               qt5base-5.6.1-1 | 2 
   binutils-arc-2016.09-eng008 | 1 
                 weston-1.11.0 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
                     pcre-8.39 | 1 
              libarchive-3.2.1 | 1 
     docker-engine-v1.12.0-rc4 | 1 
                     vlc-2.2.4 | 1 
               host-efl-1.17.2 | 1 
               logrotate-3.9.2 | 1 
                 openssh-7.3p1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                  squid-3.5.20 | 1 
glmark2-fa71af2dfab711fac87... | 1 
android-tools-4.2.2+git2013... | 1 
                 lvm2-2.02.162 | 1 
      kismet-Kismet-2014-02-R1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                     xen-4.6.0 | 1 
 make[1]: *** [all] Terminated | 1 
                    cups-2.1.4 | 1 
           igd2-for-linux-v1.1 | 1 
                  fio-fio-2.13 | 1 
                  rt-tests-1.0 | 1 
           googlefontdirectory | 1 
make[2]: *** [utils/CMakeFi... | 1 
                   ncurses-5.9 | 1 
make[3]: *** [utils/CMakeFi... | 1 
               binutils-2.25.1 | 1 
                  openjpeg-2.1 | 1 
                      qt-4.8.7 | 1 
                wayland-1.11.0 | 1 
                   systemd-231 | 1 
                    qemu-2.6.0 | 1 
qextserialport-ada321a9ee46... | 1 
                  lshw-B.02.18 | 1 
                  babeld-1.7.1 | 1 
                  trinity-v1.6 | 1 
             libsidplay2-2.1.1 | 1 
               openswan-2.6.46 | 1 
                    fftw-3.3.4 | 1 
sconeserver-bbb384404575f8a... | 1 
zbar-854a5d97059e395807091a... | 1 
                tinydtls-0.8.2 | 1 

Detail of failures
===================

    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f31051f61f3ae99b24640149a9415bc34d46be4a/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/5ac09dfbef34576d16cb46c2c19b3c3976c27a53/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/e9639649aad9d4475bcae692b74ccd06a274325d/
         arc |    binutils-arc-2016.09-eng008 | NOK | http://autobuild.buildroot.net/results/e65629d1440a5ab1ff52525ed0307ff87fa181c6/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/a3ad788181a54916a41286c41db86db071127245/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/d67a22032adcd55ec57a417ffeaf9a2dced05cd3/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/954bb7ce90c9aeebafa653ce54854d86875fdbbb/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/0884613b10ef28251dadc4c305b0faa4f773ab52/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/57450a1cb33985169b5047c38cc6fbcd543a1d61/
      x86_64 |      docker-engine-v1.12.0-rc4 | NOK | http://autobuild.buildroot.net/results/5b0f7e9e05e2607c38dfe6debf3eb8c11c3e845a/
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/af4935f0ad2054b7dc2443e2d126fe8e50996f66/
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/026ed882e86462f93e827b78c8e52dcef5add828/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/559eb7277c6289ae84fd09b280b1658d0a63308e/
        m68k |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/115f75812827acc8ee1a5efc598f0fbb48515e5e/
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/434384d8f7d6f3d9ed1522ae7a89ca81e3472be2/
         arm | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/cb765a1dbcbe6956a44974c3af35cf17420a6bf4/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/f5f389eee39244b7a1df16b32c14172cabfa3d9a/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/5f57272212775f0ca50c9465e186b7feb1c95db4/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/1cd194d20b00917dfeb4f7149eaf1e77a1517dc4/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/962d79ac85c49bfa5adaf5b06ec315de00c5ba58/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/8de222ff7436210d6beeb0f6c5a33d947d9ffe50/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/16978740a10a9aa902126ed446d6cf6318791040/
        mips |            googlefontdirectory | NOK | http://autobuild.buildroot.net/results/dd3f9571fd478e4dec38a868e02c5bc713472cab/
         arm |                host-efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/b09bba276bc1a04f5a9fa11e4ecacc5d366bcb0e/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c5b909818d05872fb824557681cf82126bc14d80/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/4f72969f7d7652d970cdd82555703d81a0293b6d/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/943f9477679363216cdb8d50011fc8926ead14e9/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/5569095421dccf94de0f8cd5439a07da50c03c8d/
         arm |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/787c715814b09d380ca521712f54cbcf5ae121d6/
         arm |                logrotate-3.9.2 | NOK | http://autobuild.buildroot.net/results/1cc77975317f706360e72cb0193343799dc61595/
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/03aa005c0942f665ac507af468a7b61f34d2e5d2/
         arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/d947665dfaeed64b5edcdca37f84dabbe905683e/
     powerpc |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/db8d8b6d449d93c14ed7960ea3191c5937931a98/
microblazeel | make[2]: *** [utils/CMakeFi... | TIM | http://autobuild.buildroot.net/results/c69e61a087f2ed38282acc54b72a1f68e318fbb9/
microblazeel | make[3]: *** [utils/CMakeFi... | TIM | http://autobuild.buildroot.net/results/34592e9738420464faee885272ae3421441c8bd7/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/cebba4655f2368bb9b62b920a8898f0985998902/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c6db6b292e75037bbb20ed69050143fbc844a712/
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/51aa569af66aeb4997cfcb66ca94bd27b5bc8d8b/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/52346f3b72883cf0e2422f435580799854d99070/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/023fbad3b293f21aa130a9668fb3db6197bc010b/
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/218688c77b0fb41a783d31145fd3d50745284f47/
      x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/1f11c8d38b08ef8b560046379a8589580a0cbb3f/
        m68k |                      pcre-8.39 | NOK | http://autobuild.buildroot.net/results/3c873a9d1b2d2de04c7e3d2256eb592eef9d48af/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/1322e1b7833b531f693aef85bb33226cbc166e95/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/9e58f58ba8cff6f6194dcf4f6d45ff464ddce6a1/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/a6a2f45392ae83df9e352a17fc06a31205ee9dd7/
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/ea8d36623de36562aa730bc76d0890d61cc9de7f/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8aafe238af459b3df302a7a38411bc3764808a0e/
      mipsel |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/3117459baabb8acf32b62828d1451b5fc2664833/
    mips64el |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/21089dc2e5ba5d5c1fd7db8d73e33d1948bd995b/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/c3d1aedbdc3e5365665c7cfcba640ee16d978094/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/f711c225d37f3c0a2a19d0af18d0189b0c73488b/
      xtensa | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/c5c945e1a319bbab22859c9573c292916cf85583/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/8ce01b1f8d1d6293a6bc2fe9b237dfeae21aa955/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/acdb828cbc1ef8eee1e4f1d61f8b79b6c79f83c5/
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/8d2c24c2d481a195c7f32a80ad96c9b22f1d0939/
         arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/e6f8189029487155a784b4e664178adfd92f8884/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/53e111ad231167f0b6914f011607b26535c4dd6d/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/6ab710b2da160e2ee69916dcefc71e2bc92d62e8/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/1919053fa8ff34387e504bfa9b24bf18911791cf/
      x86_64 |                 tinydtls-0.8.2 | NOK | http://autobuild.buildroot.net/results/1c3af774dd0e763fd05aa6044bf7399e28122171/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/21bdf5d5d0185e461b1b7e84d93f5b17ce27632f/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/5a9637d93fc54b9263248d4f53f6ea6ef36648b7/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3977fe887cd104fffb212288856a89990bc4ffd1/
      x86_64 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/fcf6dd3bd31f92eadbcae17338e5887a23e43ff9/
         arm |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/76976fbfc2162c2c671a52eafdad82df6d25a660/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/e2071e6784c40b11b167e3a21ca9806168a8abbc/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/843e4bc3cc8ff6ec37a40155faa2aab6b01ab916/


-- 
http://autobuild.buildroot.net
