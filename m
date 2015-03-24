From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Mar 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-23
Message-ID: <20150324073019.F0CA51012D0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-23
===============================

        success : 199
       failures : 95 
       timeouts : 1  
          TOTAL : 295

Classification of failures by reason
====================================

                  powertop-2.7 | 31
freerdp-b21ff842ef3de583751... | 10
                  dhcpcd-6.7.1 | 6 
                  boost-1.57.0 | 5 
                 jsoncpp-1.6.0 | 4 
                elfutils-0.161 | 4 
              postgresql-9.4.1 | 3 
                host-ola-0.9.4 | 2 
                collectd-5.4.2 | 2 
                host-gdb-7.7.1 | 2 
                     vlc-2.1.6 | 2 
                 civetweb-v1.5 | 2 
                 openocd-0.8.0 | 2 
                   bdwgc-7.4.2 | 1 
               libsigsegv-2.10 | 1 
                libtirpc-0.2.4 | 1 
                aiccu-20070115 | 1 
                  weston-1.7.0 | 1 
         lua-periphery-1.0.4-1 | 1 
                libevas-1.7.10 | 1 
                 libxml2-2.9.2 | 1 
                numactl-2.0.10 | 1 
                 empty-0.6.19b | 1 
               host-qemu-2.1.2 | 1 
                   evtest-1.32 | 1 
                     at-3.1.13 | 1 
                libupnpp-0.8.6 | 1 
            host-omniorb-4.2.0 | 1 
                    pppd-2.4.7 | 1 
                   strace-4.10 | 1 
                 apache-2.4.12 | 1 
                 cdrkit-1.1.11 | 1 
                 rsyslog-8.8.0 | 1 
                   systemd-219 | 1 

