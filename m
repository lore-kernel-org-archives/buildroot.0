From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Mar 2020 07:25:01 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-16
Message-ID: <20200317072506.C66EC88B31@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  3  |  0  | 22  |
  2019.11.x  | 24  |  3  |  0  | 27  |
  2020.02.x  | 19  |  4  |  0  | 23  |
    master   | 125 | 96  |  0  | 221 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   bearssl-0.6 | 10
psplash-fd33a9b3d68c89fa22f... | 9 
                  connman-1.38 | 7 
                  ffmpeg-4.2.2 | 7 
    host-python-markdown-3.2.1 | 6 
              host-grpc-1.25.0 | 4 
               libglib2-2.64.1 | 4 
                     avahi-0.8 | 3 
           host-nodejs-12.16.1 | 3 
           mediastreamer-4.3.1 | 3 
                       unknown | 3 
          gstreamer1-mm-1.10.0 | 2 
                   libnss-3.51 | 2 
                linphone-4.3.1 | 2 
                   mimic-1.1.0 | 2 
        perl-crypt-ssleay-0.72 | 2 
         python-markdown-3.2.1 | 2 
                 rocksdb-6.6.4 | 2 
               asterisk-16.6.2 | 1 
                busybox-1.31.1 | 1 
               dovecot-2.3.9.3 | 1 
               dvdauthor-0.7.2 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                 gnuplot-5.2.8 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
                 granite-0.4.1 | 1 
                 haproxy-2.1.2 | 1 
                host-go-1.13.8 | 1 
              host-systemd-245 | 1 
               libgtk2-2.24.32 | 1 
                   libiio-0.19 | 1 
               libtheora-1.1.1 | 1 
                libtirpc-1.2.5 | 1 
               libupnpp-0.17.2 | 1 
               log4cplus-2.0.5 | 1 
