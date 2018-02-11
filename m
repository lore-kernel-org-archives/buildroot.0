From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Feb 2018 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-10
Message-ID: <20180211070008.E70D32069C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-10
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 180 |  46 |   0 | 226 |
   2017.11.x |  24 |   0 |   0 |  24 |
        next |  47 |  14 |   1 |  62 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 9 
                  boost-1.66.0 | 7 
         postgresql-legal-info | 5 
              host-erlang-20.0 | 3 
             bluez5_utils-5.48 | 2 
                  ffmpeg-3.4.1 | 2 
              keepalived-1.3.5 | 2 
                 mplayer-1.3.0 | 2 
package/postgresql/postgres... | 2 
                   systemd-237 | 2 
tvheadend-e06ffd87beff16103... | 2 
               domoticz-3.8153 | 1 
               host-efl-1.20.6 | 1 
             host-gauche-0.9.5 | 1 
         libcpprestsdk-v2.10.1 | 1 
                nftables-0.8.1 | 1 
                   pcre2-10.30 | 1 
                      qt-4.8.7 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/47f6bc06a6820c966a994ceb1fe534a1ff28407a |     
 powerpc64le |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/3f78790f6536a0e9ec28b8f17526b21977e99b21 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7f9cbc9a11e6e7870c971a8f30605a2543feec87 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/b162c50799a6caffeb21094a9d7170d40ce030fb |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/8095e2b8c2d1bc6dbdca5f110d95e746ef74dfc9 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/8e86ffae9b3e17e2847545b2d69dafa00d8ef6f9 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9407a44b75b5802d8d7c7cc0720437392ed901ae |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/17e1e2b10a72eeadc399b9650c98e5d71e1c0e24 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/2b62a1f0a149d6c11dc9c57645991fd759ef938f |     
microblazeel |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/441039c6aa20a69a8d9535c66f2ea2b7b22929e2 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/4f317750ec36c6b8b39b421822c1495da830fe59 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/d8e95ea4115ee3dffaa2b7206e732f70cb9e5217 |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/adbe2087635e54afdc00001f85e8221c1f6eb438 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/56e5350f82897e2dec6a3e46791d1b61779cb993 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/fd46c9297fe023713600aa2a13bcbc9050edf9bb |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/a388ca281a60f492ada397c6e313dc3e270e1b19 |     
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/fc2918f0ce7693e2d8810535a36315912b175eda |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/2e0a443efb99fd9d7f6e69dee2180f76207733a1 |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/aa4804462426f0305676928b72256afb3eec953c |     
         arc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/1a78ba04abe0a1631f716cda4cfea0523ab7756b |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/44f769da4379c5281080c359a492eeeaf639fba0 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/167b37a93139296017d4787f2ad215499a88e325 |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/fad5b8a42d7dbd94c8d09df22217639e12656de5 | ORPH
         arm | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/64015ff0f041dad9473e363ec6f94e02758a32fb |     
         arm | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/96b3c8be714e81b0b83030da1f58aab94a2a269b |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/129c0f0ecbc4805b20acdb9a67bb8156404b45d4 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/6936f25293738ebe98d77362fef26e8e7689843f | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/dd3e9ca9feb2dc39a9c5546d3fdb38b9bbad52d4 | ORPH
 powerpc64le |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/13c5538a1fba4a738425223754018bb8d4bb3668 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/681ab1eb1cc639e5f739fcc4ec4b9b0ef6896c9a | ORPH
       sparc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f1fb09a09bdc24e1a0bbcd7f2e38a70608419d36 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/59260634ac8dfa58895facd9471f23156b62701a | ORPH
      mipsel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/2f4269e06e33c8060ba3ac5d63aa79c179ae1d55 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/0a9e28b46cb6315df3e0dde6cb7dc4f1b70ca719 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/da03bfd44d5053754e54901a5a8165b552b27a46 | ORPH
        i686 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/9931de82faa5a03c92b18ef1d3d41fc753e42503 |     
       sparc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/59d273beebb67183fd435be8cef30d700bbd7da7 |     
         arm |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/a375d533036a1b95af32b6bda086e93174b8c5f0 |     
         arm |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/b5141b64ed838caa1daca1bf4fe322dd2afaf0b5 |     
       sparc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/d7989660584430945644e3a4406ba33cee22863d |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2ba7208e908343a4b84e0f357825dfce45b3915e | ORPH
     powerpc |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/74ace3229a345fed0cc40e3fe28478bcb9e9bb12 |     
        mips |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/ad981dc0db9a9d668af20ea5e77da4a752e15881 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/af3622b9c01893bcdc6b089831ae88975eccfb2d |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/4d0b911c294cf889be3cae9e4ee0529a4720ae09 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/61eb125e2b3e8f1002c6f3479635b4f09e545ee1 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    liblo-0.29 | 3 
                  autofs-5.1.4 | 2 
json-for-modern-cpp-legal-info | 2 
               lightning-2.1.0 | 2 
             bluez5_utils-5.48 | 1 
              keepalived-1.3.5 | 1 
make[1]: *** [timR08-ISO885... | 1 
                     php-7.2.2 | 1 
                poppler-0.59.0 | 1 
tvheadend-e06ffd87beff16103... | 1 


Detail of failures
------------------

        i586 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/c75135504b2927391a42e59080d1069b42aa0212 |     
      x86_64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/ddaf662aa0b814ce9c85e0d5caab8da0044462f1 |     
     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/db7c2b554eb5777d654bc2bdedd2e16bb1e9cf1e |     
         arc | json-for-modern-cpp-legal-info | NOK | http://autobuild.buildroot.net/results/851f4ef3fd8298ab790dbd454732d85ff01e8ec7 |     
      mipsel | json-for-modern-cpp-legal-info | NOK | http://autobuild.buildroot.net/results/b1a9dba701aaf338f8a1476837f4ba5ebef2b731 |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/bf7cda560ff03172396655cdf55b5e48336cdad3 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/88f60d4cbde90d377628adaf441ef8ff872b6ca9 | ORPH
       sparc |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/c8bed3a3fa7d2b2258f573cbfcb01af07419e0bf | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/32a0f958f3a587294ffbdad577ee88a172225b1a | ORPH
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/e2db747ab746ee307e3d5421600d4785bdf545dc |     
        i686 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/a956cd715676f67e22d9ec9deeae90603335a578 |     
     powerpc | make[1]: *** [timR08-ISO885... | TIM | http://autobuild.buildroot.net/results/64255f64eadb525a705985ddbbd5858ccbd1735d |     
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3fc7e7fe4d577baaac576e937c02b1caae71a0d9 | ORPH
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/560c8c56e3976baedbd23ae259be677c3a6ba0c3 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/bd85151ecae5754226dd21cb538f4ba34631f0b0 |     


-- 
http://autobuild.buildroot.net
