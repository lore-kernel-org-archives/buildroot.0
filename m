From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Dec 2015 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-06
Message-ID: <20151207073022.BE3B6101727@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-06
===============================

        success : 201
       failures : 189
       timeouts : 3  
          TOTAL : 393

Classification of failures by reason
====================================

                     crda-3.18 | 38
                     flite-1.4 | 19
                    gcr-3.18.0 | 14
                xfsprogs-4.3.0 | 13
             lttng-tools-2.7.0 | 13
                 libass-0.13.0 | 13
                 libeet-1.7.10 | 11
                  trinity-v1.6 | 6 
              alsa-utils-1.1.0 | 5 
            libsemanage-2.1.10 | 3 
               arptables-0.0.4 | 3 
               libcap-ng-0.7.4 | 3 
                 mesa3d-11.0.6 | 3 
               libbluray-0.8.1 | 3 
          modem-manager-1.4.12 | 2 
                  ffmpeg-2.8.3 | 2 
                      qt-4.8.7 | 2 
                 pixman-0.33.4 | 2 
                pinentry-0.9.4 | 2 
               libsodium-1.0.3 | 2 
               wireshark-2.0.0 | 2 
                   erlang-17.5 | 2 
            gst-ffmpeg-0.10.13 | 1 
            kodi-15.2-Isengard | 1 
               linknx-0.0.1.32 | 1 
                   libnss-3.21 | 1 
                  ltris-1.0.19 | 1 
             host-nodejs-4.1.2 | 1 
          powerpc-utils-1.2.24 | 1 
           libvncserver-0.9.10 | 1 
             util-linux-2.27.1 | 1 
                   open2300-12 | 1 
                libmbim-1.12.2 | 1 
                collectd-5.5.0 | 1 
                   glog-v0.3.4 | 1 
              gst1-libav-1.6.1 | 1 
                directfb-1.7.7 | 1 
               valgrind-3.11.0 | 1 
                           all | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                harfbuzz-1.1.2 | 1 
                 musepack-r475 | 1 
                rtorrent-0.9.6 | 1 
             iputils-s20121011 | 1 
        lttng-babeltrace-1.2.4 | 1 
freerdp-17834af7bb378f85a3b... | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                   slang-2.3.0 | 1 
               dvbsnoop-1.4.50 | 1 
                rt-tests-v0.89 | 1 
            netsniff-ng-v0.5.9 | 1 

Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/3fba8442e48a83737589f814fdd6c38e973038ed/
     powerpc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/c4a86fc574ea58cea3655254ec0fd645dfc7e3a4/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/b8d2687bb162018e6f4aad154386ee4a35b963ca/
    mips64el |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/b114ac7a25ac95a059418b07c6cad25714d19b77/
         sh4 |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/65946454b3691f2f23e1921f09af5524c6ea3cb1/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/03de33421e62446a9920def833f0868db3404e7a/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/950c9c65f29330694ea67abd475e12e223328638/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/0dd02c1eff9028dcb6219dc3bbc0f7afe7fde600/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/20854a817790cd13a2c62671ed61963e9104bd9d/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/895226573ee41929a857d97cdc3e7b83db937e2d/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e5369a91fad5856fa91119938b6f9b3bd032bccd/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/feb308d625fc42df9e283dc29f763b49129344bd/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/bd4ba065d6c69c6b36c4849d24aad5dca2264794/
        mips |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/df4b43b0f5bd225c440bc918940d0f57e0745a2f/
      mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ab7c4682e70173ad274df669b3d35fd2bf5bd92e/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/cb30e5576197a5081da52bfa52eb2caa9ff09eb5/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ee1bb80214a51c212712de8193b89a32e9901408/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/983c8535ca2cf68fcb12beaa7b10aa8b19cf6317/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/05a24ef8aad9ee9e7a0dc76c3d3ee0ee3b7e59e7/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/14aedd2fbbf20d78af2cda6169f75b7e125b6b7d/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/36c46c9af19fc2f333629b3e1db903e46a7bd6dd/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e4e8e1dfa882aafd96ebe9935f0c731df2b45d0e/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/1d7547f8941501eb3dcb455e69ed83c1df1a97df/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/2956ca596e75126fca849fbc831afb93790e7f50/
       sparc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/de5dbdda30874d8699dc77debc34a16d2c2dea06/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/295afe62a16f9d44ad99a0de813f24f5bdd37019/
        mips |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/22fe7932b71316a790ec5b1876cb0d5baed96e11/
        bfin |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/d08edc1806791d1fff934642523c75bf7b46235b/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/8512a5e788a898124e1b3f4ac51407e01c8c4113/
        sh4a |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/26a0407d9ea80c7204cc174b9c5bd5e143acd23c/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6d5a72533ac8d3e9ac5d303cd2dfa3e8e6eb4598/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/8e2ded03e5add6d9c1903a33963dffe4a70e760a/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/d193e66449bf6c7c06e7499aad633a247e6c8026/
         sh4 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/308d18fbd45517c401c9fabaeb38a760138c536f/
     sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7f8efefc85baf8545dcfa9fce03959d53631a079/
