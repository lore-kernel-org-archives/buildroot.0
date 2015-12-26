From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-25
Message-ID: <20151226073021.2CEC7103751@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-25
===============================

        success : 217
       failures : 130
       timeouts : 0  
          TOTAL : 347

Classification of failures by reason
====================================

                  libffi-3.2.1 | 12
               trousers-0.3.13 | 11
                  boost-1.59.0 | 10
               tpm-tools-1.3.8 | 9 
                   strace-4.11 | 7 
              rabbitmq-c-0.7.1 | 4 
                  ffmpeg-2.8.4 | 4 
                  connman-1.30 | 4 
                      pv-1.5.7 | 3 
             host-nodejs-5.3.0 | 3 
                      qt-4.8.7 | 3 
                    faifa-v0.1 | 3 
              gst1-libav-1.6.2 | 2 
                harfbuzz-1.1.2 | 2 
                   erlang-17.5 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
              alsa-utils-1.1.0 | 2 
                   mplayer-1.2 | 2 
                   libnss-3.21 | 2 
zbar-854a5d97059e395807091a... | 2 
flann-04b4a56533faf8c8228d0... | 2 
                  c-icap-0.3.5 | 2 
freerdp-17834af7bb378f85a3b... | 2 
                 mesa3d-11.1.0 | 2 
                    exiv2-0.25 | 1 
                 setools-3.3.8 | 1 
                 fio-fio-2.1.4 | 1 
           argp-standalone-1.3 | 1 
                mono-4.2.1.102 | 1 
                  autofs-5.1.1 | 1 
                libtirpc-1.0.1 | 1 
          libcdaudio-0.99.12p2 | 1 
                 qt5base-5.5.0 | 1 
                collectd-5.5.0 | 1 
                    dash-0.5.8 | 1 
                   attr-2.4.47 | 1 
            kodi-15.2-Isengard | 1 
                   ntp-4.2.8p4 | 1 
                    ustr-1.0.4 | 1 
                  snmppp-3.3.5 | 1 
                    vpnc-0.5.3 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
             util-linux-2.27.1 | 1 
             stress-ng-0.04.16 | 1 
               libcap-ng-0.7.4 | 1 
                     vlc-2.2.1 | 1 
                      gsl-1.16 | 1 
                     mc-4.8.15 | 1 
                rtorrent-0.9.6 | 1 
       openpgm-release-5-2-122 | 1 
                   systemd-228 | 1 
                pulseaudio-7.1 | 1 
                  prboom-2.5.0 | 1 
                busybox-1.24.1 | 1 
                  libnl-3.2.27 | 1 
                 opencv-2.4.10 | 1 
                     gdb-7.9.1 | 1 

