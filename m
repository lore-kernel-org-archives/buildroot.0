From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Mar 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-27
Message-ID: <20150328073018.A0D371018B3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-27
===============================

        success : 205
       failures : 86 
       timeouts : 2  
          TOTAL : 293

Classification of failures by reason
====================================

                  powertop-2.7 | 21
                 jsoncpp-1.6.0 | 7 
               libecore-1.7.10 | 5 
                    fftw-3.3.4 | 3 
                  boost-1.57.0 | 3 
                libtirpc-0.2.4 | 3 
freerdp-b21ff842ef3de583751... | 2 
                 cdrkit-1.1.11 | 2 
                numactl-2.0.10 | 2 
                     monit-5.7 | 2 
                 libxml2-2.9.2 | 2 
                     vlc-2.1.6 | 2 
              postgresql-9.4.1 | 2 
                dovecot-2.2.16 | 2 
                 qt5base-5.4.1 | 2 
             host-thrift-0.9.2 | 1 
                libevas-1.7.10 | 1 
                espeak-1.48.04 | 1 
                libedje-1.7.10 | 1 
  toolchain-external-undefined | 1 
                xapp_xpr-1.0.4 | 1 
                     eudev-3.0 | 1 
                   libiio-v0.3 | 1 
                 empty-0.6.19b | 1 
              libarchive-3.1.2 | 1 
                      qt-4.8.6 | 1 
                  guile-2.0.11 | 1 
               gptfdisk-0.8.10 | 1 
                 musepack-r475 | 1 
      host-gdb-arc-2014.12-gdb | 1 
               linux-pam-1.1.8 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                  libevdev-1.4 | 1 
                  python-2.7.9 | 1 
                    php-5.5.23 | 1 
                collectd-5.4.2 | 1 
         network-manager-1.0.0 | 1 
                 python3-3.4.2 | 1 
               alsa-lib-1.0.29 | 1 
                  bcusdk-0.0.5 | 1 
                   ncurses-5.9 | 1 
                 mplayer-1.1.1 | 1 
                elfutils-0.161 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/29f8bedd97e511a1f1bc2b543bdd65781f78d00a/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/12fdad8360c56cf51753f90a6621ed22f75b1e05/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/15a96d864ed254105394b38add04b602afc47b02/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/e8268a10ef1918d24c95cb9b3bcd67ac6901fdcc/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/986fc6663c01898ca6e8cf565d8dfeeefcab6ebc/
        i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/adb170d2024ccc9aae9f4efe68a5c18ce0c46b3e/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/38b83ac65711ff7e49dce77d1821463c1d3fd7cd/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/59c1e29c5404e32af46cc22823810f9275b47b64/
     aarch64 |                 dovecot-2.2.16 | NOK | http://autobuild.buildroot.net/results/95d4acabc1cc548a35bee2140528e36e64d2595e/
      mipsel |                 dovecot-2.2.16 | NOK | http://autobuild.buildroot.net/results/878a97ecfd67d287d860e61350e195b3cfda382b/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/eb5b7c0fc55aeafa4919161d38c429a29689fe94/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/961e8e87e5a4fd66a8f0d2af256b1b954d040a22/
      mipsel |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/537ccd17daa4271dbc96093a56fbb7a0c5e6ec4b/
         arc |                      eudev-3.0 | NOK | http://autobuild.buildroot.net/results/56846d96a5ca2b3d8ed660993d0e51a4e0c48988/
     powerpc |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/eee31bcdc51b3e1400e50fb96dd9803e9dc8d33a/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/7b64b8bbd2793856f066d5ed365d4a0015891ff5/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/cad1530032fd9c133e7a1f361067bf31d93e7e2c/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/25bb5f01a68269b7fbabd10d245c3342a577c1a5/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/40d56003f4ad2e6f5d7555faf7b1de6d8c6045fb/
        bfin |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/b49c82107564913c5c1748adb5c9ff41aaed1e78/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c058a36a75516b24bf6c8f2f1e1755d9338414ff/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/95cff136b3f33dbac290ad8a1fdbd413e44121d7/
         arm |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/49e4f97a8bf58cbda5647b248a78079fc7f1943c/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/b96338f580fcd9a1bcc9f1abaa488905c8d03dc5/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/0774fd7bc053bd3f33f4883c9a0f55f3d6de19c3/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/7a8c794ed731ca8f2671663a2f3c3dba4a53b932/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/488abd0128eeccb09000f16792fb9d0aa9df467f/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/5eea459e621b6c4bc4cee02da1cacab29d20a4af/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/5b9e39784a7ebd8ab103bf009c07a375b6f167e0/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/e241870dc5ddb0fd960e6a091a50d3e1d64546ee/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/a825f8dd554839ad22632140d9a6a4b0c74b9ea2/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/f99e0504616c935e61ea21c672a38d5c6d1d6a35/
