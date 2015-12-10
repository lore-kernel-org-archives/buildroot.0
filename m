From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Dec 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-09
Message-ID: <20151210073020.A7BE3101AD2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-09
===============================

        success : 235
       failures : 117
       timeouts : 1  
          TOTAL : 353

Classification of failures by reason
====================================

                 libeet-1.7.10 | 18
             lttng-tools-2.7.0 | 16
                 libass-0.13.0 | 9 
               wireshark-2.0.0 | 6 
                 liburcu-0.8.7 | 5 
                  gnutls-3.4.7 | 4 
              alsa-utils-1.1.0 | 4 
                      qt-4.8.7 | 4 
            netsniff-ng-v0.5.9 | 3 
            libsemanage-2.1.10 | 3 
                   libnss-3.21 | 3 
canfestival-7740ac6fdedc23e... | 3 
                  libnspr-4.11 | 3 
               read-edid-3.0.2 | 2 
                 mesa3d-11.0.6 | 2 
                   mplayer-1.2 | 2 
               libbluray-0.8.1 | 2 
              cryptsetup-1.7.0 | 2 
                     rpm-5.2.0 | 2 
                  ffmpeg-2.8.3 | 1 
                  trinity-v1.6 | 1 
                xfsprogs-4.3.0 | 1 
        ltp-testsuite-20150903 | 1 
               qt5webkit-5.5.0 | 1 
                 libdrm-2.4.65 | 1 
            shairport-sync-2.6 | 1 
               libcap-ng-0.7.4 | 1 
             util-linux-2.27.1 | 1 
ltrace-c22d359433b333937ee3... | 1 
       directfb-examples-1.7.0 | 1 
                 dropwatch-1.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                directfb-1.7.7 | 1 
                  nodejs-4.1.2 | 1 
      gst-plugins-ugly-0.10.19 | 1 
               linknx-0.0.1.32 | 1 
       openpgm-release-5-2-122 | 1 
                    faifa-v0.1 | 1 
flann-04b4a56533faf8c8228d0... | 1 
             host-nodejs-4.1.2 | 1 
                  fbterm-1.7.0 | 1 
                 libusb-1.0.19 | 1 
               libsodium-1.0.3 | 1 
               arptables-0.0.4 | 1 