Detail of failures
===================

     powerpc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/c673cb15bd1fba9df90a673a3a66a341b072ee2a/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/0a8da3fe5f20dd42be72324326529c5a01cdf75c/
     powerpc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/1893e5bfbe8c76c85c8194e1f4d5257277f2439e/
     powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/ae92d7841c4807e4d50715acec8783f9d3b02360/
         arm |                   autofs-5.1.1 | NOK | http://autobuild.buildroot.net/results/3609b6dfadc8326d5b49dca8e2aae9b22a24b569/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/f400db5d90250aaec3f520532ec2982862e66d4f/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/b670a88a80fa27fcac6c0486b4dfdd441150b149/
       nios2 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/310e8d50862f6d9c05edaeaa164920309f82d307/
      x86_64 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/9e6fb854f4dba2f3ea3882cbeb4c1d4ee067f8f4/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/a0d320d9a47e381a3795da82d088d147cc27550c/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/449f273cf48f61b17caf4b8c723116d8473bea48/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/ea9c953efb38c617b29ff0bdb90971c4b84e001b/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/96c3d0250fa647854ee94cb6b5ec90a29ba1ebc5/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/5e646653056ab15bfc25127cd896cd6ebbfd0e31/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/c2ded9fd54ecddd17349cebf3fa0f18b662fa8a4/
     powerpc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/b20dcecd89849271dea64bd29920ab4ed5cd63d1/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/a41d9ff98e47a18bb85ef544346f8424ef3ea0f3/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/48b842ff090ef4fa0340b70f21e338c3645d65af/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/54a4e3a4cadab0fd8cb48b7536a12fd2f21f6704/
     powerpc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/b783cd2a8204e97289d50d3a544299854d789a15/
     powerpc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/3ae959f15d5ec8c9733d28f473b877a8483b2fef/
     powerpc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/f25eaebe26ffb01ad3fc164f59487799d81ca00b/
     powerpc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/da4ae1a408f9ab350401295f85e327370811988a/
      xtensa |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/8e24fd20fec31ddaa20e731fe87c231a43318589/
     powerpc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/e9347764c83bf8478f7eabad7cdcfc01fb237d6d/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/9a4f5b1f44b5fc4b75937c8192923dd31eae7236/
     powerpc |                     exiv2-0.25 | NOK | http://autobuild.buildroot.net/results/5cc439332231fd97ed627220c69d8394dee52da0/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/dfe448789bb43994f346ea9dc32bc8c10e0672b8/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/32b1b2cc9b03450a76f34ce397d5ed57dad1d432/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/ea8539abcee098a05ed53ba02e498b4fca5085a9/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/c3ec78fbab228b4dc2c344bcbc34c0a22b53edda/
      x86_64 |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/95f8bc3a413ddf06e5284517097b554d559c293e/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/07ef70dedd2c9f42d55cdcef3f4b489a77663d36/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/dd7e816999c0f0a214907d9bac5c2929f3c395eb/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/022294965d7f09944b49042442b56363bf0531a4/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/4df63815539c6adf97e8177ec7d6e4cb02dcd986/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/2c32b04113bd223df8f5245300727bfe253e5378/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/ac78ca5bc866be3b0618b109bce0e60679b4439b/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/8a2ec46562d180aad42a33513041c89615bf1fa5/
     powerpc |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/e505c0979c5ded94ddff0ffda90a7a23cc3d29eb/
     powerpc |                       gsl-1.16 | NOK | http://autobuild.buildroot.net/results/9823cda67fd41729b52a1bf69f84be540601c048/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/21756279fc44dc9a6ac4316f05d519be5ae7e95a/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/d4f754c457697d99272bd493050ddc1aa4d56abd/
