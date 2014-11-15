From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Nov 2014 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-14
Message-ID: <20141115073014.E4E9010140B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-14
===============================

        success : 193
       failures : 39 
       timeouts : 5  
          TOTAL : 237

Classification of failures by reason
====================================

                 clamav-0.98.4 | 4 
                rt-tests-v0.89 | 2 
                nodejs-0.10.33 | 1 
                  samba-3.6.24 | 1 
          shairport-sync-2.1.8 | 1 
make: *** wait: No child pr... | 1 
                 libssh2-1.4.3 | 1 
            kismet-2013-03-R1b | 1 
                  python-2.7.8 | 1 
               qt5webkit-5.3.2 | 1 
         xfont_font-util-1.3.0 | 1 
                  zeromq-4.0.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 sudo-1.8.10p3 | 1 
                     vlc-2.1.5 | 1 
               mpdecimal-2.4.0 | 1 
                      qt-4.8.6 | 1 
                jasper-1.900.1 | 1 
                     radvd-2.8 | 1 
freerdp-440916eae2e07463912... | 1 
             armadillo-4.000.4 | 1 
                   nginx-1.6.2 | 1 
    host-gcc-final-arc-2014.08 | 1 
           libmemcached-1.0.18 | 1 
               alsa-lib-1.0.28 | 1 
              libsvgtiny-12121 | 1 
                  snmppp-3.3.4 | 1 
                busybox-1.22.1 | 1 
           heirloom-mailx-12.5 | 1 
             host-mysql-5.1.73 | 1 
                     exim-4.84 | 1 
               sdl_sound-1.0.3 | 1 
                 webkit-1.11.5 | 1 
                libupnpp-0.8.6 | 1 
                 gnuplot-4.6.6 | 1 
                  perl-gd-2.53 | 1 
                libcurl-7.39.0 | 1 
                  thrift-0.9.1 | 1 
                dovecot-2.2.15 | 1 
libshairplay-64d59e3087f829... | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/25ef539b6bba7bb31b0f79c9c3d36ffe9ff36949/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/be53a3500e98276df06435f1c180c63579b39fa9/
        bfin |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/b95366345519137ec5afe6f5570e13f7a837b6b9/
     powerpc |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/247b3509ba5602a347734d582be274a436f76b89/
         arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/9fc78dfbd20cb8444d4ea02ee80b7dac5ac51032/
         arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/4346c242afb041b9c0de21ceb64bf7f0cea8c7e7/
        i486 |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/64fdde39e888d3cf0c1e851e4b9281b7d9d72bff/
         arc |                 dovecot-2.2.15 | NOK | http://autobuild.buildroot.net/results/98a85954f217e92f3ebd489bc044b269fea6616d/
      x86_64 |                      exim-4.84 | NOK | http://autobuild.buildroot.net/results/5fff50c5e2539bdea75ae23ad84c63395235cead/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/815e340dcb1160b0eaa3b03e1d840999147cee92/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/b6ee5d8f30601e37cb786eb7732c05117894851f/
     powerpc |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/722f65c4fcc093d6a6a2200c06b2ecb3ee35bc06/
         arc |     host-gcc-final-arc-2014.08 | NOK | http://autobuild.buildroot.net/results/fab7a81594e4e655dc34709b451c17bc2b3af1aa/
     powerpc |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/67a3fc90fc26241f0c8257d08fb44ceea07f1335/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/b527077a6641d63b315e45cf0416d2d06a7b7838/
         arm |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/b16e623568875571dc935e708926b0d385cbb26e/
        bfin |                 libcurl-7.39.0 | NOK | http://autobuild.buildroot.net/results/184087f2e5c0535bc48f99b3c49ea63be7c4aa71/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/30ddffb7c93c04beb95e45b87017c0fcb02f94c6/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/1c31073b7f7a1975507a7a63f8bbdb20b1015786/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/07249f0a001a34ae608a8f8646b26a1152219252/
       nios2 |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/0004923d7aaa9ab0a77c2f49d7a3b9ba90c777f0/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/648eadcb15e6842ace5d75b4eb267e5231ac9491/
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/6d1f4d298a068d746b58692c6919c2b3b2b4a621/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/e3f176a9d2c90120abbdb9c1ff03904eff5c3da2/
         arc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/a3fbfdbadc6f1ef0c59df77b0c2e55f262c6d6d1/
         arm |                 nodejs-0.10.33 | NOK | http://autobuild.buildroot.net/results/0bf17bf710db051d491123482c90f2f72810804b/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/bce5e214bb0ff916b779722c2dc47947404da50d/
         sh4 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/d5f13e4f91b04f877c41c39dac5dedbf4f0a7d89/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/e35560ad0696a475a2f088ad16b175e63c9d3c9f/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/856b0e68e3f900652b25d151628076afe24d832b/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/70bb637819b40ae52242efcba11b22a7de8f530c/
        bfin |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/a62b810958c80c4ac95ec2b5404e58505e5a942b/
        bfin |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/99b81af510fcbe2eb948600d5ad7eaa0aad39352/
    mips64el |                   samba-3.6.24 | TIM | http://autobuild.buildroot.net/results/f21741da74f059c0348f46783ae34585dd9cff69/
        mips |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/162e6d77e5812060001ea22faff99055aae3122a/
         arm |           shairport-sync-2.1.8 | NOK | http://autobuild.buildroot.net/results/1a56dbff3583bed0d693508dfc16859086846ecd/
      x86_64 |                   snmppp-3.3.4 | TIM | http://autobuild.buildroot.net/results/727b5127a03249212fbf57460cdf924946c03650/
        i486 |                  sudo-1.8.10p3 | NOK | http://autobuild.buildroot.net/results/ec406919a36dc7ccb40f08c4cd864cdaed95e50f/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/39d96bbc294a2665962e50fe1997ec1d6f4296fb/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/2594ab7a42bd76e33b3ac64f0763097a9de0dacb/
        mips |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/b21df6f8ecf4893af7c0e56bf913232a9ecdd85e/
    mips64el |          xfont_font-util-1.3.0 | TIM | http://autobuild.buildroot.net/results/1c312e1665b093f3acaa09f1b0d763d4a326dbca/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/8eaa07d2ff1df3418d639ee24832fa8ae8ea86c1/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/4bfa37d84cfcbb2f8a07003d901a075f0f27261f/


-- 
http://autobuild.buildroot.net
