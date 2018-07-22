From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Jul 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-21
Message-ID: <20180722060013.57787207B4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  11 |   3 |   0 |  14 |
   2018.05.x |  11 |   2 |   0 |  13 |
      master | 143 |  33 |   0 | 176 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
                  samba4-4.7.6 | 1 
     wireless-regdb-2017.03.07 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2dbbc2e989e4822231e71d7a6ca55309c8684609 |     
         arm |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/75dfaa6f58e1b14c65ccab830234b153f2df854d |     
         arm |      wireless-regdb-2017.03.07 | NOK | http://autobuild.buildroot.net/results/bc5835de4687439ec7a1d234222f14a7f103aa29 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

     wireless-regdb-2017.03.07 | 2 


Detail of failures
------------------

         arm |      wireless-regdb-2017.03.07 | NOK | http://autobuild.buildroot.net/results/196a0a194442b3cde3c70286397948c71f121585 |     
      x86_64 |      wireless-regdb-2017.03.07 | NOK | http://autobuild.buildroot.net/results/6f9fe5bbcf00b8a2ec13abb125475feb64110c4c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 7 
             gnuradio-3.7.13.3 | 7 
               aircrack-ng-1.3 | 3 
               mono-5.12.0.226 | 3 
                   libnss-3.38 | 2 
linuxptp-303b08cbf55096aba5... | 2 
                  samba4-4.8.3 | 2 
                cutelyst-2.5.1 | 1 
                 json-c-0.13.1 | 1 
                libmpeg2-0.5.1 | 1 
                 opencv3-3.3.0 | 1 
            perl-net-ssh2-0.69 | 1 
            qt5location-5.11.1 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/b926d5535ea5c395f25f7f0b494cd1fed97fa9d2 |     
         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/a8754c20fce798c7e1a03eaed6a3ca7ab1ab0ae2 |     
     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/343f10d5e653b10aef4a52bd74f856d72c2cb62b |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a2c65e6126c6cb702610d6224fd379db1e1a97e3 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2cf0230fce4670642bfbc67d6421c983c2be5583 |     
      mipsel |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7650c368230764c96b5f5cdaf79e7309927f7d04 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8c2b6a9cf629f8c968c1b81cef23c23b910b5ec4 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/10c38d1624d12cab71e0b0864cde8f8220f069fc |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/525d4ae4daf024e92c0399831bf36c6e8238d80c |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/198b1ac0824838c81be665cb4f3d18f13da19a1f |     
      xtensa |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/15831ada13cdd162185c77ae73684e3ff1ca36f6 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/9c235b836dd042eadc48d4cdaac6fa4a1895952b |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/94b7e9d5b20463ec3cfacc62535bafe90b71b690 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/139dc26c31e14736e8c7107c52cdda39ec66c4e5 |     
   powerpc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/71c14db3628ccab9677b20342166680c951b786c |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/36f892fad74e50385eaeb1445cc35dab9a217bda |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5f3967bbd226a85fb8fabfb4990d7d1e9387dc4c |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/afeada3937879431d5db59153121ba215f70c4bd |     
         arm |                  json-c-0.13.1 | NOK | http://autobuild.buildroot.net/results/e482f174b8124ace0690a26bb7daf073fe5fcd75 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/d62582d76b11997be7dbeb1293a487a700c9a8d2 | ORPH
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/692d75576172b14ce66e5d1e5eb373bc76e3ee5f |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/46a555c03a7fcd5c9931b9176b2e28dff66c8fb4 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/07dd1278fc1b98267829756215a3dae3a26d56df |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/b8467d4b89f2fcfea6d20e36a0ca69a4de081902 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/10a4f58855c96f623993913d0f7c59094f00cd3d |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/3a74d04356938e61eaa69d21ccb5303a54feaabe |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/710aaacb9e23a64962f83148ef8241fa891fa343 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/6174caf331984093797d7e1da8805361af04386e |     
microblazeel |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/2bc61da09b61bb61a04992ebc43082c2a20e0480 |     
         arm |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/5b9106351a04646f42697215ed497e09c62c12fa |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/5a662fddac8bf54f488b9c9392fda2c13f73b870 |     
         arc |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/12df1f96cc878805b955f1dbb5707116a3dd09a7 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/85064fc96b74ec37e4cdcfbba67a2a746f9b44c9 |     


-- 
http://autobuild.buildroot.net
