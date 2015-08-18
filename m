From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-17
Message-ID: <20150818063014.24093101E1A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-17
===============================

        success : 135
       failures : 40 
       timeouts : 0  
          TOTAL : 175

Classification of failures by reason
====================================

             core-dependencies | 9 
               libpthsem-2.0.8 | 5 
                coreutils-8.24 | 3 
               linux-pam-1.1.8 | 2 
                 sudo-1.8.14p3 | 2 
             webkitgtk24-2.4.9 | 2 
                     lxc-1.1.2 | 1 
    xserver_xorg-server-1.17.2 | 1 
                ipmiutil-2.9.5 | 1 
               curlftpfs-0.9.2 | 1 
                   systemd-221 | 1 
  toolchain-external-undefined | 1 
                mongrel2-1.9.2 | 1 
                  ffmpeg-2.7.2 | 1 
               protobuf-v2.5.0 | 1 
                 clapack-3.2.1 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
          modem-manager-1.4.10 | 1 
                      pv-1.5.7 | 1 
                minidlna-1.1.4 | 1 
                flashrom-0.9.8 | 1 
                directfb-1.6.3 | 1 
                   argus-3.0.8 | 1 

Detail of failures
===================

       sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/9ff2b32088f7afd66e16698094a3e665329328b4/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/6e0de1de9bec4dc6e094c8a5bb1367ba5f24decb/
        i686 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/6cff9a6ab9cbec91ef85ce748e30dcecff5b09f0/
     aarch64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/4778b146dd190cb7d29eb60c05cc42485db3d3b2/
     powerpc |              core-dependencies | NOK | http://autobuild.buildroot.net/results/f700c21ee0d7640c23e8738370fab367fa094899/
     powerpc |              core-dependencies | NOK | http://autobuild.buildroot.net/results/56474e1af9e628cf0a66ad64046edc4a974fe72f/
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/2bd49968996f0e97f26c0d15dfe6219bdc1a2adf/
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/d7039649e4253dff6d8283b2923bf03aecf8a346/
     aarch64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/db1bb44b896a77ba1d1e0559ad860bdec658f960/
        sh4a |              core-dependencies | NOK | http://autobuild.buildroot.net/results/f68e76072f38bfe9e1bf0a2ee36def73d5eeaa5f/
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/84369b71158e129f045b7ddf64fa7a20602ef90c/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/1db77a7b61ed3182d61112d3240d83d19a343fae/
      x86_64 |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/1e9397baaa6027d8662d778eb1ae82511acc7bcf/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/23fda4c0eb0f1db20d80ef7d8c416d2eabe607c0/
      x86_64 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/3586cc92db7aba821919f9344ec6d3d091e2f22e/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/3c37cebda951e91ac10a8eda8ba5531648a95730/
     aarch64 |                   ffmpeg-2.7.2 | NOK | http://autobuild.buildroot.net/results/109686cbc8327e62f757db576cfff49c490b52ae/
        i686 |                 flashrom-0.9.8 | NOK | http://autobuild.buildroot.net/results/fa4acb22a1d14049fb40b58c8e30b2b98016a533/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/5f3f32473186e6fa3a165b263f682047af8e291e/
      xtensa |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/cb0bb855ca196cac04a039b60526f3c96155bb93/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/2c85642128b798325fe14ca60ebef6cec13c2670/
      xtensa |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/5e2487702919a794436ed525280ddc0a0a0cd2ca/
         arc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/27eb451a387ec0d224320147fb328607ccd08b05/
        i686 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/75f2c3efca6dc68d75de5e9ccffb8ec60783e48d/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/87b17ac7103604aa4c752e33ac101fad6b189714/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/5dae3e59897fc6ec29319c5de5f1d1cf435417b1/
         arm |                      lxc-1.1.2 | NOK | http://autobuild.buildroot.net/results/c4396a01abf2946fb370dca4c9f50bb868e647ee/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/6d7bc69b5b3ed7b21ac511209a5d01c7a32b84fc/
         arm |           modem-manager-1.4.10 | NOK | http://autobuild.buildroot.net/results/4a0df8f2e27013c17388a9e3e0ca0403e23735dc/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/764ea15a125737fc164371b4777ee42f5adc0efd/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/1472b509ff2cb9b3ddb11dcbadce4f7aba828aec/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/d4a295565fe346ae2a6ee56d3fa5173fa8210b13/
       sparc |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/bd29fe52ef666b3c1424abb7740ed08bdea7bb28/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/ed9f4b896eb0f81b63b7007125204080010b589c/
      xtensa |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/7ebdb97a467cd77ffe1a385737aa285283c093a9/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/037787e3b8624fbcb0e9b42a99b7f0946e4e4a1f/
        i686 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a14fc7980d4718b576deaf56f25ba36be1fa52af/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/0d56a5bf6e92e7344dcee7acb85e176198f703e7/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/604a5dcf071c3fcf4cdae833586fc93dc3a15877/
     powerpc |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/72e4acb3a2747958481387e60b4d0a59a52a1907/


-- 
http://autobuild.buildroot.net
