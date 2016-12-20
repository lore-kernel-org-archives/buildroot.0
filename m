From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Dec 2016 08:29:59 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-19
Message-ID: <20161220072959.0BD6320BD8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-19
================================

      successes : 125
       failures : 39 
       timeouts : 2  
          TOTAL : 166

Classification of failures by reason
====================================

                     gmp-6.1.2 | 9 
                host-gmp-6.1.2 | 5 
can-utils-64edc021d22441002... | 3 
host-google-breakpad-7515ab... | 3 
             freeswitch-1.6.13 | 2 
             host-nodejs-6.9.1 | 2 
            lttng-libust-2.9.0 | 2 
                 mplayer-1.3.0 | 2 
                  ffmpeg-3.2.2 | 1 
glmark2-fa71af2dfab711fac87... | 1 
                gptfdisk-1.0.0 | 1 
                  lcdapi-v0.10 | 1 
libasplib-f7219142e790a329b... | 1 
make[2]: *** [courB10-ISO88... | 1 
                   mimic-1.1.0 | 1 
              mosquitto-1.4.10 | 1 
python-libconfig-b271c3d9da... | 1 
             rabbitmq-c-v0.8.0 | 1 
                  squid-3.5.23 | 1 
               tcpreplay-4.1.2 | 1 
ustream-ssl-ec80adaa1b47f28... | 1 


Detail of failures
===================

microblazeel | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/56faa8bb3fda72bfa5b6c6380e65c81dc164a8ee
        sh4a | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/6488afc1e67babb4e9d4e15c5a8988d2d18c0ede
        sh4a | can-utils-64edc021d22441002... | NOK | http://autobuild.buildroot.net/results/d73930f3d4ba50327d17fa270b0f66306a63ba40
         arm |                   ffmpeg-3.2.2 | NOK | http://autobuild.buildroot.net/results/516b69ac3140751f4bc926872f3bc4581f9b952b
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/12c246b058224f68494b84355a29dc4efb85df6d
     powerpc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/fa28c3d95b64a8f48279dbef108a92f9a40dc74b
         arc | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/5b1e265db6535d11b07612484bc286965f61319a
        i686 |                      gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/3ba50457c4d2590f48dc316de18688b22389a40e
         arm |                      gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/ae1e28c59f85327a07402e7a4462e72538b3f1e1
        i686 |                      gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/5bc256de9bc8238b8508067e55771d3f3508241b
         arm |                      gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/1f5ffea258549530b8ed0c8d324f810f1905e7c5
         arm |                      gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/b3e508c56ff5d9b809c35a7aa3bcd51c0d8397dc
       nios2 |                      gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/273e5bccfbc0f8cab7a433ad8b6588ac081ca592
   powerpc64 |                      gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/b1dd004615dd4e1c7467c0feae5be99abd86e9c4
         sh4 |                      gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/da99c7f9a3a1a53d58aaddd6127dd5e5fc9e6b57
       nios2 |                      gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/7f44b6f342780a49814538e4ceaf34201d72690f
         arm |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/1d76b4b42424e4db85c2d3a02f705e8c3c159e1a
microblazeel |                 host-gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/fd0cebd51490caa2b62de9913027c211ad154555
         arm |                 host-gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/7c7f000d4c12a9b76f32ca2836ff686eccfa5e2e
microblazeel |                 host-gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/176feb6a1f5fd721bdf0cda906f37ca3d873b59b
         arc |                 host-gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/1d9141b7be7485d0ca675e92903b4ff677d0259d
         arc |                 host-gmp-6.1.2 | NOK | http://autobuild.buildroot.net/results/2dba8ad49cd667392e58d917af46b53c75ff6623
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/c826999a0337cb816e0e31a2a7d1d8bb5d98e420
      x86_64 | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/dcecb17116c0cf400c98f0052c9bf71f15d0d398
        mips | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/2b4c04252ff132750253b5b3a226a26d48b601c5
         arm |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/c506bd5904c8e4e762462678fb84268c11f19e72
      x86_64 |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/f935e90c86e1b1a84e0200a570912523893b2a85
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/571ac81309d03a8512ef47f028912e8fc577e5a2
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/1fb4778dbeac4d6ea77d5cf833e197d10d2ca2d9
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/36dec96d3e9da774d7af93e9d7aa7be807daa431
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/4611ee0d0e5107c20a636a6135d54952a031a4f7
    mips64el | make[2]: *** [courB10-ISO88... | TIM | http://autobuild.buildroot.net/results/6b91503faabb9f901cf8dc31c6c1816cf41889c2
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/70686a5abdb9323d85126524f593082e968984f9
       sparc |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/57e6984427f8c5d906a93884cc461b8f93cf5ce0
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/39a272c23adf17b76e128d3c0f196312240dd45f
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b0945b060d28231887f3cf6c221965e08236d396
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/56b7b3d82e2e12c1777fa4b275d91b4d3c9488b9
      mipsel |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/248dc51630ea96d3a73024e080c151d309680133
         arm |                   squid-3.5.23 | NOK | http://autobuild.buildroot.net/results/d18c855326f42d33d12e35c8cc9fad7ea34990d3
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/4eb484e19d63a0467511e653c696d39b6e9969ca
        mips | ustream-ssl-ec80adaa1b47f28... | TIM | http://autobuild.buildroot.net/results/c15518a0238b2ab158294bfbb8be89e7cc2fd751

-- 
http://autobuild.buildroot.net