mjpg-streamer-501f6362c5afd... | 1 
                 opencv3-4.2.0 | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.11.3 | 1 
                   sdl2-2.0.10 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/19435cfbb6e0767a6da39cfe29060a8a1dab6e8e |     
  nds32le    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9502abbbfbbe4eb8527755a761d03e7d3ee52a36 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/043d37c0bd9e24c963d301110b343f849f5eb219 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/80ba730e0618648481179dad5176934c9aaa0f56 | ORPH
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/68ac05a3686b739cc634df89ca0827a62a2e4ac3 |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ab1fe15db9e299172f4917ea63dbc5aa9e23a9a4 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0dbdc1bd25ec83155b2be1617d0c040a9c195d54 |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/201ffe61f874c5a01b30b16992929cf7c8688de4 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/71c310bcdb9d10cd99455f5bfda030248780e7e0 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/67f5a4d0894372976aeddd78898d35c9af270910 |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a0d51631cc71e463866e7a7629fe6b4febb50a8e |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/399e5d7f2e6441e098f20508079ecad98e8f6b49 |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/230fa17224c647cd1e781d490c8077c681fcb37f |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/bd7ad60c62a4bbafb308d7fcfc127a10a6f69f85 |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/8786af065ebe9d1aaf0da1140e37362a4cd226cb |     
   nios2     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/234de89a9e3bf5b76ee5a521fa1b675a22371848 |     
  riscv32    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/ea8d7b3845ba2cd94184f5337956829f92caa122 |     
   mipsel    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/1b5fe7121d3a318fb82ef2a666c9e377dd41b48b |     
   x86_64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/deb9e72c40d3bbde1b1aa8f4e05bda020374fa1a |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/546be4a4a3829482dd18d16dd11dcdec75ee5c50 |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/bef3416bcee02b9d1507cf5b8f1817062c074d8c |     
    or1k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/7caddb7a4bb5ac7f0a71c95bfc14d7d81db5e539 |     
  mips64el   |        dovecot-2.3.9.3         | NOK | http://autobuild.buildroot.net/results/57ca8794ba871a14d5d6484c2c1c82dcadc77d40 |     
    m68k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/90e71e1b6319271c5c68e6520f119c15067d478b |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/bbcffa030a034eaa4f8e6de80862774ba014520c |     
  mips64el   |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/83387ccab066b383eb27113a769a4abdc5355e6d |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/2f7440375266db67daa2f315bd4d4d84f040b250 |     
  riscv64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/697f39ffa0516b6ddabdb95555a80cb41b831c08 |     
   xtensa    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/50e8fbdabe0944884ffd4b24729badad5a2a0e9b |     
  riscv64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/4f9fbc3ac9c23a2035f23c228c4b8e6b7a5a7c07 |     
   x86_64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/b36e971c33f2b601fd936b30ccc42bdbe5032c26 |     
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/674b9728eb884807d8eb50a67418c40639b71a92 |     
    m68k     |         gnuplot-5.2.8          | NOK | http://autobuild.buildroot.net/results/032eb179b3675f8bf2494296c347c61e0e2d54db |     
  mips64el   | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/4dcd5392830fcc9b9cb4540105302ffcb3d00629 |     
   x86_64    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/35636eee391d76e0f7d070fe14206616c74a6990 | ORPH
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e7ff307cbdf031f75a43f7f1285e286463dd5120 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1bb7ff659ec6f02a618932e7695f114be17d6882 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/91859b5c1b38c185c81060ed85eb15a89b6509ba |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/545269e72ed8298e3e956535f87c98261fb49532 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/99466933963304adeadbae14833cba1439fe2e1f |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c11665e1466016b1aec84cc68d93c52b1f1a067c |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/27f13424ba3a08f6028b4248afadd7b016911afd |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d17fc1392e708d6b19d75f488d491e91bfd8b8c0 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/d217908e3a340f8c18473503680eb1c91edbdccc |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/dc24321060c84f544b27fac60cad304918abf3b4 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/5d39cbf74c9bc26f02e99aaa30a99639fe476763 |     
   xtensa    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/40aa0f9189a7bb8b6aa6b2d6c3c2e1a7ede43d58 |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/d24ae15f7d675fd64a5c7c5ebfab3b2a00161e8c |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/1bfd48804da51f3d1a2e59dccfbac769684401b3 |     
    arc      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/e711f4a84814a3e21273e1727287bb76d2e0286f |     
  powerpc    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/c7a0e6a55c5256669a5c297996aa12d98f58df8f |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/abd7d47f0d43c7cfa800f8d80f2df2a1d0087b69 |     
  riscv32    |        host-systemd-245        | NOK | http://autobuild.buildroot.net/results/17e5cc48e6a1b6d49e4664f93ca927a4c3fe2829 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/8fa5a5dd4658c1b717d31e3d8a74cdf88171249a |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/3f6cef56109eb85973c57e0d69afa68ca780bd5a |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/e5aedc46fee44d8f5c9611868172abba774d7741 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/4281a236918a8fdf8f9ce5b65efb3eb03bf576f0 |     
