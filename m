From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 May 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-18
Message-ID: <20130519063004.AC69052C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-18
===============================

        success : 85 
       failures : 45 
       timeouts : 3  
          TOTAL : 133

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 8 
                  ne10-88c18f0 | 4 
         host-gutenprint-5.2.9 | 3 
                 pixman-0.28.2 | 2 
               wvstreams-4.6.1 | 2 
               sconeserver-211 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                      pv-1.2.0 | 2 
               aircrack-ng-1.1 | 1 
                    systemd-44 | 1 
                  zeromq-3.2.3 | 1 
                mongrel2-1.8.0 | 1 
                 rt-tests-0.83 | 1 
                    acl-2.2.51 | 1 
              gettext-0.18.2.1 | 1 
byte-compiling /home/test/t... | 1 
                valgrind-3.8.1 | 1 
                 qt5base-5.0.2 | 1 
                 binutils-2.21 | 1 
                 libpfm4-4.3.0 | 1 
               qt5webkit-5.0.2 | 1 
               libglib2-2.30.3 | 1 
                  libv4l-0.8.9 | 1 
                     pcre-8.32 | 1 
/bin/sed -i -e 's%^BUILDROO... | 1 
                 dmalloc-5.4.3 | 1 
/bin/sed -i -e 's%^BUILDROO... | 1 
                  poco-1.4.6p1 | 1 
                 libraw-0.13.4 | 1 
                directfb-1.6.3 | 1 
                   libcap-2.22 | 1 

Detail of failures
===================

   powerpc | /bin/sed -i -e 's%^BUILDROO... | TIM | http://autobuild.buildroot.net/results/d171759ceef2957cc20079602ab5c4b1f23acf14/
    x86_64 | /bin/sed -i -e 's%^BUILDROO... | TIM | http://autobuild.buildroot.net/results/61dcbc90d12a7b11fcfa2652c3c2da6536f7219b/
      bfin |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/82afd3d11d86ec2254bbb68f429d6adc74a1d771/
microblaze |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/8d035870027d528afee01d1bc2d667068d0c1dcd/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/03181c206db453586ba0d2e28c12ceceec096625/
      i686 | byte-compiling /home/test/t... | TIM | http://autobuild.buildroot.net/results/a2d4a5e97df1cd2277f5ce5e7e57761a52de0af7/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/c863cef492245257dc587cd3deb0c0e008095bbc/
       arc |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/33fdd7630cdf8820e0735832d0f81153250f97d8/
    xtensa |               gettext-0.18.2.1 | NOK | http://autobuild.buildroot.net/results/25a1f17f12c3b0c971acc0b6bcc4e90988fea24e/
      i686 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/27e001ab705e0f596662986ba93bedfae270ec47/
   powerpc |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/eb5df334b35db9feb84e462f5dea40ce9cdce73e/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/931ad8896fcc5d4f558f2adad76ec064be1790e1/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/5ceed2071f6fb21bac3457df9eaa63163b5f3e03/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/ce41d910820605968a292ac7d6e75cd40be966d1/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/c69add81a6e1115e9790ed00a3956df42f5dff30/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/b4bfab64a8e86399fc5b9c8a9e9eacc713e2209d/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/806cfbf4cf4d09851ca006ff02ec77f88b8ad77a/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/daaab1719e2b9b1529f770e61d2c9a657da1cbe8/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/69c1f5317ac8c34fb166e6a170a3a98a6dc143a4/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/aa1400eb43aa5438147a01aa625cb25698887a8e/
       arm |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/35008c85fe699c9d82d1a0abb990e0743489a97f/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/d78ae35d6468adc604c75e781b9ea1d18e4dad19/
microblaze |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/1b3cc46eba643187dd38d07e5d073c12bce2cdae/
       arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/4401e6c0c58c100722f3db598a98dbe1c6d3980e/
       arm |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/67398d683c6e4c571179088a7d3a7467476107e0/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/3aaf48ee375d1a1812f5bed768a4cd1414a94c78/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/55da7ab8ab441576bed33e5557294e1c6348d910/
    x86_64 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/d598e1878680df2419b747b9f9188a78c38f8b48/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/277725e08974cd3fcac086c000ac681248d74a1f/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/9ae2811bd535373b8ce48550b65edd7e0709c1ce/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/2404554fdb007860fc866c7c83b6dc8594f65e4f/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/df06caaa92011a72fdddf06e003b0730e383b1bd/
   powerpc |                      pcre-8.32 | NOK | http://autobuild.buildroot.net/results/d5afdfed39f9df6bdea8c0905a950cf3027b72a4/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/87aa282073e520518b41a8d503d54db590511de7/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/81f771884d01a853ff9e1b956a4e79036a5e82e2/
   aarch64 |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/6b5e22ca23736951543af6ee2c9a857399836e3a/
    x86_64 |                       pv-1.2.0 | NOK | http://autobuild.buildroot.net/results/c6434fef5b20cd5fde8cdde282fc0539d9f6f663/
    x86_64 |                       pv-1.2.0 | NOK | http://autobuild.buildroot.net/results/0bddd9960b32d04ddf373ad5523307d2965ce78a/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/50dbd377717e9236382ed1adf3adbe26b677bf90/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/6d7b3ee6613872dbd258e0921c0437d6aafb5a01/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/052720600263f98dc78d277cdee48f55f793680f/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/169e13c5eba4829d067a7eb9f019a392ac7934cc/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/31bcb590a05af79136e96c13574d9b3e87c29b90/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/a96a75cb95031e00582460f0f32152ea6b4088ee/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/d4f3bbc1845d2cf7133dffb6b9dc2c22879dd1b7/
   powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/1733e92a131df9f40a8b078ea7b9f05cf92a3560/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f3eaa2288192b0bc33aebefdc93398a48be09fa9/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/8926a6541e63dd02cf6532c1b9b46effafb278ea/


-- 
http://autobuild.buildroot.net
