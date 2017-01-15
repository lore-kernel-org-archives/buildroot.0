From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jan 2017 08:29:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-14
Message-ID: <20170115072936.D94252075E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-14
================================

      successes : 122
       failures : 55 
       timeouts : 2  
          TOTAL : 179

Classification of failures by reason
====================================

                     tslib-1.3 | 19
                    ruby-2.4.0 | 6 
                 jasper-2.0.10 | 4 
            lttng-libust-2.9.0 | 3 
                    mpv-0.23.0 | 3 
               openswan-2.6.46 | 3 
                xfsprogs-4.8.0 | 2 
    xserver_xorg-server-1.19.1 | 2 
                    cups-2.1.4 | 1 
               domoticz-3.5877 | 1 
             host-nodejs-6.9.4 | 1 
                      icu-58.2 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
libasplib-f7219142e790a329b... | 1 
 make[1]: *** [all] Terminated | 1 
make[6]: *** Waiting for un... | 1 
                    mosh-1.2.6 | 1 
                      mpd-0.20 | 1 
                 mplayer-1.3.0 | 1 
        riemann-c-client-1.9.1 | 1 
               sdl2_ttf-2.0.14 | 1 
                 synergy-1.3.1 | 1 
               wireshark-2.2.3 | 1 


Detail of failures
===================

        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/68f508a44fda933253ae6d224650765b9373b08c
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/0dd17bc3ad18c46ed99d428898690ab53486f267
      x86_64 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/e79f824e76dab6c73cdb662979c7358c10c5974a
        bfin |                       icu-58.2 | NOK | http://autobuild.buildroot.net/results/98685c21b2a94e5efd1a876e4f53f64ee53ce7da
         arm |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/4ec8a1735590a3cad4b74630b4b6bdd2e3a7eec8
         arm |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/97001530e59062c36f27721877cb8b5c3ba8906a
        i686 |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/6504d7c3a74ba0173afa7773f45a1b7f39b7289c
   powerpc64 |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/e60c4a71a08aebadd0bc3fb95a57a4a223e4b6fa
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/d9b9fc2cc7045b0ace0f116b0beced31f122a6d4
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/f6aa2f283c3930aefcdb535437a55cd90094f146
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/7b1a22866e8e4b90775dd7beb8243ee2a0e09a8c
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/ca535adbf79f046792d7f6ec4edabca40d412c06
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/a6da8da6c427a2b59cab17db6504a0a6524094c2
    mips64el |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/f0fdf1378fe8bc15ffda937868999bb034c4bbf0
microblazeel | make[6]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/ca5cfaa4d1c031c63402738b73bf3f5d89489a4e
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/d62201076c0a5b88f431347cf62a99b6da463566
       nios2 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/57b1a7164d98f96788b183f9575d66c3d2e5a67b
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/102136068f95be680ecef4a7f243e21eb7fbe639
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/251f3e552cdc7b356c071671b1a823736a3785b4
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/b85130a58f58ca05fdf2a507ba59bf833068acaa
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/2aad87e2b49399b3b0693e54a9818f949bb16ecc
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/6d1c218954d41d55d1a45276cbd5704c0f09138b
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/cdc5036ac7be34137312e602695853ca9346fbe4
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/3607833c1b1d23924bd6ed995759a310346d449e
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/c3736380f0764f8dc07f007ffc859670a34b5844
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/6c92ecad4d8415afe58e3067fb1f9124b4bdc7d0
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/869ac5fb480e0dd7d40263515c15245aae01df87
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/d2da650b769e573877362d160dbbab1496bee1ce
         sh4 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/de4622402a295013963e3ca362ed3efdecc1b7c2
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/3efeb57f09351fb0e11c7aa34fc7acbbbd67808b
      mipsel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/e89c12d0ae4e107cdf2986586929f8225f9b4d6a
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/7ac26377ac817fd0d0d6c9e41bf76ad426133517
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/4c4112bdc6ce0b54dd682d340ac6bedbf409f86c
         arc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/1f0ba5d7ede86e552ab98dc00022a070898c5e5e
       sparc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/cb81abe996b0fb0070ddcd01c0d695bcc0570548
      xtensa |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/b5975f672538a194c0fc960e99f8c5f7d7590eea
    mips64el |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/74e4b052fdb6bb5770c575b05f7241615bf30609
     powerpc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/f22e45ff243458953feae9dd6a3c31aaa9938e9e
    mips64el |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/5e21d8cdcc54ca457d85ec86da0637b62b95d15c
        m68k |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/46fba13619631f42954c428aaee5101e759a6a80
     powerpc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/c424f33cc543112b71952a1a8d74ae600e94c516
     powerpc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/88add491e10f2f7edeb15e0def8843f1321ac7af
        bfin |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/8e901828fcd06f723ce9551d72e4c243f784098e
      x86_64 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/8928d855ceb5651e7faa2b5d6696b6cc0c84a35a
         arm |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/2367c91d9fc98b6c0b76c29f78754ffe1bc077c6
       sparc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/c29c7c7529f3af2b7620b193fe8a79a9e3b9b0cd
    mips64el |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/8cddb99b465ed2069e64f669947028c2db7e0b7f
    mips64el |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/5cdb9d22092e9222cc7e8fe8dd3936305a5d371d
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/2115038caff1e036cbc9dcb5cb6905abe643552a
         arm |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/b71e5939e35d572af8929e1b534abf787dad2c69
     powerpc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/9db1d64fd08c8763a1648e78d7b9155777de6cae
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/770dc6521b95cf7a84267f106db211ea2821bbfe
     aarch64 |                wireshark-2.2.3 | NOK | http://autobuild.buildroot.net/results/77ffd6956022e3f535a8aefdde8a36af05ed32b2
     powerpc |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/4539f8e1f0ad145f2751507e084a850fc870067f
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/eb555254e7694db46f23f436ba0d45ece1469018
        i686 |     xserver_xorg-server-1.19.1 | NOK | http://autobuild.buildroot.net/results/461288e5b804105d23e7718b7c7d7e0421e33dcf
    mips64el |     xserver_xorg-server-1.19.1 | NOK | http://autobuild.buildroot.net/results/9f52cbd031f63cf8c08ab84106e9009127579a83

-- 
http://autobuild.buildroot.net
