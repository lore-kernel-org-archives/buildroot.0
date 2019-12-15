From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Dec 2019 07:18:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-14
Message-ID: <20191215071825.1CD502034B@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 25  |  5  |  0  | 30  |
  2019.11.x  | 19  |  3  |  0  | 22  |
    master   | 146 | 100 |  0  | 246 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 16
                  apitrace-9.0 | 11
                apr-util-1.6.1 | 9 
                   libnss-3.48 | 7 
                   dante-1.4.1 | 6 
                       unknown | 5 
       alsamixergui-0.9.0rc2-1 | 3 
                 samba4-4.11.2 | 3 
                host-go-1.13.5 | 2 
              host-grpc-1.25.0 | 2 
               libupnpp-0.17.2 | 2 
                oprofile-1.3.0 | 2 
                  polkit-0.116 | 2 
                 xvisor-0.2.11 | 2 
              alsa-utils-1.2.1 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                   dvblast-3.4 | 1 
                  flashrom-1.1 | 1 
                   gqrx-2.11.5 | 1 
       gst1-plugins-bad-1.16.2 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
host-google-breakpad-7515ab... | 1 
            host-libp11-0.4.10 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                  libkrb5-1.17 | 1 
                 libv4l-1.18.0 | 1 
               log4cplus-2.0.4 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                    mpv-0.29.1 | 1 
               protobuf-3.10.1 | 1 
       python-matplotlib-3.0.3 | 1 
     python-subprocess32-3.5.4 | 1 
                qt5base-5.12.5 | 1 
               qt5webkit-5.9.1 | 1 
                 ripgrep-0.8.1 | 1 
              spandsp-20180108 | 1 
                    strace-5.3 | 1 
                   systemd-244 | 1 
           uboot-tools-2019.10 | 1 
               wireshark-3.0.5 | 1 
          xdg-dbus-proxy-0.1.2 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/3c1ede92dcbefcd21a8c6f828765f09a05cd5035 |     
  mips64el   |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/47b27ea33a985a735349b1f6ccd7c9cd47758f2a | ORPH
  mips64el   |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/41205ad67362ba46fba8e2229f41e7c0ba15c570 | ORPH
  mips64el   |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/4e98bb11c0928eba29647bb89f35ac88c636b13f | ORPH
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/5ac27bdaedf97730fa576ef9ca29668bf086c140 |     
   x86_64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/003e34f10acc323c4131a193cdcf1330ff151f8b |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/7211f23d74e545d021a770cf75490013e2c1e6fb |     
  powerpc    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/9e9559da91240f1f23af4dbb3af01097d116b461 |     
   sparc     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/3b08d2916b055bf5399703c34db33dfbc90fb85b |     
  powerpc    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/5f27556ccc9daec578fe1bf2ed516ca9921ed474 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/ef4f5e73b36dafa518d7fa4203b6270be5ad18b0 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/28c319f1486aaa67657b6c4e50edea72d520cdba |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/947a2851078ba9e3ff1754e31fb1ef96f7be6f6b |     
  riscv64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/2afc9d43be7a3541ff4f344be752a6589098d14c |     
  powerpc    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/7273a27915ef09e51d58889432be12dac566a0d1 |     
  sparc64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/ba52fba326f03cfd401f12541f91a876eff0bc92 |     
   nios2     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/add8b69ddce6eab19e3d31a053e5e8e899fa5bde |     
  sparc64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/b096307424dd99fd43592ad6c4a07c437e976176 |     
  riscv64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/497f2604c827bff9fa9acb582a495e2e47e5ccfd |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/180a1df6b47302ee10297ed1d8b0a45b4fec7a73 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/974dd069bbcd23282c58da3a556bd3a004eb0e36 |     
 aarch64_be  |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/5b67f0cc50c937bf7a4eb48527d37d268263c58c |     
microblazeel |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/262f066b0db92cf25497e1192ea5719233347989 |     
   nios2     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/c6e02bda144da123963ae79b7423e305e10034f7 |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/9a4782bceb07634eab252037703326961cea984f |     
    arc      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/b8f0e0fe31f3f143eb37e95bf08a1966f875c8ca |     
  aarch64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/bd1f7a607ba7d2741851c9a723ff329c05b26b50 |     
   mipsel    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/103e7032cd43185d00704196a1779280a3de75db |     
   x86_64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/434393662f73118efb4b7113a48aaf40e9484a3c |     
    arc      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/c1893c515d2ff26919f6a0a712314aa13c22ccae |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/61ef983ae57d5bac8ffbd9bcd9ea03ce03692ece |     
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/d36e84fb634998937f38986b988bef0981d8e8fb |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/e5f8d38fdcbe1a30bd1583b733c940bfadc8def8 |     
    arm      |          gqrx-2.11.5           | NOK | http://autobuild.buildroot.net/results/47440354b336b943b74b72fa303b079dc962bfd0 |     
    arm      |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/09d36ebd62517f21bc4f8f7458ba7980e01ecf61 |     
   x86_64    | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/8665828d34e810b4d6385e30001707823efb19bf |     
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/a0a32615614aa30ac139a596309413426d13d1b4 |     
    arm      |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/4fa89ce31b9afa3f3ee56c645356feb191078b65 |     
   mipsel    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/1f192a934b0820d2dc77daf59cd0d0466323a64d |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2882085bf36d3c9396756a91db5f0119f22cbb98 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/48f600d4c4c23322d4acce0ce0c49fb7e41097f1 |     
    arm      |       host-libp11-0.4.10       | NOK | http://autobuild.buildroot.net/results/05adf424050cb56f74ae4106b3c9b61f8daff7d2 |     
