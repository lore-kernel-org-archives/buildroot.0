From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Sep 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-02
Message-ID: <20140903063014.E814E10149E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-02
===============================

        success : 160
       failures : 77 
       timeouts : 1  
          TOTAL : 238

Classification of failures by reason
====================================

                     gpsd-3.11 | 25
                   chrony-1.30 | 8 
           host-nodejs-0.10.30 | 4 
               alsa-lib-1.0.28 | 3 
                setserial-2.17 | 3 
              libgeotiff-1.3.0 | 2 
                  zeromq-4.0.4 | 2 
             armadillo-4.000.4 | 2 
                libcurl-7.37.1 | 2 
                  boost-1.56.0 | 2 
                 gnupg2-2.0.26 | 2 
              librtlsdr-v0.5.3 | 1 
                 python3-3.4.1 | 1 
zlog-ca6162be1608839e99c638... | 1 
                   czmq-v2.2.0 | 1 
                    orc-0.4.22 | 1 
           xapp_xdpyinfo-1.3.1 | 1 
                 pixman-0.32.6 | 1 
            host-texinfo-4.13a | 1 
                libiscsi-1.6.0 | 1 
                oprofile-0.9.9 | 1 
     libphidget-2.1.8.20140319 | 1 
                 webkit-1.11.5 | 1 
               iprutils-2.3.15 | 1 
          perl-net-ssleay-1.65 | 1 
                   geoip-1.6.0 | 1 
                  python-2.7.8 | 1 
                     lxc-1.0.4 | 1 
                 wayland-1.5.0 | 1 
              host-erlang-17.1 | 1 
               libcap-ng-0.7.4 | 1 
                host-gdb-7.6.2 | 1 
