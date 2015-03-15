From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-14
Message-ID: <20150315073019.D37D9100D8E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-14
===============================

        success : 264
       failures : 72 
       timeouts : 4  
          TOTAL : 340

Classification of failures by reason
====================================

               tcpreplay-4.1.0 | 21
                  uclibc-1.0.0 | 6 
     host-python-cheetah-2.4.4 | 5 
softether-16b713b98da8dba29... | 4 
freerdp-b21ff842ef3de583751... | 4 
      host-gdb-arc-2014.12-gdb | 3 
                     vlc-2.1.6 | 3 
                gnuradio-3.7.5 | 2 
               libecore-1.7.10 | 2 
         lua-periphery-1.0.4-1 | 2 
             host-thrift-0.9.2 | 2 
                collectd-5.4.2 | 2 
            gst-ffmpeg-0.10.13 | 1 
                espeak-1.48.04 | 1 
                host-gdb-7.7.1 | 1 
                  prboom-2.5.0 | 1 
                    wine-1.6.2 | 1 
checking the name lister (/... | 1 
                    php-5.5.22 | 1 
              xmlstarlet-1.5.0 | 1 
                libnspr-4.10.8 | 1 
                 omniorb-4.2.0 | 1 
               host-qemu-2.1.2 | 1 
             fxload-2008_10_13 | 1 
                     rpm-5.2.0 | 1 
              lbreakout2-2.6.4 | 1 
                  snmppp-3.3.4 | 1 
                  python-2.7.9 | 1 
                    olsr-0.6.8 | 1 
        gst1-plugins-bad-1.4.5 | 1 
             armadillo-4.000.4 | 1 
                   strace-4.10 | 1 

Detail of failures
===================

      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/b61acea9bbef0052483450ea85a5e2e0e8bd9b7e/
        i686 | checking the name lister (/... | TIM | http://autobuild.buildroot.net/results/d5cba6b2d731cfa605b6a8cd19d81f2a955a96e7/
        sh4a |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/0f1a2ef4a23ae6a0017feefa888027217b096854/
microblazeel |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/dbeb3154395fd5a601478161283659c63bbf2fc4/
         arm |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/2bf2d0ab36872e20edbfdfd5adc3a7d878ced11b/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/12a913e0679c9f3b7750962b8c8ec3282b617906/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/8a5c9010091f5e4fd151ed1204dca97f680311d4/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/5d10f8c38ee088e8d3e7c13e84df8710c3684988/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/91bdc55ced0874aeaddc7fdbdc95cee2b7f1c8cc/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/19ea02481a5f9d99fac0e6a2b4e2c1ded3d65c8f/
         arc |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/a98e625adc3a439976f3333d1607d06c4df6463b/
         arc |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/d3bf5ba39c26992c1f13e48f0b91391801241afc/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/1cdee5426898d71c380e460cf0aa1c91bb34e38c/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/89c99a4a97025166f868f28e89929e423f505df5/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/888a135ec4afa21c6717298a82aabd07a0f671b4/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/48c8a7e0d1ac9e1770465495b7cae261dca0a7fb/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/60171d120ca2c887d9e908e41ffce6c9aee67cce/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/4f4430dde0a3f52768c722f8ea3b1ea3139523f0/
     powerpc |      host-python-cheetah-2.4.4 | NOK | http://autobuild.buildroot.net/results/fe580287597946c46484ff36058e15cf58b5027b/
        i686 |      host-python-cheetah-2.4.4 | NOK | http://autobuild.buildroot.net/results/a98fc6661d9e9d4715b6642b470d6261140fc023/
    mips64el |      host-python-cheetah-2.4.4 | NOK | http://autobuild.buildroot.net/results/ffa8d4763ebfd2706a9aa740338a3633531f6321/
      mipsel |      host-python-cheetah-2.4.4 | NOK | http://autobuild.buildroot.net/results/bfdc9750ae8a6012feb54af2b4965d7c4151114a/
    mips64el |      host-python-cheetah-2.4.4 | NOK | http://autobuild.buildroot.net/results/3b63c9ea030f63cfa32e1071331e69a329bd7b5e/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/80811aceabc782423a65b960558b708cc3786d7e/
         sh4 |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/96f768d59556775f252ee8b52b7c89d641e6473d/
         arm |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/dd34d0283b318730e5a8e5a5364961d763d0d869/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/00f6c68cc7fbc2c23b995b0e12244bd6a3202f5b/
     powerpc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/b9b4a9515dc530936f10626cf04c7fdda2d19b7a/
microblazeel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/abc38c2bcd1e7179aff0fd9e5b38bbd387410757/
     powerpc |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/a65588aa91a87f9a3d8af2a485de2df3e30cfc19/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/43427bc897d62690986f1d5cb56bd0e11a47d926/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/e6414928628c89891bd05191e39b65b0011b963b/
         sh4 |                     olsr-0.6.8 | NOK | http://autobuild.buildroot.net/results/33e69998d152f819176c7aa3028a962dd32c1daf/
        mips |                  omniorb-4.2.0 | TIM | http://autobuild.buildroot.net/results/0647c7c98b7284df7b2bd206da740cc415801022/
     aarch64 |                     php-5.5.22 | NOK | http://autobuild.buildroot.net/results/04d85863132f97f4849a5a2b33b377a8dbfac10c/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/ed4d11274c813e93858fba20d26d12827245b944/
     powerpc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/92d5eb267d5422b3cad0ea5887fd86f46dd38a00/
     powerpc |                      rpm-5.2.0 | TIM | http://autobuild.buildroot.net/results/39217190834bfaa32a853d8f37899c9bb644778b/
      mipsel |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/aa86afa2518bd65a65ae3603d39a815d66336ee3/
      mipsel | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/12a9de3d946b1379ed8bc772e556f163af758e6b/
     powerpc | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/188e108b95ef8bceac384094e649486095852bc9/
         arm | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/795b02b656e3a6f265a5182140f4be62cf22ae7f/
      mipsel | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/4a2cafabe048c5255b21cf25f149542561f60935/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/228cb9a6124c287f6b3e9d4ad2f1c8ebc428babf/
         arc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/77b01a78211b114390d3e600587f4ef9daf7a6b1/
         arc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/bbde2b62d4b677e71a62b25fb9ccb4ac4764a4aa/
         sh4 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/792e18c5f46118ed279df0184ea90f8f10bc199b/
      x86_64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/5dedfb19df476a633e4449d44e7ba2778bf5b737/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/1a7b4ef766d880aba23420a83d0239a06678c242/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/1265e2afecda65015a2f7b0ea1f0f172cefd7137/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/d4241287ec23c57ecaec3d8e9e6c565f73fea9b1/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/13e06074f6677c04ef367a7f42a1cc33d7c3b1d7/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/3bc058d979b719ae58e68e295697edddafacf034/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/c985e34d51a7bef898fe263018883cd71ed13d9f/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/ad4a117dea2b0da51ef7438d4eb92a605b154333/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/c59256f772ff72a9ac37f728224fadb5bbfa2cb2/
      x86_64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/8debce3c804a9c167cdb5475f3006429cfb38a6d/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/e3e64213cc0f9a819ef6c1b2534d0a5c9af725f4/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/62b2adf21576dd6fe0dc03225bef78ceee41f36c/
      x86_64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/72b543e7faf9be3289e581b0b155dbdde8c8d0e5/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/42491ae3bec5f5df72fd6b44fdc2b6b8d1f130c9/
         sh4 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/690a15141ca8bbfd3967e9e1e1242d9ba87c49f9/
      x86_64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/eef0fb2f6414908c65a95a30f04fde1c9d25c4e9/
         arc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/66f5754a57395fe1bbe872d1ff9aedf8dc8dccfd/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/4cf8e0e183d1c120c9c771d85423525ab1d2a115/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/6180758c926fed46494281fb3a19e3845acacc84/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/5c34e69d69eecbd3f78c510677f5e7bc5a953d2a/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/91c2fda1f004ac8a494fd18040bc8245a991cc57/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/dac0f1076b3007fa49ea9aa4d95ecb7197d9e984/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/078086189d8cb144da74c5b6999baa96def1ec3a/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/f8c700769e5a59183aaaf25e863d209294f862b1/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/08d9222836c8fcd922db63f1d5752a9640f36b1b/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/64c3061fc8019aac26ee66db342887b0671915fd/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/04e83de00133be86d41f3fed4923e9d0f8d84794/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/d01a3c7786df8cfd962a27f39283851db45c6165/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/5d2109e2a319148fa4aebb26e0a361f35f872781/


-- 
http://autobuild.buildroot.net
