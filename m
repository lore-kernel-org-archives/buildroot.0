From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Sep 2013 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-29
Message-ID: <20130930063009.07F6452C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-29
===============================

        success : 76 
       failures : 53 
       timeouts : 0  
          TOTAL : 129

Classification of failures by reason
====================================

                netatalk-3.0.5 | 7 
    trace-cmd-trace-cmd-v2.2.1 | 7 
               libglib2-2.36.3 | 6 
      host-gcc-initial-4.8-arc | 3 
        ltp-testsuite-20130109 | 2 
          host-protobuf-c-0.15 | 2 
                      pv-1.4.6 | 2 
               binutils-2.21.1 | 2 
                 binutils-2.21 | 2 
               alsa-lib-1.0.26 | 2 
                      qt-4.8.5 | 2 
                 dropwatch-1.4 | 2 
                 cairo-1.12.10 | 1 
                  tstools-1_11 | 1 
               ruby-1.9.3-p448 | 1 
              cryptsetup-1.6.2 | 1 
                  sudo-1.8.6p7 | 1 
                openssl-1.0.1e | 1 
                   duma-2_5_15 | 1 
                   dbus-1.4.26 | 1 
             alsa-utils-1.0.26 | 1 
                 libnspr-4.9.6 | 1 
                  nettle-2.7.1 | 1 
                  libqmi-1.4.0 | 1 
             tvheadend-2b64995 | 1 
                  poco-1.4.6p1 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8a71eb95200db112ed84723d20ae7658aa4293ae/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b2b5860519db69861f2eecb037c4c5ef38aab7c1/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/7e5beca4cb38fbb0263be9d15bc9bdf8239752cb/
      i686 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/e52d5e7ec75d0d0b7d3efd590947405e7be36907/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/e345b1eb3cef07602c9419ef3d2e9821bfbe5be6/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/26be33cae7dc6b989761618b3cb36b78ee5e4810/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/627b8be8ad70c78effb824b406c7b9d953a23452/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/c2890c16b2b89408378acf50c2b9b9d856ca6f28/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/5a061d32a9e68c33e208336b59dbd2d8eb946b42/
      i686 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/a05a8267ef501ccd80c9220490a11cab3f4f4b7d/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/24ea94deb2eaa134c9f25926d1b55d5063da0e0d/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/1848f4a1ff6c80e35f78b54653b7faa0ede49745/
      bfin |                    duma-2_5_15 | NOK | http://autobuild.buildroot.net/results/a69e955302f42ba92a3199db681ce4b85047ab89/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/102eeae634e3d880c272c8d56d34e6bae8ea24b4/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/573b222c1b4c9366c0904d7c461e7d8aff180e55/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/a5aa9b9d1c4d5f76e8072f788b20217129003412/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/8170a2e4ef55bf4245ccde8209e470ec53dcb54b/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/4d881bd2635dc19905b03e185f9ca8e9c7d590a3/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/f12f692a4cf24e93d71f511362704e57766e2127/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/7cb55407f7f3e156cc04fd66da284a6c4178c776/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/5031115f6e2c8e6c32309bab3d982b9e55e69fc3/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/9afaeebf8f68fe494ae269254544067997bfc159/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/767177028f4d0b53a3b9898f293526b234394463/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/f0dd5afd1e49e967d60c7ec7e62a924942e9a3ea/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/c7c5e6aed9c598e38dea676f44bdc3d9aee6d44f/
     avr32 |                   libqmi-1.4.0 | NOK | http://autobuild.buildroot.net/results/e73eed4c83b4243df69f8468ca5ceac91ad2aba5/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/5dc429078fdc609740700a6f7130476ce6ec866b/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/74b7b0c5b619c6cc97506e59331b6d095b2aac70/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/98b8e8c7701212ee64dce58ed97367d7527564cb/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/a23a31bfe00781e44383cf7194d48bd6d9db7b3e/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/04c15b971356273466b254e028619eb2a1a72819/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/d20b184259d7b3482d787cddf19aad57bbc86ac2/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/b9c0064369033329dea4bf6b3768c9ee9d43933e/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/e3a5c3dad65ae750050dcc10a73224d4128006dd/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/3abc9efc630ff40a815c4fbb32a90f90e5ede97b/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/af53648189dd9ea40ea20d3e173e6ff391d73279/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/c486ba7eebd2bbbef69b3a68323e0329cc65f79d/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/ac7c4a329a68b48464c760239e61c31bab87db8b/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/a06ec87535b6d3326fa0ff0b211c9fee47c690f8/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/1cb7648b6b73b5b168353eb85722e3b01bc4ec16/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/deedfb0ca69796e32b1554f987b0a9b7e5c2f1f1/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/2ed29d6ca13123407fa46dac3b23184db409f942/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/e6fb7fff7d3fcac7dcf9a87919304b5ba9de434c/
   powerpc |                   sudo-1.8.6p7 | NOK | http://autobuild.buildroot.net/results/4977cfa96696007a9a2f7b9a700a2cf8f7bb83a3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/407a5e026f41ed5ed063ba044a3fdc9abeba6b29/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/517031cfd85cee31be1718d00d4f8e83338f949f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b99934e434b67ffdeffc2f2205e4444edd4568be/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/070d8d72fd17331e50de86a152a28be27d1ad18e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f2f100c8bb26e6f82496f2249f0d4b800233568b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3e8401fd01a816de3cd10604f0c3837cd71074a3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/87e0e95c11b406c58b64a1b72a56ded3d1a1473b/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/b11f9a42c12dad7488a13a1a0ddc8a4e9c7b7d31/
  mips64el |              tvheadend-2b64995 | NOK | http://autobuild.buildroot.net/results/4469131fb8cfea1ad8b5691cb4efbf731fb7c7f1/


-- 
http://autobuild.buildroot.net
