From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-20
Message-ID: <20160321073023.C428D1023A9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-20
===============================

        success : 203
       failures : 167
       timeouts : 1  
          TOTAL : 371

Classification of failures by reason
====================================

              gnuradio-3.7.9.1 | 35
                     tcl-8.6.5 | 19
                     dt-v18.32 | 14
           libimxvpuapi-0.10.1 | 9 
             lirc-tools-0.9.3a | 9 
               linknx-0.0.1.32 | 7 
                  connman-1.31 | 5 
                  cairo-1.14.4 | 5 
                blktrace-1.1.0 | 5 
                  ffmpeg-2.8.6 | 5 
                  prboom-2.5.0 | 3 
                collectd-5.5.1 | 3 
                 mesa3d-11.1.2 | 3 
                    yajl-2.1.0 | 3 
            webkitgtk24-2.4.10 | 3 
                  boost-1.60.0 | 3 
                  multicat-2.1 | 3 
                   systemd-229 | 2 
      ca-certificates-20160104 | 2 
                 rtptools-1.20 | 2 
  getent-buildroot-2016.05-git | 2 
gmrender-resurrect-aa3d02cf... | 2 
              gst1-libav-1.6.3 | 1 
                    ruby-2.3.0 | 1 
                     fbset-2.1 | 1 
                  trinity-v1.6 | 1 
                 hplip-3.15.11 | 1 
                 lvm2-2.02.146 | 1 
                 opencv-2.4.10 | 1 
                    quota-4.01 | 1 
        lttng-babeltrace-1.2.4 | 1 
                    cups-2.1.2 | 1 
               qt5webkit-5.5.1 | 1 
             ipsec-tools-0.8.2 | 1 
             spidev_test-v3.15 | 1 
               libgtk2-2.24.29 | 1 
                 mono-4.2.2.30 | 1 
                    mosh-1.2.5 | 1 
                  apitrace-7.0 | 1 
                   tinc-1.0.24 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                      qt-4.8.7 | 1 
                  c-icap-0.3.5 | 1 
                oprofile-1.1.0 | 1 
               libsodium-1.0.8 | 1 
                   taskd-1.1.0 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/8eead33cc9bc02bfaa3de5af3d66b743a9214e04/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/34edf453f4794292e4e4f88f729eeac9f3f2d882/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7a82760e922877e3adb635db95f85e86120980dd/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/51eab8edcf956c6e06a57291d7d297eb92c6673d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/6d2c5ec83b587a4083f18b6c592b1ffc14314599/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7c3846bfb2c698d1d0507d5b1c7a71c5fd5bb027/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/436db66ced9f4a17ec32f786090dcaa3de49ebcc/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/356185a8f6a5420cf0e79f2881080523dc1b0d24/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/45cb2421d9195079e01075d98df53580491a28e0/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/9e8f7ca9dbd9cb50ed4ed359286233d1841b0439/
