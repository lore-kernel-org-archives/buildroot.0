From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Dec 2018 08:00:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-21
Message-ID: <20181222070030.017BD20A2D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  12 |   0 |   0 |  12 |
   2018.11.x |   9 |   0 |   0 |   9 |
      master |  86 |  49 |   0 | 135 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 15
                   libxcb-1.13 | 4 
                   netsurf-3.8 | 3 
                xapp_xgc-1.0.5 | 3 
              xapp_xlogo-1.0.4 | 3 
             bluez5_utils-5.50 | 2 
                  ffmpeg-3.4.5 | 2 
                  libssh-0.8.5 | 2 
                  linuxptp-2.0 | 2 
                 dmalloc-5.5.2 | 1 
                    efl-1.21.1 | 1 
                  grpc-v1.16.1 | 1 
gstreamer1-editing-services... | 1 
                  libftdi1-1.4 | 1 
            libostree-2018.9.1 | 1 
                     lxc-3.0.3 | 1 
                     pcre-8.42 | 1 
              swupdate-2018.11 | 1 
               util-linux-2.33 | 1 
               wireshark-2.6.4 | 1 
                wolfssl-3.15.5 | 1 
                xapp_xsm-1.0.4 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/0177472263a63b7a5ee5f81986aed016b0518548 |     
  aarch64_be |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/9cdb65db2ff3b46e12977a7ce22c84aa5539d034 |     
     aarch64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/c8168d7178144cc96f70dbe034e9f66511f1f462 | ORPH
     powerpc |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/8ee58f07978444823f881089b94337448a7f7397 |     
         arc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/37cf934ec69a76b6288e606ff203075467c0cfaa |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/cca50ec5a87a32e98a8d92ebdab771516a6f19b4 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f81cbd4845238de2634676c7e011cb01c95ddae0 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a56770e774c3aa3a2986cf976316da7e98e20c22 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4a9682daef2c4e55e074c6a9f486259081fd0317 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/74c8aca23d8f55b97459342f7e1d3a6ffe56fb36 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6a6c790ee00045cbdb222c6323d47b87cc5c2031 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/2ec3ce49b6cd9f5f62916a778c3fb6a9f7fca0fa |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a8994f023f1111235be9f4a701d442df6ecdf2d8 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/07f0f979338f27ef008b4777d4f70c27de96201f |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/05e7efe6c5c28c5ae26ed2e739604090ed3cfa93 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/db8cf6ca2eb3baa8bc61c20c50ff71332dd0c2ad |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/fee0d996aa46752f2f51f6d7dff5be018f04d859 |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/06d489e54a48341e60a990447a9cbd7e648d98d4 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/28e91e6308b85e44270fcd59c5f183f5d8aafe76 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/96aa65794ecaae8782054785946d82d160a07b32 |     
 powerpc64le |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8e302638c828005d83df9586b3daf241dce972d6 |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/aa5307083c829b68e1a1874013a9d545d7981a63 |     
         arm | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/070478f608c35067e79cd78a861ce40ff65046da |     
     riscv64 |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/cc54fec0cd6e35e99dde2f43e0eb28b9d628cd19 |     
    mips64el |             libostree-2018.9.1 | NOK | http://autobuild.buildroot.net/results/7db07d3ed1d0291c9961e9a668840b23a23206b7 |     
    mips64el |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/d16353c34d641c27db57ce468ec2b99709dab663 |     
     aarch64 |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/84d776c8342129a1cafd8dbc2c9c73a7eed2753e |     
     aarch64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/ceab3c19f3a3673e3e39bb2a11bc9bb6ba034643 |     
         sh4 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/5bb832495be99e67c104cfc37c5162b6fc729223 |     
     powerpc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b4144068014b84479bb6b0cedd9bbe279f3c0346 |     
       nios2 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/23b2ab953be7922831efb4fd49f6a57b40ccb8e5 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/80fe256e2499c758b9d7461ddada1603d43cc94b |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/f3f9c0d25f7abe69704b3c6e8a6fffec8a4bc821 |     
        or1k |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/176367d071d53b1c7bff6d2072d56d446c9a974a |     
     riscv64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1f606b51ffbf771dabaafcdc351d10af33a8e6bc |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2cbe1157f6cdd908b1e13c6f909ba71e7f4a5175 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/15c9319771f77ce9da6ac386ff4103c309f86906 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/a790da261eb6257448dad3c746aeab1647a6dd41 | ORPH
         arm |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/c8ef159a0fc64d0e1463e6d0efd755a811401b91 |     
    mips64el |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/882cfa615f8a6bf2eabfd49351fa9044fb1843cb |     
     aarch64 |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/4c3ad1e3d4b94b7f6002306fa33ec1fd987c38a0 | ORPH
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/a6ab460b0f37725d7f296f1a174011831baa5fc5 |     
        i686 |                 xapp_xgc-1.0.5 | NOK | http://autobuild.buildroot.net/results/42a9a0f40128e51ad107242b1d10a7da3513a7ae |     
     powerpc |                 xapp_xgc-1.0.5 | NOK | http://autobuild.buildroot.net/results/7f6d168c6ebf907e1fb1905cdc26fb074a620546 |     
         arc |                 xapp_xgc-1.0.5 | NOK | http://autobuild.buildroot.net/results/68966b01695485ee836217ecfaae7bd1aa1fa7cb |     
       nios2 |               xapp_xlogo-1.0.4 | NOK | http://autobuild.buildroot.net/results/da55148994e32ba72708d66aa30f7926e032f6e5 |     
       nios2 |               xapp_xlogo-1.0.4 | NOK | http://autobuild.buildroot.net/results/47cfd16bf35db277fd26bb5c73d4d6f44ec61ca2 |     
     aarch64 |               xapp_xlogo-1.0.4 | NOK | http://autobuild.buildroot.net/results/1cbd08d1bea4b2163288fe196705404484f9157f |     
 powerpc64le |                 xapp_xsm-1.0.4 | NOK | http://autobuild.buildroot.net/results/7327e29d65107bb39f3735b2e1766bd80431d07b |     


-- 
http://autobuild.buildroot.net
