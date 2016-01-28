From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-27
Message-ID: <20160128073021.27E811036DB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-27
===============================

        success : 234
       failures : 88 
       timeouts : 1  
          TOTAL : 323

Classification of failures by reason
====================================

                  boost-1.60.0 | 18
              ptpd2-ptpd-2.3.1 | 5 
                      icu-56.1 | 5 
iputils-c8ff6feaf0442f8efd9... | 4 
              gst1-libav-1.6.3 | 4 
               valgrind-3.11.0 | 3 
                    cups-2.1.2 | 3 
                 mesa3d-11.1.1 | 3 
            xlib_libXpm-3.5.11 | 2 
                sqlite-3100200 | 2 
                pinentry-0.9.4 | 2 
        ltp-testsuite-20150903 | 2 
               libgtk2-2.24.29 | 2 
                      qt-4.8.7 | 2 
                    ruby-2.3.0 | 2 
                    faifa-v0.1 | 2 
                rt-tests-v0.89 | 1 
             host-nodejs-5.3.0 | 1 
                 opencv3-3.0.0 | 1 
                    ustr-1.0.4 | 1 
                  stunnel-5.29 | 1 
make: *** wait: No child pr... | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
              quagga-0.99.24.1 | 1 
                  trinity-v1.6 | 1 
               trousers-0.3.13 | 1 
             lttng-tools-2.7.1 | 1 
          chocolate-doom-2.2.1 | 1 
 xdriver_xf86-video-sis-0.10.8 | 1 
             util-linux-2.27.1 | 1 
                 fio-fio-2.1.4 | 1 
                    sox-14.4.2 | 1 
                  prboom-2.5.0 | 1 
                     fastd-v17 | 1 
                 dropwatch-1.4 | 1 
             ipsec-tools-0.8.2 | 1 
               host-efl-1.15.3 | 1 
                  connman-1.31 | 1 
       openpgm-release-5-2-122 | 1 
  xdriver_xf86-video-ati-7.6.1 | 1 
                 rtptools-1.20 | 1 
                 lvm2-2.02.138 | 1 
                   libnss-3.21 | 1 
                   slang-2.3.0 | 1 