microblazeel |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/5c5196fdd89a2309aa8af532a8f4a2d8693559b6/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/1914c435df6a7e697e8b672feea06b227bf16804/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/56ae0e901757370778f602e50328e9e76ba258ac/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/caa47542b1d7862ee860045ed153b1fed9e9d226/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/81f41bb032ad21ff551ba28b780d7ad26b48ca0a/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/f8eefc50feeef2e8f123be77ad0987ca4d11b77e/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/381e9828224f23bbe5aedf18f8e5757ad9b7ea8e/
     powerpc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/05d0768248d297baceca6c49f61c103f7e596431/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/b907fdfb3de4c32e69d3710bce091d84613d77e2/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/a563969cb5cf5342527fa6f6dd9462416e15356c/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c6973ab7af4b032d525e1f24915ae2a2d6e57994/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/9681039674d8349b0b2c36450892d436b7a1768e/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/559b671d04c5c0abbcaadcc4492cdc12b1b07da7/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/90b7fd0963ba973483cbe3130f4992f05f8b6207/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/95e9bc1896d3b66052c9efdb6c7ddd5c70787079/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/9d11c0784eb67a9911ac37aa9fc42b4a3222ce82/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/48651a58a6b6f8fdb5dc5ea64a78361a9fbae98f/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/93e6ad30985404976ec03e1d7dbf8d1c5649e2af/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/d8e1c56900f171510d3bd5d6e5e24c233f3161c6/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/8ef4c4ecd32099f8340bb4e8c3ef68c3c2bb83bf/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/ad102be6d763b72091e5a205f259ca14bafa7289/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/1f82e48dc2ea6980de220273bfd23308be949edb/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/cddfee75e57200a8dc8171915333192f8201eb75/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/5e86d784f30e5c54621c256b7caea5d3127b4bfd/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/85bf7e6bd5fb8ee5517fa12700827f269bcf9538/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/90c9beff428f5a89bede4b90d6124cfe22961e93/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/ac82aac134e8cb80adb23aec5ef32f6195731d17/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/55bad2f5e803326b2cbde7e5718a25caa352e04d/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/9e2126b0e68d0d59d37616a268adb810efd8281a/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/b7bc26cdcf1f104631723bc22126cc79afa17a25/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/dd1ab846dd52de757fa2b1f84c7a9a343cb47ef8/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/408c95bd744faee90ec8bd2718fcec4dc8dbb6f2/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/04ccfc916b16b94021d61a9c711cdcb0a0488120/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/7c07045ea0c0a5234d1cd4d2dec1645d15b56b28/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/11fab6d5a15a1912848d7e6ede243f0e8489b64d/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/dd37160be0536aef79696a195c46b00cfaee0f53/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/e896a9fd16fc02f5bd931b615097f931948b1734/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/573634f59f4fac58415e492df344fa57879f4fe4/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/a26cee029681ed577533f4c40a5579d44b077839/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/1af2e8b3a8eaf6ff4ac277d3f50dc692cc65d7e4/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/66e54b01ee9c58473c9f42973a11a2353021e997/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8e795f5b3755a3984f911ec2d7732c3a885b403f/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d612f9a7832d0b00eaf468f7d98608107a7a100e/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c0ef5c87836ffecf8ee0b8760eb959c5ffb50f62/
        sh4a |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/5280647ab271eb9c4ea1a00386453f3ebe64b48e/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/db2bb6cc8caa7fc258c0ea9387288f10ecb158dd/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/325271ccfd7dd353ffd849e93ef233ecf8eb5c87/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/097c12e937d739354ac134a1b8bdda26c95c63bf/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/6bd677ccd08b3c78e4fb26bb22d459aad1555733/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/0b04d73be416b685cb10eddd9b2fe267c2e6ba76/
     aarch64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/2343862fd45448e5223dbc6cabe26709cfe7f94a/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/e85a630adb2044d2e8eeb90989e70e6de7f6fafd/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a5c04b6cf5d835e1fff83772b165eb315bec4742/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/0466006e5be4f63b5a54973058c88b7bf26d905d/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/0573ecc3cfc6e0277609418906bc2bde07e0f6ba/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/cc3e33fad1c4282d959d8a428f15eae469afde8b/
        sh4a |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9f8366c9ddc9be84cfe69e9ae694ab86c29d8676/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f83c6f440a1da0a218e81c3bfe25aa6e11614a3c/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/54cd56c3cfb38d21d03806ac54e71a3786c66842/
     sparc64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/270e9c8658718765eed817f7800c7de1197def2f/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/74c48119dbeb0e9e5e54eee768a41ba75100f896/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f966fd0e4a54c8611c0a4f8b457774ed8224b002/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/071e5dcfa1d0506e2f4c5b3668e1cc59b1c2d6bf/
        sh4a |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/4f94bbad8c7618510eb1b4c6aacf92ef4bedea72/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9f22a1d740e5013b886750040ed47bf4a7e1ffee/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9cd8ed2ea473231b4e2bba05c14394552c218997/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9a109b2922b0039decdf9246ad7a1bb659967bc0/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/3143c3d4864a2585828a24fcf8d9b419e0eee0cd/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/040b4acc1ad9ce68d7836350e5d06b09175a033c/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/28a10db792d2e040d3c493f1ecdcc63b79a5a639/
microblazeel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d8f693129a57f179fbd17cf46c2362295028cd16/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d5d3ae4073c953c60d2ec26cc3d2e2fed0d7008a/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/fe631a757ed88ff8867c5ecd755c7abe42ebfd86/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f6b5676cee797582631f901a21cea3c1f83d38fd/
     sparc64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ba172ef9e31a8bffb821d29b3d8a811a134df2d9/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/4549f41a3f63f9fa17b2bee58451491d2837bf23/
        i686 |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/2cf52777568c1edf2cbab60392f871506aa30049/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/f9adaae081facad1dd9617b23ef390b5f0ccb270/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/ee3a97582859a579c9dce78f48baeae30bc4f3bb/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8d131cc188f9fb0052b8f3d19bf3b360983d081b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/11ab13c7351424ec35ccbe48e802697fed734503/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/9487680d464fdd523e6b52a54c26eb6c7fdabf83/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/708f47cd376df5d6898b3db0b60f98d042050300/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d4cedf767cdf4102e1bfb8a5b57cdebde6a1b749/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e8b7f08b388111dc5e6be8a76ff989229eb18553/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/cbf2c8ef5276e72809d878f30b6900abb17d53e4/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/4415339b5d9d18fbe7ee751215fc990acc05ea31/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/edabf2110a9d00734be669b8b45a59f2a2743a41/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/014011f4f83a423d1494ab197012db674f164dab/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d5220d4b3f34761450b477e3234f8218cb255e55/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/234b015dc82347cfa519735dbe16b298eaa4393a/
        sh4a |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/8b788d33fdc46a5a7a09f690dfbf8180e46119a2/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e434b8d077c605fc317ef0d4dc0b0fa9bda8561c/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/63731acc326f64267679911eaded78bd4732e955/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/fff5c1ecb8262721e9d76eaaf630d03f6001d4e6/
        mips |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f553372fe602717d0916f70e9b442ee3dd09e086/
     sparc64 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/fa27c7eac102062b39e8288a81a989381db5c1a0/
      x86_64 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/3118774dd44e9ba6b7fb8afb8ae1d6b0c17373b2/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/f01e87056ec743c5f44994e3dbada041bb4d237f/
      mipsel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/ad336b96d702d4dfff9431f7219e6654c04fdd54/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/38405616d452a2a6638330daddce2d7e009c38ae/