Detail of failures
===================

         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/8c666ef11310868097601b6de1dd25779729b878/
       nios2 |                  apache-2.4.12 | NOK | http://autobuild.buildroot.net/results/d8cf103033c63e79ed2db0b600f120f6fcb5b5e9/
         arm |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/fc8248736b4338ab88f11397e3857d0c6c098765/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/716cff673c93c9d0c73c92c166a5177f999aa655/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/4560a6179ce6ff69fe8f8c82b80c5b1b54a43779/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/42676b3b8fbd56d91d77dd34041d7c523f469ef0/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b9df825d3a221387b8dcdce52911e9f5a2f68496/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/cdaa2b87f7cda29fdc6dc82d2bbe891d4a408752/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/d79b08e1bb352ee2e0f505ef42d3104ededb64ae/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/4c2606ac98b559fdd5e823ae9f999923cdbee152/
         arc |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/4cb56182abfd77deb20bf5b5fd9f5a767bad3ae4/
         arc |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/1d52d24c7c0cefb61490153c5df265f75f803990/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/6ccb75e71dca50c0782f88a8da81b751611e9b15/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/88dfe2ed8e068cdb4f4bc6dfeb691b315809eec8/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/62533987043b79c52109472b4c760de627dea4c0/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/e73464e567323d669259826db48b9f373863c723/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/e99f12275976adf84a6d04f87c8f165a74975cf8/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/944d03a32b675888cbd01d30e5656d8200fd08aa/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/f3e475a243b4edb14a7ddd0c0463277a02911a7a/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/facf745d6a56237234a30d954484bdf0d0636556/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/809f8517e8dfb6e082a2351dffab6c7513f7bf03/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/25584bd71def94707cc418093fe82100124366ba/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/78ccb71b6cf72b7969131b1cd197b1289a38e925/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/e2aeaaa349e5b3bd599225b6c3312f5b2534a3d5/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/ccfec7ca1a75d3342b575518385bfba7131e256a/
         arc |                    evtest-1.32 | NOK | http://autobuild.buildroot.net/results/b2832f74c4789a74b171efaa8eb786988c9a047f/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/8f2229987cdf3fc16c25c3231410d477e3fddb72/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/937d386f876f4daace62076b96dbc9c72aef500c/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/2fe19d4438275335afad1c82388bb499a3ddb636/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/aeaa11cb6a084f56b1ab567b67e8d6702076c85d/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/599dc646cf2d24c24c9a799f4710071a8df24e38/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/7597818492b752bf5a2e49735c2c98f9bf00c863/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/0f394fdfbc9df430f2bffb477efc4444e5bc9db0/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/9608b99297306f95b141600d1112134e654a8e23/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/805af1d8c02fff555b9301c7276b635b76d7b292/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/e75e26b7614f2793ea49071548d79a667413f913/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/a71d2a85d3c29685bcb744bf234fb5739db757a1/
      xtensa |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/b0bf3ea08112bf799d20543447ffee5545967e06/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/f2116b719f48715c2d8c3dd2226eea70e05c5d48/
      mipsel |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/ecc371a8672c20ee4b15eead876ff439a97ce84c/
        i686 |             host-omniorb-4.2.0 | TIM | http://autobuild.buildroot.net/results/b555d08b12d705744e540bb40fe8f1d09422e906/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/eb217ce3ba48aea7527b7573483a5f25929c9d5b/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/71ef5f9d28817a126ffaa91408a33c204fffc875/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/2ef4bc6621e84099fd622e129871efde916e264c/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/3684ef2400a25fb7898b48726ac8d98c17ed7094/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/1b20a2f81dd2b409785930705222bc03576c4907/
     powerpc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/e7e361aeefd6f0bd80661c71109d3f6f30cd795b/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/96ab50aa7df2edf45a5cb4f2560516b80c528903/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/512dd9f23de32f88f93730ef93f703b09ecace22/
         arc |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/ccc52f43d48802006efe0d1a8d02fc990e28eaf6/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/8720d7841c1e4c68bd6078735dd857f956c6fe38/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/1397139f0408917f66b29cd3bb7ad34e907c321d/
     powerpc |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/cda111081c6e2f5f7c6e7afb8c713a5b6479389a/
         arm |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/f06ed6df6138ab399036c397c3f72d33d64fe0a3/
         arm |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/7f56ec04b2d6a0d16e5f22287ac3650f99d8806a/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/c6766da9396af968c8accc261396f1ab60c9ea69/
     powerpc |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/a49be5d4effb42212b433b63032a3f9d403efa0e/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/4004800a37fc684df906b0249759168b882526f3/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/c8c7880cd5c272fa0f87478a9140bdcba69644d1/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/2cb89c091b31b220886b5567e1b8208284864350/
       nios2 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7ba83b2008781603b6e6e4bfb01014cff25711f7/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e6b41cf6ae2869455fc473e3bf0808d350206327/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a52f95ffe452962931bf6fe8f5b6b049fb5bac83/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7baf0359b17341597dd5edaecb5d06390999a533/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/d27e371908d405272575faf81fb771a5f03373b7/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/737f69cd72f2a49806b40acd6b8ba02d9aa34e4c/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/40130aa60fb2c16213b3b527e7a43aa21a0be4ea/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/e2ff57fab4d809b82d3c480eb206ac0e499317cc/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/dc3a6fb39bcb1a025caecd26652aeb00549e40cb/
        mips |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6578e7e84542512a369f1b8c239a3bae8ab2e341/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/cf16399f64f4d4bf8e945a59deef48b175f614e8/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4cbcfc6c63f0536e2735081ccd98dd4d0e1f896a/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6beae6f6e81689d5ea41af600372092edc35c13c/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7bb801f6d77b8a438237491ecf2f1408e1b76631/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/22e3d24b14c4aa6613482dab3c002aaeb835053a/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/bee45c79f08d9bb36c2ee594849c1cfa367b6d6c/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/ebf7be4ee6361cc534112f205917c1c6bf1aad9c/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/148f9557b76a25f03aecd956a34c0a32daf2565d/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/237ee7202a00e044dee084fcb02867745da500cd/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/cb30ebb39de9fea2088efe524eb4ca313d904fd8/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/c16abcb0b2b361360ad862f8ba3895535f2acec3/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/11bfd96a435ebbe9f16d06e07b52995397cc51a8/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/979d5011488f3f728ed4cd1c4b24898804871361/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/ddee057472b0b22e50679f36a38bf4513346f02b/
        i486 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/05c0191ad2d9376f8d728607b73dca5ebb91030b/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/cbb916e78e6f6e0f0aa64e444e254fd6045d558f/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a503cf77638611bf143b158687b8b18574a5744f/
        sh4a |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/135af8cb27b9de701659689c40eba113f507c621/
      xtensa |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/820dca3f1d38a4460e5fe4c548adfd8c6b05e8ef/
         arc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/d5f15a9af816470d3c90a501c378ce6b886a17fd/
     powerpc |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/456e75367b3a8e2eb9ad82478f3522e89f658912/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/362eb1074c53ffcab576a82af3114e9801aca56f/
        i686 |                    systemd-219 | NOK | http://autobuild.buildroot.net/results/083f9579893185d93c591d171b39d8e068b21412/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/d00d8a0cb9c9f22d9d039e5e3052ecb84126b7e0/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/e142aa35cbb9649c5d14e0292bf22cd067abed9c/
        sh4a |                   weston-1.7.0 | NOK | http://autobuild.buildroot.net/results/5d90d87b37074e86657a8d0a2abfca09bdbc3b8b/


-- 
http://autobuild.buildroot.net