microblazeel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/129212bab7c5054c0a44835a4f7227975d61b6e4/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/deb2858e57e6a1a3ffab88abc7db634a297c4208/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/673f5d6ea0dfa0b8ccdf9cff590cf6a3416606a0/
     sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/d51b2c4c55f80b5243efa9691d458b556323a8f9/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6b0f9c11806b44c3c4dea6daf5049e0cff2ce06d/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/11d67b87ab21bc268267b5715a52d733c3865927/
     sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6c708a6014f563383b7a69cd562bba31dbe26ccb/
        bfin |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f557d2e9aa8e8b2fe709529e930abd51adaddb7e/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ce8d5d68eef312ca168f351b845920eb62ca4eb1/
        mips |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5004a2a9cabe75669bbe90f3ee35ab3869617fc9/
        sh4a |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/36fe8ee64d880c26f4300a8f2566d4169ee92ec6/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5fff84f420b468608a3dace3943ab4feb1f3dab5/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/37de62cdad8c2e33b3c7427aafc51ef963cdd8f6/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/b46ed8cd419e2f6ad0698da99c8fa12429631472/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/7d06525a273abd70c6e3c74ad6bf3f84dcfe03e6/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/090849b94e13faa580330a48198df8da0c2944ab/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/9f39217c91c6307ccbcc6fec96604eb78041124c/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/11c681f344c90f7faf40ece25909cd14ad21def0/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/c0f8d11a3ce3b15b5d029934f938e8700ed127cd/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/cfbc8f12c34f94cb61fc83406867ccfec6f14b6d/
         arc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/eacb973e7fcce385d1686ab364f60dec9e0dd2e9/
        bfin |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/46e1ff43c9034224759676efe597b94eaf5f77a7/
microblazeel |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/ca78c1029ef1d91b66bbc91c5e5269bf663afe8e/
         arc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/b62cd6de04ff83bf7025a8f1aca49dbcbc8d7e2d/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/35ec06cf4999b25d4c88531b79a4f3a51f20b113/
       nios2 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/f4cd54954e4f699e2ce64758555067e0457960d3/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/bc308ad48fbfd1cc41ad0914995697cf269706d8/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/2c98458fef8c38ff36cd20d77c2d651129146857/
       nios2 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/9bd2a8b35205da2cf155b0174e5ed161d682ba93/
      xtensa |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/6c759df76a9752e0c43018df9b85b0cb3faf964e/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/ae25fd38e7476ff05b7f407d127ad13dd17bd9bd/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/4567095f3872dca6a70847ef1787658ea5e127c9/
        i686 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/363d694947a5d8a58d6909cce91e6f67f7c47b78/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/e13264bdc264ec9995d714d6dcee0439e2b18037/
     sparc64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/349fc485333db04aaa66596ed3b99c9ed3160dcc/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/cf597df597b12d6e1884d50a5df606d2a2fe40ea/
        sh4a |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/defb0ad2a26fce103b988a105e1f5e6119d51440/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/0d2809d3238b4ff96a6c1ebf61034f198d742286/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/825cedcf6a2b4e1d47bb1b925a963bb1ebf6b1d1/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/12a1cbc552fd01946b07ec04612ec8b5ce872262/
     powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/7c47f8a935c65ceb1f65465f9a1fa323ee1fc087/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/b6d9a12a990a2c1675ab8e6223a77134eeba208b/
     sparc64 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/fbb9d2c599d36f9d7ebe6b3772a984d4a934c019/
       nios2 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/d1920ee4bbae0e813c5bf2d3ec660a8c6a1d3964/
      xtensa |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/8fcdbd3055c2b59a93f81535107f72e4d7835ef1/
      mipsel |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/f9aad77186579b4896aefd37d5c703af85983d4e/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/add44e05c200682468528ebb9b58c7f032ba92ed/
        sh4a |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/d590df57c50acc95796d7ae09f6d65c4bec46ce1/
      x86_64 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/bb593824a76eff48305d0097e87c3cf20be655a8/
     aarch64 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/adf36d43dc39d18435e340354065ec871607e875/
        i686 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/381f9f441d0d4e0b9a5e3752095ffd2ce5a630f2/
       sparc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/bddcf202e1a88d818a6a61dc5e4daee25a133118/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/c02ca3f8a73ef4a3f83078920e4e4b0bfed2fb48/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/f2eee887247c0aa085491f9c6d675ce87433b87d/
      mipsel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/f50c6e6b3d8217721051f871174278d8c95e324f/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/ca2f726543860bbf4bf0bd3bb449462f3706bafe/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/58858b3e7e9636e592b9a7d724531a89a7a42281/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/9cd7cbc1e8bd550ea9be7b17463c6068ce6f5701/
         arm |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/35f65f8dbd88706b85aef9ac7a8c38a978228454/
         arm |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/ce4a53fb6b260cf4565438e01cea1739d3d5c40d/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/ca6e96307cb5229e158d7c7a919b84068797765c/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/6b2fb8b2a2823b3deaaeb1f4576795bad318a37f/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d1f384de23a12d4835d6924fb8224a5c1fa34612/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/168eebc8cfd1e9b7977a6ae40eba0139ac788f64/
