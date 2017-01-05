From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Jan 2017 08:29:54 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-04
Message-ID: <20170105072954.29F6720772@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-04
================================

      successes : 183
       failures : 91 
       timeouts : 2  
          TOTAL : 276

Classification of failures by reason
====================================

                collectd-5.7.0 | 19
               libglib2-2.50.2 | 16
                 clamav-0.99.2 | 15
               sdl2_ttf-2.0.14 | 7 
                 libnss-3.27.1 | 4 
                    flac-1.3.2 | 3 
                 gnutls-3.4.17 | 3 
                espeak-1.48.04 | 2 
            lttng-libust-2.9.0 | 2 
                  apitrace-7.0 | 1 
                  cppcms-1.0.5 | 1 
         docker-engine-v1.12.5 | 1 
                  ffmpeg-3.2.2 | 1 
                    git-2.11.0 | 1 
                ipmiutil-2.9.9 | 1 
               libepoxy-v1.3.1 | 1 
             libsidplay2-2.1.1 | 1 
                log4cxx-0.10.0 | 1 
             lttng-tools-2.9.0 | 1 
make[1]: *** [action.o] Ter... | 1 
                    mosh-1.2.6 | 1 
                      mpd-0.20 | 1 
                    mpv-0.23.0 | 1 
                   open2300-12 | 1 
                 openssh-7.4p1 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
               polarssl-1.2.19 | 1 
                  qlibc-v2.4.1 | 1 
        riemann-c-client-1.9.1 | 1 
                       unknown | 1 
               upmpdcli-1.2.10 | 1 


Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/7b2c7b2bcba1fec1a0d5dbf5e525a8d5c2030f2b
     aarch64 |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/68300658a4b3d7c980ffd669281f93c357b8df35
         arm |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/04747effc1b1aa13ffcc70cf003edb6d7eb8ce58
     powerpc |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/e8789b2df047264fa6d43ae69de88e80576d0853
         arm |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/d820df81343e444a3419473b61e3c78d31b137f1
     aarch64 |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/eef9a2dda2c172cd600dc74c1e5e60476d92280d
      x86_64 |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/b6ba2dfb42ee41ed0b8304aa8c78645245f3b341
         arm |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/59cbf9b84dbf1b95127835e5a9fac171574bdb77
      xtensa |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/305a15310ab13ab7de8c3a9305ef0d230dd5136a
         arm |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/3a3a9e391af5ee7773e9e3e94b96fd5cc3d29fe8
