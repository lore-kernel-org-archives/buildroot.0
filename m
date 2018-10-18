From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Oct 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-17
Message-ID: <20181018060020.3A4DB207C4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.08.x |  16 |   1 |   0 |  17 |
      master | 207 |  23 |   0 | 230 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                    php-7.2.10 | 1 


Detail of failures
------------------

      x86_64 |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/feabc929e2ab1b212dd2589ab9d6aa060b8f5ece | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 


Detail of failures
------------------

      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6656b8f9407d5cacaa9f4be086df8f71c5ab15df |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               python-py-1.7.0 | 4 
                  cc-tool-0.26 | 3 
                qt5base-5.11.2 | 3 
             util-linux-2.32.1 | 3 
                     vlc-3.0.4 | 3 
                 dc3dd-7.2.641 | 1 
                flannel-v0.5.5 | 1 
                libmpeg2-0.5.1 | 1 
                  mender-1.4.0 | 1 
                poppler-0.59.0 | 1 
                    ruby-2.4.4 | 1 
                  xerces-3.2.2 | 1 


Detail of failures
------------------

      x86_64 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/bf19f6dfe394121a1b7cf36fa59662960470fc36 |     
     powerpc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/dbe251cec86d5da4a36bbb174df58dfce9b2b5ff |     
        i686 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1abfed312baf32e2f27443f77ba5120e04a71a02 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/8dbb22698ac917c6260473134d432eb027f790df | ORPH
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/97e465b3d17831fad74c77ad7917784743cb63a0 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/4477d4bf39a121e90203a02175ad87e7313bc0c5 | ORPH
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/94a4266ea52e3ab6c70688e4355ae01c387407e5 |     
      xtensa |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/e3caba44c0ebed1e6b2e14a5f3ec33f2b34d2bec |     
        i586 |                python-py-1.7.0 | NOK | http://autobuild.buildroot.net/results/58ca78829c18a5d87d005b504f1d9fd068db4019 |     
microblazeel |                python-py-1.7.0 | NOK | http://autobuild.buildroot.net/results/61daf9f6904add91b0b025deef774bc22ac1d84c |     
    mips64el |                python-py-1.7.0 | NOK | http://autobuild.buildroot.net/results/2d740fb48c236ef2a7156058f1e8de80b23c2f83 |     
     powerpc |                python-py-1.7.0 | NOK | http://autobuild.buildroot.net/results/c49b39283472ba24a782c9fe7069c0c563cb49db |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/8d1fc4e4def12131635201bfb4e60240ee692100 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/eb55bf44622697039a4ced510ee2d45b950d0a08 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/6b24720009974409acc7de16e59373737458e420 |     
        mips |                     ruby-2.4.4 | NOK | http://autobuild.buildroot.net/results/c519437c97d57f7666042db53f0488ed25ea3564 | ORPH
     aarch64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/ecb1f7a542f6be1f0812c51bdf645824c0da9f68 |     
  aarch64_be |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/01f152bd7de945994823edae9e456610c1f8d4f9 |     
       nios2 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/22130451bf1ce6752dba365a871b24855fc0d097 |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/7b0a22590b5c08eb1e90ee1b83632f9bf99a13c0 |     
        or1k |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/77496f3249b344e56e6c861a3b33bbc4d5f87cae |     
        or1k |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/65627c13de11430d66bcfb9e597e2d92e4b99073 |     
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/2ff0fe57436c0bb198c1bca8fa945ff1d0d174cb | ORPH


-- 
http://autobuild.buildroot.net
