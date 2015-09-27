From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-26
Message-ID: <20150927063015.F21321028C1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-26
===============================

        success : 226
       failures : 47 
       timeouts : 0  
          TOTAL : 273

Classification of failures by reason
====================================

              drbd-utils-8.9.1 | 3 
               util-linux-2.27 | 3 
                 mesa3d-10.6.7 | 2 
                flashrom-0.9.8 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                    ruby-2.2.3 | 2 
         conntrack-tools-1.4.3 | 2 
                  ltris-1.0.19 | 2 
              libstrophe-0.8.8 | 2 
            micropython-v1.4.6 | 2 
                ipmiutil-2.9.5 | 1 
                  mono-4.0.2.5 | 1 
              gst1-libav-1.4.5 | 1 
           qt5multimedia-5.5.0 | 1 
             fxload-2008_10_13 | 1 
                 dropwatch-1.4 | 1 
                    neard-0.14 | 1 
           libfreeimage-3.17.0 | 1 
                minidlna-1.1.4 | 1 
                openntpd-5.7p4 | 1 
                directfb-1.7.7 | 1 
               iptables-1.4.21 | 1 
              strongswan-5.3.3 | 1 
                     rpm-5.2.0 | 1 
         qt5imageformats-5.5.0 | 1 
             lttng-tools-2.6.0 | 1 
                 iperf3-3.0.10 | 1 
                  libsoc-0.6.4 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                 sudo-1.8.14p3 | 1 
                busybox-1.23.2 | 1 
                   squid-3.5.9 | 1 
            ibrdtn-tools-1.0.1 | 1 
                dbus-cpp-0.9.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 

Detail of failures
===================

       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/44c61dfd3d3f6d6e5a43d014df468be3b2c73fcb/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/54e62f91358e12ee4aee015c98df30885d2cd621/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/d7bd0084fc57239415d3f95c14f72d2d61a08990/
      x86_64 |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/177b07699e92b8e3694837150889ce3472970e07/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/4978d8562d89a45ed18fa78dce47ad720ac54964/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/3896a3ed880d2e07abb09bc5d8fc4360ed87f7b5/
      x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/e906fde06cb3fe4bcd14b60758fbf0457e404dc7/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/d05b13b297c07c3f8127a2d2b179a4396076fae3/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/992f868545a6f8efe65afbe25f401465c160521b/
        i686 |                 flashrom-0.9.8 | NOK | http://autobuild.buildroot.net/results/2a5da78dd5b2922796e3010e4a0477cb9f6355cb/
      x86_64 |                 flashrom-0.9.8 | NOK | http://autobuild.buildroot.net/results/30c83f9c60ac5c7359ddabdc1f190ab12433ae92/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/5051eb794facc7223117c2de21d6a8eabcd3f8c9/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/0121d2d8301b4eab6df1d745a4014d13ed182d6f/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/24a5f843f5076f08b1b3bad2b595556332fdab93/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/75ce07c2d30eb2c35a36424161fdaa372ccd4d7d/
      x86_64 |                  iperf3-3.0.10 | NOK | http://autobuild.buildroot.net/results/a169824e10e99123bb825899a7efd7cf6fa23b87/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/e31d94847cad9216aad839c2fbb312e9ea0ae75e/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/aeb5939284518816544d1d962f0688261b0eeabc/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/c83b4002cc7ccb4e9e51364a3c3d48503fe05dbf/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/cae09a54bc09ad05292ad147013bd1481bb43c51/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/f7f74bb3b9012db1a374f813f40a51827de844a2/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/723d0adec6f108a904cca5ddeb0cf050b8103db4/
      x86_64 |                   libsoc-0.6.4 | NOK | http://autobuild.buildroot.net/results/6f98e4ce49db963994f03ad3475dd1643384ac73/
        bfin |               libstrophe-0.8.8 | NOK | http://autobuild.buildroot.net/results/9f0b20f1503f609c6af0019130127d884ee0a50b/
      mipsel |               libstrophe-0.8.8 | NOK | http://autobuild.buildroot.net/results/047e319b9d7bf0cdaabc007326a6d67de2c1ee52/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/b965694d80247ac5b54114e8d27dd69a40ee948e/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/00d7837df4eec30ff7f0dc3e9ca8f69633cfb31e/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/50f142f0d5d531bd8d416dadb59eb54b24041158/
    mips64el |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/e2e2e2b96ece70710ab490e7bb7369af7d1b5a23/
       sparc |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/8c4b916762f6fe0cb070ad0f51643dcf071b736a/
         arm |             micropython-v1.4.6 | NOK | http://autobuild.buildroot.net/results/ef7d47dde06e1c5997a200aa9277e919bc93e9bf/
         arm |             micropython-v1.4.6 | NOK | http://autobuild.buildroot.net/results/d4cfb2842d3f1acad45684bdbb2b75e04b9b85e4/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/2906b2bfd46046192b0c18d04b1070af77397696/
       sparc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/b23cad402c3666fe5e3d1cd89a1b614a52bdb2bc/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/659e17b43f3322aafdbf48dee185f5eae3605a10/
     powerpc |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/f388d981b60a9cef2b409ab0e6ba239210c0cdc7/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/19d1b183e336a19c74c73571585df4f81281d47c/
     powerpc |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/3c92d3862a30d4577dc67b3e3bfda6186d78d6fa/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/8c9f0c95d2c9f67dfca27ba940362f512b212294/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/06ad3e8cc836fffcb7f8e8f8ce724547da19634e/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/45241300f8bdbed8a6ba618b8c689f19de0561ba/
         arm |                    squid-3.5.9 | NOK | http://autobuild.buildroot.net/results/fc2772181186833faa812399e47d8379f8c45086/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/79ce14b7c0bd44f1b1d30d37ebb80aff713ab493/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/56bb913e6819143de5cf4308aac439bf42b01758/
         arc |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/a7dc61846c586e819ffd5086a812b6de7de5bcb5/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/b2c15bc6e0322d44f9892dcd06eb2cfcb855c36a/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/ae5ef99371633214f8f37a51a2aba001433eba09/


-- 
http://autobuild.buildroot.net