Detail of failures
===================

      xtensa |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/ca00cb3cc0308c88ba26603c381405876384ac5c/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/734509070c71b98712508da8d7d78b9b6c49b906/
     powerpc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/eda8cad7d647f45903c76c9d1e5257ac635bc039/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/29571ce75c772da229fb760b0b16fee7ba60da9c/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/6534bf7c8995b0e31b8db0b6b61965defb657fe8/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/8e3577421984b88adb0eebef29f6f4f779da80c0/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/6af48d92ef95bb1b1d7c2711b1400c066d8c9598/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d2c81596b570b7042787f70335b6832554e5f3a4/
      x86_64 |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/7fde1122136730fd5bc03da293559c63d5d9b773/
         arm |               cryptsetup-1.7.0 | NOK | http://autobuild.buildroot.net/results/9977ca4765db56a39a9e92932cf7c7aa5034922e/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/1f7ff502110e81793a9060bdf54face55fdc3b56/
     powerpc |        directfb-examples-1.7.0 | NOK | http://autobuild.buildroot.net/results/92462c63e93c505fd3fd6cc86f2bd436be966abe/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7ccd13992a8f6a0f92ab453628d06cd57e07b36a/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/9af1131c91da048441c46d9e2b03db5a62c83ac2/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/230e0e6f357cabe482d1a2051758ebeb0065bdd0/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/c649df0a98b75ebfc486b8d07207a1dec5b381e0/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/c3aaf79788b7e6ca56a91670bc52b921aa8e81b1/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/78a15af36823620d2cd32393eaf205a0e39fa03d/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/4574f810acc6b7eab1c76227cbe3ad7370f269e3/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/2c2bb23bec605f5838f168f996aa5cb1aa0f577c/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/3efc5a15d7a8ea62647e13820ffe4d178e2940db/
     powerpc |       gst-plugins-ugly-0.10.19 | NOK | http://autobuild.buildroot.net/results/b2393cd50c20da919d6111e15b78d12cc784841f/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/10d570dd937cbc2037480ecb118196af498239b7/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/0edddc35128b6d3404e969175cf7680e22421dd3/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/af89e1937daf1af89284219ea880b32767f5dfe3/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/6a1c1f85dff304ed22aeb2ec9b6e413dee15c3f6/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/73046da38c1583e26523e4f11c6a909cadc90e1a/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/60997183e4d4587ff8d71b513a9df38a05175500/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/01c1ef666c550b5d613aeddfe49e4824ad42892a/
      xtensa |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/03fd9f3e5d199a9fe7a6a64cce652e75c7b4f927/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/e2e8c985731bde94d53f08e4848abe612f875ed7/
     sparc64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d855ccdc854357b4b0a4a2f83b7475ee4e22b794/
     sparc64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/0c189bc0db0a46806d74bd05788ac3f1155cfbea/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/187480478e78b4f75a149d337d9747584969dd32/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/95f592c6f32e9737bbad4a38be91ddd73967ec81/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ba5dc68e1432d0fd7699a6363641444c7afc3888/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/cad5fb879d98d3c27d2b4a09b006a7315d58c101/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c97ab6b041a3f6c6d1df4aa5eea4d7df37a1ee83/
      mipsel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/ef8285b86bc956ecd1cdb32445b966a6f03f860a/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/7b0c65a8ef2a421ad73f67cc810a6151f913ead7/
       nios2 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/54e09af26a437ad644e2b29ef97a5a4509e6cd0d/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9f83c0abc03ca11bad3314ed77c136790f844a0f/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/aa7c9991d7dc17afca517b2822f3e6444449da6b/
      mipsel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/8cb82c201113c2e819dad04af49b2eef1c3d2b29/
microblazeel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/e05e1df16a0859fd20e84d0c205d0776279c5f31/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/6ce509f9bd55b025cd3c1bd9b35aed398030dcdf/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/63491024abd3374ab932b2b28c98d8894cd860b0/
        sh4a |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/db17fd613ed9014ffd9d1a97b8c63e861953aba5/
      mipsel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9eb24d0487ac21072f1cf22bb5285ce7eab089fb/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/a841b8f09c8ac200bba862e66972daf9f9bb1ec3/
     aarch64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/90c4bf34be1223155c6dfc533eedda0e34f51673/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d6fe470984b36d04506df03f75a5570065844778/
microblazeel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9b18c8a0d7f33f9735f54fed400ec77cf8b709e9/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/b188378b04589c523e85860efdef1307c2639a72/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/cbe2c15a1f2fb1fe64eeaa4a080e2a5774c96102/
         arm |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/9e1d925aa89bdbfc0e7a55d5e7a2f61d115e603a/
      x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/87e03a14a82ca6f4f566d3054b1aa9818dcf3209/
      x86_64 |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/cb325ed8383ba3dfd2b3d194113accef33f54eef/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/e352a66b179fa0154af36a502bc032044430fe74/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/f117aa5cb9fd6aafc7cd8de879d11d701693a9c2/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/2d5c4068d99f66abf5dc3b810078b03386df37ae/
      mipsel |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/c9c05f3e879c22888d4d2f7d3279db15eaea5adf/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/fa57aec8b534b6b7c9c064da7ad00d5ef741a8aa/
     aarch64 |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/6cefcffdf19199795a8ba47d1e08b89df0ce728e/
       sparc |                libsodium-1.0.3 | TIM | http://autobuild.buildroot.net/results/3933e32bbe2ed7f2b8e5747d28910c970f22b28b/
       nios2 |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/d9dcc2d537275640da6da08ce0e8fec736f471c8/
