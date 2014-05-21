From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 May 2014 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-05-20
Message-ID: <20140521063007.8F27E101336@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-05-20
===============================

        success : 85 
       failures : 12 
       timeouts : 1  
          TOTAL : 98 

Classification of failures by reason
====================================

           host-nodejs-0.10.12 | 2 
                    php-5.5.12 | 2 
  toolchain-external-undefined | 2 
Connecting to github.com|19... | 1 
znc-b396cafdb249544164ed029... | 1 
                pulseaudio-5.0 | 1 
                 qt5base-5.2.1 | 1 
                    fltk-1.3.2 | 1 
             util-linux-2.24.2 | 1 
              xapp_xedit-1.2.0 | 1 

Detail of failures
===================

       arm | Connecting to github.com|19... | TIM | http://autobuild.buildroot.net/results/ae0818fb7c28777ab1322b043d0dd4724ebee6c1/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/a7733d8f5160c574ab0f6a43b3dedba74ba78019/
       arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/affd7300895ec400de50a33d51b4e94e15d63341/
       arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/047068ded3209a8d483f1c2627d4225d0b54c678/
       arm |                     php-5.5.12 | NOK | http://autobuild.buildroot.net/results/6324d0754c62383adb258ef17b53ed0cbaab824e/
       sh4 |                     php-5.5.12 | NOK | http://autobuild.buildroot.net/results/b388a93fb2aef6df35611d985cd7bff993d949c9/
       arc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/819bedec174dcad11b93a1a0bde8f42702a6bd3a/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/59a5a797a5006e62197b177d14f7c4155d0fa79b/
      i686 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5a266fa3c8b4dcf488bf09ccbed8f224a6d9ae93/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/79a3c09bf0e3cc03f8c20e8329e1328ef9108dd0/
     nios2 |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/a9b8f03a1c104d835cddf2a820c51086f437b6d3/
     avr32 |               xapp_xedit-1.2.0 | NOK | http://autobuild.buildroot.net/results/367a548a3ea7c292676deb117fc96c2e5697baee/
      bfin | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/6950376308235f28429cb8bd3dfa622261873fbe/


-- 
http://autobuild.buildroot.net
