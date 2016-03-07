From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-06
Message-ID: <20160307073022.D1A301013FB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-06
===============================

        success : 193
       failures : 114
       timeouts : 1  
          TOTAL : 308

Classification of failures by reason
====================================

              host-libcap-2.24 | 19
                    owfs-3.1p1 | 11
           libimxvpuapi-0.10.1 | 7 
                     dt-v18.32 | 6 
                  boost-1.60.0 | 5 
                       zsh-5.2 | 4 
                  multicat-2.1 | 4 
                   fio-fio-2.6 | 3 
                  cairo-1.14.4 | 3 
              gst1-libav-1.6.3 | 3 
                libpjsip-2.4.5 | 3 
                  connman-1.31 | 2 
               valgrind-3.11.0 | 2 
                 erlang-18.2.1 | 2 
        host-gutenprint-5.2.11 | 2 
                sg3_utils-1.42 | 2 
           linux-zigbee-v0.3.1 | 2 
                     fbset-2.1 | 2 
               pax-utils-1.1.4 | 2 
                  trinity-v1.6 | 2 
          sane-backends-1.0.25 | 2 
                   mplayer-1.2 | 2 
                    cups-2.1.2 | 1 
     toolchain-external-1.1.12 | 1 
                 rtptools-1.20 | 1 
    python-rpi-gpio-legal-info | 1 
