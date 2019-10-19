From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Oct 2019 06:17:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-18
Message-ID: <20191019061739.395A2876A5@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 32  |  2  |  0  | 34  |
  2019.08.x  | 34  |  4  |  0  | 38  |
    master   | 41  | 331 |  0  | 372 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-libglib2-2.62.0 | 214
                libselinux-2.9 | 50
                libdrm-2.4.100 | 17
                    bird-2.0.7 | 8 
                 jsoncpp-1.9.1 | 8 
                   dav1d-0.4.0 | 4 
              iputils-20190709 | 4 
                    brltty-6.0 | 3 
         docker-compose-1.20.1 | 3 
           host-libselinux-2.9 | 3 
                glorytun-0.2.2 | 2 
                 host-icu-64-2 | 2 
             libmpdclient-2.16 | 2 
             subversion-1.9.12 | 2 
                  boost-1.71.0 | 1 
                 circus-0.15.0 | 1 
                      icu-64-2 | 1 
             libopenssl-1.1.1d | 1 
           libwebsockets-3.2.0 | 1 
                   lrzip-0.631 | 1 
       python-aioblescan-0.2.4 | 1 
           python-aiodns-2.0.0 | 1 
                   systemd-241 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/5bd6b47b573140839f8a61a80b6408d05a173a97 |     
    i586     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/bfedd08885a2a3f277d707a81971733eee6e7a2f |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/1fe32991c24e9398a1ceddeabcb8e869e47e6457 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/0c453d7e630667521b7e0d9f101f849a19ba7c93 |     
   mipsel    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/cb52cf5e321ba98b7806b9d1e56c0dc5456a5ec4 |     
  mips64el   |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/046ce379cbbc897ff264ca85af18285006e76a58 |     
   xtensa    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/c686702f075d860647a91369a303e6d3a104233c |     
   sparc     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/c03216542b5b2e32a49e1d2060d9fbf68e7b2304 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/7b8a3a152b8bd9cb073cfcd218a84c6863a1d67c |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/db8a46b6180a97fb3258be772e7fcfdbbadd6324 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e2ab104e2850ec9247ead5895f773a502a43f556 |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5761b5de5c6629459bd01993bb9ce9f4028d4a90 |     
    arm      |         circus-0.15.0          | NOK | http://autobuild.buildroot.net/results/effb052779ad5c32a29a92e4be48c9c5768fcaef |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/017c7ec96a269b891f9828f49cfc8fca0a2423b2 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/3596108585d9f7169554b9684a624d39a1ea7fb7 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/a0e2e184de5eea719338857f5ac4f20e48c4c453 |     
  sparc64    |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/70117422fadde738bc1531558f7b9a4c9e24af3f |     
  riscv64    |     docker-compose-1.20.1      | NOK | http://autobuild.buildroot.net/results/30648df472d86529be2ba0a0f91d6eb797f90d97 |     
  sparc64    |     docker-compose-1.20.1      | NOK | http://autobuild.buildroot.net/results/9ac2ddb515e0c7a5803abca96e1b34734aeaee27 |     
    sh4      |     docker-compose-1.20.1      | NOK | http://autobuild.buildroot.net/results/8823e463844769a87783f4b913f17e741cc771db |     
    arm      |         glorytun-0.2.2         | NOK | http://autobuild.buildroot.net/results/599c41af17be8ec5272a86469713c5123c07b3fc |     
    arm      |         glorytun-0.2.2         | NOK | http://autobuild.buildroot.net/results/0113dd2243015521b95117465c2352c3fda5e9a2 |     
    i586     |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/716b8a313d1c29b21439495f25474c10e4ed9665 | ORPH
    mips     |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/c4d9fceef8c9c7dddb7da241d2589f365c648de9 | ORPH
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0810ce9546bdb7f4e3189a2e943a3b3ddba7f2e3 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/53a1342f1f31f18a9eb791ca0b93fbe6c09eb6ce |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5a2639aff9a234e974f04c16d828740bb61a8466 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/331e91a3da52204f34321461da26dc7b273391bb |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/452128ef8964a1c9c0e4e4a2cd3baf5aaca040e2 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4cc931504832f5a77884a664db7270715aff653d |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9a710bb7f5ca6a9d6c5071c735cbd25c2a14f687 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/67a02481e1fd79c2b8a0cc9b29bbb8fc3a91b1db |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6ff1e521648e082196ee498a8753d73167a63636 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/99db8b99ffb8c724bfe6711e65c4856a167d60eb |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/de24ca0f20082f2b210f5a9d38ea0f5b55a639ba |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3b49cc9b9995e1e5b157837d2208331dd82a7d00 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3cb7f180ce6272bd06ba4d576eda2f262645741f |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9a13193e3721ab1f659480de7f8265f7c0ad1ab3 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d30a9c42619489153f5ef13367622c9134e92500 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b55af642b41ca0a9bc93f31ed3f5e973e059d2a0 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a0bc97396e3a68f12348d1a86d743ec8afb1e139 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9b13876e8125c05c489cdeefeb30dba40211ff78 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5f7265672866c2def1aa8f4ecc99f3e945416b6f |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e3f73a9a77f2bdc8d0c9bd361a65f55a58170346 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ea1467804eca73c4a577f9f2b66895258c88f2e4 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5ff42df42cf682a7e0f89cd2a2d1fa7f72eebe33 |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c55beced8c96dda0ff3f9a612f3ea4e1d764d352 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bd71be01d03c63d628aa3c1c0d1149613932cc12 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/15a9f50902bc50cb4c8797b0614872dafb68a696 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/667cccc230f66782be394be37774d2add9e724b5 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4c04c5ac9f7a133b31d466e6a6214340c4209f19 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b87a6d941957b73b1332c6c3c1b9113a0f37a5eb |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7b6b41ca7be434b4f244de3aea3031d93c89bb19 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8114d75dd28dd139d0438f48aba47bb1a717071f |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c5f297cc309854a972cccf28af78cbb7cd76669c |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/79bbcb4ad0edfc67a9a1fea87ca2f84f6fb7835b |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4d41332a9390f60860f192903004b729a4130bca |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1fed33ba68add87da94fb2411c5acca488b627ef |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/85f87927df9131cf2393a698ff1f50cfad0da05a |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0d5adbb6d7a959c6f74312e3696490922e38040f |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8ac22cac40dc43abf7e431e5b9543e97abcfddee |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/43f0b334109dd0f9e07378757cdf23f95c01c417 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7488b2bad86508ff3bf52d1dc7d3dc42ab0ae2bc |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/db31681d585aa1baec2c98e56bdeaa5906f889c6 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/029b83c7c3f0c0ce8129c9597401b1daf69945ed |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fefe5d59f5fccece26ca58b0054fc03327c27569 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ae2b2d765a5d8bea12b161f91d3fd42b8c6b24df |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5abc57c98d88c573dc8d7620d7687cf50dbb56b1 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/163f0bfb07d48e04c693b9100bc4a17961b60581 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/589f1233186374d204f2a974c013af1994d279d9 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0e4fb5424f9a39b3e21d82e63d15fbfe68e6752a |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2b9e698200562fe799dc253e6d2ecf840e743a2e |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/de600ee9cdada13f87b52dccdd6b9d1acfc3b93e |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/58116e176b288fde610d98d6fe1d84b47ee89361 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2db4e8bffaa9384bffac8fe0af396de91ecf068a |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e410339d8b0073141ab500540e13c9126f122cf8 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/343b216ce77c07bab50de0840cf3e2a8be8e1e0b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fc1d22944ca6d32c5b0510f77fb9382e2e313100 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/360f81364d48e795c95db886835f81112f0060b5 |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bf08d19dc0c6326443291a80784f544e23573a5f |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/220d432ffd550df61869396d880fa2b1418ff87d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/247705fa71eb318bc7e1cdbc8ce8c9810250a7be |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c2c1789a6cf3bdf0a8cdd99cc8952e8e6afac535 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c5a30ea3eb013e9db99d7fe20c705f36c8135170 |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7dbf03cb623373db4e164cfc118dccddfca5bd53 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6a5aebd5759cdf1dcd9da8dd2fb556b0b36a5e16 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1c023b555670e0ca1c19cb0f5ecc4a1065b02b92 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/388dea5db88a6162662515ef0019de81b46bccc7 |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/cb9d24e8cab4255aac3f5de611e749799b86c2a5 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/eaa2ba89765abafdab00d6e6eb2b15f4c394e84b |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/462bb4a4f9278b7c19c242e703f53fe4a28e7ecd |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ddcfc25ad476a3bbb5183ab318804e7d70607446 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f6367612df7992ca942b6974dde710d8637eda96 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ee33644669d6956e9a1ef0e8516407a0d5821bc7 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/871baf5cce49271c33cbea56503cc75924c05c76 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b257f6c92ce9697d077f61979786883e4190b468 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2fba3cf6f6b6d650c82ac9155c5a8b58bc633056 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9fd5454f216a920cc8783b2bedf29a9537436f30 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c6e98ffadbfb98600c516303455679188576fafc |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f4cc1bb0395d3f8914758806e2c395af0713d7b3 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8ca0fb983d9a6b848701253219927b0eb3c88f30 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/94fb062880f366e02e13ea5a3fec192aeff7e7fc |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b16c088c607a4e2fa7ae3d23123c3165a49f22ca |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a0fe7ac45420ccc14415d144d42c531b422943df |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/55246172db09d783feb97f98a687acb8bfbe3c14 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/563bf52d3dec18c9de83fc2379c2f23cedb9a94d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8b28724c510db58a97f80eff3e99e84a603f1e59 |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6a56e6ac4f356fdfe3abab9298c793e8d2d6fd45 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/89e3112b2b5a9801303298862753a59b88c562e4 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/97b4e6e7190f04193bbff5689a78b18d7fe2f8c3 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d1f3fbe6cd1ff9da537871c076210ce2b4bf6500 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8e409970947a45ac4aa2d0958c8bc46ad684d9b8 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c8dcb0a0d62a09268ad4a6f9c5a10618df74809b |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b4e91abcb699d4ad1fbaedb19932a8eae807cb5c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/330acfa0fdbbfa20a19aaea46c3b2709e14d4189 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b4c85bfaaa15fd8490c5279b91542923b6ae04f0 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/228e9fc41b340a8261f4ab5acbe2e3a32904728a |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2dc92547156db30d06471c792b49120e80e86a22 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1b6196dbb5039b8e53bb7628a6e59eab32c47cbf |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5868b7b3eade2669c067882446175193917e8e13 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8d5a7bafca1a46d09d8daf10b64a5fabee78530e |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5c1f73e293d473f6dadc1999986da30848b9488d |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ff2d4a9920f6922e19a6e37284157bf5cc608089 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bcd39a742b291e26fb89f77f450dc0e787c7fa1e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5607dc7479efc77a6682c6dde64df1a676b53447 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1371e5c362d872586e5c0e4438faf051f58092c5 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a64060d15c9c1c1ed0bbc7616297b200822b2f55 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/83b1a9e5b5e54e9773f45784d621846a57e8fbd0 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e7af9f6748007ed814d8412a75af616784d507a6 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/818bc2838a12cdd69d4ef06446d8f9676202b488 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/586a714551147cb712ec7ad711e26126fcbb4114 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2553a5793d94dbfa8b5935aff9e295cecc1eb4fd |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c5276e96d78ff50b6a413afac0faa2de9de5296b |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ec915c62906dfbee81f79f7845be26dc798602dd |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9e6567dacbea84fa88df54ac660512b346d78269 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/da078083c575775d4e71a8639563d74a9266b078 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3df8906628e2e8d0ecebceb43ff9517ca95194ad |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a3e5d48e38868127cf95af5e1d7f3ef3cf2182f1 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d8c733237ecb76d5d0382621172902bac9e58ffe |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/645473e18f21c7b570b72067f89d820f05368905 |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ea30ea6bd8e17d02c567b8237370a3392c923be2 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c29279faad048d66383157581941db79364d1930 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ab710f1f23c1002ce9cc5ff15d5b916ca8ac80a8 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/44d5bee7a781a8b9697b0d0a315fd143535b4e4a |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/23e3a19db9415e8e03c6c7a8be17d919f129cae9 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6c36332e24dbc35fe158813ace4561aaf4da8dd7 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e1c835fbcaa74f09900ca0861a590abaf3c7e2e5 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4cf391963447325a83b560e489c38ac62f127045 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/06b2cf9fdca1b61a2b47c736029227f31e9949c1 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/88a2657f9a5999991db8017f6ff3dd1c7c46758f |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b3af833f6c68d6510afbbce13e30a35059962b06 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b1e4ad950f14d0e672f361c1238d020ff6235792 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/15be7871b5e2b995c38cb3081e3d971bd663756b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/646e115b10d5abb97ba434abc1d812fcdd7a0457 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4476a856e040c56916672591921027b88924bde0 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/98140b1adb31c0fcaf3e2158adfb67691870b4ed |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/352619954e6a83e02ca8647fe04be95e82206acc |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b19aca478cc2192201fa45428aada9f86992965b |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d8514e7a8181ff65b8453079d2eaea45c17f4c21 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6531f2ac6d671daf97c020fb893e39fe9c2d0064 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b0fc07badfe5893d0e93ac181bd66492d479578b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9535e1a55fac83938d02a0cea61e78d17af13b13 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6b87c6f008870f752eb5fde266a956c9168afbe8 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/daad3f03fa88fde35153419118c3b061cc249355 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3063ea0ef3a503164d4fbca66cc7c801a765a450 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5ccac42592b1ee527eb4633215bd10d4c45770bb |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2859feb43c4a92d80731f14c80a0d5ecf6246c40 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/31268d77b7a49f98fb9fb8458f21163938ac3fc5 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4de88ee26ba6f5d806d593554a1502420fe4b3f7 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d7f54f87511ac428b2b7f8d56590c7db933362e5 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a00e274e88d055915e619027f97d642338e2fda5 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7e45acd9dd614cd96c95613906566371cc7bae37 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/195d78593426571f7367f0afe0b658380535bcf3 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bdf3c98c8e4aac5b54479a4a66b4384b4ec3c176 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6d1895384f5c2a20191704cff7bc2d227824a326 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c33ec68bb68c4a2d57eccfa009eee259ba0fc2dd |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a1d91cdb59d46e0c6191e2cdfcd8d797b39d42f2 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0635dcc1ddaafd33960a89b6a79c53728299cfa8 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8ad9376dec0ea62ea5260df12d41eed43966ca87 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/72cda7f68b874d5119d7331efea600034d0516f2 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1e6171cd099497577eab879800da7b359b727265 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8c042925032b6f98dda0faedf40281d866d01aed |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/43bf0ce2070b95266d3da63b676efeea214b8aba |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e7bd1abe2ab60a8bcde8bf37555e9a614d92c424 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f585cb1f05ed8fe4ac5264bfe2195f110376e29d |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8ec3bcd3b24d8078d80972f6fd40ed2bb68571d1 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0b8bce50c4e4a36db9dd848e76582363eb11b3ef |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3b37dddc6b6134a37bd03d48c5ce84109e714c32 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c1ab7e501226123c0da526fd4f27913b1ab3ec39 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fda2cdfada9aea47cc27340cfafe2ce5143a24b0 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/160d65d597d37123460e5cb29016ba16997602d0 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3771fcfe51f4a446299f0040ae1c3d9477d86afd |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a6c97f3c3e02c3c4294179f72f323059d43c33f0 |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f43699faa17ddf8a6cd6907d9bf8ba99d64cbc14 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7f338a7f1217e9653df976feabcc6a680ecd53d2 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/032d6dd26a344f16e737b174c91393ef48f86a59 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3a2dfa245a462f80ca1abcb70be268d263cebd62 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1574f016ee37a8452b85b4099b92fa24834aecad |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2118d06d6a2272abd07e5840d27bbfaf967636b3 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/23026986f13f31f5a79936ea67c9f9477035e902 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/06982af8114aff1482b5f8fd12d65c8cf3c94b4e |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fd0d0a3779c5b21546eb17762891a556ab643ad4 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/42dc7fa13018a5a90674d0f333ca7b58b63c202c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/76be43c48932a659a4f78490a4c70fe26c17490a |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fed624cad74122bb4eca624a1266f5c649d4e317 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/533bd9261d475b15371700f72b0153f104fce40e |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/daf706ad36691a257938361cfd178ade2cbc47c3 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/228c00bc64e099a581ce15356c14f90f657d3a56 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5659ef91992053b8bac10848f2178c81f0783aa7 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/383ef0295a2c8198991d687239f1f3e6c4ebb58f |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d67dd83535fa6a531dcadde0ae45d72bf8111a83 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d193e930d4d88496b14de353a94aa7a2149afd1f |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6544ee3501f89ffb39f979fe815046dfeaae2d4a |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c8b89cc4997d578f00dd524e8e25327784dd051c |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/797bcba847926b3172d427d9ab34042a60ea785f |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bbd599649e2b21c33d0a0a3658355d224b116423 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/eeb0170959ed39c54edea4bcc2136277aebc38f2 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0af5b4954e4ea993990b179f792621bc28418b20 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/410ea4218d67da23f0e029d804be12dc4b483a7e |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ec0c3a0dad28efe4cf91f8b22c130f21f3e02af5 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a4a8760cb9666a383630810dc1b208b705ed776d |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/46f32434d66c4a453b284c665d479c354c3cb657 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c504d67d82d4115d6bb8d44f2f57e74874af2f54 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7f41cbc0aab2247204b28a908470f2ff364299b6 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ca9d7e4c99564844237442e0a044d3d13156773d |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/749d0cd62d4a8dac0972161127473a51b4823c24 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/092aa7d6e29f563687296c78362361a9e482d391 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/de4747dd9b8ff3d10ce896040b84c0242bc5616e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e319d76c86797fdf60ed92091caf0ea78356d922 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/44ed4158d0f209a519ac97037566eaf09543a2ae |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f5e1572d7277cf5a2580582701203f04a88ee29e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/329048f54911f190a3203976379d6586e560c854 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/396d5b361195486989ea3a2a955f175f3b190b42 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b67d71a67aa53db9b595f0274a1f92abc6f34d78 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/31a6467b66c62c11f3f5d9cfc70dde8a241c4aba |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d64ccb5f431bdd746b5017e448918b13dcb674b0 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/74af6dedd4116970a5082e505395081354973c6f |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5507f08b5265808e01d673b535269d4ded893d8b |     
    sh4      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/f98fe4ca54a8e504ca563410631388dc1c379d4d |     
  riscv64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/c2941db70e72460309d2ebbb2da6a83f948d7f70 |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/6b2478345fcf9d9bd2e68ef91c9c61ad5a50e48e |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/631d8e443492a3dac980361f47da1d3ecf812bdb | ORPH
  powerpc    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/58b4e2cea32f9423874a8c74103ccd71b1888739 |     
  nds32le    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/bd99f18af94f9f092de5fa560fec0e5f31d0a4f2 |     
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/7fe0ffb1f9e3b8c0c91ef7c0acb230281b923095 |     
   x86_64    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/786a177e136698d9eb806991de5a373715648799 |     
  powerpc    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/e3ca828d546c230b3d4bb95b12a0f1881c0ebb1b |     
  powerpc    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/6a6b0e7f1026c34293800f8fa80776430d9c12ab |     
 powerpc64   |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/401ad9c3337fa2299b31180ce3c7fe90b328041d |     
  mips64el   |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/2a5f5799c5dd5d16e782dbba096a9a02570d35ae |     
  mips64el   |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/44884e222fd0aff9ee3ec50d525fe4f6810deed2 |     
   nios2     |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/5b68df4d9fc405f37cfc2d6833f74ef257a3fed2 |     
    arm      |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/63072fc7281de5f58f2d3fcb5df1d6c81acc97a5 |     
   nios2     |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/4e131a04014f7e6cb376dd21330a0c56fd5c25f2 |     
    m68k     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/2995c6dd05764847a23ccd9e1267c00d0024b41b |     
  powerpc    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/605bdc643c45ffa50c50a26d86d7f8eb1572237a |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/bbf7f4f9e33ad262e2f09c76c6b6562b1bf1c791 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/fe4b5cedecf6c56254efcdf8d5308c64dcbd45e5 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/3415f8eabad971c61c5dc98d6ce923cf5d9d4f23 |     
  powerpc    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/216c28e223902be34a6338e5516e66222448480e |     
    m68k     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/01e09dd574dd72d37128b298e0c69257dd89dae4 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/0c616cce275ff3ffdd50f5ac6e5e76bc7f5de018 |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/a541525edd388ed6dbad7820bc639d81340a09f1 |     
