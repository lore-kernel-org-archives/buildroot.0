From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Aug 2019 06:16:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-11
Message-ID: <20190812061658.7E800203B2@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 27  |  3  |  0  | 30  |
  2019.05.x  | 11  |  4  |  0  | 15  |
    master   | 189 | 67  |  0  | 256 |
     next    |  8  |  3  |  0  | 11  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 2 
          linux-headers-5.1.16 | 1 
                     pcre-8.42 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-bison-3.0.4        | NOK | http://autobuild.buildroot.net/results/e522c62ea97afc8a4af1f2c8f9b49c5f914c5e50 | ORPH
    m68k     |        host-bison-3.0.4        | NOK | http://autobuild.buildroot.net/results/a6930d1ab5b2c43484c4436d83d7e7f91fb8712a | ORPH
    arm      |      linux-headers-5.1.16      | NOK | http://autobuild.buildroot.net/results/053a4d5b0b7ce1b512d2a0fe0c086f6f57331a5a | ORPH
  sparc64    |           pcre-8.42            | NOK | http://autobuild.buildroot.net/results/86ed97cb60f6e9342f57b8dacbbaccf7113f2868 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  libsepol-2.8 | 1 
                  libssh-0.8.7 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          libsepol-2.8          | NOK | http://autobuild.buildroot.net/results/ae1ff6b267add2725f550a93f1f7c98fa07fc570 |     
   xtensa    |          libssh-0.8.7          | NOK | http://autobuild.buildroot.net/results/a0fa5f3a5bc7e3a0e18f6016dad7d12b2c7dd7f5 |     
 powerpc64   |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/f1b1c6f955b90f985ae9db216c549914e5b9a57a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                mpg123-1.25.11 | 10
                    mpv-0.29.1 | 8 
                harfbuzz-2.5.3 | 5 
           host-harfbuzz-2.5.3 | 4 
           python-numpy-1.16.4 | 4 
                      icu-64-2 | 3 
                 libdrm-2.4.99 | 3 
                  quazip-0.8.1 | 3 
                    ffmpeg-4.2 | 2 
          qt5multimedia-5.12.4 | 2 
                  flashrom-1.1 | 1 
      gst1-plugins-base-1.16.0 | 1 
                     gzip-1.10 | 1 
            host-mfgtools-0.02 | 1 
              host-ninja-1.9.0 | 1 
           host-nodejs-10.15.3 | 1 
          imagemagick-7.0.8-59 | 1 
              iputils-20190709 | 1 
           libfreeimage-3.17.0 | 1 
             libgphoto2-2.5.17 | 1 
               libupnpp-0.17.1 | 1 
             micropython-1.9.4 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.21.11 | 1 
             openjdk-12.0.2+10 | 1 
                 openssh-8.0p1 | 1 
                     pcre-8.43 | 1 
                qt5base-5.12.4 | 1 
               util-linux-2.34 | 1 
                    wampcc-1.6 | 1 
     wireless-regdb-2019.06.03 | 1 
               wireshark-3.0.2 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/cf537963773a57d5a370d7c687d44bc3de3472f4 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/3a28393c52b7eb8948c2da89c7615806435f2b92 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/e332785da8f06c9871f6713f6a94a0004d9302c2 |     
    sh4      |    gst1-plugins-base-1.16.0    | NOK | http://autobuild.buildroot.net/results/100e101b5c6b4823a8038f8a8a52532b4d18e8b3 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/a483a05b2593ab5e4f6aecc52eea13b8d8598724 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/7172702113a5c1bc99886170324a2906523372ba | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/62254772451c8216b1f0ef87c361d0a9f181c3a3 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/9dc624068d9badbb7e834e871731f8586c1036ea | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/dc20182f08f076bdd3d37963274d327c820abbb3 | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/c26b006df7823d1ad609625e0a82aa8f77c8e700 | ORPH
  riscv64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/21f99bf11993acab674baa6dbc62b9c1303f076e | ORPH
   nios2     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/1d15bbd904fe542d466b14086e1178e46cbec884 | ORPH
  aarch64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/1adf87d9a767bf9f5a8bdb7512f5cbcdb26e7369 | ORPH
    arc      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/dd29ea748e5ddce6665deb6dddf5c92ff521701f | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/9022e39a1cfc9e75534f4e8135dadcdd9c508776 |     
    arm      |        host-ninja-1.9.0        | NOK | http://autobuild.buildroot.net/results/f00d60b3d9789d0496d595ee34b3ce48f344fd2e |     
    i586     |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/34bd1d61141a4fb264936d5602bc64dac6c6ed2f |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d2e0d8d31c452ec3595ddbe251bb2b8aed67dcec | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ecbf9b0c8f8bd1813c672469a0833c30843a97da | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7bab6e8ed8c9b6cc9b1df64d1f19394740fb3dad | ORPH
    arc      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/96631d9d2221ef663fd1d40c3fc982fb3a7336ab | ORPH
    sh4      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/ad4d0538b930c808e65802e25ef79edb3fc1849d |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e8d50c4bdc4c7de11e24c6ac703f1fa8076af706 |     
