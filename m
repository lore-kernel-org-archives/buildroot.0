From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-09
Message-ID: <20160610063020.EE467102A19@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-09
===============================

        success : 208
       failures : 99 
       timeouts : 0  
          TOTAL : 307

Classification of failures by reason
====================================

     python-dataproperty-0.3.0 | 7 
               target-finalize | 6 
             bluez_utils-4.101 | 5 
                  connman-1.32 | 4 
                flannel-v0.5.5 | 4 
am33x-cm3-11107db2f1e9e58ee... | 2 
               wireshark-2.0.4 | 2 
                nodejs-0.10.45 | 2 
                beecrypt-4.2.1 | 2 
  toolchain-external-undefined | 2 
               linux-pam-1.2.1 | 2 
                  bwm-ng-0.6.1 | 2 
               openipmi-2.0.21 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                directfb-1.7.7 | 2 
                     php-7.0.7 | 2 
                     vlc-2.2.3 | 2 
             libfribidi-0.19.7 | 2 
            xlib_libXaw-1.0.13 | 1 
      host-gdb-arc-2016.03-gdb | 1 
              cryptsetup-1.7.2 | 1 
                     nut-2.7.2 | 1 
                linphone-3.6.1 | 1 
                   ethtool-4.5 | 1 
                cifs-utils-6.5 | 1 
                   dbus-1.10.8 | 1 
                  autossh-1.4e | 1 
leafnode2-2.0.0.alpha201407... | 1 
                    lftp-4.7.2 | 1 
        host-xlib_libXau-1.0.8 | 1 
            lttng-libust-2.7.1 | 1 
                 rtptools-1.20 | 1 
                      qt-4.8.7 | 1 
                  mono-4.2.3.4 | 1 
 xproto_xf86bigfontproto-1.2.0 | 1 
              gnuradio-3.7.9.1 | 1 
       python-smbus-cffi-0.5.1 | 1 
                   assimp-v3.2 | 1 
           linux-headers-4.6.2 | 1 
 toolchain-external-legal-info | 1 
                   minicom-2.7 | 1 
                   dvblast-3.0 | 1 
                poppler-0.32.0 | 1 
                e2fsprogs-1.43 | 1 
       gst1-plugins-good-1.8.1 | 1 
               dvdauthor-0.7.1 | 1 
                 mesa3d-11.2.2 | 1 
                libesmtp-1.0.6 | 1 
           host-wayland-1.11.0 | 1 
          xlib_libXrandr-1.5.0 | 1 
                pinentry-0.9.4 | 1 
                     fbset-2.1 | 1 
                    libiio-0.6 | 1 
                 libqmi-1.14.2 | 1 
                    cups-2.1.2 | 1 
                 libdrm-2.4.68 | 1 
                   lite-0.8.10 | 1 
                upmpdcli-1.1.3 | 1 
                  boost-1.61.0 | 1 
           gst1-validate-1.8.1 | 1 
                  avahi-0.6.32 | 1 
               libcap-ng-0.7.7 | 1 
                   luvi-v2.7.2 | 1 
                      lzo-2.09 | 1 
                   mpd-0.19.15 | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/ee9bbc41fa532d7f5c2b5cdc33f2395d00c02756/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/8faa63a43d155454706b2a5fb4ab978b8c67c586/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a6e8f715de194b3cfee7048792a7caa9a85d42eb/
         arm |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/de2276038e9fc2c6c6fbbb77075d4c4374a4970b/
     powerpc |                   avahi-0.6.32 | NOK | http://autobuild.buildroot.net/results/9d386ec10107871070fe0183a5b471b76391148f/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/86f44200cfbe6b1bdeab409cb7ddad718f89137a/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/a26da8b628d5084890f48859905f9197dc8029f1/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/166b36e2fdf6dc40bb142f80d5c756a9b10ef024/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5ac0b7b28882e2c3e2ea28f69ba3d89ccba9f4d8/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/37a57f29c6632fcdb18670a18328679dee925240/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b58d44dbd59369be80fe0af6d2893d5aa77029da/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b090cbb2fd267e5de1d9c17167c669b303fa1aff/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/484d8ede9c010989dc2bd6af0153f977929e9fe0/
