From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Sep 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-25
Message-ID: <20140926063014.1B9F2100A66@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-25
===============================

        success : 203
       failures : 38 
       timeouts : 7  
          TOTAL : 248

Classification of failures by reason
====================================

                 gnuplot-4.6.6 | 14
                      qt-4.8.6 | 4 
               valgrind-3.10.0 | 3 
freerdp-440916eae2e07463912... | 3 
                 cdrkit-1.1.11 | 2 
                  zeromq-4.0.4 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
                   geoip-1.6.0 | 1 
             e2fsprogs-1.42.12 | 1 
                       unknown | 1 
          sane-backends-1.0.22 | 1 
                 gnupg2-2.0.26 | 1 
                    fltk-1.3.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  python-2.7.8 | 1 
             lttng-tools-2.5.0 | 1 
       directfb-examples-1.6.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                  fbterm-1.7.0 | 1 
                 mesa3d-10.3.0 | 1 
    host-protobuf-c-v1.0.0-rc1 | 1 
                  opencv-2.4.8 | 1 

Detail of failures
===================

         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/877724ff5ce85b2bb7d465f657636ba859666450/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/f0c1d65b6b3893b331a3bb2e1fbeb9563b9369b0/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/518c4449e5da7e4190b1ddd83331ec76d29cf029/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/f214c1be37d819e94a33ebab3a987f609380b1e2/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/863cdd78f94d201df448143e686c577b6e95a8f2/
        sh4a |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9e45c2452d452e3ec6912763d19828c75d93c594/
      mipsel | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/7d5477a19c95e3b6658b692866ea9765bc3b5452/
      x86_64 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/5a30aecbb426f76a22e8285931a0a8cd59b5e70b/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/6e0de0538e95ae156f7d2ad6eede46e44be81c8e/
         arc |                    geoip-1.6.0 | TIM | http://autobuild.buildroot.net/results/5f06e9f368f02e362a6ca5f35a87af6fefefb13d/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/dc9e0e4ff1225d8fb74b08aca582f8243aee2075/
     powerpc |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/a240075674ac8965ccedfa830c684dcec6da7fb5/
      x86_64 |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/925fc731e404282873f2c586c98b05da5ce96ae7/
      x86_64 |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/6d0568ed52711036be605ce8b6c38cead242b7c7/
        sh4a |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/d9cdcdce433c1bbf53edd4e92354cddc2e0b879f/
microblazeel |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/2e6577599de0aa7dac44404c176b2e5680a5ec10/
    mips64el |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/51ceeda0ba7fe45b942abe47cfd9f4d7bb7fdef4/
     powerpc |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/2a328042e8023de62da95c08c2b8dfcfb0ea97c8/
        i686 |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/f0763155b1e9b441bff4f353de172d61b266d9c4/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/fbe6439a72a22caae5f0acd64cfa4cf2797ce214/
microblazeel |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/7cde6635dd3ca838784c88a22cae9c63bcb2d7b7/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/91098f04daa8bce72d7daf8e442e3207c91db8e0/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/37b0ba133e925ef02ce3c515bf75b8761b6f9128/
      xtensa |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/f78ed3f24d75cab7feed7853fd37ad6bfa3aea33/
    mips64el |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/5a7816b5d1933cc8684c6cff3a6feb3a60afa4ea/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/a7d3bf97c4eebc289d792278db714327dc0aebeb/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/f06b5ca963014c400911684956eec7da5d52f17f/
         arm |     host-protobuf-c-v1.0.0-rc1 | TIM | http://autobuild.buildroot.net/results/12e1073f7158bc22447ef4a1b0e51293863d877c/
         arm |              lttng-tools-2.5.0 | NOK | http://autobuild.buildroot.net/results/2259682dba56c68f2270d9ce82df228cdaf66dff/
        sh4a |                  mesa3d-10.3.0 | NOK | http://autobuild.buildroot.net/results/aed492259491959afe29523465b2073007758e1d/
        mips |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/31b124ff1ec958a621863bfc80323847a6373135/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/bd4da4ba295fb75d019674efdf83131fd5eb29f3/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/8ca3ccdc596a9751bca579f7c571d238d41eb352/
        i686 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/0765828cd8741bbff159cb1abedd474a44e1a960/
      x86_64 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/38a3c60674cf2602ae5fe13caa70057167321abd/
        sh4a |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/3b367f1e3b840155a25e7848cdf01f7e78cda554/
     powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/d06eb653815503ab5ba42044def5cde6ad5abd88/
        sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/227610b4bb06fd008c27365e3e0b89b35cb559bc/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/90fce8ac0d9720829a944da4861452f8c1ab3259/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/866634096f57892261a079d0a848bc3cf47a0e04/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/f039a4ea3afe60fdc6345e8d540fbeccd46075d5/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/c98793cc58eb8e651e972060de805ddd890f328e/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/a74c38e8aa4059e7b316ad471aeb3a62b4f47d33/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/3b5593d031b2d7b0299901f47e7fbd2c39bcd036/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/7c06d400a8d211e9b5df35b81f8518d95b7a57cd/


-- 
http://autobuild.buildroot.net
