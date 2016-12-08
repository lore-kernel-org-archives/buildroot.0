From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  8 Dec 2016 08:30:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-07
Message-ID: <20161208073030.F325D20D88@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-07
================================

      successes : 195
       failures : 71 
       timeouts : 3  
          TOTAL : 269

Classification of failures by reason
====================================

uhttpd-59e0c739634f46a164d9... | 8 
host-pru-software-support-l... | 7 
                     efivar-30 | 6 
pru-software-support-legal-... | 5 
                 libnss-3.27.1 | 3 
                 pixman-0.34.0 | 3 
                    rpm-4.13.0 | 3 
             rabbitmq-c-v0.8.0 | 2 
                  stunnel-5.36 | 2 
               tcpreplay-4.1.1 | 2 
uclibc-ng-test-4ad1c23ae2eb... | 2 
             berkeleydb-5.3.28 | 1 
               bootutils-1.0.0 | 1 
                   cmake-3.7.1 | 1 
                collectd-5.5.2 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.1.4 | 1 
                   ezxml-0.8.6 | 1 
             freeswitch-1.6.12 | 1 
               host-qemu-2.7.0 | 1 
                 jack2-v1.9.10 | 1 
                  lcdapi-v0.10 | 1 
                libmad-0.15.1b | 1 
             libsidplay2-2.1.1 | 1 
                  libsvg-0.1.4 | 1 
                   lite-0.8.10 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.0 | 1 