make[6]: *** [libavfilter/a... | 1 
                   mp4v2-2.0.0 | 1 
net-tools-3f170bff115303e92... | 1 
                  gamin-0.1.10 | 1 
                 rpcbind-0.2.3 | 1 
                 mono-4.2.2.30 | 1 
                    ustr-1.0.4 | 1 
                     znc-1.6.3 | 1 
               ipmitool-1.8.15 | 1 
 googlefontdirectory-undefined | 1 
                  psmisc-22.21 | 1 
                minidlna-1.1.5 | 1 
           lksctp-tools-1.0.16 | 1 
                libsoup-2.52.2 | 1 
     host-google-breakpad-1373 | 1 
               libgtk2-2.24.29 | 1 
                      qt-4.8.7 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
tstools-08f6be304040e7b8476... | 1 
          libpam-tacplus-1.3.9 | 1 
                 mesa3d-11.1.2 | 1 

Detail of failures
===================

         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/83292acf0f8122de779639768d3d1738a7b0ee44/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/507cd0193fcbba3901c19e0f15329ec0f34b125c/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0170a1beaa2f2ef2101faeb34d27861e31b67519/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b11ab4e4c3d61a100bc6196242a1ddd703676f5e/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/18380264ac8c2f3feca17b8b797185d502b0091f/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/49623ebefcfe7d04d22c608e05d221fd5a05a3b1/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/ec4e48c0e4b8fa72d8bb7ef4ad67a166699c0b62/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/1faa3126c4cd15b7146b5ea3fb581b0bdfe177c9/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/93efecdde547da8757c6114b7c1a58f397514ae4/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/33a6bf20821644a55593798e8f75b11122146aed/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/43f67d813f24e237dc60144a2fd61a8f0ecf0de1/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/86fb0a3641e5c4a0eb3bff4f9e0fdc99f2b83785/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/771d411a4aab1e862f41d45602424fa259b79dd3/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/9578dc4c54f178e3e391b87db2ef15f69cc17d59/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/3db65217b4dd1c4616a39b864cc860fad7226864/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/b5e785227b71723ee1473e3b14f3e0e1fcf3e0aa/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/506bd6f32164d568241ae720bc2d22873c9137e9/
       sparc |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/e5d14a550a183d8359e65d922d12007e22a50dc5/
     aarch64 |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/07165d747ed8d9dd90503a2fd44cc987ac7d03dc/
         sh4 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/be338315aa84efcb5c6c79117f16b866f12c6b98/
         sh4 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/231b2932a23ecbe8faea35bcacfee62969680dab/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/8e5fc2a0c6ab72d61c80c9ae4935defc95f776d1/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/8f679bb41f44677d811764e38cf4e9f9025a58ca/
         sh4 |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/2a900ecd80b5f137a5344d7bf8b4fb321d4298da/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/5a6a008081a53f69b42989e17d76afb60b66ecd0/
       nios2 |  googlefontdirectory-undefined | NOK | http://autobuild.buildroot.net/results/5f71289c6e5ceddbaa5aef0cbddca120ee18e59e/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/8dc1834b11c6f137a9c0eb207dabd9a963a8fee9/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/8206027a3f40a48349e7016d4af2d6650c11e58a/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/c437b7e282e51a58000161abd63474e6e1023ec7/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/30be733c7c1f1f9a0683e10cdc23f5dd714f4a1a/
     aarch64 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/0979eff19898fa73b6666798614cbb0d427c9bb2/
      xtensa |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/8a8cced6badb8fd7e4af3c4fa679cbdefa316e9d/
         arm |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/1358b37b04fa0c53a59da11b280ac25af6ea9638/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d25bc57a3a05c238eafc1ca56b91c4a7bfa09fd3/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d739279555fcf5641726346a200b2298ac3cda1b/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/15a5006dce19e506e2d58c39876e236247881a2e/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ca14649e293eba548ffb3d6c5b5e5ddb456e7f01/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3b743d0563b201482a579b995cb33a759bb6cbd8/
        bfin |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ff71beec07f544bb5fff050c4adc9eb2988cad40/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/28b31fff09098ed639fbf1a6e52db2ec870f4b10/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ae19b339d38ae21a8f6db45f2ff6b58fa96ff53e/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1a17ab69799b010b86e625bc6b02e70b36c94c6d/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/11c87b070f6c5cf54f5958fc680fd8cfa50e7d28/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1eafd6f2d2ce71497bb6b0aa588b798d4cbeeb42/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/297b0957cc327b4919a01b8214864913a1043197/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dfe75986e53a82ba10c9901e9be84fd00c9ea168/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/defa36f66169e94d5680cfdb97071e6684f63e6a/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d3d04d849d3d186486a42e5a83ae974a2c1b31cb/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9311fac79ce3b2efc6c47e33f8ea0da0035477e7/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/139a2c47d83b312fbf98fba585f5dcb0208b0422/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fecc0903c7af896104b43788c72960822617975c/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/28706272722ecac7d3da43e39957d42ad764f0d1/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/2ca87fb2caf3420ecb6221a1db72e1d0c5556c85/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/e9bc4b94e6b53e58cd3a2bee66e729305b49071e/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/831c2c7d28851d8b221cc167ceb5680c33e88eec/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/231e78eccc39409dadba2940ce562e14fd4436fc/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/aa6b5a60b320829f6a31be3b970928679681861f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/aae49b037f8c063ceb2d8f9ff64369d3d1eb84aa/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/4a625f6177627755f83d4014696c91f8464f8838/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ecf9142d7b9cffec43bb94aa879d4c46437df91f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/020c543bde03f168a890d6cb44fd786fe119b82b/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/f1c8bb6f0dff9d31697fbe928b0a439f42366b06/
         arc |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/305fdc8442cd2e8f51b90485be0dca83ffa36603/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/744431e1b47d22222c4d0b48d5d20649dfeed929/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/a10aca9139054502e055cb61f3925637fc515e12/
     powerpc |                 libsoup-2.52.2 | NOK | http://autobuild.buildroot.net/results/f6f3e20ac76695054abca38c50866bd3d7c666d0/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/e48359c191c38bba9435f7b1a71ccebe7b28ea73/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/bbae94fbc57217f2667ede8451ab3db4bf72c1dc/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/70b8c9090fb80b5e5832ea3d2b27656c075e0772/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/5766fb0d6a775aef8ca759af56b108b7486de6c4/
         sh4 |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/160e433b5b3f4ff84762341289bcb39c141b78b3/
    mips64el |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/5752be7c1820579425ba24178482ab0d6eea7b62/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/690ef9ac6e07ec96995c063ea45506bffbf9eba9/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/f3d14ae47ceb0d5a5debf8c3620522e178477a09/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/69ad38abae232f7190eb9b110abdfaefe4a9dee9/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9fc052be6a7c981ba6d49883bd1ccabafab1a82f/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/79bd2b464875633606ddfa56cc8928300aafcbc0/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/636abc18d3f65f4ee59d6c87f4dfbc42973b8375/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/c708151d0edba1780e172f6d63914153311688d9/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/0549d9e0d31d5508630dfcca5b7b27ae77795277/
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/dd21e85e3fda3f49bf3e03dfb3037c6332181cfe/
     aarch64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/96cfe116e36d0ce91ab5b088e88f3e0e3a39cc01/
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/1f994f53ceca434ebd1d87923f85b5ed71229d94/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/18185a761a6c09f0e313e402b6bd512c08454e2e/
        sh4a |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/85296b36ee74d9ad7782044f8f54b7277666a9b5/
     sparc64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/28b886cde55c9721e40c1c5150bd8de8cd87761a/
       nios2 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/8f62d3791e1b3ef1625f1e1ad0e49d7d94eb1637/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/a2555e29ce87ff37160c81c27cd34c6cf7e41d58/
      xtensa |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/f3b11b0bfaefdfa13a2d3d235592163d2ffa0f89/
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/7d4273474d0fababe7db2f71561aa0a3e794e265/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/e9d8280ba7f97c49d65f219f64914177119b5a5b/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/16b18be7def4e8695d90b70d3ff448d6a46213de/
         arm |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/c13fb87c2e4739106e256f34fff93696b0133bf6/
         arc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/f822801f9b811e1a0fb4627f6b528116375cacfe/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/beac5d43a8f91ce50bfaa0614419234a3ef7e854/
         arm |     python-rpi-gpio-legal-info | NOK | http://autobuild.buildroot.net/results/4060be5aed299b9fc197f2f8c398ca2800e7ec08/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/14f4750133ba2c7ad4b4ac29939366138008b400/
         sh4 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/4a1028afbe71b914a1f49c338d9da11d6f909324/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/7af1fe9138e512d87503275a72f8b01385430518/
         arc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/2a8d952f0f4551260a79a612af89ee1445bd5914/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/4c8e68500eaccbd758a443005d6c095e5851bbcf/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/795e4951aa85abc087595a51f52dcd17cad37705/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/ab643e968c5ab9fc86a65b33c5160afb9b713ea1/
         sh4 |      toolchain-external-1.1.12 | NOK | http://autobuild.buildroot.net/results/d1652ac97d00f0ee7499f5b3492115496cf9616a/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/6567163ab11c02538a773718cd5e7348a93832ec/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/f53e77147c346c476c203fc2f79516aa5bb8d9da/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/1a4770df9469ae3361dbac8be66bee12d8030b4b/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/7d1b47a1ee8df6572c1bac56db303285ce0c3058/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/115ed0b8894cecbf994932782995d2f3247f420f/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/6c94cd7341281e1238950c56d96b9bc0729bc18e/
       nios2 |                      znc-1.6.3 | NOK | http://autobuild.buildroot.net/results/e01162bee0212edbba5b0244dae8b8a9c37111ce/
     powerpc |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/5a0bb67e792f29db8e4147b8b72273f462751799/
         arm |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/6b19b04b94d55f276c13c0b5dea339c733869c0b/
      xtensa |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/8014802a8cb4014e8d40e9d064c77b0e8fe9d4f2/
      xtensa |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/ba0fbd63a59ac20a67764b370c2f988deecc7e71/


-- 
http://autobuild.buildroot.net
