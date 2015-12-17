From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-16
Message-ID: <20151217073021.D107F1028EA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-16
===============================

        success : 220
       failures : 114
       timeouts : 0  
          TOTAL : 334

Classification of failures by reason
====================================

                 libass-0.13.0 | 19
                 libeet-1.7.10 | 15
                  boost-1.59.0 | 10
               librsvg-2.40.12 | 10
       python-webpy-legal-info | 6 
                 openal-1.17.1 | 4 
                   libnss-3.21 | 4 
                xfsprogs-4.3.0 | 3 
                    ustr-1.0.4 | 3 
                  ffmpeg-2.8.3 | 3 
            netsniff-ng-v0.5.9 | 2 
                 gnupg2-2.0.29 | 2 
               libcap-ng-0.7.4 | 2 
                   mplayer-1.2 | 2 
                oprofile-1.0.0 | 2 
canfestival-7740ac6fdedc23e... | 2 
             util-linux-2.27.1 | 2 
              gst1-libav-1.6.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
              alsa-utils-1.1.0 | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
                   erlang-17.5 | 1 
             lttng-tools-2.7.0 | 1 
freerdp-17834af7bb378f85a3b... | 1 
            shairport-sync-2.6 | 1 
       python-pyasn-legal-info | 1 
                 mesa3d-11.0.7 | 1 
               arptables-0.0.4 | 1 
                  gamin-0.1.10 | 1 
                    pppd-2.4.7 | 1 
               valgrind-3.11.0 | 1 
             host-nodejs-4.2.3 | 1 
                   ntp-4.2.8p4 | 1 
                pinentry-0.9.4 | 1 
                      pv-1.5.7 | 1 
xdriver_xf86-video-r128-6.1... | 1 
ltrace-c22d359433b333937ee3... | 1 
                rt-tests-v0.89 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                 qt5base-5.5.0 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/dcd4950241512022cc3e69a79f2b5fcffb429f9d/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/b9f99792a2b71a06a0d12681d60ad1b41f1950d0/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/bcff7145be6251ab6cc625e7bb8b3847b885657d/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/fb917ad574d6d898f46f14115df179f3bef50275/
      mipsel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/2f1c9445adda190a66bec526dc590b8a5b5f7181/
    mips64el |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/be8a00b93852d7a618f283a80a43ad9abfca2a2f/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/9f30ffe51fb563ae8dace6c71a310653ffa950b2/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/11753e7f01bc0603edf63cdf716447a1bcb0effc/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d93f7ea85634155973b7f2133e1003d88cf0fd41/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/5461cc1f29eac0571a23a827a0aa632d4868843d/
      mipsel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/f5e29ebe6ff11442053f67ba3aeef441b671f48f/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/172044447123d39039ba70f76e722822992f90aa/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/b317305410f323a210833267d911e2f258d052f9/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/e0ad99f8d683353fea5a5409f5453998d4d7b190/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/c3c3452ac2d94c84f53267c19f8e9277572998b0/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/625049fdbc2c01688ee1a2ba090c65c4f2d0dafa/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/f736efe7716847f045537fb98b123e7cd026111b/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/ae56c099cd32f4b188fdd7652751d3bfd52d8c39/
      x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/548a8c556a9dbb10069f4bdb07759877e6a32fba/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/aafcdfdf8937b5441aede9c4fc9faf6b24a9b121/
      x86_64 |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/8b282f546dc36f4bf9c25721cdf922c7a7ba340b/
         arm |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/dc192255b1fcae18db8b98e65309e5c1493bdbc1/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/1208c8e39cbba4eeb8a8795cae78512691160eb7/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/3653ea365e87635013be99bf2185ceb1fdcb706c/
        i686 |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/ef22c1a106b533f58642520f0bb8d569e4f4ae10/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/415962101e5bc5a356d36445881a6dab1e584545/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/b07556fa1f062a8c3479b31eba8822ead2ad83f8/
       nios2 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/ae2a1e008bf88dc05da38f13e2aec1a97cfea622/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/fe0b81f383abf1a4eb1146c1d26a4b5bc783181c/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d5a93b5a870de748259b097ec0b98b207cfaa303/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/3967c4726cad94975b870e262eec8e63fd5bfacd/
       nios2 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/bbec7043cb97a0bdc60371307f626ee2068e0adb/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/a9fd907b7f47cff03b431ad52fd817e8206c7406/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/565fc07abd9d136c77cc58a9ad56a4ca03927dab/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/8965955fcf5918a0afec8d7296aa048f933721bf/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/6203185c687f0a4d968dd9dbe54f0c782ee8eda7/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/4e65825ddfa3627b5c71cf3ef4a4caa7b6f5d018/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d35dfa0d7ef8bb6e328092485598bec6c3792724/
      x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/6732aece04eeecf8986b1844fa25198d4de14222/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/12df91484f8928409ee0371ca33de4dc89cb87b4/
         arc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/913f572c97f0f5cfc3563bcf4d5a04c6d522312b/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/7f736b43aeed2f4266e473890c92520740a7e33c/
     sparc64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/3ee8d08149d91d7fe5eeed2dff0ace1f40cf1a7b/
        sh4a |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/2c659950649d3227fad516e4e2da40135da7c73c/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/591d9f75b1c9189bd99e6e803c2d44086f850c46/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/73cb3b45515dfa87f0658589604353d9d08b20a7/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/31364791797320d7a27e5063b95e4652e4afd074/