make[1]: *** [target-finali... | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.20.0 | 1 
                 openocd-0.9.0 | 1 
                 openssh-7.3p1 | 1 
                oprofile-1.1.0 | 1 
                    php-7.0.13 | 1 
       poco-poco-1.7.2-release | 1 
                    qemu-2.7.0 | 1 
               qt5webkit-5.6.2 | 1 
                 rings-1.3.0-1 | 1 
                   rsync-3.1.2 | 1 
              sdl_mixer-1.2.12 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cf6afac0153ee6c29b5083fd6e7ece426bcbcb17
      xtensa |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/6926db2b59954a336f8f736af131ee7f810c97ec
        m68k |                    cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/16a5e1cbb57c0124537c4f3dc0807ba1eaa975ec
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/014769586c31d2ddb065b339344f14ac77390dc0
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/e7738bae3a20481ca1b2e3636234d62337b63dab
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/766f903a9a88d34e21d45d42c072a00c46824462
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/5b569699e876a3fdd0efda35fdab16afd3236901
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/c6fc79dfcd85440df7d9b66e143ba4df33c7712c
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/5449cb8a22920db4cc16266d5588f5aad1db6f76
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/e2086dbbe9caf1fbad543f4c9732c54532e93c6e
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/3d1611d23982ea51fe2d7d611c735c35da7642db
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/491500d64f49bff0c57e5879c55700b17586eebc
        m68k |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/25eff9a8afcab1c0fe1f81a26d70fe8c6a36ddb9
     powerpc |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/4673c46a4864093862a5192ddb6cb30404ddfbf8
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/93f3c1d279b4057fa743b60a10f3c97fc602dea3
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/83e3cc6dfabb7d2682f902cd895d9d5460c056fe
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/652db02204f43bf381dada428aafc37ef1221812
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/de92d0b92339690481300ae80b1e3af9b4b4bac3
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/b822d0387d2673e61875c59089c2ec7d582a9639
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/5e0292987a94c6c0653e3437f8490ce8c5ac7745
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/ece1407b9f32472fb55823bb554dc026546cd26d
 powerpc64le |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/a2d63e21c3e82c36f4a975e90ed56faba18e97a5
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0c352b072c6f440a4179308acf3f003a5463ef2b
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/278f90b93d5506bc9b7fd72515c7c249c3723b2a
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/6b1533de269b1d224e4012db80c68496f3ff79be
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/87ca4f7b28d5e222a2c4736f25ec63e5813ab616
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/914dea6d758993f5f85db78de533f351962d2a98
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/156f6f9178167f36f496cf484e37db0c51d4be6e
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/d4e494897f40239937593a14d974850a6646bcde
 powerpc64le |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/d6477c146af4547368c235fbb5a98e1579d3ac5c
         arc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/bf43cf004168ec700577e3895d14da59bda85618
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/49c563868136dd1d32ca2a20d40a0955400c9e1b
      x86_64 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/ce0b438ca4dcf7ccef95c7050305d8cd58fbb24a
      mipsel | make[1]: *** [target-finali... | TIM | http://autobuild.buildroot.net/results/97e1e18130189eb98f3927a1291a23d09f2dd4bd
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e4ee62e26a6621dce4e5f604a0f527a642a376d7
 powerpc64le |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/4371bdb448f6c35f723a6924b28478344fe69d4d
   powerpc64 |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/4da17fdd07a31204d6fba3c38fb67a0e1e8ab484
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/ae9e06d9a1be0a00332bd3ece3f561feb8b4dc23
   powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/d58bcc7309097ca39224b8cbaa5f833d86f34279
       sparc |                     php-7.0.13 | NOK | http://autobuild.buildroot.net/results/6a86f6cf07f6b6dccd7bfaab6d7682f9faf3527b
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/61e514202ee84856449bb7c3203252b5d9848402
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/7acf7f3f825372cda453a0922e6f8ebee2fb3a34
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/3d563fcf1b64e0447aeda5335dbc357e49b9976a
         arm |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/38834ad3013fe79e5e4f75997133f1bd827be6dc
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/c29fa1fc518713014e30445e883e0bb175708938
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/be78eb381d5e8cfc61b2f4370a99fe94bc3e37a3
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/b326bef7cdea5c7bf3e12abba6d71337935937a7
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/5da684b41888b0ef9624ace224fe828eff58f82a
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/76ffdb40a8f3cac555e3189e90dedd8199f07e37
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/f19f7642d23e1cfd5fc49eb98a360ff0283bdc8c
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/5c2152ae96e908df1761a9438275a7b97564ad34
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/4b67f575dc627bcfa817230b4cf6839b2cd79ae7
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/7129b0ea376578878c6014ad46cbea29e84a97e1
      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/881ef023a5381fd2857fba363416e8d58bd18595
   powerpc64 |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/4e0b98e152d3b016d0e88da1ccbef2845fc3d327
      x86_64 |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/a742b9c96e9a53b8bcf2c00e213cb7978ee11496
        mips |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/b23110e01829582c03e5795f22c024431acf9fe3
      mipsel |                    rsync-3.1.2 | TIM | http://autobuild.buildroot.net/results/4c1de9c1d701418bdf298c3c9b3e3140e84d079d
         arc |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/02593e7f2eac19b77bcaad3b0e9e8f9473055d47
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/516c77223b515cccb55461df5d47fe9ef6273102
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/e5e2500f04b7e5a71d2e0b7526197c3673d055d1
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/065fd1daafaaa841c0d5ca4d24c400c00b1cc92c
         arm |                tcpreplay-4.1.1 | TIM | http://autobuild.buildroot.net/results/f50d56d1723178944341fe0428300a426de8243c
        i686 | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/3f58f72dc0d1d1aaeb4894d8914aca9f900958c6
        i686 | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/d15f3303ca114306f511a87f22d7853eb4371e08
     sparc64 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/febbd094090e14fe7a79e6f691c290075da4fd59
    mips64el | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/96597bac990d0dece4c22d27bdf7586d035634cc
       nios2 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/eabd14b7d36685f6444d2bc332052aa496e2dd36
    mips64el | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/4be58e1749236ad02b94405fc193210d232214cb
     sparc64 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/83f3c0e14802a8887bbd1017d9b907ab8aa85aeb
    mips64el | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/5920af11789db7e032c26f47f65ad4e5266356cb
       nios2 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/feddb350179bae129c2f23ec28954f3764ad53a2
      mipsel | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/ce20fcf63fad036638c4eac2ef4608f07c15e5fd
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/ce03ab32d7d822be7b1f8739ac1d8e5c6afbaa76

-- 
http://autobuild.buildroot.net
