From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-06-28
Message-ID: <20140629063012.3ACF5100FA3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-06-28
===============================

        success : 96 
       failures : 34 
       timeouts : 0  
          TOTAL : 130

Classification of failures by reason
====================================

      jquery-validation-1.11.1 | 12
                 webkit-1.11.5 | 2 
              lm-sensors-3.3.5 | 2 
                   atftp-0.7.1 | 2 
                    sdl-1.2.15 | 2 
                  dnsmasq-2.71 | 1 
                    dash-0.5.7 | 1 
               libcuefile-r475 | 1 
                      qt-4.8.6 | 1 
                  snmppp-3.3.4 | 1 
                 openssh-6.6p1 | 1 
             lttng-tools-2.4.1 | 1 
               alsa-lib-1.0.26 | 1 
make: *** [core-dependencie... | 1 
                 libnss-3.16.1 | 1 
                 libfcgi-2.4.0 | 1 
                libmpeg2-0.5.1 | 1 
                  zeromq-4.0.4 | 1 
                   czmq-v2.2.0 | 1 

Detail of failures
===================

      i486 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7490e69973d6de67749c0b6198d1b31acd4c111d/
      bfin |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/be784bf4b03bfe20bbf4a6c1f411f7765e37fc97/
      bfin |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/6f4cb28572a5d8026937f84db536d5f5b3fba193/
     nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/dab6d5c724c41e226685246c2596b62854aa9a1f/
  mips64el |                     dash-0.5.7 | NOK | http://autobuild.buildroot.net/results/2992395a15763a517789fce23f3d0d703475a6cf/
    mipsel |                   dnsmasq-2.71 | NOK | http://autobuild.buildroot.net/results/7cdab3b6f74dbfde965300a51e58a377ba30602b/
       arm |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/89d196e36773c42dd662bbd1c1c80dc4f7cf11e4/
      i686 |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/18499b7bca318d6ab7a84c290b31413db9381b6f/
    x86_64 |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/40701ac7486eb83c5363c2691a8f669e0fc33531/
      sh4a |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/f979de9b977eff56ec415ccfda62c7ad8510fb34/
   powerpc |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/b63954aad3f6df206131253452b17fd9f0beaa4a/
      sh4a |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/5e511e42b9ae655a8370d08ba6a46bc30b2868c8/
   powerpc |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/0bac38782c36991ea775a3f6328e738edfa2bbd7/
       arm |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/96ea14f71cf2e61cf9efe61e6a074bea9bbaab36/
       arm |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/63e2d9836aab23a7208c04f287f7d5d589dd1063/
   powerpc |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/597a2a6e627aae40e868f11c31d5b51d0a37dee7/
       arm |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/5a94f53986ab924ed40eaf9e5567e2a0fa44f662/
       arm |       jquery-validation-1.11.1 | NOK | http://autobuild.buildroot.net/results/0c27bf0c8304fa388adefb1a8f3b24ae04488954/
      bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/0270ce1e4b93fbc5128302b0b317071b2a29fe2d/
   powerpc |                  libfcgi-2.4.0 | NOK | http://autobuild.buildroot.net/results/71d9ba50b41efa05a3aff06c24412d5e8b81d8f1/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/614f453aed7b11c27416d1e38e9f578077d6f72f/
   powerpc |                  libnss-3.16.1 | NOK | http://autobuild.buildroot.net/results/403d3e19e1a8708772c7ad7f1e8dba8848e4180a/
      bfin |               lm-sensors-3.3.5 | NOK | http://autobuild.buildroot.net/results/f42afe54d245aa0bd57fb09c8c28bee36ef7954c/
    x86_64 |               lm-sensors-3.3.5 | NOK | http://autobuild.buildroot.net/results/f537690c86adc5a770022b98932b312d55211d70/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/c58b7fd5642c43d42b2026964016172610baef4e/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/3193468e5cae17c7506036bf04c2549ef5d623b5/
       arc |                  openssh-6.6p1 | NOK | http://autobuild.buildroot.net/results/c0fba1066579f0909dd22d97bb5ef51f71c1215c/
      sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/0417b4f5b6a4b47ce52988a85d734e0d74b619ce/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/699049411548f07c4f1892b73f12f20b65dd7f6a/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/f0a9970d06ae878ea8e9fab8209813fec6e3418f/
      bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/380859363f3f1fccac3c5bd03f663cad6036a8bb/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/621fed0c8fe9ac69efedf93c7db9eb8e5c0453f0/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a830c45ff532d7bdcda0b41ce49e7c2f5cbb47c2/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/56f2c1c1dc4e4565e3ce0c64a301d0d330a8f48d/


-- 
http://autobuild.buildroot.net
