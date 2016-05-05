From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 May 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-04
Message-ID: <20160505063022.6E25D10128D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-04
===============================

        success : 132
       failures : 71 
       timeouts : 1  
          TOTAL : 204

Classification of failures by reason
====================================

                    mpv-0.17.0 | 9 
                openssl-1.0.2h | 9 
                 rsyslog-8.9.0 | 4 
android-tools-4.2.2+git2013... | 3 
                  connman-1.32 | 3 
                 host-go-1.5.3 | 3 
                nodejs-0.10.44 | 2 
          libpam-tacplus-1.3.9 | 2 
                    mosh-1.2.5 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
          php-geoip-legal-info | 2 
      ca-certificates-20160104 | 2 
                     vlc-2.2.2 | 2 
             qt5location-5.6.0 | 2 
glmark2-499aa81a68fb4c8aac1... | 2 
liquid-dsp-df5a459fa05dba41... | 1 
              gnuradio-3.7.9.1 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                   mplayer-1.2 | 1 
             ipsec-tools-0.8.2 | 1 
            qt5serialbus-5.6.0 | 1 
          sane-backends-1.0.25 | 1 
                libgpgme-1.5.5 | 1 
                wayland-1.10.0 | 1 
                 igmpproxy-0.1 | 1 
                collectd-5.5.1 | 1 
             libselinux-2.1.13 | 1 
           host-openssl-1.0.2h | 1 
                 lvm2-2.02.151 | 1 
                oprofile-1.1.0 | 1 
                 setools-3.3.8 | 1 
                 omniorb-4.2.1 | 1 
                  boost-1.60.0 | 1 
                 mesa3d-11.2.1 | 1 
 toolchain-external-legal-info | 1 
                     fbset-2.1 | 1 
make[1]: *** wait: No child... | 1 
              macchanger-1.6.0 | 1 

Detail of failures
===================

      xtensa | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/81cccdd66b402f23dac42ce4fd9a238ceab4dc09/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5f75fae0d57d38ca4104ba82fbcb2565fd8829cd/
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4cc8823bee023c378f09dfb57632faf2e71c8712/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/861838ea924869875e41d0c2043b84d8e0fb6d5c/
        i686 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/da957975b8bd54bb782773842d7cc3909782795b/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/1f83e698c188213ad24453ebdee372f7ce64ab59/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/36076bada33ae6870d3ac023d32bd708f04d2a1d/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/b829408c96982acdb23d484bf42afdf7bc41b682/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/b848a103668fa5e704a958947021b1bd25ae8798/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/f7ae3ce4fa44e4f6c2c543de8aca55916ac9e7e7/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/5ede197648c5d34f523034a1308a139a50b2e46a/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/49b6821468ede8b1a06b2df3cae2d1d8ecf5d345/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/2efc0d83f7eb9d2342bbd435852f8f950edc173b/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/708d5bda1c4763c868bc1094e2d7df674a4fb608/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/58c261101453dad1c7e4ac8f5f007f3a797fe359/
      x86_64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/bae84b77fe26cb05be3f3ee47f3afbeec7b02aae/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/93500792cd1c9c5558700cf44e00bd6839566e85/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/954a7baa26500a4c1e1a335b7cd19210ffd775d5/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/953a10d70109764763b5304d267d4209df05b084/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/cc21447e1826d769bd9f2e5daed6e444ad3e4160/
         arm |            host-openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/43ede034730de9b6e7ffe95a7f4628394749b683/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/6861f90e083652b6ee0596980fbfc29d79a58f8a/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/132bc19bc108237e1e1616d37a6b8d410e2bb074/
         arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/44a9b32a74332cdf3288b3e217c2f00aac574c19/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/41e11f7eb7b85420f087e3d1563160e718bea94e/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/5bbdc7e158bcf8bc608231cc27b4f8fda4931307/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d516f9aa46fb869c5e3c70b59f100fb9922e71ef/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/b07768b24eacbda50c47bdab8da063bc17ba8d29/
      x86_64 |                  lvm2-2.02.151 | NOK | http://autobuild.buildroot.net/results/b0a603be4840d77ff7bbf50f5535d14ad6c6b7ae/
         arm |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/7966ad4f994d893918368891107f660295164f07/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/9d468f980f933d8cea1d89003eb1d5c7b24e18ed/
        mips |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/0988895a82b67235156773080cd17c5d099408a3/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/62d690a6adcff389ec32d03c3ef8d5fcf62c6abc/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/a7b051883e3c7fc63e566fb49dcd32ff9ff4cb94/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a8b3cefa22c15759943e19b2cc8adcbfbc5bd9b3/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/8076be460a9776b1ac3f2e0315ab897c721154d4/
    mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/3aa749b824ae6acb9809d75c3ea630595a841913/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/61a95be676ba234218b368ffe7f42e3a7634083c/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/030c093ada42f81fc77ca3065e4526aba6a11bc1/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/dc3d4d72dbbef54a5f79a87b22a4d40caa520946/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/15cce5d65711fd6dd4297e97b043c6f0d588782d/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/8afa79ce1009f97074ca5d010055b68ef75cbd0c/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/f2690db08a959ad895074688fd5dac12898b9864/
      mipsel |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/8f145dcfdf508c3c9ce04a165efa54c048c1f6ae/
         arm |                 nodejs-0.10.44 | NOK | http://autobuild.buildroot.net/results/2b41dafece621f0891ef7b5dce412e2c6114eff1/
         arm |                 nodejs-0.10.44 | NOK | http://autobuild.buildroot.net/results/3241cf3234ee2231f559f71c6dc7a98fa69d4da5/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/a82cc36f17ff0c1c4e2aba4f7fb8ec11bb25b352/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/e022c910efbf37c7db67d8558ead8ef6c2055211/
