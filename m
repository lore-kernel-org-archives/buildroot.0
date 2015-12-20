From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-19
Message-ID: <20151220073021.A4CC0101BD8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-19
===============================

        success : 275
       failures : 81 
       timeouts : 1  
          TOTAL : 357

Classification of failures by reason
====================================

                  libffi-3.2.1 | 6 
                  boost-1.59.0 | 6 
                  ffmpeg-2.8.3 | 5 
v4l2grab-0abed72532bee02e54... | 5 
       python-webpy-legal-info | 5 
                libvips-7.42.2 | 3 
canfestival-7740ac6fdedc23e... | 3 
              rabbitmq-c-0.7.1 | 2 
                   mpd-0.19.11 | 2 
                moarvm-2015.10 | 2 
                 openal-1.17.1 | 2 
             host-nodejs-4.2.3 | 2 
                  connman-1.30 | 2 
               ipmitool-1.8.14 | 2 
              gst1-libav-1.6.2 | 2 
                      qt-4.8.7 | 2 
                 mesa3d-11.1.0 | 2 
        ltp-testsuite-20150903 | 1 
                 dropwatch-1.4 | 1 
               openldap-2.4.43 | 1 
                   libnss-3.21 | 1 
make[1]: *** wait: No child... | 1 
                pinentry-0.9.4 | 1 
                directfb-1.7.7 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
                minidlna-1.1.5 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                 libraw-0.13.4 | 1 
                    iperf3-3.1 | 1 
                      pv-1.5.7 | 1 
                 opencv3-3.0.0 | 1 
                  gamin-0.1.10 | 1 
make[2]: *** wait: No child... | 1 
              cryptsetup-1.7.0 | 1 
                 libdrm-2.4.65 | 1 
freerdp-17834af7bb378f85a3b... | 1 
            netsniff-ng-v0.6.0 | 1 
                     nut-2.7.2 | 1 
                  apitrace-7.0 | 1 
                   hostapd-2.5 | 1 
               libcap-ng-0.7.4 | 1 
