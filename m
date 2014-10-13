From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Oct 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-12
Message-ID: <20141013063012.69A4A1012C7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-12
===============================

        success : 220
       failures : 36 
       timeouts : 9  
          TOTAL : 265

Classification of failures by reason
====================================

                 opencv-2.4.10 | 5 
               valgrind-3.10.0 | 4 
                 webkit-1.11.5 | 3 
                 rt-tests-0.83 | 2 
                elfutils-0.155 | 2 
               alsa-lib-1.0.28 | 2 
                   hostapd-2.3 | 2 
                  botan-1.10.8 | 2 
                 libplist-1.11 | 2 
            wpa_supplicant-2.3 | 2 
make: *** Waiting for unfin... | 1 
                upmpdcli-0.8.3 | 1 
                 haveged-1.9.1 | 1 
                host-tcl-8.6.2 | 1 
                   nginx-1.6.2 | 1 
                    lftp-4.5.5 | 1 
              host-cmake-3.0.2 | 1 
                busybox-1.22.1 | 1 
              host-erlang-17.3 | 1 
                  thrift-0.9.1 | 1 
                  prboom-2.5.0 | 1 
             host-python-2.7.8 | 1 
                      qt-4.8.6 | 1 
                    qemu-2.1.2 | 1 
                 omniorb-4.1.6 | 1 
        gst1-plugins-bad-1.4.3 | 1 
                   mutt-1.5.23 | 1 
                     wget-1.15 | 1 
                    orc-0.4.22 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/bd3d04f1b739912a8b55c38a1939bf2b4ae54fff/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/2ee722953386042885528ab41b7f9a183de176f8/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/98444fb4e5186dcac6adb86cc1939f7319fb4f15/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/6c3582e39c3ed0831ee147a9d2e717e3c5724cc0/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/99a2f8a500e254e3fa871f55ca3b34da10dc7a6f/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/3a90f93054b24207fcb279212930ffb37a5839b4/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/e6b0f7a3763cc04fbe7611ece58982ffaa22351a/
    mips64el |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/0678a9eabd5a0b3db26b52660e63c0ae7a690ef8/
microblazeel |                  haveged-1.9.1 | TIM | http://autobuild.buildroot.net/results/e560fd47ac4494a27df940482aa5f6f990be282b/
      mipsel |               host-cmake-3.0.2 | TIM | http://autobuild.buildroot.net/results/b54222dd3d1430375e71724f4121852c8f224a4d/
         arm |               host-erlang-17.3 | TIM | http://autobuild.buildroot.net/results/4efb001866b1c4b2efe42f4c01d7a7b1e4f1cc6b/
         arm |              host-python-2.7.8 | TIM | http://autobuild.buildroot.net/results/9e36665354ff4827a02d0f01b33329a8d816affe/
     powerpc |                 host-tcl-8.6.2 | TIM | http://autobuild.buildroot.net/results/9fc8a9cd4f47107714d3520646eb84278511d7ba/
        bfin |                    hostapd-2.3 | NOK | http://autobuild.buildroot.net/results/f3b0c9f0cfd41d292c48367404b8fa76322391af/
        bfin |                    hostapd-2.3 | NOK | http://autobuild.buildroot.net/results/94543b865db2ff5da34434fdcdf15ea7db73f392/
         arm |                     lftp-4.5.5 | NOK | http://autobuild.buildroot.net/results/47207a4cc29303fd90fd2789963ed5332b69d37c/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/0d388d7408d32926fc69fe3d1aefa39733935e06/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/6012b83f879a13bcdb16f2c26391ff563cc3b822/
        mips | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/1ccc719dc8b521a70070436d7cf0a6b72d54f3d6/
         arm |                    mutt-1.5.23 | NOK | http://autobuild.buildroot.net/results/58c73e72e1387c7f490ad97a86666b12393917cf/
     aarch64 |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/54bb761f9e774d91066b78217efcd583fdd85ff3/
    mips64el |                  omniorb-4.1.6 | TIM | http://autobuild.buildroot.net/results/2d5c3e06882d7cba10efe44673b0e8a23742f609/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/4838285b25d6293a5cf0bb9eadd5040a7c75d766/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/650910d35c5458ad6ee2bda26c8801eb4f487a76/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/1a392529b21ee7448a78f92b05bf08cbebac01d8/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/eeb1e8297a9523ec50fd7f4aca842730638f4906/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/1a10f4b6a12cf1e6fc04eaa43235243acdb66f8c/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/2d85075be74e4b2ec82c11681d0e0f8838176a6f/
microblazeel |                   prboom-2.5.0 | TIM | http://autobuild.buildroot.net/results/9b298f59d517ee03ab80930998cd8179096509c5/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/7d61586e28a6fcf05ec64ec0c35cf8ee7d095d0a/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/46d03fd396365c9d44cee5a1fdbbb267b5b55ee7/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/eb7f03af2c59b7a53779fd6daa210d9250dd9b8e/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/4bc28172949bf4eb927bb4420030949ad6def0a7/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/e3f5a74febc87b80f5e9a72e975a2ea53b172702/
      x86_64 |                 upmpdcli-0.8.3 | NOK | http://autobuild.buildroot.net/results/7a67306839642468497b2fed963c27c077fc691d/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/bc6be9aa1ad39201a1045a65c0c3eb1e968371f2/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/04de6ed94ce7e0c196f5c2f323ed8620c40be87b/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/2e4e1ea76a4f7ee4adb53336762ed87b915004cf/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/c2f677eee543a45137499f86de578b6a80e56427/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/99bf3950108823b70c102ba00764cfb26084011f/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/443c19d41e0ee138c55006f39e0f56889761f383/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/55bc59e1f985037acbdebe0c61ef0165c41d2285/
         arm |                      wget-1.15 | TIM | http://autobuild.buildroot.net/results/cb4d68eec521b08f983d583fae893744b1005d15/
        bfin |             wpa_supplicant-2.3 | NOK | http://autobuild.buildroot.net/results/9ac3c0de573f5266a889f1ceb6d43aa92f715c55/
        bfin |             wpa_supplicant-2.3 | NOK | http://autobuild.buildroot.net/results/9be612355ff1106746b7eb36eecd5103476e0e98/


-- 
http://autobuild.buildroot.net
