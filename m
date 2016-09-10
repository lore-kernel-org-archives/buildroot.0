From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Sep 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-09
Message-ID: <20160910063030.5381D1031B1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-09
================================

      successes : 256
       failures : 58 
       timeouts : 3  
          TOTAL : 317

Classification of failures by reason
====================================

                    mpv-0.20.0 | 7 
                  ffmpeg-3.1.3 | 2 
                    lftp-4.7.3 | 2 
              libarchive-3.2.1 | 2 
make[1]: *** [libavfilter/a... | 2 
                    mpfr-3.1.4 | 2 
                 mplayer-1.3.0 | 2 
                    ola-0.10.0 | 2 
                 openssh-7.3p1 | 2 
                   pugixml-1.7 | 2 
                    ruby-2.3.1 | 2 
                blktrace-1.1.0 | 1 
              e2fsprogs-1.43.3 | 1 
                    efl-1.18.0 | 1 
                   erlang-18.3 | 1 
filemq-e59951489045825d6fc5... | 1 
                   fwup-v0.8.2 | 1 
                 ibrdtnd-1.0.1 | 1 
                  libcdio-0.93 | 1 
               libglib2-2.48.2 | 1 
                 liburcu-0.8.7 | 1 
           libvncserver-0.9.10 | 1 
          libwebsockets-v2.0.2 | 1 
                libxslt-1.1.29 | 1 
                 lvm2-2.02.165 | 1 
make[1]: *** Waiting for un... | 1 
                 mono-4.4.2.11 | 1 
              mosquitto-1.4.10 | 1 
                     ncdu-1.11 | 1 
                  openjpeg-2.1 | 1 
                oprofile-1.1.0 | 1 
                privoxy-3.0.26 | 1 
           python-psutil-4.3.0 | 1 
                    qemu-2.7.0 | 1 
                    quota-4.01 | 1 
             rabbitmq-c-v0.8.0 | 1 
                socat-2.0.0-b9 | 1 
                   sudo-1.8.15 | 1 
                   systemd-231 | 1 
               tinycbor-v0.3.2 | 1 
             tinymembench-v0.3 | 1 
                    urg-0.8.18 | 1 
               wireshark-2.2.0 | 1 
                     xen-4.7.0 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
===================

         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f62b509c8458719aa0a13752916991b1082649ce
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/229fe8852116ead995e9d50e6a04ed0ee375ff6b
         arm |                     efl-1.18.0 | NOK | http://autobuild.buildroot.net/results/4a3f5f1a35cc961f99be743aa60ac786478cfdd2
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/951ae6083c2724655738096bb8c9ccf3aed0e947
         arm |                   ffmpeg-3.1.3 | NOK | http://autobuild.buildroot.net/results/5baf27661c3acf7fbaa77a048fd75727c7e4c8cd
         arm |                   ffmpeg-3.1.3 | NOK | http://autobuild.buildroot.net/results/a513950ca24c575018900edd3ff72fd5196eb3d9
      xtensa | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/2658ca303b6560303e85922f24304c04302c9984
        m68k |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/e826f61de6521cfb105d001449064dc3ba1be41d
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/1be0f2e11fbd6928aff9ab9a048961c58b9f64e0
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/451d90e93d1b5b25b38515f253af50ec9f97518e
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/4b3363d00b7d9ef44bca37eecaf59308aa130370
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/0c4775f405a307ba5f1df5d0a9265ac0705420d1
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/48000dbc79cabf392670fffdbb2c501ef55473ce
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/51b4d12f4cdd5e4fdfedfa1a997b647738888bb5
microblazeel |                libglib2-2.48.2 | NOK | http://autobuild.buildroot.net/results/e1b63c709e31be058957e36f577c21af25f57ee5
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/eff06c59913d71369fdf282f774c3fb950c5fc86
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/ae4b9f7ee5063f1e3aff0fb50c93ebfd2862f3f4
         arm |           libwebsockets-v2.0.2 | NOK | http://autobuild.buildroot.net/results/6c6873e9f9d090c2ec973b5c13a330c81e2156c0
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/3eeea0d118e2b10f7dfe786a2eeacbdb841e0b55
      x86_64 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/cff41ed3fc457b5c77b5ed198ad009072869cb51
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/90f83ff114be21c066139971cd1a9f50328c3b2f
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/623fe4c1b12284b2940801d86056c205f48d4fee
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/9e3b0173af64858253f06d4259e13f9d4cb43e49
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/4b3dae69bc83aed32ec27bbe79ea499a1bf855a4
        m68k |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/21b5855ad87268350f64f3e164584da83a821673
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/c3aa134e49387b83e271a3516eb50eb0329158d2
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/df5b0469963aacfa6f7079170d5311f0ba5477c7
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4d639067b6165a376476e00d5780f27a2d280a8f
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5e15c1104d829f134108bf8f61661e6d7a21a4b5
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/e4c82d15c2b2b06f96efb4987d2429f6cb68911c
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/4d235c7cb7c9c107a25ce5364402097737fe6c7d
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/4e0036d2bc2eb3740eb7046ebb34ce42c48677b1
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/2c09c4aa95bd576f1383f103a52d493975ed1f38
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/6c0905fafdb15a6cf8c2f723f37dd19e8ca42d21
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/616a8f93fc61413bdd61d73068bce7a95ee4f8ce
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/d2a8de1979c83897957bd6953a7a878dc2fcc640
        sh4a |                      ncdu-1.11 | NOK | http://autobuild.buildroot.net/results/7900d37a69410891c2625a558d528114e115b30c
         arc |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/1017953c2b69dace53be552e40307c203b34061b
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/18806d49f0689c15b746b1b47c4adfcbd71377f6
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/1d9902ee3ab59ebd6f48760822a787d9f7548a5b
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/3ddff4cd77d201adad79ef159fe34d8a7f9efc35
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/79153721c09c1c3bf71d7829533ba64b9160696f
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/f5d072ce29e62de5bf42a0f81d45d467bcba208b
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/371776c4f3915f5cd920b82faede46a84697632b
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/c4950abd33cd310e89882367376e62b13e4827c7
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/79224c383da7c2ea8e5841497d9df978f81f1e20
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/365c2f0b32ae3cb1d6d4d8f0145500dfadd05c59
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/f3199f1312a58402b1a01876c2dad71cbd5598b6
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/2ea765df39eb56906b430a128cd89676b426d6a4
        i586 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/625b88bf745927c54bfef4fad0447c7196814dec
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/a12fbae3feb7f1d062426a121453c21dee9af91d
        mips |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/430f9ed2a402ebc3c29df54007ed047935e6acf4
        i586 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/1e5f29bbf6e8fb97dd5312fad4bf515ec9dc7088
        i586 |                    sudo-1.8.15 | NOK | http://autobuild.buildroot.net/results/ba307abcf025caf75e49aaa83055096708499665
         arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/6eaa46e518c2f065c7370e2e5038dc0b987aeeae
        i686 |                tinycbor-v0.3.2 | NOK | http://autobuild.buildroot.net/results/0f03932355e2cb84ea560a9c5570bca708460a8e
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/9de933e3db1289815c9ca10f339d4a4ecf8b3de6
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/a46dc9b4570f6ce6c7f5c22153560cf3b8df68f0
    mips64el |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/3f96eea1bb2d9d262e623466488374c3297e1acf
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/be472c0387282994a7f783fba1a098138df0af3f
     powerpc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/43ea2b30ceb3f5169cc3936420cd351475f63e67

-- 
http://autobuild.buildroot.net
