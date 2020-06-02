From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Jun 2020 06:25:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-01
Message-ID: <20200602062552.895A7860B2@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-01
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  3  |  0  | 11  |
    master   | 99  | 27  |  0  | 126 |
     next    |  6  |  1  |  0  |  7  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 6 
                qt5base-5.14.2 | 3 
                minidlna-1.2.1 | 2 
                 xvisor-0.2.11 | 2 
                  zeromq-4.3.2 | 2 
               apparmor-2.13.4 | 1 
              bitcoin-0.19.0.1 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
                 gnutls-3.6.13 | 1 
       gst1-plugins-bad-1.16.2 | 1 
           host-nodejs-12.16.1 | 1 
                 mesa3d-20.0.7 | 1 
                    mpv-0.29.1 | 1 
               protobuf-3.11.4 | 1 
                    rtty-7.1.3 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/9974bec67fc48c2cac4fe7fb5c5b530aa88992cd |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/b55a36ef4c58d49948e2033f3523e19e27217010 |     
    arm      |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/cb9066223eb88b8a7114111f902275fbe45d7fc7 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/a9ac665abf0e1765f58ad1673d04a9d92ba0cf84 |     
    arm      |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/0865de17ba25b08f6a758fae132581037ea457bc |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fe8a363c9a5ff177c668cd65a539540bef8d5059 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/43cc48b3c83e467dff0c884b3205ff188b057fce |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9ea8900f85fec5e725d5a964920cc6787de81e92 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/79ca69a48fcae414fa25e5b66ead2eccf080282d |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/680a88c5358324a9104e24ac8ce413bb95a9aa12 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/33915ef01c4858dafdea33f1ed8fabe846f1cdef |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/913a19ac5c36ba18870eaf101ec2c4ea2dcfe323 |     
  mips64el   |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/209ec5110d643a19e96884be53b7592a21be1b62 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/02f5dce6eb003f172014bbb627d978cb1c2b72b3 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/5c8b1eabb800b3d4dcb39b3e70d2940e79f847d3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b5f0313146bb29fdbfa9681c6f5c94093a060908 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/996553013e53cf82e1c235e7f4444e51c0fc1169 |     
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/20c1b26936905557927610a5a49cdede928d232b |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/2ea21a804583bdbdbaabc57f07741a8155435de8 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/834782d0b9df14cc07e96f836991504250f72193 |     
    arm      |           rtty-7.1.3           | NOK | http://autobuild.buildroot.net/results/88b9b87903e5d9c9673bd95317d1d6da5cef7e7a |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/38d776025d06e9683ef0c56f1672364a5566ddaf | ORPH
  powerpc    |        wireshark-3.2.4         | NOK | http://autobuild.buildroot.net/results/ed427e2b91c2d23bdb02519977c17d122faf6804 | ORPH
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/83f1eb65fa9a7e2e80a30edc679a651a102005b8 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/3c0eb783fd0fd29eaa59b5224011b18edd01e084 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3e43bdde6e2f7d3281cd4eb629ee0c6f55b72daf |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/27caeac9a63e074f90016775ff6e61e9398919cb |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-checkpolicy-2.9 | 1 
                host-dtc-1.5.1 | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/791f453f0b0d8b58c858e230083b09789b10c6bb |     
   xtensa    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/95d084245280d3226d564e2f56222ad2ae69fdc1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7cbcc060a69c669fe232eef6e8188156f9bb3608 | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                 dmalloc-5.5.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/4daaf84091f90f934a5b7331db295721d6da7e17 | ORPH





-- 
http://autobuild.buildroot.net
