From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-23
Message-ID: <20160324073023.72348103E41@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-23
===============================

        success : 206
       failures : 190
       timeouts : 2  
          TOTAL : 398

Classification of failures by reason
====================================

                     tcl-8.6.5 | 24
              gnuradio-3.7.9.1 | 19
                moarvm-2016.01 | 18
           libimxvpuapi-0.10.1 | 14
                libldns-1.6.17 | 9 
               linknx-0.0.1.32 | 7 
                  connman-1.31 | 6 
             coxpcall-1.15.0-1 | 6 
                blktrace-1.1.0 | 5 
  getent-buildroot-2016.05-git | 4 
                cgilua-5.1.4-2 | 4 
      ca-certificates-20160104 | 4 
              gst1-libav-1.6.3 | 3 
                  boost-1.60.0 | 3 
          libwebsockets-v1.7.3 | 3 
                grantlee-0.5.1 | 2 
gmrender-resurrect-aa3d02cf... | 2 
                collectd-5.5.1 | 2 
                 copas-2.0.1-1 | 2 
            webkitgtk24-2.4.10 | 2 
                  cairo-1.14.6 | 2 
               iptraf-ng-1.1.4 | 2 
                  ffmpeg-2.8.6 | 2 
                 qt5base-5.6.0 | 2 
                   systemd-229 | 2 
                  dado-1.6.0-1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                    cups-2.1.2 | 1 
                    yajl-2.1.0 | 1 
                 igmpproxy-0.1 | 1 
       openpgm-release-5-2-122 | 1 
                      qt-4.8.7 | 1 
                   nginx-1.8.1 | 1 
        lttng-babeltrace-1.2.4 | 1 
                   erlang-18.3 | 1 
 make[1]: *** [all] Terminated | 1 
           lksctp-tools-1.0.16 | 1 
                 libgee-0.18.0 | 1 
       gadgetfs-test-undefined | 1 
                pinentry-0.9.4 | 1 
               libsodium-1.0.8 | 1 
                 jack2-v1.9.10 | 1 
                   open2300-12 | 1 
                     vlc-2.2.2 | 1 
                  trinity-v1.6 | 1 
             lirc-tools-0.9.3a | 1 
             ipsec-tools-0.8.2 | 1 
flann-04b4a56533faf8c8228d0... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   slang-2.3.0 | 1 
                   perl-5.22.1 | 1 
tstools-08f6be304040e7b8476... | 1 
                 opencv-2.4.10 | 1 
                   mplayer-1.2 | 1 
                    ruby-2.3.0 | 1 
                 mesa3d-11.1.2 | 1 
          chocolate-doom-2.2.1 | 1 
                 libdrm-2.4.67 | 1 
                    norm-1.5r6 | 1 
             gutenprint-5.2.11 | 1 
                sg3_utils-1.42 | 1 
                    vpnc-0.5.3 | 1 
                 mono-4.2.2.30 | 1 
                    mosh-1.2.5 | 1 
             lua-cjson-2.1.0-1 | 1 
             netbsd-queue-1.70 | 1 
iputils-3a86a2542c6fe29413c... | 1 
                  lpeg-1.0.0-1 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/615cf2e2b8d6d208f15a66cd07712353902b49ed/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/311553af6727fae7daa75603b73f3d0301737b4d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/4890b8f30274cc0e7a8ca701750bc43736700417/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/0fa88966cf2ae50bf1e839a491f04baa6581431b/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/22b70b602d9e24f82a6d30f7451745574f43999c/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dc2526c39e86491f11b8f967eacb87567b7a548c/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/caf682523402b23d01dda8e03def80aed0960eb6/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2312fd7e29191cc7f8d51a3dc6ffb99aaf17f42f/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/9ccf4c1f7f7414ebd42ab38bbbc7c273a5becbb7/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/63bf89333f63add3271c96424ca83c6abd806f92/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/fff3fb112bc623a2256a3ec87a2eda2b40308f76/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/49c284a1c124ce2344e37461b81d0b06829e2552/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/c50c4dcca92ade058a061268f5191930ff299511/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/f19f51145bc0d3f55336eb93a8494f9699c9275c/
      x86_64 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/78724636cfe0ac58b582372459142fdf68f0811e/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/292c89a10dc0debaff90359b74f941b68e6681bf/
        i686 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/5215b2d427b1a4a0e5e5ef3318f80866a573e55d/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/f96b49fd3519905d7b2c666033c9f399465fbb37/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/7ccb37b4bdf2d806b69f5bb62f4d3577efcdcd83/
