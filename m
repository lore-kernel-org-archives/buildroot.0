From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jan 2017 08:29:35 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-30
Message-ID: <20170131072935.3FC6620CEC@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-30
================================

      successes : 140
       failures : 38 
       timeouts : 2  
          TOTAL : 180

Classification of failures by reason
====================================

                    ruby-2.4.0 | 5 
                    mpd-0.20.3 | 4 
               openswan-2.6.46 | 4 
                 sngrep-v1.4.2 | 3 
kmsxx-bd5f6471e619a6ba2987b... | 2 
               librsvg-2.40.16 | 2 
                log4cxx-0.10.0 | 2 
                   ortp-0.27.0 | 2 
        riemann-c-client-1.9.1 | 2 
                     vlc-2.2.4 | 2 
               cbootimage-v1.7 | 1 
                  cppcms-1.0.5 | 1 
         docker-engine-v1.12.6 | 1 
            host-heimdal-7.1.0 | 1 
     host-xproto_kbproto-1.0.7 | 1 
                  lcdapi-v0.10 | 1 
                    mpv-0.23.0 | 1 
                 openocd-0.9.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                 rpcbind-0.2.3 | 1 
                  stella-4.7.2 | 1 
               trousers-0.3.13 | 1 


Detail of failures
===================

         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/e1755e189dbf5afad1d60ecee7215c7db4b161c9
        i586 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/98e140ddd4c43f72d2f2301c48678d83baa0f087
         arm |          docker-engine-v1.12.6 | NOK | http://autobuild.buildroot.net/results/027f3e7f0a8739f8aac7e97490a1442be8144092
         arm |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/b10bf70c34eecfa988f80627f2d047a79300feca
         sh4 |      host-xproto_kbproto-1.0.7 | TIM | http://autobuild.buildroot.net/results/311aa83016a224da6ec1d6c5a8e0139413b7f9a2
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/f51eee2fec2a5f237265b17c6f386b69d923dea4
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/28f7f21a7fc4527fd6ae8a00a2a9062599660246
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/85e1ccc5e8cd9baa7012fbbe843225d5ddf0cc30
      x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/fc3c66894c33baf5ef66c3720b0edb39ae68e60d
      x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/7b20dd42c44fe45ad3676a9ef89b3459bccab88b
      x86_64 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/14b9cab834540a01c9c838ea579dc73e383f754a
      x86_64 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/02946a75f478b1304896e7a0794bb6aa527e45c0
         arm |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/505a2733ea1225b7fa50536bb1f7765e4c14c89e
         arm |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/5184834056236f4ff68fb57eb56296cb9b4caeda
         arm |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/715a357abce90bf4b9c1135a73f3524d4d90a48d
       sparc |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/88a312ea1cb047945002be7a613056521db8df08
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/d1930075c396c004ce370307d9f6529ee7f689cf
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/53ed571327c814a23fcf03c7ad5bcd551b6732a6
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/d32b9bc2e5fb9e0ffbcc17b0e323b35ffee6611d
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/3cfa7ef93e9a57d661d81f0d602b9ab73b898919
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/d94bb37f869aadb278e41b13fc1fada312f3b5a4
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/e077ab8bb909ca7f92cca3201023bfc5307af20f
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/45e74403e23a62b22df75fcecb4fb6b0f751e960
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/b59fd4a5385ed8af5cf0a91ceda7e5fde92841e9
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/5b42cc7fa424a9b9a5817bad772050d8ae6497b5
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/828a4e09cb14c33b021bd347394104ff8b6dba78
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/8de7e533fed3c48fdbe164bc9286148e63494c8f
        m68k |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/f2fe6026c461c22666478309eab326cfd433efb5
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/74a7310bf7512907585dddbee3d3fa6d5a85d014
        i586 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/177136583b667585e030c97399835ee382fbeb59
      mipsel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/45b459c7e819ee8cde6258ba9034a33c11e321bf
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/c21ad8f4904c9f9a3e1b34ec2d0f2e738d850b20
      mipsel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/750e84bc30c68c9c7048af8a96ebdb03d4a9bfc9
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/9c3a468d8d527f7b901dddb35b8918647006221c
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/1125cbdbd0dc5c915a5819462c7d4721d3ba8ba1
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/0af1dd557cd08500f2811c93ef5ce1989c915783
      xtensa |                   stella-4.7.2 | TIM | http://autobuild.buildroot.net/results/616764ae5895fde636129f9ff37ebf1475f2430f
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/0860f33921717753bfd5801542ee9fdb0940aeee
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/fe908b9b1ce80dd7974f19b2e42b0f7bcb637a21
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/228fc969f54500b3c084b7a61c5378e7fa515b7b

-- 
http://autobuild.buildroot.net
