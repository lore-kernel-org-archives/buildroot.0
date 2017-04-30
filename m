From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 08:28:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-29
Message-ID: <20170430062823.2A28E2076E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-29
================================

      successes : 135
       failures : 51 
       timeouts : 1  
          TOTAL : 187

Classification of failures by reason
====================================

                    ola-0.10.2 | 16
           host-protobuf-3.2.0 | 4 
                protobuf-3.2.0 | 4 
                 binutils-2.27 | 3 
                libsquish-1.15 | 3 
          libsquish-legal-info | 3 
                busybox-1.26.2 | 2 
                    mpv-0.25.0 | 2 
                 x11vnc-0.9.14 | 2 
           aircrack-ng-1.2-rc4 | 1 
             bluez5_utils-5.44 | 1 
             bluez_utils-4.101 | 1 
                  boost-1.63.0 | 1 
                 libqmi-1.18.0 | 1 
             lttng-tools-2.9.4 | 1 
 make[1]: *** [all] Terminated | 1 
                 mesa3d-17.0.5 | 1 
                    mpir-3.0.0 | 1 
                  quagga-1.1.1 | 1 
             rabbitmq-c-v0.8.0 | 1 
     toolchain-external-custom | 1 
           uboot-tools-2017.03 | 1 


Detail of failures
===================

         arm |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/f65de186324e6c3cd689540a22fa46ae89afc8c8 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/f3f806ae6d1f8bdd1dfab988339d2e468bb72ba0 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/a7e238cd2b6615684ea4a64d92bf427c8560f195 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/557df252b0aa7b7f52271dcb793fc4572541c523 | ORPH
     sparc64 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/19adc0aa5a7e48119ef4ba25ba0403867f74f678 |     
        i586 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/81e554594e39e68e7bfe2da9ef797be9257be535 |     
microblazeel |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/d34e059517d704fda040edb88279201a4b3093fb |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/ea07ccadd43bd73ab3c0c07a0d05884aa41def87 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/b4665fba928923e096b62dd153a0b034e10e211a | ORPH
      mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b1e97ce7c43a7b3f01bcd5dce7fbb0627d4bc55e | ORPH
         arc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ec877d161623d4b7903999463263a59009bebf52 | ORPH
 powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/31b88a76033c91bd66cb8086461a67dd4e08e96c | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d42403d7855262c022835b740c7d604a21bced5f | ORPH
      x86_64 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/760dba36cd5c6c2e7a998f30a0a3343c80c22556 |     
     sparc64 |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/b30141743fc83ffd2753b6cbe5b7e7ecdd378dae |     
        i686 |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/c14bd94049a7bf2f468584890ba65edbdffdb0b4 |     
     powerpc |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/04c30f9a425d10111974a315a6d7474e243cbbd3 |     
      mipsel |           libsquish-legal-info | NOK | http://autobuild.buildroot.net/results/0cb00fbfd548ac6a72716c62ce45af6f3231994f |     
         sh4 |           libsquish-legal-info | NOK | http://autobuild.buildroot.net/results/4f81644ca2e0ec4064f43c6cb00f2d5c858bbf77 |     
        sh4a |           libsquish-legal-info | NOK | http://autobuild.buildroot.net/results/80ff1c78f21a5326bacd6e7e4c48ac8dcac32c1c |     
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/eb822b96dccf58af86758eaee4458588c2fb8e24 |     
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/7b7de05af5a7991210f8c87120d2cd1528dd3011 |     
         arc |                  mesa3d-17.0.5 | NOK | http://autobuild.buildroot.net/results/99f84bc248d584ee55fd536010552d6e19e1b30f |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/2598203a16802af9fb562fed2b7793f51dc573f8 |     
   powerpc64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/be3da6597a1105e7253091c1847f003a347e197e |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/649fb8df1ec8d114aed1f1bc61bf0969c86c1936 |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/073985690872cc7f50737864cf7c0dc79f81f834 |     
       nios2 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/8520b1856a37aa6fea002dc82a6de6fdc14313ba |     
      xtensa |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/e07ab9855ddff0600011e395d435fbd0841f1a3d |     
         arc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/acc9bf495fc9af0b7b15dae212cc85d3e94d7fd1 |     
   powerpc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d7bd88e93fea03dda761b22ce19eeef90bf6acfe |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/6924efd69751626b75f1a671da1235fd0b45a96a |     
     aarch64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d4b24c1545440ac4da079f98cdafb0442d1049ce |     
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/8cb91f4b599f8d99b5a3bb6dbbbc2d525f136b78 |     
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b3d9120092faa008fe0ec417849f2d55814da8ee |     
      x86_64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2dc8da68ca44fc0de72bf8434a0c857a8c1d7665 |     
     sparc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b5d013ebbc526f6b424287aa4c54c3c3b6af58c6 |     
       nios2 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/71bf3bed77f578d03372dcac2b50d58c75a100e3 |     
         arc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/834b03d25adad8e8742988765dfca9f748c0d0b2 |     
   powerpc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/89dadb4a2053c02e1b6f36e65f7c48e8238fada4 |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b26198b77b9e7d7a0394b2f5c864bb475c06c5d6 |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2386c9448eebfb41f57aafbd2567425e155fa0ab |     
      x86_64 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b6efd8c9b9d05d475224a97413567cc2415f4222 | ORPH
        i586 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c250660c204c977aee2536afd283ed7cd9cd5be9 | ORPH
        i586 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3fc4e1b1ce5c2d94c4f5872b999419685b3ab66a | ORPH
      x86_64 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ed640b04302a359790d4434b5a58fad1a109a456 | ORPH
         arc |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/936e6855ab1c3ac24972e8f8dea1898556218395 | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/103bcb106af6402ccaf3fcc2c04a6bdf60a43bf1 |     
         arm |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/39888c188c0d13219a8419897a833275fcc81597 |     
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/9063d01137fa60478fc194794bfc3d8228c1008c | ORPH
microblazeel |                  x11vnc-0.9.14 | NOK | http://autobuild.buildroot.net/results/1c15b0999ec3e93296c2aaafdeef51eb21651b83 |     
        mips |                  x11vnc-0.9.14 | NOK | http://autobuild.buildroot.net/results/34f8045e772b96293cc7d25bd61ac0aa5842824f |     

-- 
http://autobuild.buildroot.net
