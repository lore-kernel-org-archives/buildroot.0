From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Jun 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-21
Message-ID: <20150622063018.5D4D8100F40@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-21
===============================

        success : 201
       failures : 42 
       timeouts : 0  
          TOTAL : 243

Classification of failures by reason
====================================

                pinentry-0.9.4 | 8 
make: *** [openvmtools-lega... | 4 
            python-tornado-4.2 | 4 
                libtirpc-0.3.1 | 4 
              wireshark-1.12.6 | 2 
               libsigsegv-2.10 | 2 
                   glog-v0.3.4 | 2 
               upmpdcli-0.11.0 | 2 
pulseview-198f9bc74d6c955a7... | 1 
                collectd-5.4.2 | 1 
                 empty-0.6.19b | 1 
           libvncserver-0.9.10 | 1 
                  dnsmasq-2.73 | 1 
  toolchain-external-undefined | 1 
                  snmppp-3.3.5 | 1 
                    php-5.6.10 | 1 
                   hdparm-9.48 | 1 
                    gpm-1.20.7 | 1 
                sysstat-11.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                oprofile-1.0.0 | 1 
                minidlna-1.1.4 | 1 

Detail of failures
===================

         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/eced932f2dc96f4a3e83ed976d42299cc9408d5f/
         sh4 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/19c6e28d778446ccb3d6581eb4ddde6707232c44/
         arm |                   dnsmasq-2.73 | NOK | http://autobuild.buildroot.net/results/afc03c535caddf262cb082d4dfa8f5f03bd4797f/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/4fca48cc194160ff20f28b6b0471ca047119965b/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/d1f9cc8399acf0cf58a272f94e09889a78578ea2/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/ba43ddcb1c287a99f9a162b87a914bec6345ed14/
      xtensa |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/795dd3f153e109ac805633a3d88096882acf5a37/
         arm |                    hdparm-9.48 | NOK | http://autobuild.buildroot.net/results/c349cd0775923d699225367c4f8907d48d012d5b/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/831c36b455ff6b463520fc4ce8d89a45a76b8a44/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/c4218e24b3ad2c441066ddae15001df52bbddcc3/
     powerpc |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/89e1e51bcfd7d08f39ae48fd4d1d333f3a185f55/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/4335671392eacfc2770edec2aece68e7163a7078/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/ceb89adea831e7c419b74627ec4da2e7c0299bef/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/6c8bbcdd655464ef449de01a82e63c0882269d19/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/739b4f446c56018496d3b91104352e4971d5c569/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/8363943cc9c967713f585209408ea087a052a12d/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/d130f140db6c61db586d61645372668bd587be6e/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/ee581e1d525a7b6646cd3018581b339aa1c38063/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/16a740d4bc80c8507f137e2449abdc13e24abec3/
      xtensa |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/160d3f627128ea1cbea54c3b15c723cf7b58aa15/
         sh4 |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/73f34ab59d54ded68ff60608a0212a6e5a5190e5/
         arm |                     php-5.6.10 | NOK | http://autobuild.buildroot.net/results/24644ced2d247d49240a1f3b20b12f036606e087/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/0d78a2ff8c952cd104794f5049b07216978fdf11/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/af8f7f588dfa64d82c98a4b42ec78fd17dde137c/
        i686 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/a58b06f5c2067d8a826271b9aa9febecd1b76216/
         arc |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/be6d5a27402cb89f638deee2069113e4a4fe6497/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/5db2320891613656978b3efcba83269b0e15ea34/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/836962f23dcad77b145fcdfeffb40e38e64d6971/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/6874c7a9cc72a2528421342ef75c4e6dc2968998/
         sh4 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/28d4e60bf539767a41e5cd2f0d2450153d042ad0/
        i686 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/195165106487df0df0fe8593ce93ce7525f4abe6/
        i686 |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/47af4e6dc46d46f4bfe906e306471d459bfe5c91/
        sh4a |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/e9ce497094daca82f658178495ca3515b38ebcbb/
    mips64el |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/aeaedfd9d9062140e897bfe80474e0a796e32af5/
        i686 |             python-tornado-4.2 | NOK | http://autobuild.buildroot.net/results/144be9873ae3dcb512637da16aca76085818022f/
     powerpc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/6d0189021cbe47a672017f6eb460942e8f739aed/
      mipsel |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/818c08decf4a6190a9ed39915eae4cd3d2779880/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d63cbba005b1dc884fbe820a063fbc7af04f600d/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/36e5297823d2ca898ce92e34dd3f80d8d9bc3112/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/2601f83ac5ec4475b5f2a21b042630116ff07d60/
    mips64el |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/10dcb53bda41482448753d76b327c94987ad176d/
         arm |               wireshark-1.12.6 | NOK | http://autobuild.buildroot.net/results/e279af201726df43696bd395b7ce1d3e52500492/


-- 
http://autobuild.buildroot.net