tstools-08f6be304040e7b8476... | 1 
                 gtkmm3-3.14.0 | 1 
                   mplayer-1.2 | 1 
             stress-ng-0.04.16 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/1e022ef3916ae00ddc053f3af7196e0aee186f81/
      mipsel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/512ee5df8a9efdb33f6de61b43ad85738505c4c3/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/c46a8bd66abee5b83a04f6fd59de5660eb229270/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/8a437005549859ccafed9306f2ea2e96f044e713/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/ab8ae0e5d3ca32be22860c66153c083b3266a280/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/afc91d398a77bf9066613fda6dd6ebea9352e6ca/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/a90f4b6ba5d71ef010d4f7fcdbc6ad1ebb0c6890/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/66fee81b1146220beb16e55bcc0a5a56bbd72257/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4e16359ac76f0220ef68af9721bcd5d45937fbf6/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/47b000fcebc528397fca705e22b355dbc9477168/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/a0bc85de3a311c74b1a5fd3d2d08c3fbe9ece6da/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/68c42a4ccbac58588796b9c71811ac449addb024/
         arm |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/1b585b0e5ad4f123ca3922994e8ffb56c1dbbaa6/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/ab9a6dd044b5f3e8e42629a2aaf598fd0e0357ed/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0650529ee56e9f8b7eea0a82af03bd2f08058fc2/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/12dd96afa5575f3df01acb9950ba7bac07c1d944/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/7c5e60825a20d6d837fd7b57fae9d464c9785383/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/4fb569160a1b728e5e1a2f9b958c19e31b3ca22e/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/fff98ee3becf9c7f169d3f698319176b0b869d3b/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/556d6f434613fbc93ed6f7c20ca53766cda4505d/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/56364d1700a8d4c10758508a3410516d91a9b0c4/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/36e26dcedfe427cde733cf9f61645d3aab6ff5b0/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/ecb53b6f65a5751a753aa443292d741b40e0fed4/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/a3ee13ff46a9f5a184b85121e5357f7565fc2e2e/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/09d8a0c5d541aa5a164a14e047a3fa32d9144871/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/b7fc179fe65b6926324d1ba5eebffc52b0fe803f/
      x86_64 |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/bfd8d9e19ef97add085db7c20a73c697922386ea/
      x86_64 |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/ba1bf5cde4088c91c96d80671a077859a35ad2bc/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/e2de1e88a91752cadfe128b2f937ae3f961b1309/
      x86_64 |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/0a3d19d5dd8887f18f593da8996682a2b1f05393/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/24bc8d539a4da43fa02bdccaf5e75f501e6fd6c3/
      x86_64 |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/5034755f6a7061a36e2aa57d8117557fb22b19fe/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/8ff91ecf1e026366e2a2adbe7a4c9ce17f35d26c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/81db38ed4986c934b755b4e62272923e8d08f0ad/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/8a7ee09d45e59e35fe5e1e31a9eed4cfae708f26/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/46eb1934c39c8882c4d2cca397053c0abccb5639/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e0b5ed4bc7671c14cdef11ea10d5ccbe644da1f9/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0dee851bb4adc4340e74bbc0739f79c847f53594/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/521d2d635e66743603b4004d1ef9d775cd6706f1/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ec0f7cde78d206be863821f17ae76f602daa02d5/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ceba0c87e51a7f47767a7986cc914d6a2fe28fa2/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/a33a737b3980a4a4f935a9635292f9225827259b/
         arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/8fba690ab3f6e0e22e738854026c320f9290a08a/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/71f5b456c1ad71614d24267d9cfa5d0f2775f796/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/23932cf433c38245d7082ec96b81be5a4e544e07/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/bf3fd117961e4c16a17d532479561d1c4f27afe1/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/125aa005eebdae33545a619656727ecb40673447/
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/670306ec5ece115c4fd2f480214917665d578886/
        i686 | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/e5ea05174ba86a2e9fe4ef05d4e28ca4619a33dc/
    mips64el |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/60f63958b2310e00937c498ddf2a0295ff77683a/
         arm |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/399cca80ada5798decc87bff69a3acc432e8f3d0/
      xtensa |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/90c9374ea0c79307b8279ce793c1ea4f4f66e4a6/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/34cfd819099257d07b5640a03a58ba97816153f4/
       sparc |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/8420c3dfc54b885751b9cf43c15a0b0996c01c38/
       sparc |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/468b6dddadea1b14c8cb75209739f4e36283d969/
         sh4 |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/bcd6fe39906f89300598fb71f64ee836969ae4e2/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4fdd3f9f6a5fe8ecf8588e5caef6ee869b8e0f7f/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/36d6106f4c68491d0f43ed0b25d86238bb8653f1/
         arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/d8e769709681b1965f36eb5c27f71f3a1f5adcf1/
     powerpc |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/346a325b9f2365c79f428e4d245e47cb897d1317/
    mips64el |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/82de078236686d5a1434b746622a7287db1c0f3a/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/7a11daee3bdddb3fa0b3f49509bffea66a499fa0/
         arm |                openldap-2.4.43 | NOK | http://autobuild.buildroot.net/results/f134d3ac243073ef89fe4372ef21722e4bfaf950/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/e5e8e3de6f5b8b7de79deb749e5bd9ad4930a1b6/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/2d1f6711f31131d2352bbee673be83937fbbfe73/
         arm |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/14f411ef29cbf0ba8cf4a4fed71556eacc96eb04/
     powerpc |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/b3cb007bf68d2dbc02e887e4d1e3dd3024ef5921/
      mipsel |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/604ea0ed365ef49a3884b6f1d025ff2000cb6829/
         arm |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/d944f36220326510c15685efe19075e90e72a5c3/
    mips64el |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/4871e9d87680a2cea70479396d6cabf277042b5b/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c8b12c919ae818f1f0124ecc8ee99b46b8568287/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/74d6afce44abfa911807e5d6a3d0a54c2e21600f/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/fcafdb94fb5766481d2d49e20697be7ccbcd8dd0/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/bfac6b5652327857b9f0526106b3c673468e3154/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/f05274e7989836450f5b1e785a7e894dbcda35bd/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/a63afe98e880fdccbf6251bf533228fbd43718be/
        i686 | v4l2grab-0abed72532bee02e54... | NOK | http://autobuild.buildroot.net/results/9df2c09963b97524621f8323b279b8a1672d4b6c/
        i686 | v4l2grab-0abed72532bee02e54... | NOK | http://autobuild.buildroot.net/results/e2ab1698f18aecc3dac5dfcb947c157b784bc411/
      x86_64 | v4l2grab-0abed72532bee02e54... | NOK | http://autobuild.buildroot.net/results/25b8ad5280f89b3e7d807104e43dbe2ed2c99b40/
      x86_64 | v4l2grab-0abed72532bee02e54... | NOK | http://autobuild.buildroot.net/results/b1ca0c984ec51518a4090039a86a1814582c3c2b/
      x86_64 | v4l2grab-0abed72532bee02e54... | NOK | http://autobuild.buildroot.net/results/befbfb29c33621272c5b3fcfed070bcdd5cb6e69/
      xtensa |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/2cc5de0beb41bf6357fd2ee114249bb45c6f4011/


-- 
http://autobuild.buildroot.net