microblazeel |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/82798118795aa6334b4dd6eac06777682131da7f
        sh4a |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/c2a01ede3114703eb31fadab3f2e1552682c98f7
   powerpc64 |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/e2168ee129472a827cf9a7dfc8bedbc774f89c36
         arm |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/0d0435c4d56592ac7f77358b76c10a379b0ca6f5
      xtensa |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/9ff912a588a0f0eba43d245b8f2432380589acc8
         arm |                  clamav-0.99.2 | NOK | http://autobuild.buildroot.net/results/df8a73d31e3b73bce060d33d1895ebcc92a7e0f0
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bc21627ce0e83a6b34923cb1388e2e97b2ebb3e4
   powerpc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/84f90c6c3ca83c6f3f0a558173f17d86c3b12d7c
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/6d1c9efbb769862aa85897020366cfe8abd51c53
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ea67d5bc07594ade9ca2ffa23a448190ff0e9107
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d728f615d683a2198ceefd1df7a050d2b93f5cf8
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5f35b2c927f4bab153facd1a81a5528a850168f6
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d9dd9ba5df04f9536f8b771be1260c9064ffea18
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0f33fb9b70817985ed4097887231cc927286034f
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a8c09288f4751351bb2bed2df27a94ec85bb9332
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d6262628b58f482c479808e316fd697e8e9520e9
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9ffb7bbf8928b1eab931b88d35faa4a4051dc4ce
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/769a8a734e277e09d792c4e6587512108e7651f6
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b5f649c2345748bad2d444095ca0d44c5d0a4702
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a872cd8f9072349ebe0a7d52f82339d72921f9b7
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/cf61253c8e38326db3735b800e67aa27ac9357a4
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c35dac4a4f637af7a07330a59aef93d0e62de578
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ae75fdf02d50a09e2ad4b853d28c9846e3769341
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c0d499bb1f5b0b03f7960107c98740eba96385cb
 powerpc64le |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/954f65c83b54293e2a8675f860b557fbcb230caa
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/0dd468cd22c8ad4e78beb8614ebae2e958549f39
      x86_64 |          docker-engine-v1.12.5 | NOK | http://autobuild.buildroot.net/results/befcf8bee4fcb90644312241819d6fa1c6a30374
       nios2 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/092156dd7e236424d3f568f5d1967fc5119cccf6
       nios2 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/6019e70b1c15b3fecd4760d0ac9967604d7bbced
         arm |                   ffmpeg-3.2.2 | NOK | http://autobuild.buildroot.net/results/d7310bce1c40b71ed863e39382b08f9c73ec215d
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/97fc1cc17ff8fc021a102fade0fe1dfa8dc17bb2
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/ef180745d06115595f60cc22499c31c30f9c66b8
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/007625197cb1829f2e3a832a0420336f3aa66c8e
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/aad318c44763d74bf803a23a152f22eec78dba0e
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/b5db71ab8ea5a3f6d1012e9936d0e1f738528594
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/06425b6cb270cef74031bc1f151a3cb52faba672
         arm |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/566b8d65d9700f4079c53c029d4da057cf5f7ee6
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/1ae5f7482dd64b789b9b8561b1885e6f8619eac2
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/dc5cdcc6113ebcc3be103a384b9a6f4a6ec8d1e2
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/e3b199b604dbf7ffc8422582362298504d5cf441
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/c3fda0bad09debc387f2566f44a57fa3a38bc0ac
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d91801e62aa9bf07eed7b4ce24608e5fe65cd95f
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/6c0f23f4e177e86c95685d971997577a9e5c439e
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/6d54924b40ba54ed347c1782c3a4ac611dce0798
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/70eba26a494c1e7eac994a7173fb9e75661ca539
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/22947137344f3f1016d8b11115d4d77c23ef11bb
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/2834845ef83c22a2927c640b12b171fea8979d0c
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/6a025e87d2d2637e709e334efddea9ede7684ee8
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/8b3fe038c83f7ac93d09aaac62f2b5d0b4859007
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/b446b792c6f7a02868a21971bb36d25f02a26fa5
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/9915c9e8e9b9a4b98fe11da4990f656f198e0540
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/5ed69df7093b76cfd309d6a3686e0ea0f3a83947
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f2a71b995faab7885987a3013d3132a31148e350
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f153eb2a654afaa27fd43f2484aa2e9aec756d82
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/bf063d224f1dce7391261b65c64716283dd6ea56
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/5a3854e8ea2c42e19a8d5cd6cc174451be58e974
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/d5b820db5084677ae333ae4a6d1c297a2629235b
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/bc7d15fc7c8747993bd27b4bff909117db62073d
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/94a80eabfd376c221301968a091d526a4334037d
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/0b7dc61dc73ec602ab6e892011986ad062e42023
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/f32d8fd8f3913c61f82c18eb0094a3a4a89ba85e
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/0f77ef674b1b3db93f010c4f92f9dea6ed35dbd0
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/825a834793937987047db5078ab1b311288a02b2
        i686 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/4fef8d435e0b5fcbb38374e00bcc6417e73ca1b2
         arm | make[1]: *** [action.o] Ter... | TIM | http://autobuild.buildroot.net/results/3eb7756ae71b42cfa0d9b390d432e35b25ba91b6
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/ab80acbdfac8a17be895c387f353600a83af84aa
     sparc64 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/49afb76542842ffd4faee52408fd95b31e8bbc02
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/7032ab355ffe9a0928a25474ec57624847273afb
        bfin |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/b00a5ae7951d72023423603f465fd8dbb3fa3fef
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/3899442f7d24ecd8ca282781421526457bdb9523
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/1f610b83f867f7756049b3aa4030da04a1f2a3b1
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/6e8605b1ef34181ac3ba57f96bfd254b4c481068
     powerpc |                   qlibc-v2.4.1 | NOK | http://autobuild.buildroot.net/results/daa5195eff55a8fb94956c707cbe030c8d7b75b1
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/6babb5e21bd7fbd78ec0dbe56d2b67b4c81e4b27
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1aaabda495fd6230c9d0210fd612cf32e06ae049
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/3ed6a7f05c505ee0b6b6c2a2ff10b5afa29cf322
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/85c5e0f417acbaebf9e4e9a34882eb975ad876e5
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/cdbd394c4983b4f31c14fff39dc1ee3cbda2fc44
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1781847b086b19ad0da57782c1aee8ac5d29fe8b
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/eb3293ef278cb4678ff33061bc206476812e493e
        m68k |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/6fe11fd14ccac0a9a4635a26db117b986bc6e66a
     aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/f7b476cbb3c65a79a017b5881791f8337cc8dfaa
         arm |                upmpdcli-1.2.10 | NOK | http://autobuild.buildroot.net/results/742aacbb7e402d810289fcf0789bff7dfe6d32c5

-- 
http://autobuild.buildroot.net
