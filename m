From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  6 Oct 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-05
Message-ID: <20141006063013.D7B26101723@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-05
===============================

        success : 171
       failures : 80 
       timeouts : 0  
          TOTAL : 251

Classification of failures by reason
====================================

    host-protobuf-c-v1.0.0-rc1 | 31
                   atftp-0.7.1 | 8 
                  fan-ctrl-1.3 | 7 
         python-protobuf-2.6.0 | 7 
                   dejavu-2.34 | 5 
                 webkit-1.11.5 | 4 
                   perl-5.20.1 | 2 
                ser2net-2.10.0 | 2 
               valgrind-3.10.0 | 2 
              libgeotiff-1.3.0 | 1 
               mpdecimal-2.4.0 | 1 
                   hostapd-2.2 | 1 
                     vlc-2.1.5 | 1 
                 openocd-0.5.0 | 1 
                 binutils-2.24 | 1 
                 libssh2-1.4.3 | 1 
                 opencv-2.4.10 | 1 
                   slang-2.3.0 | 1 
           xapp_bdftopcf-1.0.4 | 1 
                 pixman-0.32.6 | 1 
              libsvgtiny-12121 | 1 

Detail of failures
===================

    mips64el |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/79afaccc36aa7f14adf5f72bfd95fc843db9ac74/
        i686 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/5f3a59da3b128a50be1a4ab4cff9c3838e323e08/
        i686 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/3b840e843b0319aca67afe5d0e8b24295af67b99/
    mips64el |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/113d293b5f6532c14ff25c3ddcd5da806a964ee2/
     powerpc |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/77c5f6db28f4587d2be3b344a2ce20a8fcde59f0/
        sh4a |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/30e97bbe7e198afbb34d129b320f87e74f15513a/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/60498e7fb2c382bfaf0df9c7fe3334289f5a6d3a/
        i686 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/b67454aeec455a2d3033b909462de617341b94d0/