microblazeel |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/c4bfefc344de3bd901a2e086481e8707863d02df/
      mipsel |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/8174722545d85e0e3e1529ef0cc9daab771aba10/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/c6e1a3a2ca313e3c560cd0111d84a730227575f7/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/8787a6e3e97ae302e2e9d8c1c06f7420d7a7f497/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/ba6c9a9b8e263fd4ff975a9209b17dcf1f81a680/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/e06467607dc075f173ce3ce555e87e6a84edf4d0/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/a2d64263e28d3d77336256cc567d8eada98ccdf1/
       sparc |               cryptsetup-1.7.2 | NOK | http://autobuild.buildroot.net/results/43982aca96696a98a6ea80b4fa09a8de0d5275e6/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/13da6a12e226baadcf86adfe31238d63c93a8d89/
       nios2 |                    dbus-1.10.8 | NOK | http://autobuild.buildroot.net/results/1caf8ba4c4372ea3a5acd001f0961cd2e2a461b4/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/3b7e70c090b16097a087fe3126469324c0e33fa6/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/ba429f2443ca0fac27255cce230415e8bc0f17b3/
        m68k |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/5e46234fb874e583300f17a1061d17dd018378c6/
        mips |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/ecfef817ee0ce048f317ca08b6876186065d81ef/
        i686 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/1c8b9a46f7d2207112bc835c38544779096a3879/
        mips |                    ethtool-4.5 | NOK | http://autobuild.buildroot.net/results/3603b1eadfe588e392b5d9885ac80aa6b469f57d/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/214f65894645b8ed804bd154a56dd3b4c751ab08/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/43bc0b016d13b1d5c1887c2e9ae9906c55c8a89b/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c305f3325bc4c582db32c9d0ea4eb04dcd93eb10/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/dec8b0d0ef730befb020d2acef40cdc4c2812fee/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2eb9bef5e9b096241487beedd4afeac9224d44ad/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ca28649a2593a2f3d0d8eb8d2ef8920fc97b4166/
     sparc64 |        gst1-plugins-good-1.8.1 | NOK | http://autobuild.buildroot.net/results/1b21fcaae31bf3cf9553f4199b6b9b9dd5da014b/
     aarch64 |            gst1-validate-1.8.1 | NOK | http://autobuild.buildroot.net/results/7e7a8753fcfc6eb063171abab9a8bc53e54480e2/
         arc |       host-gdb-arc-2016.03-gdb | NOK | http://autobuild.buildroot.net/results/78808f690cf487a78836e3db9691f7cc3e542b7f/
         arm |            host-wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/9b30a7f99c4b8ad92a1fe1765453c2e3ac41014b/
        i686 |         host-xlib_libXau-1.0.8 | NOK | http://autobuild.buildroot.net/results/2b25e785e1b38cb2b44b32a682003733b4085b27/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/ca2019b5752e4b9c19b382f4c04c546bb9dbcfc4/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/6a1c163d2d95e7e2564d477353edc28af4bd7dbe/
    mips64el | leafnode2-2.0.0.alpha201407... | NOK | http://autobuild.buildroot.net/results/73247a764d08f20c1bfbd086028094eb97245f26/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/1697a6a25f3be495c6925457e6714e2ec35931f1/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/cb8bd3a01c7a6fadb20f18c1a3cbfabc52f3a6ff/
     sparc64 |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/9bf28bb56a6e7f3c9607a76b5f377200aa6b94eb/
      x86_64 |                 libesmtp-1.0.6 | NOK | http://autobuild.buildroot.net/results/f332d01161c8c1036c31697b2a9ab082ac6761d7/