microblazeel |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/6c497f3531fb60dc02700b8ed0c99af8e5ebbdf6/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/109a40d3af2b6709109355dfe83e4a80a171be0c/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/4b93622286c1031f610f9e816ff9907a9b3c8bc4/
        i686 |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/fc9a386f8a1eed1ee31964e7e9f3b04308c381c2/
      x86_64 |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/d417f95e84e062f37cead932e7e447d3ff23e493/
     powerpc |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/550eca208ad5bcdc8b96a43ce00350c5dfb03253/
        i686 |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/259f58d4789347beef99dbba45a420ea1692b200/
      mipsel |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/bb497b9bca7aafadc1237efcb6448b098417f074/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/aebe6ab19351041f74a3335dd50cf5dafbb16b83/
      xtensa |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/8a2cf319267e755bc392d3099235d92c776071ac/
         arm |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/52eecfeeea3e28e83ab3e6b13b6417a00b1e12f3/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/49d794997d8d77a0d9851115cdbd2f195820e2a2/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/e9693cf98a257b31f05fff7a58cf5e533db21800/
        i686 |             qt5serialbus-5.6.0 | NOK | http://autobuild.buildroot.net/results/f58643ea8cfa6db474158a6e97b3e0cdccec97bd/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/7c9bc7fd8d514d5fadf83db65b571dd492e66982/
        i686 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/053c453b943e295d08c1fc72243f23b7d9ddb272/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d3e9ffd566a0b9000dd15ad21b06d12a873a1cd5/
      mipsel |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/09bab70c0d5941c1904329de3629be98264e5cc9/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/0f6e21427f3196c43526dcacdd689702c2b01ee2/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f989946d71e48d833be57f449977571bf343dc1a/
        i686 |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/ae9537221541dd2e44a93ff3ed642066581d0fe4/
      xtensa |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/b7bf96afd9ec2a3399d460beaeae647b3f05a0d9/
        i686 |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/ee8d1d44c99e6382c44ad10b28d3f835846a846f/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/dbda30327dac8649f2af15a2c24a704909ff4c8d/


-- 
http://autobuild.buildroot.net
