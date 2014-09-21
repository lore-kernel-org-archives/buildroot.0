From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-20
Message-ID: <20140921063014.4E0101017F9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-20
===============================

        success : 182
       failures : 27 
       timeouts : 4  
          TOTAL : 213

Classification of failures by reason
====================================

     openvmtools-9.4.6-1770165 | 3 
    bandwidthd-v2.0.1-auto-r08 | 3 
           libmemcached-1.0.18 | 3 
                 qt5base-5.3.2 | 2 
               alsa-lib-1.0.28 | 1 
                 gnupg2-2.0.26 | 1 
                 python3-3.4.1 | 1 
          libmicrohttpd-0.9.37 | 1 
                    ruby-2.1.2 | 1 
                   czmq-v2.2.0 | 1 
                    fltk-1.3.2 | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
               qt5webkit-5.3.2 | 1 
cannot allocate TLS data st... | 1 
                  prboom-2.5.0 | 1 
              wireshark-1.12.1 | 1 
               mpdecimal-2.4.0 | 1 
                 sudo-1.8.10p3 | 1 
                  thrift-0.9.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
snappy-1ff9be9b8fafc8528ca9... | 1 
                 webkit-1.11.5 | 1 
                 cdrkit-1.1.11 | 1 
       directfb-examples-1.6.0 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/257681d3fed3e7ea48ba8257b9fbd9e4dcfc14a4/
      mipsel |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/5ba65e5b4a8b1c7d70d408947b8cbafb42fc9e2d/
         arm |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/934a2b469353653ef6412856361f023ea4fe843e/
      mipsel |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/21195dcf9ce24be089cdfaea33633f048f11e38c/
         arm | cannot allocate TLS data st... | NOK | http://autobuild.buildroot.net/results/b391fd0b16d497fbe9657e78ef4b224248dd9be9/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/2ccd26e904690dc62f3a764ac67bf178c1eda0ff/
      xtensa |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/abb6a894d165b5b50492d181b2841768dc0c548d/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/6a1b31821254abff55782f896951b1fc762bb1cc/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/fec650dff657c9ed67cf489141361a83f84ac26b/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/d1fddb043c822417d6993101b6de06ffbd2ae0c8/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/a9bde6a5d584d33ad71d658367ec1a52a358e687/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9d31b962e844816665378137a3367f1662e180de/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/c70d304215781170b44accf29b6a6e813fd8976a/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ed6e6e01075734224b02e2ef026d22311d841658/
        bfin |           libmicrohttpd-0.9.37 | NOK | http://autobuild.buildroot.net/results/1ae9b8840609b6cc9590065dfde77511458ec3e1/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/e5513200f3b4584306fdeb1eae01016c748563c0/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/02b24a012dbc76e366c10d3758978eba5e597499/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/54f5ed9a8dbd90540322856b1f2d7918dfd159e0/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/2e0c15fded8b1043e916c34a795da0a06c8534fb/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/e53ee2a0d72e6a169f79f160d868c5fb890b1525/
    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/35b5deab3cd86103c213274dcaf061f1d945032a/
     powerpc |                  qt5base-5.3.2 | TIM | http://autobuild.buildroot.net/results/2771e6ce6ad8e2c441808601d05ee9d83146a675/
         arm |                  qt5base-5.3.2 | TIM | http://autobuild.buildroot.net/results/eeee0bd6a093ca1eb13491acd3e2dd3b2c91737f/
      x86_64 |                qt5webkit-5.3.2 | TIM | http://autobuild.buildroot.net/results/09f05b6072ad49a9303284e282e3fc607911906b/
         arm |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/e90e811f1f205f9ddfe8983d8072b8ce0cb05c98/
        mips | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/d1ec8de2950b9e4ae99e103fc012c9066d83c7a7/
         arm |                  sudo-1.8.10p3 | NOK | http://autobuild.buildroot.net/results/b1091bd04ab988744548b74fb48c64bf291fed2f/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/b8ec9c505b1c5872f5fda1218b3f9f08f1b1c80a/
        bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/bdd5d87769c2deae8e6e7183b9243977abefb726/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/9db8e77658ce2e214ca63b82e0cc21cdff6a61d2/
         arm |               wireshark-1.12.1 | NOK | http://autobuild.buildroot.net/results/f6d351a74a5f737f8290894a64b591b269476126/


-- 
http://autobuild.buildroot.net
