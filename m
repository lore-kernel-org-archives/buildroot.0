From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 Sep 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-07
Message-ID: <20140908063013.831E9101099@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-07
===============================

        success : 157
       failures : 49 
       timeouts : 0  
          TOTAL : 206

Classification of failures by reason
====================================

                        jq-1.4 | 15
               libiscsi-1.12.0 | 9 
                      ftop-1.0 | 3 
    xserver_xorg-server-1.16.0 | 1 
                  opencv-2.4.8 | 1 
                   erlang-17.1 | 1 
snowball-hdmiservice-f75c99... | 1 
            host-texinfo-4.13a | 1 
               alsa-lib-1.0.28 | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
              libgeotiff-1.3.0 | 1 
           xapp_bdftopcf-1.0.4 | 1 
                 libedje-1.7.7 | 1 
            xapp_xf86dga-1.0.2 | 1 
               mpdecimal-2.4.0 | 1 
                  thrift-0.9.1 | 1 
        gst1-plugins-bad-1.2.4 | 1 
           libmemcached-1.0.18 | 1 
                  python-2.7.8 | 1 
make: *** [core-dependencie... | 1 
               libcap-ng-0.7.4 | 1 
                     radvd-2.6 | 1 
                  zeromq-4.0.4 | 1 
             lttng-tools-2.4.1 | 1 
                directfb-1.6.3 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/a4d3ad1a79c70ebfae582abb1fbefc71dd98f572/
      i486 |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/193ce6be527225866f12fe795431d741417f1f0c/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/01e8858c6ef8ef8d459e72aea513a0024190f65c/
       arm |                    erlang-17.1 | NOK | http://autobuild.buildroot.net/results/154b300ca84b9360077fb6f8244edc79ed472526/
      bfin |                       ftop-1.0 | NOK | http://autobuild.buildroot.net/results/6031efb02c290cc7ef1b1d2b19b5098fabf23fc9/
      mips |                       ftop-1.0 | NOK | http://autobuild.buildroot.net/results/fa8019aea75dcf616fca255c6b3ff65207977654/
   aarch64 |                       ftop-1.0 | NOK | http://autobuild.buildroot.net/results/af42457efb5aa08622cfc82a3d15ad08b8968a2e/
       arm |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/62622adb47c7dbe9ef0420163a560406210fa248/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/82f4843eb0a6f7ce6c1554f1e0b783f6506ebe71/
   powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/aaf3c114e0ca3e265ae32c646ba67f01aaf608bd/
    mipsel |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/abf4901330b1f60e499df43baa21971ec817f616/
   powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/62c7999c87a521af05047df011cd79df914bed8c/
   powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/fd78bbba3751199d96b9cacc70f2f2462c583658/
    xtensa |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/612909c101cc1b19eb18b89d3420d5c551a121fb/
    x86_64 |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/44e6323abb86002c8071f566a2e251103338f56e/
    x86_64 |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/42e9201e7ea04274f5c23893438285cb4c9412fe/
   powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/538217769ba6ab9983fa9bc87e5511b2f2c9eb8c/
   powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/e7b21bd8397f2d8ef9ba3acc9a06e024ef514f84/
   powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/56a8d5758e4e8884835a39f865faf3b042be2918/
    mipsel |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/af9cbf5f2beac5216e3c9ed503b91485409e3da7/
       arm |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/82b949191abbc32462b8166beb105e0e152aa123/
    x86_64 |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/af8b6fe8b081112101ea667735343135625b6e8a/
   powerpc |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/831ffb0a37a8007b2a824659e46dbe9e6e710d6f/
    mipsel |                         jq-1.4 | NOK | http://autobuild.buildroot.net/results/fcef84cb1c1a6b76add2fe8eaee8e6fe0d051e98/
     nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/9ad8c9f7e5d067bcfb84e57f4e9133d6b4c4744e/
       arm |                  libedje-1.7.7 | NOK | http://autobuild.buildroot.net/results/76b11559edefb65818aa559c7134a6f20d56c5e6/
      bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/cfcdea9a150c8aa23bdd0ef01d1b8083c64084fd/
      mips |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/389992938f1b69f633bde3c773b27e8136ec4942/
       arm |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/91745637288fdecdfeb373de7c0978d408340acb/
microblazeel |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/1a4cb36465b9d76744d5ca29696ffea1bae9bef5/
   powerpc |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/23c27fc7c4836dfd2527e52d95d5e72905ece7be/
      mips |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/b52782c7ada0db098620bd8eceedd7b84515446b/
    x86_64 |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/10193ed56dc1f01b86fd48d7e3db10846a7e1575/
      sh4a |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/522da67c84d4a848e506b249f72090dea662e3e1/
       arm |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/3fea37b2df1f1faf66a562df6c9f4f98b7bf5e00/
      i686 |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/b5e9fcb60b74fcb6bf6691d4490ccfdd0f90515a/
      bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/c6a1065ff956f2767d540ef6ab5434ba2ca33252/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/2909ad46d18a4ba990f755f8c0b53e9d8fcddb7c/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/9a5ce07f7227850e44927c13dde0e821e65c083a/
       arm |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/c10d78911b79e6f7c24e9ce52bfac6c12a9a6f39/
       arm |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/3916b1dbfa928ea9f2993d10fab5037e3b87d526/
      i686 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/5e9f35d8e715fb3b379c71306f8eefe423c02473/
       arc |                      radvd-2.6 | NOK | http://autobuild.buildroot.net/results/45ac996c8444a35e8a3221df572aed20c21c0e92/
      bfin | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/26ca4ef7b2c2dd2606cf551536caf133602b32b8/
      bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/2a5707fb3ac1450b6c1ef7321eeeef342b6df862/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/5013c42e9771c663663735ffd07501546bad8cc0/
      bfin |             xapp_xf86dga-1.0.2 | NOK | http://autobuild.buildroot.net/results/e76b8ff1767f061587b630091174c58da599d5e3/
microblazeel |     xserver_xorg-server-1.16.0 | NOK | http://autobuild.buildroot.net/results/05f2f1317f366b724c2d6b1bb572bb6778c69896/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/97cafcd8e5148348f9d4cd95ef6a354ce6a24c6e/


-- 
http://autobuild.buildroot.net
