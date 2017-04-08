From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Apr 2017 08:28:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-07
Message-ID: <20170408062822.DB87E20847@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-07
================================

      successes : 215
       failures : 37 
       timeouts : 0  
          TOTAL : 252

Classification of failures by reason
====================================

                 xenomai-3.0.3 | 6 
                busybox-1.26.2 | 5 
             bluez5_utils-5.44 | 2 
                 libdrm-2.4.77 | 2 
                 libdrm-2.4.78 | 2 
             lttng-tools-2.9.4 | 2 
                  ntp-4.2.8p10 | 2 
                poppler-0.53.0 | 2 
                  arp-scan-1.9 | 1 
                 ibrdtnd-1.0.1 | 1 
                libepoxy-1.4.1 | 1 
                 libxml2-2.9.4 | 1 
                 mplayer-1.3.0 | 1 
            netsniff-ng-v0.6.2 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                 opencv-2.4.13 | 1 
             qt5location-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.5.7 | 1 
                  trinity-v1.6 | 1 
           uboot-tools-2017.03 | 1 
x264-97eaef2ab82a46d13ea5e0... | 1 


Detail of failures
===================

        m68k |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/c605c8cc36348f199a36e2652851b8d02ee222c0 |     
         arm |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/2d2cca5341b527adc60da34556cdeb48a9bbc2f0 |     
        i686 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/21cef7b40f17a9202d2eeffd97c631bd8d07710f |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/17c4f32da05d181692c0bd2fa03d145aa4834e56 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/8af768b324df2f6c1d52346bdc5c07c5641d6e28 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/c0e72ec0a7182b3303a0681ed75448e1ecaa48a4 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/2305e9ec03ffc754ae65a57c72fd4862ff43f6d2 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/cbc6b3b3cca685d9f550d8eed38820c8fdf3979b | ORPH
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/fddc47b57c6b19288e7900e88715c5475cb33425 | ORPH
        m68k |                  libdrm-2.4.77 | NOK | http://autobuild.buildroot.net/results/b5d7667737c92de5d19313ec6bb0ec9ce81707ea |     
        m68k |                  libdrm-2.4.77 | NOK | http://autobuild.buildroot.net/results/732652f34f4865462007a3ebeb40d6642fde028b |     
        or1k |                  libdrm-2.4.78 | NOK | http://autobuild.buildroot.net/results/ebf5815a2d02083269d5083b2afb39744d9915f2 |     
     sparc64 |                  libdrm-2.4.78 | NOK | http://autobuild.buildroot.net/results/6b05d6d8648afa972f4805fc6318ab93244f64f4 |     
        i686 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/4d32805defcf5dd546a477bb718757e3b9cc3dc8 |     
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/07bbcae19477b0f7fb36fecc7215a688cb743628 | ORPH
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/b2f2624dc98cdd5db1860f75e4f637719b6ca27d |     
     powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/6d82fe029ed5bc9275503a82a3759a57c319078d |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/383f3219f4eb967fc9850998a9202b3e25d011ba |     
        i586 |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/0eaf15dd387961641b42d977c49804fe8872074b |     
        mips |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/e97db1e9a483d9156875121b521d7c79fed04303 | ORPH
    mips64el |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/893287e5f484328b723f727ced5bc1794bf96596 | ORPH
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/95efb3f673b7ac09b4a412bc5be0c11d015d916f |     
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/c18c439ceed992424d111bb6030275b050b4ce25 |     
        mips |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/19763a7375b6fe9fc69b788077318764d434ec56 |     
        mips |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/bf93625fc317af49bfbde8c3724a2c265546461d |     
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/c42abf34774ad2e4b7b5ec44fd83b1a4d4b7e429 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/3cbe662bf7321ddffdf2e021375fd73d2c65dd28 |     
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/d7ff3bf31efc5bb7fedeeaf94e387f10975251cb |     
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/35e97e51a6f7184d7b708c62a726ab91a0f546b2 |     
        m68k |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/4b185402435444d307d0372d66499174cb43b91a | ORPH
        or1k | x264-97eaef2ab82a46d13ea5e0... | NOK | http://autobuild.buildroot.net/results/3bfecdc9c2cffc913a9486e9e0f5ba83320178c1 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/f6f569e3a40be9a2338db50f1e576072efa85265 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/ef971145f287299ce98c6fe50d5205b3cc6b8011 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/92a4aa8d67e584740f5c2647be7382957b7bc66b |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/6774109e84d56d5b73c94255765984057e25d1a1 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/032e8ec9b2c09733b1210211feb560300f33b792 |     
        i686 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/b57d4ed92ce7ef6a6ab76c4d75e242978e90683c |     

-- 
http://autobuild.buildroot.net