microblazeel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/592e71485dd6d5305df2651358f5206e3a1ac850/
       nios2 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/5aedaa7bed5129395b30465f9321fc25e833afd0/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/2eb4670d9032beb85c7e111345634a7dcc25b371/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/333ceb1c0c0bd890094caadb53a41af6c834f6e3/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/eaa9d2fa48027506abd6b675f523ae0f715187f2/
         arm |                  lvm2-2.02.146 | NOK | http://autobuild.buildroot.net/results/99e1a8a5569f473f24861e0f3f82a0cbdf08a403/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/d7c19443af917980d41d650a9c5eb8dec332e77b/
       sparc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/29f1c6b0ba0670d6f7950550a8ac48bb0c87907f/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/139af430eddf07b89bb10c7d05d77b8f08da6b96/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/ef1b8cd7e87abf41efd40e9d2afa92fe1029ca22/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/0e583a4f6f6524ee3eaac4630f46a746786e5b8c/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/5fe253bd047733648bbdc81b2327125aac4d51f6/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/43e1066b78f2fa1fa23bd3d62366c98b4a0596ec/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/36414ccb49531471593d8f2825b91f25d16249fd/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/f302f74d41281ed5f7a465793d3db048e0f26600/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/22493494e5f50905e188bff643b0d03f0d067f76/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/2f14075e22b420cc3fdaaa2231494f2829f040ec/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/d3030fea0b3b8693be640754774e50ac064f8c89/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/b5b90a03fc47f3771803cb474e0ea9671b5c4667/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c821d33212faee4755cc155513e81cfd18cff37f/
      x86_64 |                qt5webkit-5.5.1 | NOK | http://autobuild.buildroot.net/results/9ddc79aeb0a3464b023836b381e907c455d8ed13/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/79ce35cf5aa1c9834e7fcb22f65805eb91700b5b/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/ac1c06deda12a8c787a438a89864ceba57d9bf24/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/8bd00128b1f86f30f950227cdd5b1b4455e8f463/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/69fdf70fd12d7119e996a37e093c7fa3d953b1c8/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/87d4c5d50d48f98d796625f9bf7afcc8c6107f9c/
         arm |              spidev_test-v3.15 | NOK | http://autobuild.buildroot.net/results/997c9e51b54623da386511d6597bf8eb1af64dee/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/b371dadd0c4750bd5cb6bbdfd3cc98177a5640db/
        mips |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/035a12fcff4163c15cf51b6c70085e94cf085ccd/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/65afd17ab3ea29b404c14c1e348329e0c1b74117/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a21ff7cf2bb530b5fa667ae7a4b809ea7c68eeb2/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/4da21cb704ca1b34de9f05d68df7273d7ebe13fe/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f34f4e04b116f383942227433fb1e01a3de34677/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/8e698aa701ed8ef72c83d66730580bbbf7d078b5/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/3c73022d4cdcb92a0cecbd820e23de2bc9be147f/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a49e707de88f33b32dbbc438ac43cd4d3156a82b/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a319af1784cc2a2cddd472120697076146388087/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7be02e0b2367f90148b6c17735921ec3a7551daf/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/e2fb1db6fe40cd59785f9ec371638716a45f3e67/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ed88571b228fcb82bff84b2b1c0b87e7275b46e2/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f5b1a88e20d5f42e028970b8ead320f890541414/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/2178e264913d468180c5c84e3bf11643abda3f97/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7777247f3d9cc4b6f72f910206f56ef6ba828655/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ebd69dca9d618cb4fedf47204dc959141de9d7e8/
         sh4 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d9aaf985786256572d9a1e8b194580828c15b4a6/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6f1990660325ca85ea0d1cff0ce3a4b4885fe88c/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/af92a0dde24a1747d606dc695c026dd52753ff12/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/922de3121686c2d6e6fdc506e53c645149ff2ec3/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/b26712160ca33da2a1e5a148f88ddb60d3084d81/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/66894611eb322bb999a67c17a9d2479b6dae47b3/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/ba38787ec3f67e0b75e940c5a24224aa74a2ca2d/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/2254755b724d7b444cd7b45b951eeec53173da9a/
        i686 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/4535b054e954101072defb9716be0cd349a9f766/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/e431004947cf039dda1d0199cd6375adb074fabc/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/b92510c087d90fc5ab9d1ae1dd5b0cc08d98eef2/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/28277e01e2d30af6ef8e222b8cc776eaef27d874/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/89144e9cd6bd066d8deb8019f83779dc54d165e4/


-- 
http://autobuild.buildroot.net