make: *** [core-dependencie... | 1 
        perl-xml-libxml-2.0116 | 1 

Detail of failures
===================

      i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/240a2ed8a48744b4efcbee68e0e69aca70acdc6d/
    x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/27efc1f5121268c830388b557473df164ae34b0d/
      i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/605cf7937c68537024b91b330e21c86e0f12bbcc/
       arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/4d33ff9e890f53a2ea677f10a2200eefcf19e473/
       arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/24d4fa91708231470cb3fa377a24337e877f5742/
      mips |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/79fe4caffb9a3b9f1b203498a589a5172bd0acea/
       arm |                   boost-1.56.0 | NOK | http://autobuild.buildroot.net/results/1a73d44392bfca62db76682559fde7ebd58c35fd/
       sh4 |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/adf932a3f40d2c6348ac79422e304e917d80e45c/
    x86_64 |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/910e1a99e12c9d8c3e176c38ab9162ae74ac6bce/
  mips64el |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/b0886a5336fd38bd1b8949e2df92c5dccbe533bf/
    xtensa |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/71ca6c4db830b343848202fb9c93e8bdda4d882d/
       arm |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/2ba2545de0f1a425249fd0628adced41f4b53ed6/
    xtensa |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/4f753c2da9356e8309fb3914fb09b54c5a99d685/
       arm |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/8832c14e7f59cea5f8c594e4c4ace977df177b7b/
       sh4 |                    chrony-1.30 | NOK | http://autobuild.buildroot.net/results/1bb77fdb91667b370aaa5ed333fb8bf555c00fb0/
     nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/c2d4b1179926f576d80e5bc646b31b410a8933fe/
       arc |                    geoip-1.6.0 | TIM | http://autobuild.buildroot.net/results/8a6dc4ac60a80a1dd9ef7d91975b1ce40e153bcd/
   powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/3d47972c16bda5dc5840a779e6134717ee370e15/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/4ddbfd7daf66940a52388191b78937b592595a60/
  mips64el |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/9ad814e5bd1154b7191c8cf5090f64f826903c38/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/033407b675fc1344784af2708d1eab2f7ae9a277/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/4e8691e2fc34ec3d375252580494cdfc9d0814c9/
  mips64el |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/999fed5cf704575badd83e92f280ef2b22b921a1/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/a93091adc9914f8d71f0460af88188e39c72e917/
    x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/c4007bec727511329e0bb45789c1ea9541ea5d46/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/6263c1e3a8863a7991a6be2f138e9ae66baaac04/
      i486 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/22c1bdb9ea1a01ae0c7f594ff222bd8e663e9a4c/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/213ced0ef149892a41b8cd6252768f8085301c1e/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/520b92718d5a85b8e715bd3aeb9b7a916a564e60/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/181172b380ae3802d589973518d7cabc3a82f928/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/9de9c9c7947efbfb787b88f7675c96587e718bc6/
    mipsel |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/e6af690c7079fad745c6112b4b9727ab7e700639/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/ff38e3c5ef010dd554eb51486097b9b86b9b1727/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/109045ee7f7f28cf6d506dc012760ea53c38ae6d/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/f55e9559c3904f5720399ddd11287bffabd95b94/
    x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/c245522dc05be8111d8e9fe09b08045c57c975da/
      i686 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/2b2f599c73db0f71081a3c5f1deec32231c420b2/
  mips64el |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/83fdc2c38ecf6cd4ab535ddb0805dfe5959d81eb/
      i486 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/2e8eb3c3bc4fffecaf154390be96c2aaf16774ca/
    x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/b0f0b860ec0bfb5f11855d543dd0a78f0a872885/
    xtensa |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/b615acbfedc7c9a417e4829ceed36e3c5e641027/
       arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/bd1518f94376b18cd77b0409c5069fd191357169/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/641154fdb05ed0ee31c12774ac20361f4732bd10/
   powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/3fd311365152829343f8d8d738d0a027a0dd2421/
      i486 |               host-erlang-17.1 | NOK | http://autobuild.buildroot.net/results/7f80d187844abc98cf17886aaf66607f736c1122/
    x86_64 |                 host-gdb-7.6.2 | NOK | http://autobuild.buildroot.net/results/0c00ec94b712af8e3a5521d78c0e21e7f6bd21b3/
       arm |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/1fff66d7871264d9410fe09845ac5808923d25f3/
    x86_64 |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/b6729cf68c9beb03e5ca9f7ba0d6849456262e45/
       arm |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/e1b3def5f9b0bf5e40e72cbc718a07dad8858262/
       arm |            host-nodejs-0.10.30 | NOK | http://autobuild.buildroot.net/results/3344b011babb7017e744cff5ea706bcc2a8e0341/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/4c1364bd75314a7ac3b9a60921d741eb07f24c4b/
   powerpc |                iprutils-2.3.15 | NOK | http://autobuild.buildroot.net/results/6bdfcc730daa8f6bb7f4206dd906a1bc56b60726/
     nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c45c8c3d4bfbc30151ef31038d05f4d66060c57e/
      bfin |                 libcurl-7.37.1 | NOK | http://autobuild.buildroot.net/results/dd1c326345f8f9c8b5838601ace19002f5360bb2/
      bfin |                 libcurl-7.37.1 | NOK | http://autobuild.buildroot.net/results/9188fc9a63d880cac28c5a9a246ca5504dd11bb2/
      bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/d204297c0f9017cce1ef0c16c72e25b3b784ab4e/
      bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/44a6b3f835fab42e350d9e4f70c9b6e283d9761d/
      bfin |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/72f389edf9c5a7e35d01dc4f76fd6dd0d8110f20/
      bfin |      libphidget-2.1.8.20140319 | NOK | http://autobuild.buildroot.net/results/9322c930a545bb500b5193a84b26895a03a6b7f7/
      bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/534f02e619cd61c9fcecef9099ea9fba7fe62dd0/
       arc |                      lxc-1.0.4 | NOK | http://autobuild.buildroot.net/results/a8b40d92d99b8c6350763c3354c33065a819f6b0/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/1bc76be3a42173ccf518b2050f9437487dfa7239/
   powerpc |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/90c56707aeac31c4855aaf4b3da5ae7e5a2d8ba0/
      bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/320e9180196d22d2a969ad4dd933b4f3e0fe45bd/
  mips64el |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/c48fb41fcb86cccfd6e71c173e7f4fc62ed96135/
   aarch64 |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/39fe44cd4ed57c85ebfd055471c9890c003a3b9d/
     nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/93be381cae1f064f5e0c846865d3fb0670b8d6d2/
    xtensa |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/b4a8f482d0282b23497f88324d6d2f1d6cabbd68/
  mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/c3f6ffabb5012bf04b5d5079ffe4bbc35d29067f/
    x86_64 |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/3dcda657089a8489910c1ca973f900a34370275c/
      i486 |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/d5ba361a5c3829d789fe647fe785ab81efd9bbe1/
    x86_64 |                 setserial-2.17 | NOK | http://autobuild.buildroot.net/results/4d61f60ed94a7a1ddb1bc1b11173967e1d65c8d3/
      bfin |                  wayland-1.5.0 | NOK | http://autobuild.buildroot.net/results/907f07664c4f9c959293381f13594a9a3f996566/
      i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/0cf985320aa4c363401d0892a773b83a6e92a6c2/
      bfin |            xapp_xdpyinfo-1.3.1 | NOK | http://autobuild.buildroot.net/results/2dada0264409d8fa6befedbc02c0de77c605a5fa/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/7f740c245ac821adc0a418ce6a9d4815df263ce2/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/ac823db7ac5772f0d2eb87e371b8fe53dc165cf0/
     nios2 | zlog-ca6162be1608839e99c638... | NOK | http://autobuild.buildroot.net/results/40e9221158a4555db5115dc2a5a4c503ece96541/


-- 
http://autobuild.buildroot.net
