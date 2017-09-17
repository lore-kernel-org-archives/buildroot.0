From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 08:30:55 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-16
Message-ID: <20170917063055.5C6F4209D9@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-16
================================

      successes : 165
       failures : 27 
       timeouts : 0  
          TOTAL : 192

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 7 
                   luvi-v2.7.6 | 4 
                 lcdproc-0.5.9 | 3 
               librsync-v2.0.0 | 3 
                   mp4v2-2.0.0 | 2 
rpi-userland-29835184aa70c1... | 2 
                  boost-1.64.0 | 1 
       gst1-plugins-bad-1.12.2 | 1 
                libmbim-1.14.2 | 1 
                     mdadm-4.0 | 1 
                    mpv-0.25.0 | 1 
                       unknown | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/9494f32bfa35692bbb964c1e76353fd3d05fa08f |     
         arm |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/68fe9fdb979836c8f80bad45999c6d10f30c7b0b |     
        i586 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/b1efc7cda72288cb41a4a9be437a519803012f22 |     
        i586 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/0ede6c3f610237059a94fde272a290a45c8de7c1 |     
         arm |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/8dcaf7aedb4b213360ea75e42c2395f408590cb2 |     
      x86_64 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/9bbc68127e19f41d61f7523fd4e6ed65d69dc617 |     
microblazeel |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/d33fa1cc624041462e857e832c2298da506edf91 | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/9daa00e4bd67eb63927f4f1f238b786d90dc112c | ORPH
        m68k |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/1edc92909d7a9043212d9412dbaec581726d8ffe | ORPH
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/104f1a60c0880847d334a8a7fa52f3c74fcd5eae |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/f821f31cbe673a817ae0d444c032dd97e36b906b |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/940bdbcab244f89aad3e2b48997ecf5732d6bd9c |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/e8109c49c26d8d29a15d7a615648437e8fca9763 |     
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/dd822829d98cbd856b0791a6b7b0e97cef78779e | ORPH
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/0cc5770c89ce3a0b64b9b1fd36f23c202d09d836 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/1e46c310c4f273a736147bd962158f4550af0d92 |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/3f41a6b15ed92169a8679477f8e67a61f33bf2f7 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/eb38bae9fdb782169de969cfc4917e4f62e6ecaf |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/4bb4f99af846f13d0002773c6ba1c32f035a36d6 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/95beeb09220d877787cc7c9ea76ccfbbcb90fca1 |     
        i686 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/239e6b276f948fb7170f845ded30bf8ef836dc1b |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c4ea1c953311a6c1169ccb6fc403abbf5c701d46 |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/5e4d9114033b461b853be24c27e27a8f61b931d2 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/65e20e27715f5721ed4a9ec42dd7d3fe5d7b8ca9 |     
         arm | rpi-userland-29835184aa70c1... | NOK | http://autobuild.buildroot.net/results/5c50f7455ee6e930a3cac75f6491bb53308bc032 |     
         arm | rpi-userland-29835184aa70c1... | NOK | http://autobuild.buildroot.net/results/d18b2baafff91b104150f19bb8573a79a1a7884a |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/39926e38119d0b2e41b06f8646e799a616f0b709 |     

-- 
http://autobuild.buildroot.net
