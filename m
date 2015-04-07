From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Apr 2015 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-06
Message-ID: <20150407063021.87698100F3D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-06
===============================

        success : 212
       failures : 62 
       timeouts : 4  
          TOTAL : 278

Classification of failures by reason
====================================

              lirc-tools-0.9.2 | 4 
                  boost-1.57.0 | 4 
                libtirpc-0.2.4 | 4 
              procps-ng-3.3.10 | 3 
pulseview-19be0af16af83ca10... | 3 
                    php-5.5.23 | 3 
                   mono-3.12.0 | 3 
                      qt-4.8.6 | 2 
         lua-periphery-1.0.4-1 | 2 
                 libxml2-2.9.2 | 2 
                  snmppp-3.3.4 | 2 
        gst1-plugins-bad-1.4.5 | 2 
                 leveldb-v1.18 | 2 
             bluez_utils-4.101 | 2 
                ipmiutil-2.9.5 | 2 
                 cdrkit-1.1.11 | 2 
                elfutils-0.161 | 2 
               host-qemu-2.1.2 | 1 
                   bdwgc-7.4.2 | 1 
               dvdrw-tools-7.1 | 1 
janus-gateway-c632c1e9da5ff... | 1 
                 rsyslog-8.8.0 | 1 
                xapp_xfs-1.1.4 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                 qt5base-5.4.1 | 1 
                  dhcpcd-6.7.1 | 1 
              pptp-linux-1.8.0 | 1 
                 lcdproc-0.5.7 | 1 
                   erlang-17.4 | 1 
         network-manager-1.0.0 | 1 
               libcap-ng-0.7.4 | 1 
                    quota-4.01 | 1 
             sofia-sip-1.12.11 | 1 
                   zmqpp-3.2.0 | 1 
                 civetweb-v1.5 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
  toolchain-external-undefined | 1 
                  thrift-0.9.2 | 1 

Detail of failures
===================

         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/d3b745399035c64a06b5c2784b6a4ec04381ef55/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/e87b45035077c26b786ebd111050d3ec278910bb/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ffba6b64a6e8418df98e4a0faffa5d5c4694373a/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/5a79c86238a51bb458678c86db798233c2521368/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/fb5bfe5648e425667e443784d75cc56f3caeb8da/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/d89843b0b0caed02127633f8ab11afe3d0bbe776/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/ba5836e9a77e1b48e24ace46ca1611c22524261d/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/2013e42306b3c16542f87215c6ad4bdc3de216ea/
         sh4 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/bb33b336ef2ce0ff880fc6c4e7dbaf0a28682293/
      xtensa |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/675fc5ed869a27d2b013905a9644b02f81788118/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/5beb79f7a49bae5b7791b6cc5252f03968c13b72/
      xtensa |                dvdrw-tools-7.1 | NOK | http://autobuild.buildroot.net/results/ca1a3d2bfc10ffcb33166fb9639f5314072fd2fb/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/e72f2b5d5c5f6f5883d40c7498711c8daf0b5cdf/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/20b63fff9509153a503476c3abc165631aa32c4b/
      x86_64 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/783272aca511b2fd4a218bf2f794a3c63eb79409/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/3d8a990bd13e5bae392690977991f8e9ba833aba/
    mips64el |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/e7561c5df1623476c374e86f199b64dc2f8c6be7/
      mipsel |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/857d4ebce20c0669a4212a856d77491ffa9f6e0b/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/9bccfeec8f009fe5e933983a4295825f88696a25/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/e4b00fe058042603d62efa159ee38e41c13af39f/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/55718728b66229147ec734a8986a92febf1a1741/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/c497fc446140694084922d51fe6be308ce5c1c1a/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/2ecfb1143ba89ffa5cdc8096bb175b2c396c4670/
         arc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/b43b0df570135f6ff5040fccfe8ce500225a8dbd/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/19d8e60e68726d67de45960e6fead6b80144013f/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/9d0c41a5f1fe403338878aa86ba346e6d71a2f4f/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/acbf1715fedf7bc44054a807b0c75bce967b9ea4/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/5810a64d9bb91e13670844982d8eaef0f0529dc5/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/13cdec5f524661ece2392b6f8802270d0ae73ae5/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/b78e017941f90c1ce7de0b76a5e12a2b95b82ab9/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/4c7da3add1ccfb2212e6684811ec9463c26558e8/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/312dbc1e098dfe71a3ce018d0bed6d859c4e8bdf/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/f20d728a491792f1a8ed7a1a9c4e4706352cd7c6/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/01f62345be1af074880d3f8235a2a957681737fb/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/c20a98dfacfa79579a0d401e081f2cca13a7a7b0/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/4826409b3d3177eff3e7f2c3b7360058c73fd406/
      mipsel |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/24ca778c2136a2db9c399555941654f7f1b2b4e7/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/0fe9b4a3a5128844886e4bf89b5bc0d3008b43aa/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/757089b85d2363aabe5d2ab5c5d48668184eddf3/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/19418d59442ab27a91dbd2f3fab35ff16cc8b2d6/
         arm |                    mono-3.12.0 | TIM | http://autobuild.buildroot.net/results/f247883e30216bd651f744c05dfd33c87ffd3137/
     powerpc |                    mono-3.12.0 | TIM | http://autobuild.buildroot.net/results/6d2d0ea8d45399d30687df2b46138ae277b66a4a/
         arm |                    mono-3.12.0 | TIM | http://autobuild.buildroot.net/results/59b99bf80958b227bcce4288cfadac334fb3373b/
     powerpc |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/791b954b50d9ae16665f691e14b7b5b03c808655/
        bfin |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/2788273f8d2a09bd3f6bbc1aad5d34b80e9d9f3e/
        bfin |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/76bf37a6f9064ed1164b098e802f62d036899d33/
        bfin |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/bcc5953109b47cfb86b33e6ec2badbccaf3117e3/
         arc |               pptp-linux-1.8.0 | NOK | http://autobuild.buildroot.net/results/208a5bb34340fe698fe621e390199db8a723e304/
     powerpc |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/beb417429bc795cd9aec894dc37024d5ab6632e4/
      x86_64 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/2475a3f4a94bae6d06dfd2c2b74ba6af871f64ab/
        i686 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/ef84db9c5ac2da1db80264087d89b5a9fd0e9478/
        sh4a | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/fdfca695bb2348395ff8201ac295efeb6540b822/
      x86_64 | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/9b3273d6f003104190d42aa53ea1d79c3fd0c5ce/
      xtensa | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/52dad96cec9f36b150f2b2d6d542e8d5759a1d51/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/efd4858ccb352484447d80fecf1a358f5289b381/
         arm |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/168c7e7b078513aa3103d4d5d3e6edccf173dc52/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/7d9bb37249ce9baf8461f31106e872a11d0ea493/
         arc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/6394ecc98ec50e39aa91588aa253cf7246b98c1d/
         sh4 |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/8a31c815f113f610fb2cdbc4d27e5ade492be354/
    mips64el |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/8044336f4498d1c677db8b664575a603430c3038/
        i686 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/11e4e2a9fc470ca8921044fdbc712b401c08a6d2/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/b909faf030d4aff076ed745705d1449b61ab7389/
     powerpc |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/21e3fff1e0d714f94ac7e621289d1a59bc02a05f/
        mips |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a3dd6280edd139736764070c4d841f4714962704/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/2b9e9ebaaabe4880e7d258d88f12ce90738ca779/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/5d4fdcb1e9229679ecbaa3d54c5298ca6abd7048/


-- 
http://autobuild.buildroot.net
