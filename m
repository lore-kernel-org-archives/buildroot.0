From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Dec 2016 08:29:56 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-14
Message-ID: <20161215072956.4026D20E57@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-14
================================

      successes : 125
       failures : 23 
       timeouts : 0  
          TOTAL : 148

Classification of failures by reason
====================================

             freeswitch-1.6.13 | 3 
    xserver_xorg-server-1.19.0 | 3 
         docker-engine-v1.12.2 | 2 
             host-nodejs-6.9.1 | 2 
                 jack2-v1.9.10 | 1 
                  lcdapi-v0.10 | 1 
libasplib-f7219142e790a329b... | 1 
             libsidplay2-2.1.1 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.22.0 | 1 
       opentyrian-9c9f0ec3532b | 1 
             qt5location-5.6.2 | 1 
               tcpreplay-4.1.1 | 1 
               trousers-0.3.13 | 1 
               upmpdcli-1.2.10 | 1 
               wireshark-2.2.2 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

         arm |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/1280e20eeaa5492152c17829332efe93def7b5a0
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/fcc32f6cdc46f354a016a9b137d4f51d4054cdb6
      xtensa |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/d9e87809c6dba6c23d50aae2074b0025c4165f9d
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/7c484681d60b0ee6d3a79a38d26f81887f9ccbc9
      xtensa |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/9b8e083b3bb440bfca3884b48037113470d6667d
         arm |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/442444e5e219b0e5c9f0fc4e7ad74e39d7bf0601
        i686 |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/5cfbf059a367cdd03514aef9b5ea5375df5ba01f
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d2a4cf8bc999f65a91c4a848e1e2a305778fcdde
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/7151f5ce15ccd83a70c15b037f6875094bdf61c1
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/a4cad64b847d7f021f85f040a37c74af8e459f6a
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/aa6523e52355023afd36a2fdf1996793d34da514
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/1457a0f9727987e028ca24e37e27fef917b85af1
 powerpc64le |                     mpv-0.22.0 | NOK | http://autobuild.buildroot.net/results/d478e549a2f6f14bf33f2c4664415f11d45b1ccd
     powerpc |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/0af1fc07fd7aad7806591c178540e0a3da0d6d45
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/588934b1ff760285f287bbdb97a249280b518a4e
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/b9469058c4daef38fdaca4b624b5518988ff0bda
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/70c5c982e050e4cc4ca46fa648aa3a42be19c2cd
     powerpc |                upmpdcli-1.2.10 | NOK | http://autobuild.buildroot.net/results/5a44349d8f7a7bb22e4556b2142c03398b564c70
         arm |                wireshark-2.2.2 | NOK | http://autobuild.buildroot.net/results/0e944dff935d127db8736888d401a62905a7cc34
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/0b9384c4beaac85f3a17c3245c8a7418c2e2e296
      x86_64 |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/dea89273493704ca36752683a62eac8a5eac534a
       nios2 |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/41a5eb65d17a0845a723684add3bf1c47954f1b3
         arm |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/b48074089da770463f7ffcc27e385ac59456edc5

-- 
http://autobuild.buildroot.net
