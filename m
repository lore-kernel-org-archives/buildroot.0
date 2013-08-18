From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-17
Message-ID: <20130818063005.9660F52C601@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-17
===============================

        success : 86 
       failures : 50 
       timeouts : 0  
          TOTAL : 136

Classification of failures by reason
====================================

                  libbsd-0.4.2 | 5 
                 qt5base-5.0.2 | 4 
               alsa-lib-1.0.26 | 3 
               libglib2-2.36.3 | 3 
media-ctl-ac40b79f002a2315f... | 2 
                      gpsd-3.9 | 2 
              strongswan-5.0.4 | 2 
                      qt-4.8.5 | 2 
               w_scan-20130331 | 2 
                  tstools-1_11 | 2 
                  poco-1.4.6p1 | 2 
               audiofile-0.3.6 | 1 
                 ffmpeg-0.8.12 | 1 
                    acl-2.2.52 | 1 
              fontconfig-2.6.0 | 1 
                  ltrace-0.7.2 | 1 
                 fdk-aac-0.1.1 | 1 
                     pcre-8.33 | 1 
                 binutils-2.21 | 1 
          host-protobuf-c-0.15 | 1 
                  prboom-2.5.0 | 1 
                  dnsmasq-2.66 | 1 
                      icu-51.2 | 1 
          qt5declarative-5.0.2 | 1 
                  cppcms-1.0.3 | 1 
                    zlib-1.2.8 | 1 
               ruby-1.9.3-p429 | 1 
               libevent-2.0.14 | 1 
            bind-9.6-ESV-R9-P1 | 1 
                      pv-1.4.6 | 1 
                  qt5svg-5.0.2 | 1 
           binutils-2.23.2-arc | 1 

Detail of failures
===================

   powerpc |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/a13a56e2359f7bb78fb9200797b435d68efc316d/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8464aa4cfdbd50fbdb58d087b93d4ddbbfd2486f/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1a96ae912fabc08a692bbfb9bfd1399afa748f09/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/601c6fac527177a6fa71d25a55727eb39583923d/
      mips |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/e3ed9c5e7523a71a4737bcb59078b59ba7461b39/
  mips64el |             bind-9.6-ESV-R9-P1 | NOK | http://autobuild.buildroot.net/results/efa508fef335287863c3591da156949c567fe932/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/8d52a6f8e856643f8fc7c08ef3eeca3488baacff/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/4645485339b79823628356d1ed68a77b19e636cc/
    x86_64 |                   cppcms-1.0.3 | NOK | http://autobuild.buildroot.net/results/caa86c7e56c16d1f381a0e79ed3d365acf224b90/
      bfin |                   dnsmasq-2.66 | NOK | http://autobuild.buildroot.net/results/714cd5fe8f06512da126e4a11a833f19569a6682/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/151406174d8f1f6f75a14fd3713bae3f2e563afe/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/309bbfc6491105019748323af4a32374db60c902/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/c52459d85c63de41b1bb1288fb27226b44d3ebf3/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/25a9e3125c055a47a199aa1384334ccc46d9875b/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/d00394634876e9cded4dd59061d636a278958f5c/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/f1be1e7cc03ffec67a456810ca439fd45387935d/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/a99581192ab49ca86d6c37e51cff8c1e84b672ed/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/21e4bbd9c5707a74d41e3f87ea479d295c3ed0dd/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/c3e7a02654daedbd797482f44065d8bd902cbd1a/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/62d610203c98e4acb853bc312892bd1affac6e8a/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/a3ca6d25cf3de03b76e2e1baac07efabdc34d1eb/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/7ee1bdab1f4236c985ddebe3d3b3dc3c0f3d8d7f/
       arc |                libevent-2.0.14 | NOK | http://autobuild.buildroot.net/results/4f0c6e01ad4502cb5a7f85475977077e94013121/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0932be733bc6072214a43de45c7736598cc3ecbf/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e159e37a957e35ba575af27289922b9e421398bc/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1ea85a1b25400c45ca0f433b936830bf98e58943/
       arm |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/b6892935acf9c58ff3876fd9372f746cd26063ba/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/0d38182079dc6bb7e658f2ef7debb9b6ce578d26/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/dff55100b79f6db65ec2131bda537086617bf641/
     avr32 |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/2698e19b68e1b332cdfaff8dd2f7c5e636b37c47/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/c35ef0e40d77d1d5ee6c01aa75f995759db39c74/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/9a1a89ec6d77d2fa3f7b73024c09d8851f6bdc16/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/f1f1dea0bfa954e870d1e7c7e8e173c49da7522c/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/34b32d13894a6e5ad89aac21459235d005bb2fc6/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/302eb28517b343762b03135374a834a49604ac13/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/4b2d4960f71dc511db9895af9d0fef913e87eaa4/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6d4b320f4b5bd5dd4b5ef91d118d89a7e7bb7033/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/4aef031efe46e4141fc8878f6f2c736edad16667/
    x86_64 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/1741f689e68b77751ff85c9370c0cfec7a38904d/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6e2806ba35d543b3f4c1600df18e954e7dbcc76b/
       arm |           qt5declarative-5.0.2 | NOK | http://autobuild.buildroot.net/results/4e726d9840c7b2180073b347c673fc6cce9443d1/
       arm |                   qt5svg-5.0.2 | NOK | http://autobuild.buildroot.net/results/3287707d422df87896a8a370620ef01f3cd0c64f/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/53c087d96ac45716f02f8270e1164cf0073b9eee/
      i686 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/b069e304c42660e7f7eba0b358f95dbaf879df64/
       arm |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/7355ddbaa213f4fcfd1b6d37b25bed1aab525723/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/52a482cf754f29d1cbbf06f2cd4bd5fc1ed9b453/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/feee6287be9728fc783cdcf973b315927f1956da/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/bc7cb976fb9f21db5a3d6926b42bfd887e78f5e9/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/0a14fdca5bc912bb66e0a04faff9779ae95d0e07/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/04d5aefb02372b28b94564ca8492c6d03cebf260/


-- 
http://autobuild.buildroot.net
