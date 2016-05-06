From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  6 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-05
Message-ID: <20160506063023.4D6FA1017D7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-05
===============================

        success : 164
       failures : 49 
       timeouts : 1  
          TOTAL : 214

Classification of failures by reason
====================================

                    mpv-0.17.0 | 12
android-tools-4.2.2+git2013... | 4 
                   mplayer-1.2 | 3 
       openpgm-release-5-2-122 | 3 
                 lvm2-2.02.152 | 2 
                  ffmpeg-2.8.6 | 2 
          php-geoip-legal-info | 2 
liquid-dsp-df5a459fa05dba41... | 2 
  toolchain-external-undefined | 2 
glmark2-499aa81a68fb4c8aac1... | 1 
                openssl-1.0.2h | 1 
iputils-3a86a2542c6fe29413c... | 1 
                    ruby-2.3.1 | 1 
                    pppd-2.4.7 | 1 
                flannel-v0.5.5 | 1 
                   taskd-1.1.0 | 1 
                 libdrm-2.4.68 | 1 
                 opencv3-3.1.0 | 1 
                    ustr-1.0.4 | 1 
                 mesa3d-11.2.1 | 1 
                   assimp-v3.2 | 1 
                 jack2-v1.9.10 | 1 
                   erlang-18.3 | 1 
make[4]: *** wait: No child... | 1 
        lttng-babeltrace-1.2.4 | 1 
                    mosh-1.2.5 | 1 
                   nginx-1.8.1 | 1 

Detail of failures
===================

       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/978a7da0a4fb4a9648ba6f0929b95650d28790d3/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/52f10bef03ae5bd0ee278804b5b4e8bd762b2e51/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a14b9aa46019e2a188d3d23544489d495868bb79/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f35573b3bb2afcfc93d00333d383dbbc61a2f992/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/da7d28f96d65a8c5e2ae3dc4f793ae526520d299/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/1abb8d1e789e630d1f030ebd4b9c91b953b32f17/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/996140bac8d8682f9af1ad6d18649e5682c03822/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/3297fdeb18f0d64b4642b4f6dc50884f495e1782/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/622c2ab174917a012f753a7007caa0844648e302/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/5667b994db0e81fc9745dea91b8ebc683634b642/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/9bea04ae229720493655cf474ed0958aa44b1d1b/
         sh4 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2ed65c2a52b6d65695e3a060a4b43182636ac4b5/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/15c6f348c9b0b6d9f3e14f151ecb420fa7f6d96c/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/458e9c5e8a399d4b91d5cd91aeab6edc09638450/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/7fc3936440552bb59ed7012f22159a0e4a802df7/
    mips64el |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/b6f0f4a0c2be3848d913bea76bd37cc04f415e62/
      x86_64 |                  lvm2-2.02.152 | NOK | http://autobuild.buildroot.net/results/63103b0267dcde0235859a29d9964d08e3aef5f3/
      x86_64 |                  lvm2-2.02.152 | NOK | http://autobuild.buildroot.net/results/243bee959ed7f2a849f386cc0eeb26f9d5460cfb/
microblazeel | make[4]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/3b8c98f5a86c448e4f35d1bf77c4133596bed767/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/b4a288a4b9f77f3714b5e1a67fe7f60191dffb4a/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/70cb7b7ee6dce139048ea1cd4b543dfbbc798ef2/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/04582963e330ca4271c7d3f35181280715bea847/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ecb26f49c5910ca99a97ca194d8849d7c545024d/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/91bca95a3ba422d78cb38a2c50309bc471ebc15d/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/ddbbdeea894e13f742f041d284a6cb958eb8c7a0/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/f2af77a5f6dd2ef6e2d29cb3a87baa9122de66ce/
        sh4a |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/cf0c228ebbf4c0163a487c9182e5434a7c007981/
      xtensa |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/ebba210920f003a573d620593b9c3da90d62a555/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/e267984c70f5762e71b24e90be4d84bd2445ba0f/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/6677776f699c0c9dfb30b2923c5d7fab2cedcab0/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/061cf0ef5874f787a167a0867080c337181d36eb/
      xtensa |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/5dc6ef0ba7d3ac8a09708f6092ed2b2fb6ac8e0b/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/9d8f827cd6f78aa094227c28931b97f4914d5b3d/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/b24a60b390caaa5c490e8c42a6fefb2cb4840a84/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/fe01e913c39820ca08241f694826b8b6164dafb4/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/0c0ad4c83f32c205442bd240e4fc2c2f3265b118/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/eb47af0c8df6fae82859865fb8b9912f45960444/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/9b425d6355d0f17732dee100fa333629b5e9a155/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/360b1e255e29e6b3c79a8080baa3e755864f83ce/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/e6782a9471621af8ebf336bd216d65b7c4cc1572/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/0d0ef36071fc4e36aa59549d0080bc26c3249be6/
     aarch64 |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/ffc5dc84cbc4ce3843c27bdd78e5fc50f27dfe51/
     powerpc |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/a649f2aa6be555ea4e10b985a31487aa2da17be9/
         arm |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/0e5adc367c42207bf0d5e51f280d2b468b5db22c/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/141960214a20f06ab1e1db5c6c9160cdf1fa641e/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/a06d9c2ed3818372dc1417702c9a28f2bdac098a/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/121aa15235e06c80d65428626da5a2da9d11c9ba/
        mips |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/4e02688f5244f41fd66db86e9c70d5a5a05aac5c/
       nios2 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/93499f9ff07231b38b67e2256ea059ca03ae99c8/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/7488735f8a424af56dbe63b0c4d9ad05eabff693/


-- 
http://autobuild.buildroot.net