microblazeel |              libfribidi-0.19.7 | NOK | http://autobuild.buildroot.net/results/76a82561b5dfe499f94a1032603e0db9bc8ee0b5/
      mipsel |              libfribidi-0.19.7 | NOK | http://autobuild.buildroot.net/results/5a12989a09c79436f414785ee599487b821cf3d6/
         arm |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/31124dd734c5e801c8c1bf170465ed90f2929adb/
       nios2 |                  libqmi-1.14.2 | NOK | http://autobuild.buildroot.net/results/2af7c2068deda02434211a64defceb84ee4e1e09/
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/5ceb4e85440637d771b5ea36075d2a33a9b77498/
     powerpc |            linux-headers-4.6.2 | NOK | http://autobuild.buildroot.net/results/c8e5388508dc886f2425e88d4852a7acba6dce88/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/d732127d136bacc6bc17b742028691437df7f5f9/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/0f1b52c9f927e70ac026c0c42ab2cfda863df9e8/
     powerpc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/eda3f691a3603494425c422e47c4cbe677ffaf52/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/45d18f3892d5d83aeef9d2c323c4fbecef7dc91c/
      x86_64 |                    luvi-v2.7.2 | NOK | http://autobuild.buildroot.net/results/affd40aedce8b63c92fb2bc90ab22e9b9d0c7f97/
         arm |                       lzo-2.09 | NOK | http://autobuild.buildroot.net/results/95cb75d855b68d2ca7b84d489df9a7c6a6d556e8/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/df3536fbb2b879b961698d7a93cbb7a911cd686d/
      mipsel |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/17cf61a2ba40a4d89fa77e4fbc85469e49bf517a/
      x86_64 |                   mono-4.2.3.4 | NOK | http://autobuild.buildroot.net/results/d0a5120ec24de93e62b6842984ef62ccf9b14030/
      x86_64 |                    mpd-0.19.15 | NOK | http://autobuild.buildroot.net/results/9ba573a588934700c354ba7676b3aa88cd7c8d7d/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/29d130d3c2bc5faacb79f8f3e557a958faca40ee/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/bdde5f9591923f61bc29e1702facc5cda902c306/
      x86_64 |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/c1a7acf367d83a1abccfbe3c460570c4631aa80e/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/25f2a5af137d88adc0d7b6ff8afddbc52de6b4d1/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/78c0a55a821b6aa6b5a01dc570b39b63d2277e3f/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/c6b193e1943f672480537221b0bbe3dc8e3a24f0/
        i686 |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/b10045390b31485a70b6af9569d9b453ec71ffb9/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/3957da544b857f2b7500793535415551ea6ffc92/
         arm |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/8751dc25cf7c9668a3f0d85d15d90935e4a171ee/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/0c8e0ceccc2d5f48138ec4f95e57729e33108f59/
     sparc64 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/eab2d2bf78ac943156a0b8698e63bdf6e63865bf/
       nios2 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/4d60c711e9c1da6dd5bb809bbe328e6252d2d747/
     sparc64 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/ed1982367fa1531d772d29b35e333b34e5889cec/
        i686 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/a0ebb6b155fa11c5886080f993c9aa9d596ac1c3/
    mips64el |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/85e5086401a314a2d3d24efa887ac0188add85fc/
      x86_64 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/99ea243303ae12aceb2fac3a5df5e3b552712eda/
         arm |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/c50a9377e1fbf15bedaba1a830865fee6d1d1601/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c86d37f2db1392e156f6e1f0cc27b1a68de28f4c/
         arm |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/b18083051d6a97c44727d6a40df34800ac7ff8a1/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c1f3ad649a90bdf665ed1fae796e492db7098e7d/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5e487d1261273958dd9e60ceb7a3b8ac0cbb4cfd/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/7bdfbd5e128626816bdf05e11908a5b213e8b4cd/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/2e9af0e4653317641e260a67d105f12b636125ab/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/8640b4de19cff217ad4512e3719cd210588b21ae/
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/dc99f2d8605c5d766a9b7926b5870e2375b49232/
        i686 |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/285ad1795baf458c6852dec4901aec4d2ccc0873/
        sh4a |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a05cb9fda98967f7e664aeb85b70e2b54d8962d8/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/81c394997b67dc18c3f86434f01e5ad5019efcac/
        m68k |                 upmpdcli-1.1.3 | NOK | http://autobuild.buildroot.net/results/abe9be3b78f26f56035ec805a86ab33b1d145a02/
        m68k |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/883395dff83cd8c998fdc3086fbca0dbb4c0bced/
microblazeel |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/99881b3f1e1783db90866acf480686bf848bd251/
        i686 |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/902ed7881b2418d1fc7d5beea752082177ef7f1f/
        mips |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/748f1aaa0e1cb03116d9e125ca792b38626755a7/
     sparc64 |             xlib_libXaw-1.0.13 | NOK | http://autobuild.buildroot.net/results/f245f44d04a28a86741594265e3030c3ab5a6fcb/
         arm |           xlib_libXrandr-1.5.0 | NOK | http://autobuild.buildroot.net/results/63974c96f18e334688063c13192003ac0575fa2d/
        i686 |  xproto_xf86bigfontproto-1.2.0 | NOK | http://autobuild.buildroot.net/results/070cd8bffdd3eff1a42e5096c03c4960e8873be3/


-- 
http://autobuild.buildroot.net
