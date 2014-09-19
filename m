From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Sep 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-18
Message-ID: <20140919063013.7A395101056@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-18
===============================

        success : 252
       failures : 37 
       timeouts : 1  
          TOTAL : 290

Classification of failures by reason
====================================

     openvmtools-9.4.6-1770165 | 5 
             e2fsprogs-1.42.12 | 5 
          perl-net-ssleay-1.65 | 3 
                 libssh2-1.4.3 | 3 
                busybox-1.22.1 | 2 
           libmemcached-1.0.18 | 2 
                 webkit-1.11.5 | 2 
                    ruby-2.1.2 | 2 
                   slang-2.2.4 | 1 
              libgeotiff-1.3.0 | 1 
                gptfdisk-0.8.6 | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
                     tcl-8.6.2 | 1 
                     radvd-2.7 | 1 
                elfutils-0.155 | 1 
               alsa-lib-1.0.28 | 1 
                  nftables-0.3 | 1 
              host-erlang-17.1 | 1 
                   czmq-v2.2.0 | 1 
                 gnupg2-2.0.26 | 1 
              librtlsdr-v0.5.3 | 1 
              uemacs-4.0.15-lt | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/1aeb5c5f172ecc3adb68dcf9c78b745cdca101df/
      xtensa |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/7bb8644f044234379671371dadbfc72e5911f118/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/48257263a0e37821b15e718a733b4c0cd16bbc3c/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/b70d9dea6b2008fa74fa1095e8bc27b5d65f0e6a/
         arm |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/bd2c431e8b40063e9a15f706b6b18739ffd89e23/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/c5ddcb664cbe9937a8385e89a27a7df429735d5b/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/8afc3d1480b9c5a09dac816c2ded9886a444565c/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/796ddf82f4de08da1dd6eaf3bbf04057bf0b555c/
      x86_64 |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/7afe85d7bf96c1c0d32d3b5204fdf8239f533264/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/9af76014518e404637b5e81f9d6b86c1fd829898/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/443b935580244bbab6e6cbad512197680c2e978e/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/7746fa38ed06ce2aecb1584c1244084156310685/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/c20b559538e7ce77d12ea985735c584a617e3557/
         arm |               host-erlang-17.1 | NOK | http://autobuild.buildroot.net/results/3ce7a0364761322efd7c31c3041f38d52695e03d/
        bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/529a86c63b559dd7ffb4e4cd38b38a0a99d6ddf5/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7419e4f34cbf39fee29c8cb3b1936d8595bbde6c/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/604a5059add4bea03872aca9e5425b9996694591/
        bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/a33ec4f3ab7475578cb14df01da7553725d9262f/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/844fcff78be9ece73b9b4abea8678bfbaa1e6475/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/39042ba73c2d0fd2a0cecf38e4f4583c4c58bd34/
         arm |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/3b0938087540f0505c038d9be56cabde17cf80ab/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/b9ce1e521e1fdc0407efb53f435e5f899482110e/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/2941ae8f01f396c2364136f1d608167d43e6fb9e/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/0474f6d4e818308e8bc3426cb4352647eae2a8ae/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/57b4ef53f7dd7d7fe4c95c1eb75e0988bc67c8d2/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/f9508ecd38bd17bf0d2f298c3198e63073680aa2/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/47db2cdb4b0ded6289f8f865e69b54a49681a4d7/
         arm |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/074bb90cd328359036582c5f15912f67c15ff59e/
     powerpc |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/6c0942e18b9dc8cf02c838e960633c4fbca63991/
    mips64el |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/1881a0bd84427a535a1f7431528aea236099cb9e/
         arc |                      radvd-2.7 | NOK | http://autobuild.buildroot.net/results/08079ec611cc4fd567ca488c3585f98f77cd6b20/
     powerpc |                     ruby-2.1.2 | TIM | http://autobuild.buildroot.net/results/2140247282a295fa9403b92b65f31abfa3210abd/
        sh4a |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/12be865a3e7070cbe8873e06ac626c335b57036f/
     powerpc |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/613b4d830c4a4b2a0f140949f3768d4a255916b6/
      x86_64 |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/e31752402b3687bdcb005755fa9434ce5d21d933/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/dd76c4229c08ce281a2fb81b13f2bc089ae19675/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/5725defd035ffc9bb40cb1d0ade145abee6497a3/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/decf82b51f5f70caea75a1a08d1c0284a70d0fdd/


-- 
http://autobuild.buildroot.net
