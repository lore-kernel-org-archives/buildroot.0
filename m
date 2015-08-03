From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  3 Aug 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-02
Message-ID: <20150803063016.1687A102853@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-02
===============================

        success : 228
       failures : 65 
       timeouts : 3  
          TOTAL : 296

Classification of failures by reason
====================================

tvheadend-d9cf931f9f7242f07... | 16
                busybox-1.23.2 | 4 
                 mesa3d-10.6.3 | 4 
                 qt5base-5.5.0 | 3 
                 cdrkit-1.1.11 | 2 
                     mtd-1.5.1 | 2 
               linux-pam-1.1.8 | 2 
                  boost-1.58.0 | 2 
       host-erlang-rebar-2.5.1 | 2 
           libcec-libcec-3.0.1 | 2 
                coreutils-8.24 | 1 
                  weston-1.8.0 | 1 
libsigrok-fe473123ba836445d... | 1 
             expect-2014-05-02 | 1 
               arptables-0.0.4 | 1 
               libupnpp-0.11.0 | 1 
                 libpfm4-4.3.0 | 1 
                  imlib2-1.4.6 | 1 
                libmbim-1.12.2 | 1 
 make[1]: *** [all] Terminated | 1 
                  mono-4.0.2.5 | 1 
                 setools-3.3.8 | 1 
                beecrypt-4.2.1 | 1 
x264-c8a773ebfca148ef04f5a6... | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
             libselinux-2.1.13 | 1 
                   systemd-221 | 1 
                 mpg123-1.22.2 | 1 
                elfutils-0.161 | 1 
                 clapack-3.2.1 | 1 
                 lrzsz-0.12.20 | 1 
                   tinc-1.0.24 | 1 
                   audit-2.4.3 | 1 
                  connman-1.29 | 1 
                 libepoxy-v1.2 | 1 
             fxload-2008_10_13 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                  opencv-3.0.0 | 1 
           qt5multimedia-5.5.0 | 1 