microblazeel |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/911b93ee78da661da1d1c6a9dd330e50d6215db1/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/70cd9c2d5adb2fecb59c23ffa98b003dfdcd2fab/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/85ba96ab39bb835759d77f9a285a3a9263343156/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/e833643d4f28648cc4610637be6a8097fa672716/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/0b4d89fa5aa5eafb914c8eb107638602392f7b60/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/92c311ca5b7836b8d5d0e62266c228fa0644d49c/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/77f64db670ccfe074a7990436ad7f75cbd18ffac/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/1084bbe30bbb299d930f219830a4488c8a83c52c/
     powerpc |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/cbc2177ac60e3077b8488c4d525fd0f40146c9f8/
     powerpc |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/88ceba395995bd61cb8ed96b85c8cd0f03dfaea7/
         arm |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/d45ea645400e1434c335f78bf75a3c8bee249074/
     powerpc |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/56dc7c8edd66d30daf8437e598d2225dc1dc343e/
         arm |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/1e323aff21d6b2f471906e1c4e3254dbfe95b3a9/
        i686 |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/8a7d3e7455d6a775847dfcbae80d53b68003c13f/
         arm |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/e19a5917fc5a172a5cb6f8c62e33daef218a08f6/
         arm |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/2b62a3672159b479870159ad5957b8e27fcf3ff1/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/6edfcbe81e6bcf1ca75defde96e01003926dd2a8/
         arm |                   dado-1.6.0-1 | NOK | http://autobuild.buildroot.net/results/cf4fb1e4b3ae40352111a2509f5f5d3c0c63cc95/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/b20f8f60b5ddc24e581ebeb975c87bb2a5fa1a55/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/2362a6ade6d04faa5dc731ff9d00d2a107711b47/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/d5e19e2fa11a886db5e932fbc54aac1020d8b8df/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/c12d600a9184431819a81d00d8b4548125a5eadc/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/8f430682bd845745bb687a67a8338cfd0525e30e/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/76c2c23ca3d1c0d5ab767b79709b6982f14a5c8b/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/07ea28bbcbcc5368905dc8501bb30e01f979a2c6/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/132f6fb653459aa6b5ddb6cb161dea8f59e29438/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/9519c09f9ca808ef41ffe5136efd6909e080961d/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/a852de5e4bf23bf6e814c0e754522eaced94efa9/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/0065aa212d889e9668fb1c1c47faac38ff0b8a70/
     sparc64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/185be1bece0c6c565508fe58ceae25119bd7fc55/
