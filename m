From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Jan 2017 08:29:42 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-06
Message-ID: <20170107072942.59852207D9@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-06
================================

      successes : 147
       failures : 94 
       timeouts : 2  
          TOTAL : 243

Classification of failures by reason
====================================

                collectd-5.7.0 | 19
               libglib2-2.50.2 | 16
                      mpd-0.20 | 11
               sdl2_ttf-2.0.14 | 10
                 gnutls-3.4.17 | 4 
                 libnss-3.27.1 | 3 
             lttng-tools-2.9.0 | 3 
             berkeleydb-5.3.28 | 2 
             host-nodejs-6.9.2 | 2 
                 libpng-1.6.28 | 2 
           linux-headers-4.9.1 | 2 
             rabbitmq-c-v0.8.0 | 2 
        riemann-c-client-1.9.1 | 2 
                  fbterm-1.7.0 | 1 
                  ffmpeg-3.2.2 | 1 
                    flac-1.3.2 | 1 
                harfbuzz-1.4.0 | 1 
                 ibrdtnd-1.0.1 | 1 
                  lcdapi-v0.10 | 1 
             libsidplay2-2.1.1 | 1 
                  libsvg-0.1.4 | 1 
        lttng-babeltrace-1.5.0 | 1 
            lttng-libust-2.9.0 | 1 
                 mplayer-1.3.0 | 1 
                 openssh-7.4p1 | 1 
                openssl-1.0.2j | 1 
       opentyrian-9c9f0ec3532b | 1 
              python-click-6.6 | 1 
                    qemu-2.7.0 | 1 
                   slang-2.3.0 | 1 
                  stunnel-5.36 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/04d82012034e065e1a3e57a687d44c0b7b4d67eb
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4e341fde84731bbc09b419a5f679b6b02530de6e
   powerpc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/308c495851d6bebab6f841a78710f0a56ec49ac0
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7c0ad021c0d5e32d48cf699040d926e3d6bee369
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0e524b0a0c4654bc5b43414ad6d9d720f9cac537
   powerpc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f96afefaf2ef75362254357fdb66583bb95210f6
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/431359c3d2af782532db7d070e7a0bf494cde083
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/954edb14e01bc203526d17b7f44c9048e5d387d0
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/915eeb53d7385fba0de96289a5a5a1d387df43de
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/cb4b02bb6353a34ec2ca6d58e7852ad67c285a1c
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/41e9ed39886df609bbf20f24141a887442089962
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/93906e2cc1f5f37b0019c6e6c2df410ce812daf0
   powerpc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/30d56d6ba63ca598ac489d633156e336d4f94410
         sh4 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c3cbe8dbf681526f2db88841402358b0ae276070
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/34fa5657c4c4032fcfc18f81d811a12889a31e7d
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/698aff68b20f9c75728dac53c67bfd4803e35304
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/057e7157f50e80911bb888f262122adeb27bc2bb
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d3e33f96a65bd655d9a68306f430519bf2d8ed9d
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4d9e3fad4e22abe7f00fcc5ebe1b7a9adfc15116
        m68k |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/577790f0e79e891f69e4440014c4117bd35d1ff7
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0048c8e5fafe443527a723f7eaaaa54b1a1f9148
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/43750601bd0ccf538fe28a993e0ad0c7cf7e9b63
         arm |                   ffmpeg-3.2.2 | NOK | http://autobuild.buildroot.net/results/11a7d5b2ca7bbcff81070d0c9a0bf9f4a526d843
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/4a3aaaecf144f09784f8314c4fe7b6dc6b8fda28
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/22354cd510639ec949785a9b5ae820614b77d769
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/4add34b08ce8981a7642c6744af5344ec2e1f52c
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/81b322318d29e1db5e93e6196c30c0eb7c067c51
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/6ba9a86439bd6b53c0af32c56d9adb2b9be43ca4
         arm |                 harfbuzz-1.4.0 | NOK | http://autobuild.buildroot.net/results/95be2048a44661e2c28ab396b0579b8dcf30645e
         arm |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/f32693110cf8a14586088a78ff0f0264b04870da
        i686 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/5ac5fac323e57bbfd89059fd406fcbc65e664199
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/492c37628888a53222616a9f936660ae5b63fd87
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/3d7c4d24f38712d340d9885655b538830c56883b
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/9c355602bdeed2bca2b2a54e0fe79549952badc0
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/1478957f693e517a239071692b172281ffa23233
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d11049a01b69cdf6fab747f883d4714cba72da57
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d945ef38501288b9f7a13963b342ebf0c1cd93b3
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/b26b015b61960a240d998a7568192fceb1ce34bd
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/115f68060dfdfc1c20ca5f8f2b131f28492a1955
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/c5dbc0b37b9d375482556f8bf0805e22e80eb619
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/1463471f3a077e2a5fde6cb0d42c095d91e50c15
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/a995884a9b71569353e2cd20ae375f4a96b97a2e
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/522add4e11f72558f6a28b84ff96390c681bd00c
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/960c33574c8aceafe8d3de81e55b3069d576e8b6
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/4cdde7f5f9c6652bcad9914cb1a9e35366a8abfa
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/1d5ddcf5819f7be5a45446a869328d399b3c6233
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/b40daa0f29bacf5934a05f761c08d7f3669b0edb
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/98290aa7bce4a1dae720bf10eba21d4b877c835d
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/115b4d8da461384459c11576f5ab71176d00f56d
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/1070d40a7afc1942e5c32f7874485c3d4f3e8d4b
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/c45ea4c82c6c1c4c5c4c5a64e2b86ca379e88dbd
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/735001913bd11df6dc2acd55c383ce39a86531fe
         arm |                  libpng-1.6.28 | NOK | http://autobuild.buildroot.net/results/4c0567f638cffe4a5a8edf69dc05098a9194be25
         arm |                  libpng-1.6.28 | NOK | http://autobuild.buildroot.net/results/dc20ee92d5d5650dab63d85db6beae394906bd04
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/06940d906182888a4383bb8bf77b4ee475b4a8ea
   powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/5c7f6b3a3cc78a016e50b5d5b4af621d542f1f38
         arm |            linux-headers-4.9.1 | NOK | http://autobuild.buildroot.net/results/0d849469e3ecc4f03ca776bd07f2b2a2fee7fa7d
         arc |            linux-headers-4.9.1 | NOK | http://autobuild.buildroot.net/results/c7b687c4a010a9b1ff6dac82d2be4483c0d5cdc2
      mipsel |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/d328415e9598239d2939f8a085ea6bfd447647c8
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/fe81900bcdb6096a38ad78c4a55977fde921c372
      x86_64 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/a7e12127c2b3181efa420303054ebe2799785122
     powerpc |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/cf798953b9e5ff9c6dfd53f0c8c41631f9c692ef
         arm |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/71f73eca92f3ad2ae49f07c57ca95bdc798ce8f6
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/1649370a5e39747ccf4d06b634737ca0d74a9393
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/3709180774868d5996abd17440c4c0c1d325e292
         sh4 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/83e19ddc71c5aa84d68634c96ae4c5d6c2404802
        mips |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/8cc92fa9c91af4dcdb46436510e670300934ae9d
    mips64el |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/059f97287764e38aff3da7d66b89e87bb8e9d799
      xtensa |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/8fbfd916dfdef3b59cbac94d37e16fc77b09ce49
        i686 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/f0d0d064f1443c251b3981d39d6aaf186014ecd8
       nios2 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/4b30c55cd33c3d91a8e13db16944014cc327098e
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/8e7545e6d484dc09ad0314f62d5969cc50af4be3
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/419a302555ff8a72bd263179aa42bef0cf45fb5f
       nios2 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/40a867882466bb7e2fac3215964f3537be268eff
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0ae05e80815696e62a290d4465e8f4f5e017cbe4
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/6c5e8e1c79a788e27ebebef2ca0f8f66ac8fd361
      x86_64 |                 openssl-1.0.2j | TIM | http://autobuild.buildroot.net/results/43d5a269d703479a75884028a3e455d6cdf8735b
         arm |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/825319664974aa11e17a0c19fc57dea18dbb96c2
    mips64el |               python-click-6.6 | TIM | http://autobuild.buildroot.net/results/781590e1c4c165cefbbe0063e51abcf9dc0bd136
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/89db372944bf60f917c3359c8a2a58ba1278db6e
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/51d36f166a8cb83f12c6ddfd5f957d931430b65d
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/85431e61ea66ebd49b06af87858380e003a20f73
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/b5a917059c9ec5af20d7a285ab358d1539e05818
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/e415b3ea8328f3ed354442e86ac500a4112df468
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/e33553dac01de9bde8e0944bbfbf30c06df04638
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/902ff56bbe1a224f7ce977a16531b3e1fee80ccc
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9cfd18ea737b58047b83ac818c964d54c2bf2edb
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f631d0b39b0f013250907f80c6186a46e2a91f35
       sparc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/c956c316a99a0880da6e9d04a7261497116f158b
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/23a84f3158dab9937a0f069eb443e88acf4c1fd1
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/267ef6a3c29b453fd5961a0cdaff76be94cdf0ac
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/b14b49fba660c9880ca3dc10dbdce7dafd17faba
 powerpc64le |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a073dce530d4e06dbcb452a1493e615ec5cc606c
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2076cbbbaee1ff90469422cbd5ffe5127db11505
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/9601ce7d8494865257834e86d0a28530f2b70c6b
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/5cf9f30025161ec381c77a0c696e597a430d08fa

-- 
http://autobuild.buildroot.net