Detail of failures
===================

      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/72c4d16306ae33e7e16b3a423a72446d4be93a91/
      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/99e9d1c0e09d648b3474d866590e32f0e86063e4/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/7c0a69074718a475eccc62170bf17e96969f3a02/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/11ed9500b2309d87d8ab47fcc5bd46d584aca5b6/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/094dd7d5b61e8a308cacb5d60f31ae58283567f0/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/5358ef664d2c6c376c1596b03a8890e5a3d28c26/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/01dd6b7505eba272a2220f20aeaecbb64f08f946/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6a586df0f4c4b8c7c4dd1a8a85d8b4c5ae30be30/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a3986da8627f7f7633a165e7e20646f6006a1414/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/93c6af6b50833b9582f8f13d3dedeb176c6a3a9a/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/27e13a2fd85d2f9de89823c68b7c8a0030533c39/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/2418eb4def996614f163d0c6d5f7bcfc912e63b6/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/c887e2a8c2dd48b5e062cb40cf2b2bee17895e54/
     powerpc |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/31147790ec2514f9ccbab1d3a18e59c72ebe1eee/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/d5e583c695afbc2e686e3002765ce9e1937aa0d5/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/b118fa158570821a4223be584dfddfbcc6ef1d5c/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/2f2e5d1e7ed91d77f22dfc182348d772decb6a90/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/7aff491d55bd39fad3e9cc72998a14549947fb05/
     aarch64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/b8bd72cb4d078a33720e2403ed9a1f646c34c678/
      x86_64 |                   imlib2-1.4.6 | NOK | http://autobuild.buildroot.net/results/a6e61bfb376946b479085f243601d6e1634adc6d/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/b62611c61c98b000ee7b5daaca78a5fe98107967/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/c21c555c38261f6911349ff9fdac6edeb4debaac/
    mips64el |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/c6dd45049eadca1d2d3e1f0faa4662297f6e5b7e/
        mips |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/0e0e57d3eac1da5de3c9c18d04a3bd204d35d7bb/
     powerpc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/5a421458ffe614415b540b1eabcf9202822aa697/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/5aac9dade9c8053d697622c74bfc671abee85daf/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/5b495ec2ee983ffed9973629f397cd9c4d438b7e/
         arm |                libupnpp-0.11.0 | NOK | http://autobuild.buildroot.net/results/360727119e93ea8eb813447c64b1c961c7c05b09/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/31d2110139a6d0aa8bb36e0462df84c3ab9af31e/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/f456903ac936216643aee8f18a4ba313f24c8fcb/
      xtensa |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/7546c5d43626ec08eb76222b602888b5781aa5f1/
     powerpc |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/3650163ff6257ad445ec0bfa15372908a72c8298/
     powerpc |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/799f505594f668154af38cb2c2a1ed8a90337e9f/
         arm |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/c6b6a21f73fc84f4784dd00de504ef0eea3bdaf1/
         arm |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/e5c0e693505798ec366328ed87de3460cd07894d/
      x86_64 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/d00fe349e8710a1ad557507cf04b006216806868/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/19419c475aec3278255eb19ec920d62f5c9ba3a2/
         arm |                  mpg123-1.22.2 | NOK | http://autobuild.buildroot.net/results/fb60b84093030faeb357bf0bac5c51b3a1cd437a/
         arm |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/6784bee1c1cf6fbdbd036a78e47706a0e4190e88/
         arm |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/5ee3f31d166d90eb1e43786f9ed39525f10e326e/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/97749077cdc1d9d0b27a4206a1d58000e73265bd/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/e1849ef0c0e55ff54e072bbb17bae00cab9cd2c2/
       sparc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/030a96eaaa18df8b21ba9510b619337809703dc0/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/3c044d561e8f6b22b5ece735ef05c755b09ff989/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/d5a029bb2bb91a214b84c505d74fcb71d5696b77/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/2d5c0fceab2df694e7be412218d70f1f78dc3415/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/7af24c60c261f74f005229e012e4e1206174d163/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/9fafe16acbe64be1d6543359aba2d37fb2cd78a5/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/8cd8f08fdbcdb4804e1e8bb344e143ad061e0384/
         sh4 | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/e69b810a7fde01300ad0d19be5916363269a49bb/
    mips64el | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/b476d020e1d460fcb5f739f78c9517491cc905eb/
      xtensa | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/23e4df5d9b28ca9a84b2d789a44f66c4957b6241/
         arm | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/463218a1f1c6c204becc66bdb531797eaeb7aeab/
    mips64el | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/2254383a557423c8f1e8153668726a6da4c9fad1/
      xtensa | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/b69f50adfcc9fd58aaae4f27aae559848909cef1/
         arm | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/7f3b4d0b9517e1de8251b40eeb13cada4e926a72/
     powerpc | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/182fbdc4be66cecbf2a61cebb500289eec4c11c3/
         arm | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/2dd538241f3c9129034d9d6cc5be7931786c45ad/
        i686 | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/6999454b212d9858fc9430f96aacc767f19952ed/
         arm | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/02098abf3e51996fd01d180e9c5c5ed7aae2f1fd/
      xtensa | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/aa012c37508afdb2401550a92a28c5888e88bf70/
      mipsel | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/1a4b2d5ae0e9c40a661773ce33afe7b8a0fd395c/
     powerpc | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/a62a660c1ba74faac181732103ea452c6cdd0603/
    mips64el | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/560a144c633468516b725314412e8638cb073e5a/
         arm | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/e5bc5a7e9d0114601c450079bff1edce9b92006f/
     powerpc |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/41603f02fc9c49ef72b648bc1f5df8a47e064c5e/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/25da936991b772be9121bdd0627de7ba6a3646e6/
      x86_64 |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/b0cdabd7d840698837f1f6816499ff0102624e9b/


-- 
http://autobuild.buildroot.net