microblazeel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/0a66915037e6a2a9130c2560f611329ff148e43f/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/ad92203f6d5c0de4db0a268601bd8cc4d53a6e1c/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/e2e363dc5f400934a4650de7f6900521524de806/
        i686 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/b05401fb10cdbba48042784352c1f396b3a21218/
      xtensa |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/f2836539824acbb5db0bddffe83403232148a2bf/
      xtensa |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/2d99e4ce6c7743ea7d0f734544ba359a35841d7f/
         arc |                   libevdev-1.4 | NOK | http://autobuild.buildroot.net/results/b410cc627fcbbb9a4e5f3c71bff0c91b11b5fd2b/
         arm |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/728697f43b4fa2835fc0feaeadf39a1e33748a15/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/36ce1024803c8d5416842f48a5079cf8ea18061f/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/1be4dfe062827eea7b35d2a20e06af96ef2625dd/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/586e963280a60b48c1b644ece3bde67ab42943e3/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/07fc74acff4d52c5b058de55777cfd0b51b09850/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/eeaa3af76fc31a7f81a6df291f4e991fcdeaf75e/
         arc |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/2802463afbd574f65792395c8c935e8d80055c6d/
         arc |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/ed89fc1236609eb93eb6f790005830e0b610a643/
         arc |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/56e53149466791fc0f2687c0ef9ef3dcdcc057ba/
         arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/62f2d4cc6d58ad85448cb71f397329cf3c8c9b8a/
         arm |                  musepack-r475 | NOK | http://autobuild.buildroot.net/results/32ee9fa75d2a564b6977674348a9a401be4671b4/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/c8f8ce93a9544776858fb65627aaa3e8d25a2894/
      mipsel |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/cb589690a6c8097d8990ddeb5eed6ed682a2b7cc/
      x86_64 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/51108a53833d6c11d30bad02c1604786fa64be33/
     powerpc |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/0ebf6eaedaca31241ca842efcaff409eaaddd643/
        bfin |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/e1018274701b9a0d5d19a56dd28b0bbf7c748da7/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/c84f202b96e7a73cf3a8e16766a513f091546388/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/95bbc51fc9b45b52818b06dcb94c56f52d29c478/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a653b6ecc9ad46266d6836bc29fd669dff9ec036/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6d34fb761a5f1937149b9ffea0b867bb6533b227/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/50e70b0c7c3533ddb7397fa7542a9369bf7a7249/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/beefdb4fa270735b826c74b54e871ffb10940b93/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/f7b56d471884848b5acd63af88c26d22b6a623c5/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/511a1c76bfd0ebf637e5abcd6fecc4d6a683ed3e/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/b94fd3f3e702bfeb3254291425151d1ccd9d11c5/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/202d106299e8c65491d61ded3406944b5992a9f7/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1bdd09cbb74102ea766df5bd73486647bf9b9024/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/f768120210936cf8cfb6bf5ebba948f0c48116c5/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/fcd6118c9e33711ebc50cdf993d877ef6245c277/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/47127d40065b646689dadff204aa01db9e177e34/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5313c214bf8aa2c8e87083e3866b0d152b1efbcf/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5587b9eee9544b295d704b30935cf298d6151a15/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/61454cb1fcff95e7889c025503a2b1a1a0a3b24c/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/65246f6f71e67c2637efbe8bb6e501750629d5fb/
        sh4a |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7cb41be2c33ccb9ab9463cb6c99b2ddcb069d234/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/5d819de927e6a3df6ce99c3c48216f3ca1bc5d64/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/24e312271cf07a8dd966b43f153a06ddc858a786/
        sh4a |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/23aa6292dea0b9c40ef66ab09cea597db10c0b89/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/995b14f35c2be2ba6061498922f4e6726dbd6df9/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/ae92d107a945d6473109b65592fb471c0a99f4a2/
     powerpc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/e05ace1c547840868781bd7f52bff6313a257f3c/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/46c87caadb83636e443ebe9221679bbac47cf87a/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/c41090d4fbd36a18ad2fe786196f8994864be2d0/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/f6f4bd7c4767ab5ac121617b023c11e1b88bd933/
    mips64el | sconeserver-3b886c3dda6eda3... | TIM | http://autobuild.buildroot.net/results/f077a9fcb4ff8361b233be6ff28b91c23879e359/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8a17618924349f50b53ac101cca25adfbddfb41c/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/46b6361abe6c613548be3a1be48e5b8ed961c1ba/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/df5e79d72f3ebb7076b7adb30448115a4ceee0dc/
        mips |                 xapp_xpr-1.0.4 | TIM | http://autobuild.buildroot.net/results/d7199c3b86738aaa8c921717ebf6b9198e853699/


-- 
http://autobuild.buildroot.net
