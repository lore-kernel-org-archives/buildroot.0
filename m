From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 08:28:47 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-13
Message-ID: <20170314072847.E5C8A2081C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-13
================================

      successes : 149
       failures : 18 
       timeouts : 0  
          TOTAL : 167

Classification of failures by reason
====================================

               libscrypt-v1.21 | 6 
             gst1-vaapi-1.10.3 | 2 
                    gdb-7.11.1 | 1 
              keepalived-1.3.2 | 1 
                libepoxy-1.4.1 | 1 
             lttng-tools-2.9.3 | 1 
                    qemu-2.8.0 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.6.2 | 1 
                    sdl2-2.0.5 | 1 
vpnc-b1243d29e0c00312ead038... | 1 
    xserver_xorg-server-1.19.2 | 1 


Detail of failures
===================

         arm |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/8a10e5a4818c2489ec5d666857900f1713df6a23
     powerpc |              gst1-vaapi-1.10.3 | NOK | http://autobuild.buildroot.net/results/653d9b056b04e589b8f5c57111635b0b3d7c8949
    mips64el |              gst1-vaapi-1.10.3 | NOK | http://autobuild.buildroot.net/results/6ca2495a841f02aca6161c0ec52cf82b0b8af47f
        i586 |               keepalived-1.3.2 | NOK | http://autobuild.buildroot.net/results/5038874be985ad2b6588150071ced0d6589af601
         arm |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/d950bddc9f3990d0df13f5f94c2087b8d16dd222
microblazeel |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/d95abde3e3efa61b28f57fcc42f3153705478e18
      x86_64 |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/c0a1f746bcd4479cb50434dd978afd4b6952d4e2
      x86_64 |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/b256d003d841e492da073788198203e7cbc834cf
        mips |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/967ad7fae0137f64b165c986c251d143ac825147
microblazeel |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/42e004547492af9a735c408a94ca53a55ed4ffa9
         arc |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/0e1822f9de4503c87317df4aa2467c2e2477885b
        i686 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/0440657aa262b9353165298bd7f4a51e019bd026
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/142fb912d5d5af8b0683c77718b15da6bfbca85e
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2a858ee702c6688a426c79e80374556967440e25
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/fd8c2d23872fa307250db55e50b9a02254397322
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/5e2a20c17e90b9286c57f3406aed928851f366ce
         arm | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/998373d154be1f8b311d6114d8e72f92e244a133
        i686 |     xserver_xorg-server-1.19.2 | NOK | http://autobuild.buildroot.net/results/182fb6c1bb40f693a4a881aad86400945a831bb6

-- 
http://autobuild.buildroot.net