microblazeel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/3c2c8d9d22f18aa597f9237add6077a8bc77b5e0/
        sh4a |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/5b1d43689113e9b57c9cbd29a9918a3d11e70a73/
     aarch64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/1dcecd4f0707aa0b3a6118a8f3828df3e8023123/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/dd1464eb7577a4551b284815b0989dedcc10eb00/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/27ceb96b5f16663c6a4d511fbc83a8f181daa27a/
         arc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/436c77079b0967e4bd85148a2dca77b5c906f265/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/6da342e3b4e9cf707696e08b85abdc108152e4db/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/01e01d77499bdcd45ca129979a8d8ffde1fab211/
         arc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/6d2210734f08b639419ea17400fce60907d9f21b/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/7e1fc39cbb758932c1c8071bed41541e37c29327/
         arc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/387ca6d5d84a72e402fc8babae4b356bb5988393/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/18ac6b13286b7a578f2cc5b418dd5c646b4059c6/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d4b333ad41ed4d0c7411598306261ecc1af62399/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/7731c6ea57542e0ecc620cd5878531cecb8393a7/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/2554991388d0300c15d0a9b6250113b1d434efdc/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d0455ae2616b4bfdc8c57667ecbf6d57f258d700/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/87685d627462a0454c7f040805cd396bed2b29cb/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/dabaad7c013c35b22a0e493c896f9f3a837746a4/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/3658df1f3088c28828cbc50701dd48f54ae42ade/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/c1970de10b0e523d4c5036c7a4348535c15d5e23/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/3d08bcdac8c3fc45c206079ef58d442e97bded8a/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/5434f9d5b077eb08d395288b0fc572e220699fed/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/6c2f5535c646d99985aea200c2c8266beb80fb41/
     powerpc |              gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/ae8eeddfa6b56e88ec17d7e845d7c6d2b696d8ca/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4724bfff950acec409419a0ff6bef929fb984cb8/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/a03e8c066fee0c022bca798caf475210e6167621/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/15944a2bde09fc1ee9dacf8b8212014dfbda1d32/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/6af7a1ea9026e0a5d925a4b5b0ef8d3ae0248204/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/abcfe9fcff4deadbd1a1d5a7204f80c204868e88/
         arc | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/5399aea2101c0c402d7a4669e4eb065c9eb3433c/
      mipsel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/cf983e69d9c4db058a982e7ffd2ef7a380dc8656/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/23a75a5b8d369ecceaa36665aef7a506f42aa884/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/e2c8d69c8142ce4177aec6a00cdba865fd038e8e/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/6a0c4f6f6ca263bfd26552fc22409300d6621033/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/0f63872a2bdf516d9514670ce85cff4a983d8745/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/703a24166e00d5be0c89fc2c01b10d41156d3db4/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5c9e8e3c24588de0242f436e185850515e7ab9b8/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/697f36a9f1f85d7a76b2b82c8b2e6d16464ea413/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/7a273b8518ad3ba005c079064b76ccb7bfad0feb/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/f921b4768a6c6af9eaedef58953a4e5388f7d04f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d9d4f1e2c9306c8179c525121a2f22db7e313d71/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/c394fd92828438a4849028fac07de54ee752ad00/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ceb8902f4d37b5d7be8043e5e1c1980c2bd95c59/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/3c0971e27dcc25e5681fcbfa4c32a3480c9ddaa8/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ed5fc7f9dc63f8099d5bb67bdd8cc99358e0c5ed/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d8c57e60f6e826c82e5e70de664e7b10da1c01cd/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/0e744897944a5161577b33793df1671ec54c0e6e/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/a3bec1a14a71d53f4d3b454bf2c89b21a149fce7/
        bfin |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/b88bcc38b8c31e0725771041ed28de39367e53e2/
        bfin |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/d0f17febbe29a24afe9fdc54c393e816d9c996b9/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/637a42b75115357186b90e9a49197dbf898d9b4e/
         sh4 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/31b8c2bf64340d778a3cd11719e3cefe29412d8c/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/55487fe2327132f00ce76eee6265cdf3755b6183/
    mips64el |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/20d07dead6733951bba41c683502f1d715c7c058/
         arc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/a0f7d522f4ff215b0bf79e12b204daf02b5a2659/
    mips64el |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/38622a00ba8d46cb449d43e9f8bf8b14d0b3f595/
       nios2 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/3d14ee84d369dd93fb7eb009933472bf1f809c17/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/b45ed04a5191c96030ffd4a94506de1bc08c86c0/
      x86_64 |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/c41d87c0cf22f3b88e5f80ad6bf5e81900603c1d/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/e550ebfdd1e8f459ca7b12f2708a704eaec52474/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/794f524de5e7bcbeaf7c1f1f0086a984aeb60932/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/18c760355268e6afd26edc7949388e0050e241e0/
        mips |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/adf6e6dea64ef72d5b275a80faa77d2af343b941/
        sh4a |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f987093f8b251b627fd4156e035aa2c8092ca103/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/021367705a2f8521c310d8031b567f77dd9c9f53/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d3c2e2337f9073e571a4a7e1948e85d08ed2b818/
         arc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/a9507d2ee91d32c3f92cadebc5847e9876a01827/
       sparc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/b7a308d2db9e872c372ba78e527030ed6848b9ed/
        mips |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/85ce06a7a920b79b1be0dd8884dc6bfdcc446085/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/47bc6759147b8f2159fc53f673051b9a9d4cd733/
      x86_64 |                   lpeg-1.0.0-1 | NOK | http://autobuild.buildroot.net/results/db094dc87cd3d1551bacf873680d4188fa3729c9/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/3e32681c97efda94e0698f7430034944c3bc1f59/
         arm |              lua-cjson-2.1.0-1 | NOK | http://autobuild.buildroot.net/results/8d2f80df0451cf6e66de7e0832989a89962e1ed1/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/3654498b428c382b2a3cb564d457a999b313ed83/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/d26683e451a8353947246cd3efaf9f27de43c923/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/048f79f5471722554f7ef6b8a64348a8a2ca26bb/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/cf6ba3021022092ab04d593ffaa02e3cf21a2684/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/c76ec4f118979ce7071210966794e5004edb1c97/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/c952fb2a99853ad44d7fed5605e98a8288d22366/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/9907f24a8d0a45d2d412f667fbc46bd9ecfe7b13/
     aarch64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/535c73da47167bc86b7378b224e169093d6c65d4/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/19d087b5e98018757f2004e08cca70937274ce57/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/941a264ff66b38990be430388905538fceff6693/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/94108f869444fa68e07cfbd3e85089fcebda1a53/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/cce10fa00e7faec81e895dba0fd56ae2e8b1bdd0/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/e8abcbb1f80311de672122d91f1fccea6b3e142d/
     aarch64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/cbe7519150742640bf42e09fca1fccbf58a5a3d8/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/b7928eb6c40c3c1c0a36dc093cc7e74e33e721b8/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/6d2803ef0ee6f75ca31422090959814da78c439a/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/8d10d3a686eb824c5b5c0ffad1897d6b70d7cc4a/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/05488a06578e7bcac5fd1ef56d0f7bca0de67188/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/7c9c22b599801cf32f1e808f2b4bb422d6d59c1f/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/f679ba41c79b532fd92432822e447bfd98289733/
         arm |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/c5ffc11eb8f522ef3cd91020e874337eb7188747/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/439e12e6c125548ba2ed7f981a96c2bb8f07cf0a/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/15ae1c15dfa4bb57b4c05086683b622c27812ed3/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/d0c2e5bc3fb6d6a1ec2e02b8276f2a5a5e534601/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/0aff9821030dd22169aa94c2aa3f3f9f93dbb02f/
        sh4a |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/a353e0fbdf2a4bdafc0878e83034d285941b3463/
      x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/ccc846501facdcdbafdbf4b26f36190e9861b258/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/17063b3e63e273be91bea611b05ab7caa4a71084/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/8e8fd1e19cdb3b4de88f52bab6a2b97e0c92d8e8/
         arm |                    perl-5.22.1 | NOK | http://autobuild.buildroot.net/results/cbd6e5cf316339841b7c012f7ceb7de570c2414b/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/91d2c72fbbf134519a397dafad81051ecdf00482/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6340f136a10e10e50067a584af89e37e3a66aa47/
         arm |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/8958cfb71efdd3ce32b2145237e865ca8a6a6a7f/
       nios2 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/cc8b6f3713bd1140a4e8fef378525df1f1c88130/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/3190129f7fa8410f55b7533c90212b4c21040b59/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/0622c64af428986dcb585b3a49916140b7ae94a0/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/bc83fe70a0559de5e298b329124a8a272db0d164/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/240c3aa2bb53de8057e6d8da1ad85a01b5def02a/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/9a005d336aec847b65f867c68a2e113af3359887/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/1033164282789b259b570ace6ae4d3675262ec6d/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/633a86e6b50924ef3fb0c03a8bc3ae7bea107a45/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a0e199d0536a72decf703c2b6e5874244d85c8bb/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/b49786d63f17780e11be8b02b02473c8b7575dae/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/81d937655e1d4173aa9ac1fe001cd4f1c1e74e2e/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c5548f18bd22b39d551ec4ed875c3066c4b0dd7b/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/818c38693042af61e546da5197e1689e0668e501/
        sh4a |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/dfc307727b472b7f39c76b9087260db1b9a84aa0/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f5a06823556bbb60412ce5f8468f191bf807c053/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ff055f96f2ef27efd708933577a26778840c88c6/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/571595cd4ab993923f6a347fb3d874221c044f11/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/0c502fe40993676ea011948e494c48e0435c9f3c/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/1870d44aeb55d1c09278370906b4b32e713d985d/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/477c04dddbbdf7ee961dfba2ae52bfb74d571865/
        mips |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/1040d6f0b5c96fde9a893df30bd7c7f8c0e1fbf9/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/75bbc0a4f525f5ed76f821457b5fc66ac6fad98d/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/be41bfa63b340ceba956db9633f5a4553cb21244/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/1862aed1a2f7dd79409a687f24b2e8c3e3021af4/
        mips |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c62541b46065b1d64a93bc16e832256d9ebe229f/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6ece61515ab209b2fc0d6766713f0df60808966c/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/df5b990ec52bdf7fb9cfbba3a5cce8e040fbc77c/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/870ee2dcf8b2251cc512a27613089e8c5ea6f470/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/21fc9764347b1875617bb9e43351870798b942cb/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/21df2534d93b8a1340088eca0439b4c473414b5f/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/0ffacc848f1a41fd381438db50d6497885f2f16f/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/4f5c05a77a53fed2ac326a6b890325021c93ec4e/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/c3c6f8d7090b496c098c5f4a481d95781cac0844/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/3d800a44a6a98206f717ab3064f6e5ee3bf934ef/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/a172b5eabca17ab0601d8dff93d6cde3dad561f4/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/2d490f2e20835707ee9d1a27104d35a3ec583c6f/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/e3cb0e3c30021f4924ffdc9af96f4af83506b779/


-- 
http://autobuild.buildroot.net
