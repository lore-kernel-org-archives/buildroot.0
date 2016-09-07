From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Sep 2016 08:30:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-06
Message-ID: <20160907063047.2AF861018F6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-06
================================

      successes : 225
       failures : 68 
       timeouts : 7  
          TOTAL : 300

Classification of failures by reason
====================================

               host-qemu-2.7.0 | 5 
                libxslt-1.1.29 | 5 
                    mpv-0.19.0 | 5 
                blktrace-1.1.0 | 3 
                   glog-v0.3.4 | 3 
           dmraid-1.0.0.rc16-3 | 2 
                  ffmpeg-3.1.3 | 2 
              libarchive-3.2.1 | 2 
make[1]: *** [libavfilter/s... | 2 
make[2]: *** Waiting for un... | 2 
                 mplayer-1.3.0 | 2 
                    qemu-2.7.0 | 2 
                    quota-4.01 | 2 
                       unknown | 2 
                     xen-4.7.0 | 2 
                xfsprogs-4.7.0 | 2 
                acpitool-0.5.1 | 1 
                    cups-2.1.4 | 1 
                  fio-fio-2.13 | 1 
                   fwup-v0.8.2 | 1 
      gst-plugins-good-0.10.31 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 ibrdtnd-1.0.1 | 1 
                ipmiutil-2.9.9 | 1 
                   jamvm-2.0.0 | 1 
              kodi-16.1-Jarvis | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                           lib | 1 
                  libcdio-0.93 | 1 
libcec-2c675dac48387c48c7f4... | 1 
                libmpeg2-0.5.1 | 1 
           libvncserver-0.9.10 | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/a... | 1 
                 mono-4.4.2.11 | 1 
                    mpfr-3.1.4 | 1 
                   ntp-4.2.8p8 | 1 
                    ola-0.10.0 | 1 
                 opencv-2.4.13 | 1 
                      qt-4.8.7 | 1 
               qt5base-5.6.1-1 | 1 
           qt5location-5.6.1-1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                     rpm-5.2.0 | 1 
             stress-ng-0.06.02 | 1 
                 synergy-1.3.1 | 1 
                  tremor-19427 | 1 


Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/d0513cc2888165e849f571e22b5d25f828def81a
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/29a24a16306a13b73a5c3ec9f23ff4f38989cf61
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9e20cbaac2edb7b634d1a5ff338c67f46c7b3ff4
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/31a1f49030a3c832b2f8a0e72f67e9354d429034
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/e5b1d27e22a8d3a15f004343c8cdcd14db81cd95
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/a665f20df6b0d2b255bc812169e24e539f7e6447
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/0411962eb03f0ce1aecf2e07a68577f33fd3cf34
      mipsel |                   ffmpeg-3.1.3 | NOK | http://autobuild.buildroot.net/results/2603dc63785d3e281a422b9395202b9331606c02
microblazeel |                   ffmpeg-3.1.3 | TIM | http://autobuild.buildroot.net/results/05490eb891d520df7e5ee897992f5fa20c322251
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/840ea917b2f9b37edb5b04b43b9969aed6ce38bc
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/24c23e0292a474535097759d7a5c1e0907861d28
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/1d4577ce110620373b518b6e007174a5f2743f5a
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/f3da151a8112ee61cd815466cc7b0171c3df00be
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/eb4bbb27e09b3625ed51f04790bcfcf4b897700f
      xtensa |       gst-plugins-good-0.10.31 | TIM | http://autobuild.buildroot.net/results/be10af7f4b8c46900438a1e91df96c59dcb6a29e
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/9637437cc4869fc69722476e2b919100036701ea
         arm |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/1719a0bc633acb826ec12e7f51bd315972f6a35e
     aarch64 |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/ad52ef97424c363837af8e844a43e9932afcaca4
        m68k |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/472fc23563e4e2eac5cef7cf56f34d6de7355892
         arm |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/3f140dc5af1daa50187dde700e1f3def0385e9ac
        sh4a |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/d7bc3402937eba8044b58c5b6feac8e37a677480
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/af7f8dd3f00075e7b9180d1215083f0bee1a4d46
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/7048c431f6bca3d40e4881ffe94d69368a2d4054
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/5ebebb93d8e42c225504883dd4200da8b66c7408
         arm |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/ad65b494e7e563a1e9d17dcfd96069d442d1a992
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/de736cf30522e0794b7c98a19a0fbab5288558ad
         arc |                            lib | NOK | http://autobuild.buildroot.net/results/2a17a6d687d3472942cb22568224da5773dbf1ac
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/eea51c8a3d79528b54c723d2d6b1d06ff70bd0e3
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/3847e6bd0407911ffe3141c190cbf30003592453
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/735eefa60ce42a4269e51f7ff5b5b10236d03117
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/5267ceb40b75644845a3bc990e931000e0eb00da
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/e8d306135458df648e99f0479da512e45ffdb8ba
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/0fc0a9e082068c20c4170de795a75a453f47b0c0
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/810fccf116e2a519fe1db7306e12b13e7449185d
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/2545319cb987a62565c82f30b521c791a8c37338
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/e4776f448e34532b721c3e8b1f92ebee85ab815b
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/cda4113f8e1439054137277ebda080dafe4213d7
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/4bc9649beed7469d790db406ffd6725681b8d295
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/fbd5af9f85d533b108c3008d23fb1f753cbe7bde
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/e3b20d9bfa3dced86e6ac9d7bacd025d0e14c2c0
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/5a974b1afd7f04e37fafe697318e5efb04a0924f
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/83d8be2eaa2b08ec891017a57fbb291abd3ac4d3
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/9a36f6de676fc473bdc064cbe314e71bd0dc0e76
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/4fe645eabd891c52948f0cc7756f5fb059362db5
         arm | make[2]: *** Waiting for un... | NOK | http://autobuild.buildroot.net/results/62fe69ec9bd8d6330d839c3d6be2637e70fc989e
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/048f04488cb8c7f4c32b828aa5214ebc22ba0153
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/11b6289676649470d8dbfd44dec7adf7056b3d3c
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/369e3f5b36c733dea792fca4c242943a7c23eeae
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4e2d714a50d94076da3a2566342dceab06bbd6eb
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/fc80500f5cbb5051694d5a5c2c5ee29304a5372d
     powerpc |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/ae077b60beb89600147632be9475f7c17763f10b
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/f4ad3dad937a83f7520a916826060562e7ee1696
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/45e265e0a2eddc0e09dfb765642617d5074fa0db
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/176f29fdb0fae17fcbe673df56928a3b21faeba5
         arm |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/425a98dd57489c1189c52b2259d8c9b02ae14b67
         arc |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/c34f9a1a559aab9e2f1a4d7ba93334966dc88e59
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/9da1e3e604615310cd1a3291e8d5af3e705a4f92
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/3e238933fe2eef17c03bcd8ee27d086964e37fe5
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/7ee906561e14af8dd0546f9e851c88658db796af
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3d4664f41f5eba584090f9ea77af0060f2784287
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/2ab8a3cdf9cf5d6d29acc89c54e1e09441173f47
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/6d45e9c6ce352b4060432eb51faf5c0ab186424d
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/ac049bbedc66d1a2b32276c3ce0c6c15e94ab91a
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/0522eb38c022ee7f5c960701b3c28a843a3a6eda
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/2236f39f7c00b19a84ee48389901555fc20d7a61
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/e98b54a8b9d8bd0c80bb7d3adcf27627cd7e94f0
        i686 |              stress-ng-0.06.02 | NOK | http://autobuild.buildroot.net/results/bba4d0b635ab6849f969b8a0363ebe9f5fafd82e
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/1480fb87c6827c7554165f140f52f7a5cb442563
         arm |                   tremor-19427 | NOK | http://autobuild.buildroot.net/results/9e6c3058a74713c4e5323db2b29e063d81d5b499
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/712db85ce7bda24d41b67684702581c1c7067410
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/12b4f17b98505b4f5d47f917715864d719a2aaaf
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/0ddcc631d503219c78f5e18764e47854bda54a2b
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/ab7ca17111cfbfdbab2214579ce642a8e05fc232
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/eed8d470cf60912b5a90e18d9a0e853e79a38694
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/ac5a234a02fbf8c44fe8f19d3654c91347d262dd

-- 
http://autobuild.buildroot.net