microblazeel |                  binutils-2.24 | NOK | http://autobuild.buildroot.net/results/d4f17d30de58ccea352ace73a644f3ca1639722a/
     powerpc |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/3dadab55abebf89ab1abd6b943b66d2f70a07e14/
      mipsel |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/790560caa4354e35bb14b8ed18c18a68a00949f4/
      mipsel |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/b642913d0d2b5ea7b164915a5401bea639f1c803/
        i486 |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/abee975b4f612e8e03bbb9fb3bd82cec18cc0a92/
    mips64el |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/7b490fcbc0f3a6d38de6f58f0f6ad0040b36fc3c/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ff7a88d9c42a8781442c88fae60d9b13ab793130/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/7ed228655cf3d1b7bd58da26c0fbf38eac9846b9/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/4479cd7487e2ca7279dc95b374bb2165c155ebab/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/864aec710032b49c38264ffe41628c8d8c130593/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/24f5d9f127c21e4c80ab21e98bb99af4bd71d69f/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/453c4e0f87c50e1574f4f40b22333def56fef67f/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/afcf6977e7845cf423d3f58d751f762622d84615/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/729711efa78faede7611fc0f8b5c78d6604b4727/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/e3089934b7032e2d540c5a1e8a2e2a63b7f931d6/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/e340d95c44fa0a6151dc797b2e5392e722f8d99e/
      x86_64 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/640f74c1a28ef44d397afc8b4cd7a67629afae06/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/9cf77740c817a9c7104e698502269d6bba71f314/
      mipsel |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/8a453da43fa742711c9c068449df2a77ca96209d/
      x86_64 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/4934eec5c6105cce04324fd17055b183610c3b87/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/81519cbd184eb09308b8d742a5bc5362579e09cf/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/2d057cdfb0e85f18b459e4734221fcde7121ea65/
        mips |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/c3649577a50c2579d92bcaeda1406fa18995ded6/
        i686 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/e407cef21aafd51b689439677701fb86bd4c5a60/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/f8767f687b8c9d87394ec9465b6fe14c30bd8fd3/
        bfin |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/fa185eddedd545addbb9c79a19609ec29bbbc6ba/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/9a62c65795633b161023234647aea94f7e233a9c/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/6b73153c2706134a297ba712818abe775755cae5/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/18d6b7cdf1db7d87e4d62156f9336ef7603835d1/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/09ce2eed0c5aa704d24fd3d77c39d3c8baba7b3c/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/cd56af232755592d82286d1500ae69a218793e74/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/546fa684c5bf3ad272e20b7721ee48f09057f0f0/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/a09882201e55cfb62ce1bd3f3762c6993f614e7f/
        i686 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/09353848b04b1e780910110c2ca6cccae562b03e/
      x86_64 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/1cbc9e287e40a54a21fa9964b60ee503e8c5f480/
      x86_64 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/86cfc7cd241d380afcfac791ad52593570689a10/
         sh4 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/421461d280efd52e8127e671da630a4782de93a5/
      x86_64 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/06b9e3cdc55d244ad260d96c4c4bdbb3da24dc49/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/c19812cfb2d71ce68c589ae9cffbda49e0c90faf/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/6cdfe0100aafedf0849aa812857049fdb02bd17b/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/665b83a2af27c18cdcbc2169adc9ebcdbc69ab32/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/b0f85682a3458e73c5b62f31a38f29806a9d6fd2/
      x86_64 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/27799c52dafae3004fb404e7abae40c77d5b382d/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/f8f2ed5e3f0e2e496a54349190f2c8546d7f13b5/
         arc |                    hostapd-2.2 | NOK | http://autobuild.buildroot.net/results/bc5100d6462af4e2805f2bc8d39c87a55d843e2b/
        bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/56eb9da5386ca30e2fedcf6f5fbb7a33a4340a88/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/85c209d341174c157b56370766332157e7195939/
       nios2 |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/f373c93da2d2bfc507554a9b23c1c4abcbf0c86d/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/3a3c9a0dcac4bc2d6bbee76b356b1de2cce0785c/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/d95166c923f965270faaaed4a09ce872167e05e3/
        bfin |                  openocd-0.5.0 | NOK | http://autobuild.buildroot.net/results/1624d2761cf4d83ede555ded09ffbe9304defd28/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/b5c786890eb0f1707c1b878eedc2fa1a91f7f5b4/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/bf0700f7e12d3fc83f76cf67bb6cf16c0586d8c1/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/ec2344485a195267d72d436038fad91fbacbfec3/
     aarch64 |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/1f294a82674c0692a9282c1e82c4f9b2e427f57d/
        i686 |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/1a3bd0153d8a5a4173334a039c3f0aa4600348d6/
        sh4a |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/d58d9048c341b7a5aa314931dc3a74430d6ffc5a/
        mips |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/22fe9e19e14ee3f40faedda5782268789ad9d6df/
         sh4 |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/9005b6b17879e872ccc0685d5cc1a4a6ab3e563f/
     powerpc |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/adf01ff37ff8098feb090a262bd84aab0f19ea98/
      x86_64 |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/b004d5c83f8d922484e8922a7979b4d1c7dabf80/
         sh4 |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/700a9838c9042a7db68577f060542b9ef3126225/
    mips64el |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/ef139d42973a4dbbfdeeade741f71c0676f26b9f/
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/ec9f1d7680aa50357d9a6646cef610dcaa1e8041/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/3fe67d9760abbb5c9fbcabf8672ec537a4bffa71/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/31d4cffaf0541c5dcb21de609dc97c0d303c2111/
        sh4a |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/4e6b7a7822ef2c0f1d2e521036252960e999acfa/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/7679d621e1e1d498c07d63ae81bca6c56e92b2dd/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/2766ed05ab2ebccd00b8fee2b7f2a7db7cd02257/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3d31a7cf786d946ff53bac7c2edb407aa735eac9/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/118e16bbf6efb42bda82e0ece5ae912093fc32fa/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/051bbc46a6b090f0a1903b0e347c975e0725a5ba/


-- 
http://autobuild.buildroot.net