powerpc64le  |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/58b8fc7c088a0e9d21f8ad365c23d8e1ec7fe912 |     
   x86_64    |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/af8b842fb3bc4a4960d46c6cd212d300f0cd2caa |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/4da6fdd51c0b8a9caff8e41af110f50a2fe29e5e |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/0224f6e60c92ddf5bb05b239decf2006c132e8cf |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f9b6a7d6cb0a6a9dc4aaad5d813d4a5ac9ca2804 | ORPH
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8a50e4ec08d38298a93d81c6cd4f00d34684fe3b |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/40db5964ca1cb56e885e57f014128a528e21022d |     
  powerpc    |         linphone-4.3.1         | NOK | http://autobuild.buildroot.net/results/244b1a28ab9957c48e6742c42433a6be651261b2 | ORPH
  powerpc    |         linphone-4.3.1         | NOK | http://autobuild.buildroot.net/results/16032944c892f7a494df3d26af51050f0d3ed3cf | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/7d8b9f408ac0226719b42edbda741b6f0b75bce9 |     
  riscv32    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/3fcb7ce347cee69b4d7097268efff12c1a1bcc9e | ORPH
  powerpc    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/5ab6c1b9dece5e658044c1d9d3b7e42093c9eaaf | ORPH
    i586     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/76827f71c155a8ed6642429ab60c91abaf1c72ea | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b9dda6c4bf96bbc87a739b02fce657df0f3b15d9 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1687c93a3947ca2019d9c543bb762e5a2463ff94 |     
    arc      | mjpg-streamer-501f6362c5afd... | NOK | http://autobuild.buildroot.net/results/9eb55525aa2b05af89885f2aeaeb218071ac607f |     
    arm      |         opencv3-4.2.0          | NOK | http://autobuild.buildroot.net/results/58c1d13e20a38de344de1dc373613365145b4c9d |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/7c7dc9770e98115372887007d6d965a580d9a160 |     
 powerpc64   |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/b422bb707c3551678b5a9c33ac7f493b7556b7b5 |     
  riscv64    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/a427e8917e3232f76a2ffd00c68f84cb3afd10a5 |     
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/89c07164b73822b73818626de0089dcc44e6c4b0 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/8a38135de125734235b94afb8c6c99b9d638fe70 |     
    sh4      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b3e5dfa5a41d67fcb3e9536af0cf39214624dd16 |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b31815b594fb7af8c4b15ba1c8edd4e9aa84426f |     
  mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a3d4ad8b3e38e7b5a5606e929d741d9eb668ed0f |     
 powerpc64   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/0fd96d92409178dd5863eaf3d578d2489620f20b |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ce01785f138cf9397c6f2dc0df20212c8102a592 |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/0d66a51a8c9e7812f6fc448b7d71c689f56cbc12 |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1aa22c9db0baa4888faaca814c79716948ade09c |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/f6c3b8dc2ac19911e3f8040e07945e606f8ec8f7 |     
   sparc     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/ea718a35bd535119e774c3ef9ab2196d8c69d4eb |     
    sh4      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/65485b539ee7a8cf177ebe0bec6e50da3b47edfc |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/5c8df1327e219fcc533e3017e443d188ef17d5fb |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ca16b3b02454646e32ed4c39f68cfe3fd47acc8f |     
  mips64el   |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/88b2ce895fdf2840de862dd34c197efb4977a34d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/12d578095ac511bd291c442cb3773936ef7ee259 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/3a65b096aaa97ba75e0aa0cbd23f69cbf6cf3918 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1cefeb4657f4a24b212b0b5d30f17d1bd16edbb5 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/99d96169916a40c7af4ec3ce0be72c5d60ceaaf7 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
                    wine-3.0.4 | 1 
                    xen-4.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/04e3d7a7d68b96b8f8f0652c0cddc4f942c813c1 |     
    i586     |           wine-3.0.4           | NOK | http://autobuild.buildroot.net/results/e38a06a26cfd14e208c054c9b428cddf22d9ed96 |     
    arm      |           xen-4.11.3           | NOK | http://autobuild.buildroot.net/results/4f71eaf39cbe62bc42e930a526ccaf03632f531e |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
                    strace-5.3 | 1 
               wireshark-3.0.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e52788283c8484d9c5d29b703ef1459310b68f74 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/0d4844f57f29d44132f021465727e91fe59be153 |     
   x86_64    |        wireshark-3.0.9         | NOK | http://autobuild.buildroot.net/results/73cfb5d93f9ebb380e25b30a12495566b5b550e5 | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-nodejs-12.16.1 | 1 
               libglib2-2.62.4 | 1 
               libtheora-1.1.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/194d99cf74eb6fc03e30f79d1ecdccccb3a7c6f4 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e774abdb3d798d88fed010ffdf0df481e0bbb317 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/7afc2cc8f1b4b69da943abce6ec6850c9388149b | ORPH
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/e3273ebdcdb442db5a3f2dc103a24f8423b9d10e |     



-- 
http://autobuild.buildroot.net
