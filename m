From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 06:17:11 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-28
Message-ID: <20190829061717.43D6F26087@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  2  |  0  | 21  |
  2019.05.x  | 26  |  3  |  0  | 29  |
    master   | 188 | 27  |  1  | 216 |
     next    | 22  |  9  |  0  | 31  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

  vdr-plugin-vnsiserver-v1.8.0 | 2 
dawgdic-16ac537ba9883ff01b6... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/ef704d3817123b5bdd5bd783abc30242f3c551e0 |     
  mips64el   |  vdr-plugin-vnsiserver-v1.8.0  | NOK | http://autobuild.buildroot.net/results/b572f51583931495ce65960419f9f4de9749644e |     
    arm      |  vdr-plugin-vnsiserver-v1.8.0  | NOK | http://autobuild.buildroot.net/results/24f9fad99a03b4c47fdd1a7a4b2183b50087eef4 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               qt5webkit-5.9.1 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/67b6d0d4eafee419a4da87322753c9839aafead8 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/1eb3027b87e5cc9f1490152041ab69d71d2d45a2 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 4 
                  flashrom-1.1 | 2 
            host-mfgtools-0.02 | 2 
                      icu-64-2 | 2 
               libupnpp-0.17.1 | 2 
           python-numpy-1.16.4 | 2 
                  cmocka-1.1.5 | 1 
             host-cargo-0.26.0 | 1 
           host-harfbuzz-2.5.3 | 1 
                 host-icu-64-2 | 1 
                     host-llvm | 1 
      intel-mediadriver-18.4.0 | 1 
                 libdrm-2.4.99 | 1 
               libsigsegv-2.12 | 1 
                 mesa3d-19.0.8 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                suricata-4.1.3 | 1 
                    xen-4.11.2 | 1 
         xlib_libxkbfile-1.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/1e967dbcbfe8b3c875403fcd6d98c696eddaf5a2 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/a39071fea45be9b09a1452fd3649e8f0a2257268 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/fa2815a6edfb6b5aae0c6cb27120c8a48c490a90 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/b4ecd3141e79f6438ce895e8210e98e4e623457a |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/3d5806930029b64b3766d5b2a4f575b814c3699f |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/b33f38dbf955bf17eec0a7b9183ca597d7534679 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/22d8915717cf873b856041cf24e4f2b87daa75f2 |     
    arm      |       host-cargo-0.26.0        | NOK | http://autobuild.buildroot.net/results/0052e5d8aa4d3b9b4eef93b492fd096573eda51f |     
   nios2     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/7ce462bc2d3ffb2c21116421e32bd4ccf765dfc3 | ORPH
  powerpc    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/15e892f8391ea312fe219b79c40ad74b9e6624c6 | ORPH
    i686     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/ca3806c4847468d06be064372c8db75406888ef5 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/4bc0ef70e55f57e16aea8bb31be46b0bff80a0d5 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/c8345ff0b523c46645b42f82e887e090d8b81baf |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/293fda184fb48bad547902083919fdb941ba2783 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/c6210706012ff2bcdd9c90cc92be3c73f7d1e605 | ORPH
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/5c15ae9147735ada317f14d7db0accdcfefdf46c |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/53b07976849da57d06579483080d95d340e593ea |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/7ddf2378235ba5f4523fe7a0c15d33213c19c68e |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/1668dfeee1e1420c9daf969057a50ae3edef9e2e |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/c0cadc8689d643c42294013b17025ecb86c9ba3a |     
    sh4      |         mesa3d-19.0.8          | NOK | http://autobuild.buildroot.net/results/f960083e45812b6e6a19ba4cce1586622431b920 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6d0bdb7511c3a247746760b991d6487753f624a0 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b7d3c0306cec58e264f32dc5675d1df896948a51 |     
    sh4      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/dee59681187d807652cd8d7b2a33f89e727e0360 |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/d7c88b2a216238d7107890e1442409c29e5597c8 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/e2620b39c26f88ef9574ae2145bda79768d4a6ec |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/42aee70ed3c02f0d33fcfc2c39684d3a7bde81f1 |     
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/5b12063b225b852ada4d31026f4379ac892d45ee |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          host-capnproto-0.7.0 | 2 
                 haproxy-2.0.4 | 1 
               libsigsegv-2.12 | 1 
                log4cxx-0.10.0 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.21.11 | 1 
                qt5base-5.12.4 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/0ce6a95e2bcd3acb393447b1912af9d3b986001c |     
    or1k     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/e0d8f66f4d9873f584b9fa724489def0166c37ca |     
  riscv64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/7e73655543f2aa5560973f4b5e7be5c99cf41191 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/8f788b091a75e7853d1044bed12d1f7fadbf8098 |     
   nios2     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/02365f0e5f32b6ba144a8f664ae8f03b689c9417 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/812f5645f6ecaed34c1260ba0e794cbed214ab67 |     
  powerpc    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/4d9a10af77b50918fad0071fe66dcf867d950200 |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/61738a668fe223207e8cadfecf1f0fa14af4c4d2 |     
    m68k     |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/a7bd2780e49108c4d1ec480eacf09c8865b59f79 | ORPH



-- 
http://autobuild.buildroot.net
