From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-29
Message-ID: <20130730063006.14FE152C5D6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-29
===============================

        success : 106
       failures : 68 
       timeouts : 0  
          TOTAL : 174

Classification of failures by reason
====================================

                 dropwatch-1.4 | 9 
                 libffi-3.0.13 | 6 
     xlib_libpthread-stubs-0.3 | 4 
                directfb-1.6.3 | 3 
                openssl-1.0.1e | 2 
                libtirpc-0.2.2 | 2 
       sunxi-cedarx-74923e55fc | 2 
                  aespipe-2.4c | 2 
                  ltrace-0.7.2 | 2 
               w_scan-20130331 | 2 
                    acl-2.2.52 | 2 
               alsa-lib-1.0.26 | 2 
               ruby-1.9.3-p429 | 2 
                     lua-5.1.5 | 1 
               aircrack-ng-1.1 | 1 
                 cairo-1.12.10 | 1 
                 libnspr-4.9.6 | 1 
                elfutils-0.155 | 1 
           imagemagick-6.8.6-2 | 1 
                 libevas-1.7.7 | 1 
                protobuf-2.4.1 | 1 
                   mplayer-1.1 | 1 
                   dbus-1.4.26 | 1 
        libnetfilter_log-1.0.1 | 1 
                 cdrkit-1.1.11 | 1 
             gstreamer-0.10.36 | 1 
                  prboom-2.5.0 | 1 
                      udev-182 | 1 
          host-protobuf-c-0.15 | 1 
                  zeromq-3.2.3 | 1 
                      gpsd-3.9 | 1 
                   attr-2.4.47 | 1 
                   neon-0.29.6 | 1 
                 binutils-2.21 | 1 
               arptables-0.0.4 | 1 
                  libusb-1.0.9 | 1 
               libsigsegv-2.10 | 1 
              libsvgtiny-12121 | 1 
          enlightenment-0.17.3 | 1 
                 rt-tests-0.83 | 1 
                pulseaudio-4.0 | 1 

Detail of failures
===================

   powerpc |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/ef201d34f9b394e04ec7db20013c63d1a9399431/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/60aa41fa8ae01d899d6294ef90303dd4522122f3/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/11a3dd1a7ba8e091870d635455da7efc69eaa507/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/7e4f929839afdbf793875a1d2b474d2f0033d4de/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/cc4304d33ff3b8ee01db6cbf41e776bd85bf64f7/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9e1f977619fc4757f620e951c9c8ee0cf6133e9e/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/64efdcf300cc29146d1736924a69c3582362918c/
       arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/4c68900fec8ce626bbe7c1d143c70b5bdc20a8e1/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/b689cb8df8fe336a20c83fd7253ed1ca3afb8332/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/3653807f766dc1951662f5b4d82e8c3cbc394cfb/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/53d8f41878ce7fe2a525c3e68f310bd5d49d529f/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/c27f85710a1f1ab60b7428b2966f3c7c292abfa4/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/fde3f92523c77e2606bd894aa5d80e1e01f1e13b/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/007e8478b2eebdc8a174d4d9e1480223d8a1a8d6/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/127713f8fca57fb9e2da872db0fe8eeb611ff8bd/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/b7e1bd111bbfcec26a5dc1ca43fe80dc450d2e98/
   powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/39904e14ee9a3924f651a0bfa8ff267195e9b4eb/
      i686 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/cba5b230c8b8161834a2684cb5d8b6f6adc5fd6b/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/089b449ee8afc66fdd81264d301f2a150bfae33f/
      i686 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0910dfabb12e626f057b003f04266f733239bdc1/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/f7a5de8d2844e5099470ee854ecf6a4d1fd5fc74/
       sh4 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/36f2cc758280e50719cf1e139aae967ad0323b41/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/32fbf410282096ce2e8a7b3e4d32b67526eaafbd/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/5e31225f62ef04e7aea752243ac3dad8023c912e/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/acd5ce75e6eb98ab869bbbaca3f532fabe747906/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/81b351c7bcbd4f249718c8ec570533d152e37898/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/7c5c89c9efeae6ef93eb2d1cd7c04a4a7963faea/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/20e259da25f1745fa48c4266dc4953b0ee54fcfe/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/88a8da2b6dc50787e8dc76589162f3ceee1f85d1/
  mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/ecc0510d6f51c69f98459a3ae8cd433b4eab8fb2/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/e93a67b7fb5c85077c08960ebd04fb83631d998a/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/870dfeceb3f53f8c9830bb51c3b636a319472e70/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f8811882ea35c799aac9e5fb4a7a3ec9e51228ee/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/0dc0d85c8e3bfc8509d9ea91bf864cf290b5ae48/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f7b988c8a6bb44ad7003d701957fa10d392cd448/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/ff932b1b7f544aa3d5fbb8ac954920c9a439b6eb/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/31524afc54a4f6aa6d190f49524e30758c599030/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/66ebcd78c974562e20fe00ac234a487de2f4a96a/
  mips64el |         libnetfilter_log-1.0.1 | NOK | http://autobuild.buildroot.net/results/294276afcd250ac9d0667f9bd3c9b80c8fc104dc/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/0bae4cdf8eeec8cae79058d5cc73786680424292/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ea2b9bccc0562583f3939c52d14847b00cd59a92/
   powerpc |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/3361015c400e3eea95a065f9aae2379612708373/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/0455644dc03983d06871e50465924590d10be570/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/1498f63a4d29aaded03648471436dda65c0540b8/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/fa356c468f30ceeb73bc2876f34c631d62e5a380/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/e61feeb46f12f3a9abba2b5de0dc713dea59cf76/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/472fd2f0cf1b3c8b5c85be99ba338494d9e84dd0/
      bfin |                      lua-5.1.5 | NOK | http://autobuild.buildroot.net/results/98f6d495f8ffb4f34f36de7649fc43489e228ae3/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/c183f712a4a853c488c86cfd07f98f5cd41aa1cc/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/dfaa27e68ef526559bfa94165f8ba0ae358fd086/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/7e0859265394c9e3e305766e5f0dbeb601d1a148/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/3886ecf70b239491a9c0518613f5e2ec3967c8c0/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/a4187b6409f4866094ff97a1d50f042407133d6a/
       arm |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/f131d85a63520215f3a4ac9c0c2bb6961a9c6c7d/
       arc |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/364cfd6d804e99bbf0d9af62f4a54ef72b4adf6e/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/ec1beff518c0d2e234a6de5c8a2afb0f57a7b269/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/15eee15d0206b62f2fd9439062610d3482b6baa2/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/4b43c31a74910ee0013bc3c1baab4b224e74928f/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/5b0e52f2fd59916e46572b0f34403972e77e8283/
       arm |        sunxi-cedarx-74923e55fc | NOK | http://autobuild.buildroot.net/results/7395780dafedb6126dad7f9405609c2fe02104ec/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/d4bb44aa2268b468f49f799c98ba961170c1112a/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/9daaee0a234cb7278bf8bdd13cbf847363720300/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/9b5a1048d3b47689afb07ef118797a9eec32f5ad/
    xtensa |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/a8b801ae22144705d105b060c0b82bf8d00e4b61/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/221bf937b0c64965efa2a3a7f9d1618c1ee5c1ad/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/3e55aa7ae098e4afd6a5489670487f73625cb3b6/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/89b35eb1b9d6da273e059e15392ed0501f1ce4d5/
   powerpc |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/be12bd0f676975a387d121a5e0dc21fa58fc0757/


-- 
http://autobuild.buildroot.net