microblazeel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/8db0bb2fc1f9cb0c4d2c5a5750374a1342d60401/
         arc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/fcde47d09b4627fee4ae4edbde546ae9125e8079/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/807a873c368cb16ced2bd5848fc291ddf0135d8c/
        i686 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/0788a414ce02d711590dc3d82ace3395501e0c50/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/ff7a730166eec647d48a4d18acf18d3b59085c9e/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/1ca062297e9e5c431dd87f75759753c6da7cc7ff/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/52b49a817b3f34b3a7df9131822e3ae8aac17df9/
      xtensa |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/235ea6ca2b87fc981372fd467b870a11980b7634/
microblazeel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/6d6035e4be94cc70610763f17741a7471d7dbffa/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/db1f84bf910df5a042bc83a6baf58a9aae063c90/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/47f2a5df8fdd04d46c976c1ab5ec6a4db73e4cda/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/c7dd51182afbd88ab313334312a77ce36c296a7d/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/161737a99489543e72b9737ac356dcc9f461b99d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/90186d1fe134b804c0101554296b1235dc0ccbb0/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/5e3f7eb118b3555300ae0efa0173c90067d80f23/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/fc26efc52e2fc4d2a2510b8cb2c82b1485c21623/
     sparc64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/826a8f36631daa35ebd49850e12304e784ff9be8/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/7d5f483cdce508d27678acf5ac387b57fffae9bd/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/e47b75bf07892126eb1fa21268edd24077f140c7/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/1025f598e3995ce2157fd028345796e00ac36da6/
        mips |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/a5f9100346aca894188126b499ba2ac84579c8d3/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/1a90ae4963a73ce1f12b743272e61697dee25454/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/bb4a2715923f9d098607b2de76f208ea6c9f2c42/
     aarch64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/5836d5758ff8c8421973b325fdd80ab70f04699e/
        mips |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/5d7202143f0ca453a251ac147421b9d284ed942e/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/746be354f6372df33dae9e2cc969e2a497fe9a3b/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/46896031bcf3195716ee2224679400eff37c4151/
      xtensa |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/f2e49a1ae7bf54c4688705b1d308029b9a88a364/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/641278bd64e5522c99bed1d479693dbc2f0957a7/
    mips64el |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/03b2d258117b0ec4e8d77792c4fdc0533cf0e1bb/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/362f14d2dd87ad170b86097fada6185432675123/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/ee8ff0ce201ed02d4c47ab3d780533139b0d2377/
       sparc |                libsodium-1.0.3 | TIM | http://autobuild.buildroot.net/results/f5823c215ac12016dda387968890570532936252/
       sparc |                libsodium-1.0.3 | TIM | http://autobuild.buildroot.net/results/fa71cdaf50e845cfab039959864b26d4df2ff9db/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/6543e12eef0a946045c0110674ef47d788e2cf71/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/0eb93fb68c0d481024d55a87b3b9511c29a4d095/
         sh4 |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/74c26f466adbda99d8af30f6368de5e711f23c02/
      mipsel |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/b063c8248e2362e2ec015515892797996d4e1436/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/6eaa3c0537e15ac856d350a6065089ab67139f63/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/35a7aca9d55d5a97e56dd704b8744e1fd64319b8/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/79cc7accb1e33ad4068d5f51c3b4468c3c6a1850/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/063b5f623f916b2881e7a6475a1e1779fd59fabc/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/aeceee1a79583d9c36555cbd91899b9fd74652a6/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/5eafbe2e1d60a1b52df046873e4ecb002429b58a/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/f97f0b05e395a6d7f6b93b65490d95f2c9f7156e/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/f6bdac83c4c02a08ac5ac30bfa79d784913c3137/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/e827137c7843602fed9b11f18dffea9fb378280c/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/0a88eb7e99b203f95c16db00096fd6743a72d40a/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/68be485fd2236e04e65fd57082f11342be31a82a/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/439432f630bfea10d8ebb8f2ba144660251404e6/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/8c4f275d32333cd693e5711bccb97e47272ed0a3/
        mips |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/6a4ab61cf47126e2034354f79dd3206aaaa419d7/
        mips |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/b4ac86a035d2606436aa8e6ee460995f9f8d8db1/
         arc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/4270c421d2ad79ffba48490b3c79aa6a29567b73/
      mipsel |           modem-manager-1.4.12 | NOK | http://autobuild.buildroot.net/results/3735baba46dee5bd846cc830e1e198ed783452c7/
     aarch64 |           modem-manager-1.4.12 | NOK | http://autobuild.buildroot.net/results/1e79cd2ebad99e08a19e980a649f9c0535006cdd/
      x86_64 |                  musepack-r475 | NOK | http://autobuild.buildroot.net/results/6ebc9cbee3fc48f4f5b658d11b040ad62fb6607f/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/324e3a8b0a1899c94ce7fae5fb6e4b34dbb29b1a/
      x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/7592479b9fd7b85badc66991c59d296a5623adb6/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/80f8aeda993e1f809612e3f7253ac303ec0aa9d2/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d88595bf93d1f9b232b74e17295ec4ff5cca57c1/
     powerpc |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/f59f5b46cedfacd3e6fccd8e75a64ab6947a13b8/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/70c5d4d70e5af2b370ed76f792ca775f95e05661/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/4f06d3357885b3505608887ee6f4c094a4e9598a/
     powerpc |           powerpc-utils-1.2.24 | NOK | http://autobuild.buildroot.net/results/79880198d3de8f81f1f2bf5bf748b447c144fbb4/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/44de83ad5c8887e7b85910e516baba2d2747c9a7/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c1d7a3c9cb29580aa05f0a92ae4bb22bb2b13316/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/bf33af890d21c6010c472759fa13cd5fcd88b308/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/ac591564bcdd0bd84f3fc1764fe4c0c339e09a97/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/90c3fb476b5cd188ca6e51458078da16a4fe70c6/
        mips |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/6337908280ea50eca70397e819d9c1d59b2e9f9b/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/64515e810f703edd3cf9b6f0239a4a950e672d5d/
        mips |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/9459168dc5865c1310d225d79284f9c79ad3d95d/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/ba07f2c559c9bf5c47964c996b6208fe3679bd2e/
        mips |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/4577f2327efdd4e81e8f05b2b8642485d73850c0/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/6ba231451e1f3307ec467ae16250343541f920e0/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/8f047364bbc0cb6b1e1d306df4e9d6e558748942/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/1bb211684b4aa8de2e17432992141d9b42719275/
     powerpc |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/6bd35db8d55404b8eed44c7429857cf99a6cdc52/
        i686 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/83bacf2fdc049df6f8cc9bf7489e1ac59263505f/
        i686 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/1bdcfedf07f50bbab7897baf2669bea9d41e9e3d/
        mips |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/c1353f2e6c4dc126b3a59dd167c3c5473e4a938d/
        i686 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/5b59b2457f7125c41894743cebe601e7f95dd87f/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/9d0004eab4030e810a057ce40f9a912ad8bd9e6b/
     aarch64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/3b589fefbe45873e1241eec4ffd505df590f8832/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/2fecfe03a42e54e067c97e48b8309758aeb2d8e8/
        i686 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/312d70b40721e707652d80a91bc1613414295bf6/
microblazeel |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/042269c20b76b938d5c0ef8dd3674a542fcbf50f/
     aarch64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/7ab50329241234eb415ec83428b6dbacbd83f66e/
        sh4a |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/0c6d9af84dd5e52937378e9976a65bb6fb1a0f09/
     aarch64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/b1858c85a667a7a1aafae3501df5e5b729617ed5/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/710f93bf1f5ad7b5c9fd79d4b72e20eb2a2275f3/
     aarch64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/f1c78d58942ac09913767d8b554b1160b6843184/


-- 
http://autobuild.buildroot.net