microblazeel |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/2ff9a65fce5691af55b0b535f499f8349ce14f78 |     
  nds32le    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/644e044cb7f7f2efafa3f272b570f1840c2f1bd5 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/c199ff7c29a5b1f335aa91b4cd509b64aea31d65 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/7d9b6eb7a941d9d379efb43e4b680e6db1519b1e |     
  mips64el   |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/50da35ab92b1a0e6a8354d7002fa9af6d434fa72 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/4699ac018c469f4f3147feb7db3d32d132eea289 |     
  powerpc    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/a0ef7f98016bff2f7d526841b8734c55cc5defa6 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/72372dcca158f359875f9f6548b16a8888451d0d |     
  powerpc    |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/221b3e9099b7682d704663600269baf7fb7c4323 |     
  powerpc    |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/e7002d9a97cce0f9bbf0ac73f9bcfd773bec7428 |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/61270356728539a517f892e2990dc5f3b571e6c0 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a8285e41ce888bcf761ae4035b53de608a0498a4 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fe885a53d7ba458250482d281440aade08feab40 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/351bc2560b908360a0b2ab44bba1608d887049df |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2f856a72428a25644026ea236220e48fc7c6c747 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/22958a3128b854d8550ae8cbbb15bd2605b1c1fb |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4c4701ee9357f5b5adeb44085d94b71489eb44ac |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5dc37e8046583d17397041c57ecd628a1459eddb |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dbb99ef750ba72ca6f332fcc7318b723c84e0256 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8ecea955f98f3291c982127649b75a70fffd3234 |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e2fa7243f7689cfa10ef02361f05929ec68a06f3 |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/84fe263c26944e65b91ede35f1032c071827cd66 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d2072c450ebb16f0c6e8016435a8b762e1336e25 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/94ae58818db49231c23c4063418fb9c2817efbc6 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9d275795bd4485a4c195f1cbcfc206d1f230ff96 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ecfea7257a6321989c2fffc9c17a89ed6661e953 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/db9a99c6dd0fc755a78467cb284487eb33e8126e |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d21652d70bc8263e9c7e22579c466bbac4318fa4 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7ec933ee4f6a16ca359820d34e413ac62082b22f |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2300086dc6b37b40ee41e10bcadf45f89edae592 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2a7b482dfa694cca4d0fdbf3eb7bca8cccd81fb3 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fe06f05af4cbe9d0bc435bf4d2635048a2a895bf |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f29d2258c3150d03c71084ff2b333065b81b110f |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2d72443c46b04eb80b0f478fb87104cc0a2cb8d7 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2ef664f1206821a42e3b5424d32dfd2867ae4323 |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/475a786dc5ede9c70f92511930157dd0907dd16d |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9acf1e2254e17706c2d150cb98370b732b5b0325 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a315833916c925a5e95f660f58f6b7c1c74e8607 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1b3f924fafc6334dd735b1689495577c35e08cca |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0909432de4767839c0edb8093ace74ad7ef87727 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2a5667f260f83d82c1229ee21fb2eca9b24bb7af |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4ef871fe09797942d86236b328d0142aef3ee99f |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2f718edb8ce358c58efbb6ae7c529a5d247d00e8 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0a8d8669a401d33e77106ce75d7583e789b890a7 |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/aa825a6e4ba8cf394867ba55abf468074b35eecf |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cdfed8a22e001010becfb7c9f4efdcd17b6123dd |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/316257971ac85dc94902b932558b17508dd1183f |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fd9bc3f1b5ee2070b807a2a4220204faffa4771b |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/76a6df50ed0e09ce2a08e755b4b420dd2002f030 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/826993fcd98318eb53733441917e27e3ab7d5fae |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0d0f022106e0a9284382671228cddb91f6736533 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/56df248c91ceac5346b6bc2620cbab78cfe0930e |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f2bf615ed05467ef60be380a1d52d82f83fa48d0 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6ceef366dfa9fae40e7ff8fda6a808bc26b58233 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/565af7549bf16af91861c2831f60e40bcb7bf9b5 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/86991f1c589f4a1440e2f086076b480e8847e062 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b44aa3731a04fe141fdfca64f1497cc94883a354 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b3a6ea0fae283f7f79ccfc3aac7372c22450b513 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2760f14811dde3c6fd31bcfe4337e11a50fda31c |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c4f5035c5c79e88a80387ded5cd61fc89fd2d91a |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6e63d7f4f3f54794d4b605d2416603ee5e4d55ae |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/a2795356289db19e96069e136cb5b0e5a2f3579b |     
  nds32le    |          lrzip-0.631           | NOK | http://autobuild.buildroot.net/results/6c7b34562bee728fc3b5c1224b6611642c9347df |     
  riscv64    |    python-aioblescan-0.2.4     | NOK | http://autobuild.buildroot.net/results/9007561a26efd6820e79116d7c7c4a32ed207559 |     
 aarch64_be  |      python-aiodns-2.0.0       | NOK | http://autobuild.buildroot.net/results/dffc16da5e7ee2483a7c591e6e9f5061ac873ed9 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/acf2d7a0664ada5c6f34279b58bd2264c4f396ef |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/382170f5dba9253aecb55a9b1eac4df2369abea6 |     
  mips64el   |          systemd-241           | NOK | http://autobuild.buildroot.net/results/fde0f131f7d44af8566cfd1482f468294298e085 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9x5ek_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505489  |      
             at91sam9x5ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505495  |      
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505497  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505501  |      
       atmel_sama5d3_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505506  |      
   atmel_sama5d3_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505512  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505516  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505519  |      
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505533  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505535  |      
        engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505551  |      
                 hifive_unleashed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505603  |      
                   imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505607  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505612  |      
                         lego_ev3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505622  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505625  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505630  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505713  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505715  |      
                qemu_aarch64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505718  |      
               qemu_arm_versatile |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505719  |      
         qemu_arm_versatile_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505720  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505721  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505726  |      
                   qemu_m68k_q800 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505728  |      
            qemu_microblazebe_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505730  |      
            qemu_microblazeel_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505731  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505733  |      
            qemu_mips32r2el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505735  |      
              qemu_mips32r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505736  |      
            qemu_mips32r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505737  |      
                qemu_mips64_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505738  |      
              qemu_mips64el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505739  |      
              qemu_mips64r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505740  |      
            qemu_mips64r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505742  |      
                 qemu_nios2_10m50 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505743  |      
                 qemu_ppc64_e5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505745  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505747  |      
             qemu_ppc64le_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505749  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505750  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505755  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505758  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505760  |      
                qemu_riscv64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505763  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505767  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505770  |      
               qemu_sparc64_sun4u |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505772  |      
                  qemu_sparc_ss10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505776  |      
                         qemu_x86 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505781  |      
                      qemu_x86_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505779  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505797  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505910  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505913  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505914  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505906  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505907  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505908  | ORPH 
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505963  |      
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505966  |      
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505968  |      
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505970  |      
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505973  |      
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505975  |      
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505977  |      
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505979  |      
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505980  |      
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505983  |      
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505985  |      
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505987  |      
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505989  |      
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505993  |      
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324505996  |      
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324506000  |      
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324506004  |      
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324506007  |      
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324506009  |      
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324506012  |      
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324506016  |      
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/324506024  |      




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/5fde1ef310a1b2a02948ceef2ff18164d13e0ea0 |     
 aarch64_be  |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/dafe97193e327ba3ff41b342fd7b603185ec405d |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                  cmocka-1.1.5 | 1 
                  flashrom-1.1 | 1 
                      icu-64-2 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/93c18149fadf4392e59cc9710932d12ebbbb57cf |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/a4db8fc59dd4067327e62ad4daa2dedaf2c86137 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/97c67a4847c9139806b5c393c0845c9c07c1a894 | ORPH
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/bf7b2a1700cef35776d6b3cc61e0a1b68c0c7fdd |     



-- 
http://autobuild.buildroot.net