microblazeel |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/79fc8c3bd395fec7412742a38f96a2425aa00e98/
microblazeel |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/678a5f270c940917951c89431d488f1ca7e7ae63/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/d9aec6c6059df5f236b3cbb5cb7d7969d82f25b3/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/8b184f17eb874b739fef35ad361547ab6946d5fd/
      mipsel |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/1429c683c12811f04b05a030c31922a182fcb7b9/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/a2a6698c8628143887ee070d68df08fe9a4e961f/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/e05980c610a306246dd8fb268828ae3a9b697704/
         arm |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/222e8f3392a794b693ff0a9617453bdffbce8aef/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ae2ca2ebe441696f66035a6d86fecd96773e5524/
       nios2 |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/c5f741afb44128d180aae1970cfc083d2429ff56/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3fce1a6c899a5f3de3f85bcc9311fc6fad2a2771/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5547ab8e8223076c1ba0b587e04016cbad57156f/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/251751de854745569a7caab36527c27abfa12239/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/52d6557ce86ebde27a8a97c419a3a2e749f5dfc4/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6f5e36663df4a27c1955dbd34b63143d97789ded/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1733ca9ecda3db1b3b43ee7a016f7d39844a0c49/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0b94e6ca8f4d2eb257acafd83f02cfa1665ee062/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/264749898e006bf2f5a8c70e05484ba11de11e8b/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/be7be2c003f1efd4df1c1ad80a1d2c5d4c5f222a/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b682689288fddabf60778387b973f2182ef41d17/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b6a1d0d2a6c8649363bd6e968e4696c6a29d7da6/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/56e5e8bc8dec55110abe8668c1b5ba9234a52b5f/
     powerpc |                   libnl-3.2.27 | NOK | http://autobuild.buildroot.net/results/fd97b1e65e4d5c3c26fea1c0fee647c3f87e22e8/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/de97b675a97f301fb6b4b043747a305e9cca8950/
      x86_64 |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/bb3732e2e22432634ca78bce655ae87f7cde9fee/
     powerpc |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/ad61c35b2b56889e524efaef3b560df6b9b0b509/
         arm |                      mc-4.8.15 | NOK | http://autobuild.buildroot.net/results/6f95455792ee8d0d571083d927827ffb7f4e1f8c/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/49aeb2cd30a8a9f654133477c12e21feb9279a47/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/9c6a66eeab076e73d352c59fe35cb87e2f834889/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/9c64a2594f431810ed3d2f7477a3254234702d93/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/79ecae0e8af47573adae533a9e97809a0978b531/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c7193c60067f0c2618a7ca28859a533ca1fab143/
        bfin |                    ntp-4.2.8p4 | NOK | http://autobuild.buildroot.net/results/0277c35189c187c777642f808c7e85a00caf00fa/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/3aa278d2a74758d0298d61aec6dcc6b88973660b/
     powerpc |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/728ce5cfa3245ed6584808c63e5657ff90e74545/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/50f29b9fed72ac3ab2f668e1bd27ca39f3db7a9b/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/1c31c9a8fa93dcd571d827f7c967a4a178220917/
         arm |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/1e5f6a5f349800226d8b07601dab68ffe7794461/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/3dde3cf3905b18fb18310d906d8657eb414af5e2/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/9d994181fecfa263b86f2d664464f585f5edc9f6/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/3dc6ddd43f4af3055f58ee2508cc7a11e3e98de6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bdc68837e64d381e5266407328feaa6dbbffdd9e/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c8654769c44956ff2acd7feede0cbd9cede6f6ff/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d87721adde55d62bf6a58aadad71d9213c45f403/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/13355f2d6f996bea4155d4506e569dcef1ff0cb0/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/725b8d7a5912de43e4d65fbd15ac706d0500330b/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/033d8e889283fb46cf4e1a30ec27e806737d71be/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/b011726df376a3c3b9dffe4fc852263a32b1b9ae/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/3a196e45365ad91db074e3f9c60e4b4e17f643e6/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/e5222041d89ff85e58035a8ddcf787f48a83a556/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/8a05885357c7ee1e1b2a6dd59e384dde1ad8f8d1/
     powerpc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/61b14cf63cc279cd99b0412c7598820480338468/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/3ea23f4a2238593d7a455fc33fda7a159e5008fe/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/e9f24efce76f41689e1186fb197400bb8f3fc1a8/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/d00bff32d8967706678acadd15a53fd6bb51963c/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/f25c23003ed282b935f5289c944615860265364a/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/7238f5cb88387bc2ebae848af1a14506614f9b27/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/c4415a264c543b175835ac58ac73207ff64f124b/
         arc |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/79c47cc79dc2fa5bd3cd870c751a3240b8d73d0a/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/6e396149b1dc5328688597c5e07e4ef7488e1b45/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/04abe0577d5e4890467bee30aa5f2d11042d24e1/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6c1c2a75a12ffb5eb3cf304e6cc211977bfa3dc4/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/3a8567b6233b6814f59d8992f294ea4783db26fa/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f6083a9adf57e612b292e91f3bfafc3b83028a06/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/e8075d2a84860b6351f40a8a6d5c26555f3d5d7e/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/2841b3d80e1d3d44cce08d413b9fa0a9fa95bb09/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/663955b5253484a1dd46e0ce96b47e85df3d8d42/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6213c9ed20715659bf861d9bee2b6a8a884ac6a4/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/f85068b07aaef354fcb38062de8739498ff86d79/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/1ea043bf56fab7aa1b1dd61061cc77e6d2bdcb6b/
      mipsel |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/5d7bf4119caa333cea7a88cad229650b8dc5c779/
    mips64el |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/fad66e88b5a97004b21658d413f4d3a6d0d8838b/
    mips64el |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/c6494cbd08c0461f1292a109f61f7c461e7dec47/
      mipsel |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/de1ab0e291d1aa8555a6144cd1e0ee87439c00e7/
    mips64el |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/5ba00bbdbb19c0b670bcfdb99c087c24cafb2677/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/c7e23b8ec2c69798482868e18311ebf2c01b65e0/
         arm |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/1a53d929bcec840cd18185e54b1a6da8aa849269/
     aarch64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/812eb1d72cb716c169d35c5c05a7f62e7d61fabe/
     aarch64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/167f56343aed22a9d8192ed7f276c31e2ecd4526/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/a1ccdf405c6ea1479b2824a6ab51c4608e176cf2/
       nios2 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/876fcda7b157416099a7b4d38fd4881b62a2f415/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/3f9788c33061e7101f95b7fec25b7b1485d8c243/
         arc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/a285ffca9529c3144d1a0912044d921dee95d7e5/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/ffcfdbcb1e855d8db896d784c53868db1c8bab8a/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/ccdcedc83208048582da8149097bfb9ce0235840/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/87929638f06e5f5fe4365d4f08efb0bd81199ca2/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/4546e053893839636c39f2e460edb2686d69d1bc/


-- 
http://autobuild.buildroot.net
