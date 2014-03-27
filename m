From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-26
Message-ID: <20140327073009.54C42101250@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-26
===============================

        success : 45 
       failures : 51 
       timeouts : 0  
          TOTAL : 96 

Classification of failures by reason
====================================

libubox-bbd846ec2d72b262975... | 10
              host-scons-2.3.0 | 6 
                    crda-1.1.3 | 4 
                     wget-1.15 | 4 
                   slang-2.2.4 | 4 
             lttng-tools-2.4.0 | 2 
            lttng-libust-2.4.0 | 2 
                 qt5base-5.2.1 | 2 
             dosfstools-3.0.26 | 1 
               vo-aacenc-0.1.3 | 1 
                  samba4-4.1.6 | 1 
                  ffmpeg-1.2.5 | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
                rtorrent-0.9.3 | 1 
          libpthread-stubs-0.3 | 1 
             util-linux-2.23.2 | 1 
                pulseaudio-5.0 | 1 
                 mplayer-1.1.1 | 1 
                    gpm-1.20.7 | 1 
                  python-2.7.6 | 1 
            gst-ffmpeg-0.10.13 | 1 
               audiofile-0.3.6 | 1 
               libsigsegv-2.10 | 1 
                 cairo-1.12.10 | 1 
               libcuefile-r475 | 1 

Detail of failures
===================

      bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/b32bd6446a21dc7b8b4c30dfe0a7e6e5e0b058dc/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/3286ab4b76f7c4fb34e06719c4abaeda6d699685/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/bed439bdb0a8bbd9050a8d18ed647dc289a5dc0f/
   powerpc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/3d9d9bb01a9022daf5be8da938420a85ffc91f14/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/ca22e078afa6745bc1bf3770700b5c54946e9bde/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/9e66198bbaaee9ad3862fe14599f009394580801/
       arm | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/1a9b0cc13e4ab2e1086f73dffc1c7abea67c11dd/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/0106ccce1ecb5580322e9fee86bf237ec1799b32/
      bfin |                   ffmpeg-1.2.5 | NOK | http://autobuild.buildroot.net/results/24a77d1241084d0233d1e7aa96fb0a0838e4c78e/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/586d0fe83d0a7266c077ee6e57fc834a46172426/
    x86_64 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/c38dca12d8c2a5a5c827c92fc1dee062a04ec2c1/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/2b0d740b1e85c49d7e32e303deb7a27c732324b6/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/78b8c40347089041d62c74901669fdc01b070d26/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/12ef78418662ec12d0d3e442de30aaed6696fad1/
    x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/86f55c10ca2483e14bb4b7d0af0cc9997e1c46d8/
    x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/ec3ee3e27db2254728c3d36a0d7660d66b10d742/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/e7b828d3e581d552662b8fbe790fc726233ce4a4/
      bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/d393fd1af8aed8e66d8278921d1fb97d836d2542/
       arm |           libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/f8ba39d62e45a39d4e7c90c6441d94dabe175be7/
microblazeel |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/cc99d0b3272caa480584028dc4a3b76a9df2c983/
    x86_64 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/9ec84f6ff7445fbf5425bc9a51bee89d4327e478/
      sh4a | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/9161e1fec71158c20d9c796b25f4afd1cf8c1ce6/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/7c2949f535ebc31c9641f584e97294f252fa00c3/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/a31720baea59661ab5f97a272fcf8e5e499a1e64/
    x86_64 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/dc58b2ed8395ee71030d6a71945f5d482d064f5e/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/fc64896ca5c3b05dfe4b5c5e7d25fc4b6c9976ad/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/12af20190ecde9c1a034af0142c9722b8738c548/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/eb40cff1cb30932e19a1312994062a8d59d3d34e/
   powerpc | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/2a0e5a36c91e9af4554f3a77dc3cfe9a88ae6a9f/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/37d233ad768f77dfe63bd8cc0f1b5be0249f0161/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/0139769670885fd1c93a49bb0686f5398cda26b8/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/446e6bc9d12ffafc9e2495c9c03be1673e5a6863/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/467301ab10d89726e16872b100d7590710c59fba/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/561fc1169cba1347f2ff724a0e83446aafd6a246/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/bb29e5d6532df1fe2a2ce662204d21b7e9747655/
      bfin |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/36f2a54cf3b144322eb16230256cc80d76b0e961/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/b08d46518a7db229433817f03508e39d4a6ee9c9/
       sh4 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/e102c2510591a8d9ad349bb77c54978ff53e4908/
       arm |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/7eacf46d75a493f8fd57dc728ce71308104953b7/
     nios2 |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/365ab44482ebbf03cea8731ed17145adcc41c105/
    x86_64 |                   samba4-4.1.6 | NOK | http://autobuild.buildroot.net/results/24148f668585fd5eaafa2182592987339de94d74/
microblazeel |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/898d3d0cdd6bddae0b2f8f5418affdb8b7742bc6/
     avr32 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/7e7932e2e531e60f290ff9ee9b72002ceceb248a/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/80049c101c4668f539b10381ca95f982316cae75/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/955016b49c631dad50a3be8a17442b3908d33140/
     nios2 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/3f19bb3c0b7c92cfbd2b40983faac691bf826804/
       arm |                vo-aacenc-0.1.3 | NOK | http://autobuild.buildroot.net/results/43f5b21be5deeac6b9b0cdf0d41aa8da45348047/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/f3bcc994f284f9d873058f67f7b820ea54b94d99/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/733ed1b66a3c8fd5ec439893e468c5b05a5668b8/
    xtensa |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/944d2b0012581af88cc078e1200d562e5fa93274/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/20829e772336f44551cd7b5cd7e491d96a2df3ad/


-- 
http://autobuild.buildroot.net