microblazeel |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/f198c86930535c50393e17fc7a70fb4f27b096ee |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/34790b63dd066e29abea7fb4718ef8c8554c3980 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/530c1ac2825e532b656ee90ad2298ba60df4e42d |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/c263bb4625b5b477c5117a37383618df6299857c |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/91c8ae6e2c538b8d673bba22a953b91ad0aca74e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6833390f50ac62040b448c7b51ed635efa313ea2 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/cd60dffd0ff356aeaf1508840e00e7e3b2e7f8e6 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a1541982ce7d42b935391cc38753e352c6e10a70 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e0dbaf300ad71d5a126f8eb7f5ec5a5f76b65b11 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/db7197e12e4ff8d761a34dee9a875ba5f3afb09e |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d0ef45ceac332d262347eb82881260dd17d26730 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/61f8422ba188327d1166ca8f4587addf3ccea76e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0be255746c6195ae6fe45623c74a231f59e8543e |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b63868d49c92c2d031a8fba12a70e8686e38cccf |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/29a361a387187c5dfc7fd5681426d991769cba38 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8eed7dc0b0e97aebb93684b953640c20cdbe00d5 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/46322cc50bda112a39ad16771e34b8fb6dae49fd |     
    m68k     |          libkrb5-1.17          | NOK | http://autobuild.buildroot.net/results/45eee300788f46975d292b21eead97f9e9a8b5d8 |     
   x86_64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/2aa9031c77e468f9eec120407d821e8bf3b0294f |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/cfe463a6aba37e80300564c881365cb09a564a33 |     
 aarch64_be  |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/f2fc18fcc4a1a9736c7650ae15ac480b76ff3cd1 |     
   x86_64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/47900ee78749590928d29c4bf94c5bdb7d29686d |     
  aarch64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/6ef3c5f1d1bcf70587fc584949891d6cf2253ad2 |     
   nios2     |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/afa31c7a39c352d9cf23caadf572453ace0ec3db |     
    m68k     |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/06aba3f3b69585571aba60cbb77fc217d93b3bee |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/106ec9de1748330445445caf1a8c505d99cbbfbc |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/61baa8b44d402f446ffd5af12bfa3e0f4b9a5895 |     
   sparc     |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/30bef5532b37025191df288dbb2207e98367e331 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/d4ad319d26e3bccf2fcb331d0f33479cc3ac7742 |     
    arm      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/3bc7a091b553074697c00747a0ec8ab0e1163c7d |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ac4d7c28abb821c58ad05a957af6a1af6d8b053e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/30baca334eed8d304e2935f89394bb9c95ab8cbe |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/d42e4079b1feb8288ebe9f2dfa93cebfb15c6b5a |     
  mips64el   |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/a7ea21a8e10f32239ee28f58331899912f232ca2 |     
  mips64el   |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/7d4f86de4b68c98272332773e701d76b93a8ff64 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/4ff4bbdb2b0cde76a1985504aa7032c907c39d66 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/ed3585fc65333a960125904a42d8ca0cdf119ce0 |     
   sparc     |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/be81d5175c7fc20f04b18cc4144feccec20882da |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/74fcb6b5cf0e81606f52c185f4c2c81819d84af6 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/a67bb2d20ebef043957015c4e05461bfa97a2381 |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/adae2690e6a91890b2a5727023a1c245699fbb88 |     
  riscv64    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/c4bb3d41fa07e38f0360a563bdcb4a368740cfe5 |     
    arc      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/5f8b383bcf36498cd87feeb422b98bd00bf59238 |     
microblazeel |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/5e2ac1f69612be76f718424e81e9e15cd2a33234 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/338b0c4e1b19d49ea893bcb6e26830f7eb6dc531 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/01706bd8f25d3e775d293753832a6991b98d6b87 |     
 aarch64_be  |          systemd-244           | NOK | http://autobuild.buildroot.net/results/c07e4db6cff6087b8325b5a3e29435f5c963d327 |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/39f3efab5a766b2bd220ad72491b440864086280 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6101e831ff2ad8ab0e0fbba4580313bddc4044e5 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/be4b587464d486ae923b4d7dd7324e51180e391e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d4e057d1b0bb8823cab64bd1ddaac61eac5fa75e |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/2602c2ebfd86c12c654837fe633b0d8d47eea170 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/313b681297614752e0288d91d1fd5705dbf4fcf2 |     
    arm      |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/2bde3fa6bb6cda8d81a0b844005f8a7ccc17f202 | ORPH
   x86_64    |      xdg-dbus-proxy-0.1.2      | NOK | http://autobuild.buildroot.net/results/075660f70d984fe18f10ee4674b0e6caa91bfaca |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/5f7fb04eeca1acd98f238c61fc180a6692133e17 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/0ad956f41f56544ba6fabe0038a78909d36810a9 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/1c320080ae7efa61bacd924c123686df8e0e3bc7 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 2 
           host-libselinux-2.8 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/49ff7196e1f346dd8fb867aa5762601ca6ba8a14 | ORPH
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/f80d11cfa2656c1ec14085401787359bbe3fd35a | ORPH
  powerpc    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/ae2374bbebbbe020b8ffb74ab699688c4793cbbf |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/6832a7cb3df6addd847519bf90aa8764e83b7c12 |     
   x86_64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/c43f410c0c9000fb0df907a301a95190717802c0 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                libgdiplus-5.6 | 1 
                     squid-4.8 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/6fa76777ad3295dcf9ef242d47e74837db14408b |     
    or1k     |           squid-4.8            | NOK | http://autobuild.buildroot.net/results/28e8cbb7bc9dea6bba435a152fc37d09a26a1fe5 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6552ea39e2350fffd47c89ca4f7b72db430e2352 |     



-- 
http://autobuild.buildroot.net
