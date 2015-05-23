From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 May 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-22
Message-ID: <20150523063017.24219101544@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-22
===============================

        success : 298
       failures : 47 
       timeouts : 4  
          TOTAL : 349

Classification of failures by reason
====================================

          host-protobuf-v2.5.0 | 33
       host-erlang-rebar-2.5.1 | 3 
filemq-482797b8aa30fcc9ea13... | 2 
                     php-5.6.9 | 2 
              lbreakout2-2.6.4 | 1 
             sofia-sip-1.12.11 | 1 
                 clamav-0.98.7 | 1 
                 cdrkit-1.1.11 | 1 
                ipmiutil-2.9.5 | 1 
          libelementary-1.7.10 | 1 
             gdk-pixbuf-2.30.8 | 1 
                netatalk-3.1.7 | 1 
            gst-ffmpeg-0.10.13 | 1 
               gptfdisk-0.8.10 | 1 
                      qt-4.8.6 | 1 

Detail of failures
===================

      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/66ad722692d2b67b3faaa9b02c2c6f6b873593b9/
     powerpc |                  clamav-0.98.7 | NOK | http://autobuild.buildroot.net/results/f91051a06c89efa63ce1221992ef727eb1b3b923/
         arc | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/75f827dca2134fc927f75157589f9f58a28fa4d4/
      mipsel | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/76f428ea702c06928d1d3da5b586c999babb4102/
     powerpc |              gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/ce61d5aaf5dfdda92fcecb08a30b6093926d6f01/
        bfin |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/e891a5bab72690a530781ad87d5804a53a209b5c/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/8a68a94fa8079c57187e2b17f717fe3b33307ee1/
        i686 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/ad7252cfa5a931d22e335d38e18465a9845423bf/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/06fd5246b87ffb218d29c32b7ca32334aa2af42f/
        i686 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/ad1a3abee19ae4aa3463dfe8d25747390bb6ce13/
        i686 |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/828e85cd5a26b125f50fd730d072d7c859e80d82/
    mips64el |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/308065764ecce8c6e78794672b1b2e7614b06229/
         arc |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/7a72c342c7e2239f5cad51ababeaae521ef959f7/
         arm |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/187f9ffe931f85b985fadc9c2deed5afec22a649/
      mipsel |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/1acde9d1394785dd3febb01e614f48f2fc9233a2/
      x86_64 |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/650e6e3a0c15293143eace7e90194d9cb62f2f0d/
         arm |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/94816d019585c67cad0ffc2d573ddf4ab23c3449/
     powerpc |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/472e061c3aff843ed36c8823c439d9f214dc7f85/
        i686 |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/a0e8e5a3020c8d9296c0bd95d646e430d0e10387/
      x86_64 |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/5fa2a4bc51602c07292e6b6d2e1f164bee455e4e/
      xtensa |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/c9421af7d88afe78c6d9c349b8b8c49bb72427a1/
    mips64el |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/57ea34e9b48293075e10f0dd2331de2785730827/
    mips64el |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/d13e963aa7f89baa7d5c5febb571f3ad317f6e46/
        i686 |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/09d00d392a13e4bf7bfa00099bb6e042ba1c94b9/
    mips64el |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/06d84dd08bce441fcd3beaac599a930d8a2781e0/
      x86_64 |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/543810d33b91a1f98bf9010f1b880e264d1df0a3/
    mips64el |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/b61475cc2ffebb3757267b3316ab72b59923a591/
      x86_64 |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/dac24eb4f7bbbd29fd1ad402ccdc332649f38a30/
      x86_64 |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/229be0510cf4e6815780d61cc39a7b04f14e5b67/
         arm |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/086c100ab2bbee8f578d8aa2f5b6e8aefebce5df/
     powerpc |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/4a901773ab32c31b077a5fcce85804c48f0e5d51/
      x86_64 |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/0b98bf84645d4a79db352887a5da95fa2c311ee4/
         arm |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/215fb6f0a42049722181d5356d25b1bdbd151129/
         arc |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/8f7d9769bca844efae79f93f6109dd760b0d4842/
     powerpc |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/3e4d3cb874e62c27e7c8294bd4f6e5ccd4ea5ab6/
     powerpc |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/06943135586f79978c1906b006f39799949887fc/
    mips64el |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/ccba6d8c73b5e826b86065b77b3fe5077db7b99c/
      mipsel |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/929dff4f7e3494650af14133888516150d4bcd28/
         arc |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/9cfbfb4d848ddc23e0dc5226e7ea560d93b274a7/
         arm |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/688e30682ff379984330f45ff8c6197c69471c86/
    mips64el |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/bda1675b1ee196b53b460ec9b367ca6376e21b5f/
         arm |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/6608316aaaa9cf05b007bbf7222f367b5fc7c743/
      xtensa |           host-protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/50910afd0949a725ec33f3d53d8a5e3d1923d25c/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/20c09695481c3d1030852330c1d1f1f9489f1f41/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/1f405a54a62675f71e6294712007e09562be30b4/
      xtensa |           libelementary-1.7.10 | NOK | http://autobuild.buildroot.net/results/07c97918dab24215f5c5130a9cd2788adca0a27d/
         arc |                 netatalk-3.1.7 | NOK | http://autobuild.buildroot.net/results/2fd076fccb14a6459de191f1eb0108c433ad21e9/
        bfin |                      php-5.6.9 | NOK | http://autobuild.buildroot.net/results/7c4368fe7a5e2028eb47fdb916ba3a15d99cd679/
         arc |                      php-5.6.9 | NOK | http://autobuild.buildroot.net/results/6418b26140b16b6f04452a9b05431c392de04238/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/1613e23c7b21a064f8566ee3ddfbdbefa189f6ff/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/c3546faba53dfc61ff35d95e266a2d91327ba861/


-- 
http://autobuild.buildroot.net