Detail of failures
===================

         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/088f3341b0edb410e927a29c3795ccf31b83866b/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6048d133724ef5ffaac015b1a0f7007594292011/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d63789830f1c0c806e7cdc7d37eb7e530076d2b8/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dac3634a4f071a6d40201946a70908f9dfa00016/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1c12ccd6e4fc93d2c4c73d7b64464fa7eb65d147/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ebfb7b7e96cba64e12323686ba280817fbdaf13d/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4d8868befa458bf38f6de5acc06ef9a45242f5a7/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5b25cfe39b5432b909eb61a1eae2406ebd09197f/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/62e1760ac2556d2ea29b53cfe6e815d63e92c679/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/28cd363d737ab00381cda4659393277bc20b2554/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/57575693418229fc08397977388715436ba08745/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5d4851fc0ba07e06f9f697558580a1dfe3d0fdb2/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6b9308e68227c9d3a6550f7a9ef7cb70fd6f5267/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3d24d47fb04382d33b6c03b097571c3b135e5f56/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/57223d1d3fa0a79c4f1d4dbe41250970e5d718dd/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a89e19acc5ed967dcda895f85be7ff427bcc0439/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/860790205fba0ee64eb3ab8a500da7320d0c652f/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bfc8b48a5ba66a53ed406f683b2bd1e22cb0c1df/
     powerpc |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/e6df7adc851459df6f9dd8575b7375dea1c39153/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/2d557f249e91ed31b99a745780fc742f34c8d1ba/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/12caf0a13505e3a6d983f7b22b4739b1d358d0c5/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/3823059325b731ce4125c201b46595f17352bb7a/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/57b0953d4e8f01bae6dda1e86b84c1a534240ea5/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0177d6f6069d6d0f8bca9974264370e978a7df8d/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/a770d114a3fea2b63e5e49f5ba4df18067590b6b/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/868642325dbcd581373eaa9e1ef900f8a27f9121/
       sparc |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/48ade9b0b4c2c6dc7148d5bd1e106aa7f5b6af7b/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/0637236b89e3251bbf8b649ff60de0ff19494703/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/51c27dc3d6839b2db0e3056e63198cff70c413f2/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/e4b1b51ec947c029003c3435defeae368ddbe3d8/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/0555a082ddea348f36437e8fbf9b49162b3b758c/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/59bacb344df83f83aab6ec92595b39d6cd584484/
        mips |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/e2c247039642eb0db45a27778aa5c36f1255d52a/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/95eb9dd0d01bc84cea5580727eef478791ab45d8/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/6637a717a6eac054a2956f46fc4205e95dee9c20/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/b0bf1c6716ddd24f665415c20e32772f954c6a5b/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/de556721d260d6b44a398bc5be7d7da78fc00fd7/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/81cc11b79abfe7f65acc71120c80f48c4748d655/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/00c9485a4e8b8b8a1fb82bd3bc24f6b8946baafc/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/307ae944f0032aa34006b54ac0028f8102fa3f3a/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/e7a7f712468702e4aad60040b2512943a98f9897/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/e8c4ff457d25bbf6b490620789277636ba0b9a4e/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/e45afa55623ae60aca9a6fa78773ced0bb492875/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/f3f6a3260d9fcd80e0cfd70ddd70359fa8e89756/
       nios2 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/cf836892f98d702a294a125a73f68c86163a7984/
         arc |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/4f2f967093296c60cbe86292cf7a371b8b82aa9d/
         arm |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/faef0bb2032205d7e3a0e600d5685546fcdfa20b/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/6c47e65655884127dd44f2dcb8ab98b2e32da5db/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/dee291c5188d144ab9cb4137275644e3ee0a61e1/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/799e028352118fabc5318027df12342c14aab183/
         arm |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/02df8b1b107c6b9bc4f0b873d6fe5aef29c5fc21/
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/5cb35316500f41c49e62edd9c9b5617c730cd2f1/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/fe08158cb37cc3ef38316ac531771039bb288d2a/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/d6ae874d59e13a90ed36e43bd2d71e6474b1829d/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/31e926c4698f592b21318bcba92546209e659891/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/b15f7aa5b103311219d6a6de59aa2d39cf413ed2/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/fc26fbdb1b8560b99677362e9a2655bba016d530/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/88fba618edac789cbc3474e781a2d8c48c1bc229/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d952f270f862b0bb0220a7a1fbf66d9314057c10/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/58f0c8dfdcb1c6802d8b8d8f6999ed59d5a3afc8/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/e1a71176e656eb3fb1269d8525513d46fc4bde7b/
        sh4a |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/48ae6aa02cdf13ef2229d324ae289efaee6ed1d9/
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/29b8753825f9b4ee53d34c1dacbbae016c2f0937/
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/543702f81cd18e6d11faf874b7092116b6fcc31e/
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/b399ee830de587e3302f86ac0caadd2607c6c43c/
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6191df5243e073e3ba6e27bfcb4a833d6c77ffa1/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/59fdd94bfaf4f6fb7367f5b2f0b56e2acdd371c7/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/823c2c147a09c21d9cff1c96eb14d77a532ba3be/
         arm |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/a8d415b758b593db84b8d9b01127621e95840b2e/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/67448c37a64219a41c6a34183551896a058aed3b/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/d6bd630da20c76ceb16804a36ee730ba4ac8d19f/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d9bd90c5f2a5919329fd3ad9d6c43cea719cde16/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/f01e0fe45eed2bae1d4896e76ca5ddb1057754d0/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/3b4ee5a311014c9740010d0d874779576cd7e98e/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/227c6d64c5f18254ce796645f894dcde23b87a8b/
        bfin |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/87306e6295eb6cb08a7846eb56f280ad5304c50c/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/44003169e4be6a740a2fd90c7ac837d0f1257e25/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/2c8e444107c50dbfcb7a451a9d016938eb6b8ba9/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/59da40baf26c35790546bb1ab9b1be6433ba60e3/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/1d162cdc69a6d15a6c9fb7287860df36e2ba88f5/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/a757016491fbc3d662d73dc4b1368bf36abb8fb7/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/7db818e8e45273dd3d8d1c408de70e26624f2ba3/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/4445a148636c0e6c0558b962bb11d727596f5d0a/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/3ad6b37c325f3477cb76c722b02dd3576b694349/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/0a1474dbd02ac311f1220cf3cf548145375fbc85/
     powerpc |   xdriver_xf86-video-ati-7.6.1 | NOK | http://autobuild.buildroot.net/results/68eab9ee7f7cc25a1f5e56397978eddcdcff2f70/
     aarch64 |  xdriver_xf86-video-sis-0.10.8 | NOK | http://autobuild.buildroot.net/results/9783677bbc1419bde24cc548461a423a5f858ad1/
      x86_64 |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/747f0e75b1dbef266fbf2c2adc1451cc0d0973ba/
      x86_64 |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/70be356012f2b6c221260551827b4c80a8ed74e0/


-- 
http://autobuild.buildroot.net
