From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-26
Message-ID: <20141227073017.DD15F100D44@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-26
===============================

        success : 260
       failures : 58 
       timeouts : 6  
          TOTAL : 324

Classification of failures by reason
====================================

            libxkbcommon-0.5.0 | 16
                  guile-2.0.11 | 9 
f2fs-tools-baac4b4e6f41ceb0... | 6 
             libxmlrpc-1.25.26 | 4 
                    libcgi-1.0 | 4 
             bluez5_utils-5.25 | 3 
                  sispmctl-3.1 | 2 
        host-util-linux-2.25.2 | 2 
                 dmalloc-5.4.3 | 2 
               sdl_sound-1.0.3 | 2 
                  dhcpcd-6.6.7 | 2 
               host-ruby-2.1.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                  zeromq-4.0.5 | 1 
                   lame-3.99.5 | 1 
                gptfdisk-0.8.6 | 1 
                   perl-5.20.1 | 1 
freerdp-440916eae2e07463912... | 1 
                     ntp-4.2.8 | 1 
             smartmontools-6.3 | 1 
            host-heimdal-1.5.3 | 1 
            gst-ffmpeg-0.10.13 | 1 
               host-qemu-2.1.2 | 1 

Detail of failures
===================

        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/30a41b80037b13b73cdc105c8672c141e7411469/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/14e10640a121724863d4e4af9efd8cad49a28a51/
        i686 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/ff13543a3e49d9547904e5b03f9ed6bf40c28b84/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/e2424e988cf4c51d15994925484bad6a05428514/
     powerpc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/e6ff9068266a66aa59aa99eb5a2f37edf36b67de/
        bfin |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/cafdc75540e64e489bfa724bedbeef76fdedafe1/
       nios2 |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/d3c7c0b874b68b356d460bceeb03f1b99b7480d8/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/63586a6e6aa455c4824ba487b2f754890279071e/
      x86_64 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/d123040122612f4321699ea1ef835804cbdebf6a/
      mipsel | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/bbc9900cf41858a7a0d5180b5fdda863196806df/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/7e582bbeba5b74b9d286f3736047d9dbc30a7c86/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/7c04af8e2cbe10c6eea942ce547b9bc75a8533db/
        bfin | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/ad819bbe958a655c657b3328f15df9269ecd2c9a/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/98a3b52f6d6718e9418e4aeb37a2639674719756/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/f9e199c1036e2add8abe745d72bd40fd18914ee7/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/9038633f39dc1d89dcb7b2bdeef5b0dd5bbb79a0/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a641fe0db10ab657a37f2030150e7e48206281ed/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1375077196d352585b55fa0b04058ca8cd653b92/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2edad3087ba00c42c0478577c7b8270c2dd5578d/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/02c923807fcf9e98d25959d704b035664c68b964/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/55be4ac96667c48981d0c4f29e6a5e99b6c713d9/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/fd92f4d17a61f80a9dc428a5cd9a4aa477bbe7b2/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1d9f7aefc63f9d915f1a331ffebde456f012fa2b/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d07cb883d5b562238186419288e5033dd127655d/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/84e70f4754b1f9b12cac018748642563034534a4/
    mips64el |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/6636e202d995a8988d9cc7da3b64eba95d44953a/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/9f1ae3497ca102d9fe32b18d3067306a7fe71da9/
         arm |                host-ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/741dfee4553a2bf1ff66b90baa12144a64c42689/
         arm |         host-util-linux-2.25.2 | TIM | http://autobuild.buildroot.net/results/e3b59601e535527e4f65499ec71544a68a18f607/
    mips64el |         host-util-linux-2.25.2 | TIM | http://autobuild.buildroot.net/results/852a2f379e8f57dc5451ba649dfb916b4f6ceab5/
        bfin |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/bba7dd521080288c368a9ab68db568644e47ad4c/
microblazeel |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/22630c92bbafb5f703d871b8e92ec8fe65dda2d3/
        sh4a |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/bfa66563dc5dc205799543cf759622ed78641d05/
      xtensa |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/62cbf0b10e379ea174ed7ea90fd7e9d69ea04915/
     powerpc |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/07564c13852d2d601658691a6a20a07698a75670/
      x86_64 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/af0bb8f8f72f82ddaf1aea87c6d0a2235034067e/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/24375a029d75f52c6f42c1645b9e9d1433e53da7/
      mipsel |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/bccdcf48ae29a843aded7e70643b323eea516446/
      x86_64 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/3b572780046daf06361f88b141756623cf8d5791/
        i686 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/ba0c73091fe4103e89583baf9674e6fc1555eece/
      x86_64 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/aa27c704477f1cfa4e783db01a688097e7a2c9df/
     powerpc |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/9cd2dd05a30b0aacc4e50e343b79ba648ab7202d/
        bfin |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/33262499f4548986e3aceb9768ac90aac0f13767/
        bfin |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/9d597f97f727e2bd8cc5578089d452e21ced4648/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/4ee8f2ce7d0015c5f742d871ee4b670007834daa/
     powerpc |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/a64c0b1a1dea714e7a2311e0470e5bf99f567fb3/
     powerpc |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/c7c2941d8d3f81acc0090b2d477e6a2a5f763273/
        mips |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/824df05d91db49337398b5e660a0ae79be2ea43c/
      x86_64 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/2a4d3e06ba33f4f34b586c491c840c6651612fda/
         arm |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/85c372e830dc99ba4a8f12af4a9316d89e6d85cf/
      x86_64 |             libxkbcommon-0.5.0 | NOK | http://autobuild.buildroot.net/results/040bfa58cadaec056f685be3025accaa076aa0d4/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/603d2e9cd8a6c1fb59c1ba1013a8fd50651daac0/
        sh4a |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/c0ae5e33ac7500c3de3925fab5cc0d498759f105/
        i486 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/aa1a6a952c2307343435eeae949e2e6e454ea6b8/
        mips |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/7f5c2bb641591648d881bef18d5c983bdde011e5/
    mips64el |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/da59f18a8486b6de9805014645baa4400676ee28/
        mips |                    perl-5.20.1 | TIM | http://autobuild.buildroot.net/results/02b65293b67dc2dd235d0f653b067f233442b142/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/9bf0b4e5bb6b87e3d83267ef50240907e4390de7/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/e29e4126df6d8659ec60e1c1b306b6da604ae670/
     powerpc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/c0375a282871ce8685649e26cbf2a03290a09206/
    mips64el |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/80049a2c4573de9752f02b00b9d70087d12a1862/
         arm |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/17a03edd2771b5c9e514dcb62648dbd02b763c44/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/7ebbe0e932cdf28a59c5758e8a75b260b6918195/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/2a4f429a9eb16443e5957c40549034bd838f5a7a/


-- 
http://autobuild.buildroot.net
