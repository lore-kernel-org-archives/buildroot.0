From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 Jun 2015 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-31
Message-ID: <20150601063012.3193F100D5F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-31
===============================

        success : 261
       failures : 12 
       timeouts : 1  
          TOTAL : 274

Classification of failures by reason
====================================

                     php-5.6.9 | 2 
                  guile-2.0.11 | 2 
         conntrack-tools-1.4.2 | 2 
                   sudo-1.8.13 | 1 
                      nbd-3.11 | 1 
                 cdrkit-1.1.11 | 1 
       host-erlang-rebar-2.5.1 | 1 
                upmpdcli-0.8.6 | 1 
              strongswan-5.3.0 | 1 
                    qemu-2.3.0 | 1 

Detail of failures
===================

      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/2f5ad4fa38119733a408b75858dad9c6dbe97ffc/
     powerpc |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/74222a44ad168148c18af479878d8f848d3d6a73/
      xtensa |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/fff4865c9bb8ca42d3cece903d0fc3daea504f67/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/38d672ed550666f3abf9892451d147c1dcf34ee8/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a1795dafc4967f1a07e674e7676f7b1d3fb39241/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/201c12c2071c5f3d07df81db1c0e32ae49ec9cba/
      mipsel |                       nbd-3.11 | NOK | http://autobuild.buildroot.net/results/3a2d4124f78d4e504e8e961fabe038e570923408/
        sh4a |                      php-5.6.9 | NOK | http://autobuild.buildroot.net/results/06a078fb6603a83c4097042fe5c5b087541acd29/
         sh4 |                      php-5.6.9 | NOK | http://autobuild.buildroot.net/results/ee7eaca346d84bc4b0552063e21cc8b342e5a653/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/c81b1d9f5a52199ae7b3da9b7264737a2d46f25c/
microblazeel |               strongswan-5.3.0 | NOK | http://autobuild.buildroot.net/results/7e5c4d835444965ac9c32eb6fcabfd5f1b209f10/
         arm |                    sudo-1.8.13 | NOK | http://autobuild.buildroot.net/results/79b2fa4128c70d859dcb9dcc0ffdcf6c60d7066f/
         sh4 |                 upmpdcli-0.8.6 | NOK | http://autobuild.buildroot.net/results/7ed85071bc06b4806e90b278a0736ea70c01b456/


-- 
http://autobuild.buildroot.net