microblazeel |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/e79cf01683e07022c0ab7586fb47335c2e7ae726/
       nios2 |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/560e18c7decec22c0ba85e6e374e4b8d84fb038e/
        sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/81373f634a53032c52ce5195f4d4fcd44d13b754/
       nios2 |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/58f2e14cf821d2029fdd2e5c054a83d9cd2eadf7/
       nios2 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/15439270c09cf49a178a7e98da76576782bfaa2b/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/057f44b919c0932c1e1262e8e01bc60a69a813ba/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3405e7a2b194683324eedf3526f06e33ce4e24e1/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/aa52adf82ec79d2678d0097acb160322355fde98/
     aarch64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/96784258814ca9dad775ec6361d3a3aa55d7e9a5/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/72b20d2eb48f8da9c170d726bbec1fbd6b80b4c1/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/e32293b58b6363b75718e715198162b4604dbde2/
     aarch64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/a3d637b63a134dcd0b85783e99060c91270a5054/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/9ad7d9cea06f648710bbc39573900ae83cb27ace/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/7bb17d9a825c4b612ed7dd8b72da2f85d5c8ead4/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/9e17b97f375f307473018c390c0bb52c5de63a65/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/57645be95fa02433395af354e15a3b5a302792a6/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/86c535d7b50626edac88efec1282bb4a090a350b/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/5ad3ed5c16227faef1ff895c2a66128c17c340dd/
     aarch64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/ddeb62ff40bf331fe7dc3ae33540648729994ea1/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/24a134b731f62981c4c8816f4a03fc48191f12ad/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/bf6047ef837a7a566ad5d84abbe2cdc911350faf/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/09146cc784790f8af165f1d5d88fbf1f7cd8fcca/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/84f2503a63f30b489805da7aeee0d6996b370dde/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/ffd41615c8ddfaf04f0cda5276fc08cfd2708725/
microblazeel |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/b029ae5547a6d663a1b38ae6e826bae93f09fdf2/
       sparc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/6b079c1cbac60315ba4a85e5ef90be07e36a3c75/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/03909c932a4dfab8f7231e3e9bea4fdb298614b2/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/384550310ac0399ad7fb38b395219ebb2d02022b/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/5165ce021e736248838843e9c91470fefa9304d9/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/fa4add0dea565ef00b32b5484cf2d0ea5a1ff285/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/31d5bd855a383be4c16b891d20e347430d586695/
      mipsel |                   nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/fbd30e9c362ea1ebb156b444adac663ab781f837/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/6ba83d2518fb3d837e676d78a433166cc894b110/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b527cff9d159a67e0d93b7cdebb25431f686b0de/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/695246ef28e8142aa2486658eba93b092e4c5e3d/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/15be071343668b99b57504b3d8edef6018e498e4/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d69c8a5f1e1719f7994dcb191320f252b3ff67b5/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/f262807a148db5231a6a718f16d5edbd858268c7/
microblazeel |                read-edid-3.0.2 | NOK | http://autobuild.buildroot.net/results/2dc6a22706648b1539cc626a71f7cede3b0ea5ef/
         arm |                read-edid-3.0.2 | NOK | http://autobuild.buildroot.net/results/f4f183034df4521226e4eb370af46fcd7a0cf781/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/d5c12a95b95a9bf1aa08a393af495c79a46d2493/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/8b4debe28f2517ded9d42967664eb564598bc5e8/
        i686 |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/24243765fa0390f55e3f4f521cf4409811a1ff2b/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/74031b5f4c394602751ae335b733efe1b669af0c/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/e70cf33be7c3c23240c4fee6c500477109074ff9/
      x86_64 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/170112afb9c3018b00c461bab447b61c53d6ed29/
        i686 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/0f574fa14fccdb26518775ab7b5af997ae046424/
     powerpc |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/470264ebfee4a7ab8e9266fe95f79900160d74bb/
    mips64el |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/7c59d33f3d01e67b71985a51eeaf8e5d899d0ea2/
       nios2 |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/5f24eb7429c7128dfc4773d9c7f252b9252cdddf/
      mipsel |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/653199d405a96343891ab81371705c7e0fe91bf6/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/0f1dc65530fa3a9eab5b84718676e1b047ab5835/


-- 
http://autobuild.buildroot.net
