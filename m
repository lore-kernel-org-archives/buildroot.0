From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  2 Feb 2017 08:30:50 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-01
Message-ID: <20170202073050.0538121D60@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-01
================================

      successes : 125
       failures : 19 
       timeouts : 0  
          TOTAL : 144

Classification of failures by reason
====================================

                    ruby-2.4.0 | 3 
                 sngrep-v1.4.2 | 2 
             berkeleydb-5.3.28 | 1 
                ipmiutil-2.9.9 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                    libiio-0.7 | 1 
                 libraw-0.17.1 | 1 
               librsvg-2.40.16 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.3 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.23.0 | 1 
               openswan-2.6.46 | 1 
                   ortp-0.27.0 | 1 
               qt5webkit-5.6.2 | 1 
                 wavpack-5.1.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/11e53847b7ddb957b3485662be10dbafa2585c87
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/90fee6d0f632884ccad7b481874abe3ef3e7cb6c
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/0774d7611b2cd5503a998b4d9648300f2b0202c1
        i686 |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/b123669e942d07d1822b3c788aa0584af4cab6b6
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/50a759420f7b286cfc71a6ebef9089f38be4377f
      x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/1ecf0de4e7e47c42f8b9d03a026db5030e2957fe
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/d3e94500616125a5e77d11b89a7f06378c5302dd
     powerpc |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/f7b427536cd244a407c386e75588d1ac73092288
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7c6c01328a509c2858cf89244ede7d4cab26de13
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/95244563c96031c2b2a5c28754098d9a75232395
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/af0155bd60e4ab3c577c4f75ed9093040ea90852
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/3be15284a40e1802a2490151702c7bcbf2a71d4e
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/c48b39359925059bfc9bbfef77e61486faa196fd
      mipsel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/aba64aef1278ebdf5c34ab76a9772d582e3bbc00
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/4fbaf141060b9d657c3bbb08013c7b96d38b3f2a
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/19c8b29111650957e3a8b3dfa29dfb03b77377af
        bfin |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/c0291c8fef04bd1d973bde862e2be5455db1c069
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/f72f78fd36338cb4e3fd723c119c1e0f8d0878a4
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/3f1e071c8bc04f39eb4be36e7885bc951a914f3a

-- 
http://autobuild.buildroot.net