microblazeel |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7871b1e9a8890c11b5054ef87ca5610f85e5e8fe |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/eebbc8ac62915de08be651c2d715db2cd8f99084 |     
  riscv64    |      libfreeimage-3.17.0       | NOK | http://autobuild.buildroot.net/results/403a6249492f05dfe1e639a1913c81d644f593b2 |     
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/14d128c349b0cc9a4053c85624d198ac16afe114 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/3a009042a4e4fe77db2664f6339cb0b690f3d738 |     
    arm      |       micropython-1.9.4        | NOK | http://autobuild.buildroot.net/results/087906ea63875bcea244aa8f1e551aecd8285f65 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/77af6ce7e31319dfaa3b7894ed6bc09b4406ef31 |     
  aarch64    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/30e4fc399949f4b6d214ab3ff0428df128d136d4 |     
  aarch64    |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/d0162c0db01eb13d03a48c1ce3e57d10f0c1660c | ORPH
  mips64el   |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/6ab199e6b59f11729dd7cf821ee19c1e60e8a818 | ORPH
    arm      |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/a70fbd8894bcd02422d40c098420c0c09233c682 | ORPH
  aarch64    |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/755a4c7adc0fd7cfe6d0f94fbbe5f039d56068d6 | ORPH
    m68k     |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/14a6b9035ac3bca7b3c63cce70abece99de726bd | ORPH
  mips64el   |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/67bae5a41500e333b001f0ac9a6bf049df5ed2ce | ORPH
  sparc64    |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/bf906c15199b128f72c09980b2b688f121791f38 | ORPH
   xtensa    |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/454bc42053deb84a73ed75dda99ae9015d23da84 | ORPH
  riscv64    |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/36ceb5fcc74baae13f6c04bdd8df83da00de7c2c | ORPH
    sh4      |         mpg123-1.25.11         | NOK | http://autobuild.buildroot.net/results/0ce126787fb591d74c4a817be50497c251abb941 | ORPH
  riscv32    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/028d0b03156f0141c40c7087fa6409519f3bab56 |     
    arc      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/77cb1f4709df37349d2189e9fe0dd67ed1bb455a |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0d7f0f80f37341acb7e1976e4285dba42fc317ba |     
    mips     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a5067c64c28a8b73cc9e149349a26aaaaeb2d502 |     
    i686     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2302f58cc32c6c4905aae1a8c6860acfde5439fe |     
  aarch64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9e10735566005d9d15a158d969656d1fd63b69ff |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/635d92f6217f64df700b4f0bd78e22ce571937c4 |     
  riscv32    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/27a5de113ef24bd793b8e1af11c18dfdcf30fe54 |     
 powerpc64   |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/bd4cf1b1a1ec3250d0118076065ed8bcd4b142f4 |     
    arm      |         openssh-8.0p1          | NOK | http://autobuild.buildroot.net/results/fb71f2652d8ba66c43ee97b898e39b3cca422bfa | ORPH
  aarch64    |           pcre-8.43            | NOK | http://autobuild.buildroot.net/results/9b9a16ddbd5f30bf0d9ac60fbaaa2c78465dbbe1 | ORPH
    i686     |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/ba9b8182c4471ccd0cfc95a6348f60e79725401e |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/2b19d0bff955cf79ffc0ea720373072e366faef4 |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/cf208d80d3433796c6b44ae04d03cb64fc0a04b2 |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/fe4891697f67114d1470034c56e13d236089fb8d |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/39a0b9227434fd5cab033683f05c66567c648552 |     
    i686     |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/7737455b57b4e2936e6887c7be5e3e191e70248b |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/4886c5bc0066e13d89d73c538f406dedd8e07ffb |     
  powerpc    |          quazip-0.8.1          | NOK | http://autobuild.buildroot.net/results/25b2d6977a84bfb688f509aaa59d8b6441942bc4 |     
    arc      |          quazip-0.8.1          | NOK | http://autobuild.buildroot.net/results/88de693441d5e3456cb657267c5d87fcc1fc7799 |     
   x86_64    |          quazip-0.8.1          | NOK | http://autobuild.buildroot.net/results/b10f866fe8a38e1501529d3792c2cfa1386f013b |     
    arm      |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/b70df12ac7e8c5d951507c326b16ac0615b2024b |     
  riscv64    |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/e38cd9017b2d3e3224431ca9b7c51f3055414daa |     
    arm      |   wireless-regdb-2019.06.03    | NOK | http://autobuild.buildroot.net/results/a7132cf979d2858492931746555e8481a8af537e |     
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/0ee98bcef776a3265c1897261ad8fdc7ebb30b8e | ORPH
    arc      |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/7e279c6ab60cdd3d01685714fe1f4945542cc424 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

domoticz-0f411f781ae4fb4a82... | 1 
              libarchive-3.4.0 | 1 
                sqlite-3290000 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c9531591a17464825ea5ac9f2f792448f6247520 |     
  sparc64    |        libarchive-3.4.0        | NOK | http://autobuild.buildroot.net/results/28094f161dee28a7aa30ce3ff7c7da57cbb1178e | ORPH
    arm      |         sqlite-3290000         | NOK | http://autobuild.buildroot.net/results/673356a33a575124b36f65063e0ff541f69513b4 |     


-- 
http://autobuild.buildroot.net
