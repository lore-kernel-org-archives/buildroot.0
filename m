From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Mar 2018 08:00:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-28
Message-ID: <20180329060015.64BE1207EA@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x | 177 |  14 |   3 | 194 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              lynx-2.8.9dev.16 | 3 
                     php-7.2.3 | 3 
             bluez5_utils-5.48 | 1 
                  boost-1.66.0 | 1 
                  cc-tool-0.26 | 1 
                    gst-ffmpeg | 1 
               host-efl-1.20.6 | 1 
         libcpprestsdk-v2.10.1 | 1 
               libvorbis-1.3.5 | 1 
                         lldpd | 1 
                poppler-0.59.0 | 1 
                            qt | 1 
                 sngrep-v1.4.4 | 1 


Detail of failures
------------------

      x86_64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/9922dc596c1f14a827c81f4b91cc6b08662ded2a |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9f669a39d3ab0780a6c4889e9f5a45258437a313 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4c416eb8f9da733f93411b054367ec54f32bbec6 |     
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/599d231cf761450999c5a15336c1f3d487e8ab82 |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/8a57571a6eb388bff5d87bc7c6fd66d208130e87 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/0aabb2545227fbb365203278c015fd46e1f200c6 |     
         arm |                libvorbis-1.3.5 | NOK | http://autobuild.buildroot.net/results/6ce71c8d3189e1f37c738f30f5fa9376b64bb25e |     
         arm |                          lldpd | TIM | http://autobuild.buildroot.net/results/d8a5ade582f8d4627b4b53fd26094c6dd85f8f2f |     
microblazeel |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/93d16caddd4bbee6c106ee4a4979e849a1d7d2b3 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/3a34bf4e9d318fd46d6169e0ca758cc3156280b8 |     
        i686 |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/6ca13a4ff9ea286ed32a24734abdebff67e779e6 |     
     aarch64 |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/4210b7537d1f5ca8f5b72248fb614eb8f77862b7 | ORPH
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/5457b94e081068d7821f9f995c904c2ca53e1069 | ORPH
 powerpc64le |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/9a16c2bc4d4c6beed2a1e1d07a126364bfb4bae4 | ORPH
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/fc4a36fc5ba8eceb3356a0715b2438b5ae7fe57f |     
    mips64el |                             qt | TIM | http://autobuild.buildroot.net/results/6170023e7766dcd4736ff2132ff129c77820989a |     
         arm |                  sngrep-v1.4.4 | NOK | http://autobuild.buildroot.net/results/f1c6494133806b9fc26ae3ce9e9c6a22fa2eda6f |     


-- 
http://autobuild.buildroot.net
