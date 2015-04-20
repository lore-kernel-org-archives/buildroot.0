From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-19
Message-ID: <20150420063017.46C701016BE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-19
===============================

        success : 189
       failures : 44 
       timeouts : 2  
          TOTAL : 235

Classification of failures by reason
====================================

                  dhcpcd-6.7.1 | 4 
libubox-5a0bbefc8fa44044625... | 3 
                ipmiutil-2.9.5 | 2 
                host-gdb-7.8.2 | 2 
                  snmppp-3.3.4 | 2 
                numactl-2.0.10 | 2 
               ipmitool-1.8.14 | 2 
                libtirpc-0.2.4 | 2 
                     vlc-2.2.0 | 2 
            python-pyqt-4.11.3 | 2 
               libecore-1.7.10 | 2 
                   bdwgc-7.4.2 | 1 
                 cdrkit-1.1.11 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                  boost-1.57.0 | 1 
                host-ola-0.9.4 | 1 
janus-gateway-c632c1e9da5ff... | 1 
               qt5webkit-5.4.1 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
        gst1-plugins-bad-1.4.5 | 1 
          sane-backends-1.0.22 | 1 
make: *** wait: No child pr... | 1 
                 python3-3.4.2 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                 lcdproc-0.5.7 | 1 
                    wine-1.6.2 | 1 
                     gdb-7.8.2 | 1 
                    qpdf-5.1.2 | 1 
                host-tcl-8.6.3 | 1 
           libmemcached-1.0.18 | 1 
                      qt-4.8.6 | 1 
                     mc-4.8.14 | 1 

Detail of failures
===================

         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/49694fef5ed7c3206af43879632f1f99d87de5a7/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/5459f153757a22b8ab2d5f325c7db7a804f33036/
         sh4 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/7d3880ef0b09c4c2c84a2c677e02ab27bedaa7d4/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/1ed27e24b768a9cd6632d6473f66104367d9552a/
         arm |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/69a7b30166003cf7ce3984f31c3a420b92c837c3/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/e9c3137ed39dfe4dd7d94f1412059d6469eda58f/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/e0093101ae636a693744c040710e68a90d1e6aa1/
       nios2 | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/1b111329bc51738e8513492d2912f546b5a3cb47/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/3c11c7b3cfe0dfe9b9ee6e2ebaf0722350cf447e/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/55ee89ef65a84512bbe14b7d1358988ba3b674bc/
    mips64el |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/790c272735dc224215af29cc7bba99bfdfc51dca/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/6e4686a9952e175501989cb764228ab6a50d96dc/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/36b5763ce35cb81c7176987c65244a1f7fc53cf8/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/edaa98dac145713d814480630d2c6d20dfa0850b/
      x86_64 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/2e16cd6e1a6262c77d4e822d77c9580d9b904232/
     powerpc |                 host-tcl-8.6.3 | TIM | http://autobuild.buildroot.net/results/3d7939e7d0128050928d7efdb1cedcdb9fda4ff0/
         arc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/e76781f5c1f67a7dfa4d4838ba82644345fafb56/
         arc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/edca5305637061bb359497e116c5e6aca3b4c637/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/0b18feaee7ecb944a39c67a18ae11b681b4e0dac/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/7ecd9471d148878c49bfe661f03fcd2b7d885b3e/
         arc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/776dc328bb75501f467eb9abfaf41eac1d61c158/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/4eeb1c5032a4a6894fd899b1b92091fbaa51c29c/
     powerpc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/403f22e62a0055a07c2c8bd9ceade7b056316362/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/78555e81767267be8df936bc8b49439ec27fa2d1/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8b16542dfdb6ae3a5a41a4290721048650ea1983/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/fdf19bbe99818441be43f5b48a116037195df38a/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/19e2a5deeb056a57df41e6eb3cea2c0517bf0497/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/5e6269945efaf3d1a545f236bdf473b5002b696d/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/88af12b0ff92eb0c1c6231d1794a43e0703cb763/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/14f5e627bcb63bdc4649502483011408505152d4/
     powerpc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/67b8a28718980fe42b6af8723afa856142f8ee40/
     powerpc |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/1bad539b0eb7550d2e36d0ce50c06674b026342d/
        i686 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/df5ca75018e1f43e39d6541250beccf15c3335a7/
    mips64el |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/d29c1a55ced1e1137dba5224fe8710158a4a9aa1/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/e2ab7e2e61aaa5758a3a572ae25a047e802fdcc0/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/96a3f53bb7feccc9b20ad4357c3e1bbe36b4f7de/
     powerpc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/05bc1a914a93058bb1a699958c2d842dd40210f2/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/9d5347e1f4b534c8f616a93dfb87e603b327b320/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/cb907189e4440171a73f23115efd4814b7f01981/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/d4e21868e52f77484bfd51b0103fd5ce67623c39/
        i486 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/b77e9b73c6bc3ac81c97dd3c7359a1018dbabd0f/
      mipsel |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/ff2e841c79c7e452a01b2fc9abf682ed2544a96b/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/4acd0764a6a87f88e94345d77aaa7dfb480ec600/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/6a2a05ad7bf531fc9fb9fb04a2a06a60a0e88e85/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/be7c64fd327b3e91d42bc0fe35c9d29c9bdbf8d2/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/b80221e6ee7212aeb051323325c1bb4a5c6b0464/


-- 
http://autobuild.buildroot.net