microblazeel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/8dd830157c38d564c3fc2a6a8c682a98eccc50fe/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/0746984531c741cdd52271d753f4f7f7d6d41c6c/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/df66b3018bee7419344b9f8eb9a4720e6a64cdef/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/042a58de8e326b2e1e59733703e41c0133a5fd17/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d833ad82ad7b2c7dfbe812d9f2bb0f1ba981d9b8/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d266bd95283e2f4eb5948b91860d09c0d04805b8/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/200bba3eebbb21ce50a40c18b53f7c8af2fc2779/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/ff68a06dc8df6bd45e9152acfd7c4c41f93c00cd/
        mips |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/6427a76c0b677154c424dacac2274cccffd5de7f/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/2df57285650c17db2c2521505681ecc8f818061c/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/4af75dfdccc9dbfe523ec4c911c3707c830028d6/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/dcee469f1836aca2f48da22f76adfca69a657033/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/590e7d2c34ddad5d5a73c732b48782d3459de0e1/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/44125233a36b56b60fa5e8c86560adf86beff9b1/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/cd23e583df2993e30d9645483bf146c3c79eabd4/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/776946777d6b26ec95ec2a4b69a2b1863ba116a0/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/bc9d453e844a35d8a2879c576d60b5477db2f724/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/d67c742e1f3a8bfc5f8b97ae8d87682f0ac090b1/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/6428fa3466eb3c30b7f694619bcd7b91b0def800/
        i686 |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/bdfd5637f59d744767b4cccd17a244c62805389d/
         arc |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/6031dbb937dadd04b6b9d1d77fc6106728502152/
        sh4a |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/79043cdb48d0282975ddefdd79520bbfaaebf456/
         arm |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/1739c6f6b841dba81623763dac70fd786b931faf/
         arc |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/12db91788ee605594ca5624f7024a6a043993248/
         arc |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/c50532b29d5e5202ee91e952731d91ad21316917/
         arm |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/91d5330aad0806b93b34269eedd5db2c74cf31fb/
         sh4 |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/daa0788d19c969522ba5b950a505afdfbaf70a88/
         arm |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/88cfbdf83c236fcd77dab570369fedf3f373903a/
      x86_64 |                librsvg-2.40.12 | NOK | http://autobuild.buildroot.net/results/f0d161d60d567c125000232c28a419a2f08706c7/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/b55feb2d8d5eec4950d7466e578fbb69ecfe1482/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/dc12715a65a6727899ca49b9f02d292f2f7f8374/
microblazeel |                  mesa3d-11.0.7 | NOK | http://autobuild.buildroot.net/results/eb58d55d24c9bbbe47b5c3502c7da90a137287c4/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d6482efc12efb4e005b8cc0d450c207d5ffa0547/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/05f15bdbf660f239dbfc801f1840549e03f4eb40/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/81d0223e13188fbc72d269672a874c2dcd36221e/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/c1b32d18e73d0551fcd65cd9b06417b41ecf5aa0/
        bfin |                    ntp-4.2.8p4 | NOK | http://autobuild.buildroot.net/results/899266459bb192629c8aa3f55462b100aeeaaf02/
      xtensa |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/873255402a6033d3143116a7e6ce2e9b7e4ae570/
        bfin |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/ef22efa0f8a73458852b529a32a7f21e9c72caa8/
    mips64el |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/326338e9b36cdf34cee57dbfec9ec16360a90d62/
        bfin |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/76ff9fabb67721df0c6c93ee7252a6c56d137118/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/314bf2af34df8a97b4fcceeb672dc018537b2b1d/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/825b3ba93e4b31d178a23ecddcc7a8248abf3efc/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/c82387de66b9a99ee1f7b08c9e8c13d5610aff55/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/d6855260e33c45c6b4666a58228dc7d79ceafdf1/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/7fdd2b72fc5489cdb09bfbec6824ff1118d485a0/
      x86_64 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/77649699499f66698cd90b5a11d241c7bf590f5b/
        i686 |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/cbc1273c64118b53d441337d3c44f0a1a8bf344d/
       nios2 |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/2a9c2c382b52d4abb2d3045133024a288fbdd072/
      mipsel |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/8a23f82efcc602b2b8d5d04afe4ccb6a6ec4ee95/
         arm |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/ff238c890b998790f608bc5ad05e0f832ba30d6c/
         arm |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/b829e239e80cf5c254c60914e549f89f68b4abaa/
        i686 |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/13f39824c7e573974437ae78667b54789e47348e/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/d3481ce4dc9b5f862579c1800f74968f613ac027/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/bb905d82f09abac40bcd72995c1584a61360e2f6/
    mips64el |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/4b10732ca4f29f4dc01fb2940f72dcfee52b0543/
    mips64el |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/8db2771299d8af00af255034646792670f4633f7/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/2222b31d6d6eebdc85fd94acb9a4df0ca1a493a8/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/5b4117d243a78748e3784060722523344ecf6556/
         arc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/640a65a5e4e0f18a66178b9f195ef598f84a177d/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/b0808566b450464cbccdcb0528858b9a2ba617b8/
      x86_64 |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/d5d64e95d63f1bbfd062558576527bfad2371bc5/
      mipsel |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/ff3a7870aa4bbf7258fcaad2262c4f1370625832/
     powerpc | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/5133dbc0209091a676f972aff6b2c6c79ad71290/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/2d01841da137bf1703d9f5e005bfe0b14251191d/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/f51fa33720671607c672f3808a2a3e4eae4ad440/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/c945bdb1427b55e03901027fa674b577e45963a1/


-- 
http://autobuild.buildroot.net
