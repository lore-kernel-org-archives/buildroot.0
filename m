From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2016 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-29
Message-ID: <20160530063019.306A6102A2C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-29
===============================

        success : 187
       failures : 26 
       timeouts : 1  
          TOTAL : 214

Classification of failures by reason
====================================

                 mesa3d-11.2.2 | 2 
                    mpv-0.17.0 | 2 
      kismet-Kismet-2014-02-R1 | 2 
             qt5location-5.6.0 | 2 
                wayland-1.10.0 | 2 
                    cups-2.1.2 | 2 
                   erlang-18.3 | 1 
                     rpm-5.2.0 | 1 
                     nut-2.7.2 | 1 
                moarvm-2016.04 | 1 
                   lite-0.8.10 | 1 
     host-xproto_kbproto-1.0.7 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
               netplug-1.2.9.2 | 1 
                flannel-v0.5.5 | 1 
                 jack2-v1.9.10 | 1 
        lttng-babeltrace-1.2.4 | 1 
                  connman-1.32 | 1 
vpnc-70f1211f6f26e87e374d66... | 1 
             netbsd-queue-1.70 | 1 
                   systemd-229 | 1 

Detail of failures
===================

      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/fe6a2f562b83c2d7c45e1bbf61c8bf9d88418920/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/70d147fcac588610521974b8f7384e710a9a6d41/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a2e871403f02479f5c701849a3664fb11ba8b219/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/1c6423a47d282894a1c41a669aee215dfb916f4e/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/9b930b87cb244cd1a73c4347cbd1b927dc36676a/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/5ee0fabac9698a68abd1e3ba328feab464f362d8/
         arm |      host-xproto_kbproto-1.0.7 | TIM | http://autobuild.buildroot.net/results/8ce3f72dd896e5d0531e0b6504e8fe266ee96fdb/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/73a53d5313f280294fbba09c324ec4396582ceb3/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/9713f1923a0bb2309d113e6db9dd9048a2a4bbd4/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/02db363fe069f0a7882960faa69ce79882410a7f/
      mipsel |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/433e666bc7b0b605142dd03c096ee30bcfa014ff/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/e747262b81d6e251f9e829071ebacb79e66838b2/
        mips |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/c70ee8bd0269f6edf5585ca3222c44260de1b524/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/516507ae4fa189091ac1310139a4f622e17b67ef/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/54f927539abf5117d12ea338cc5d572eae7653c6/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/8e99161e4d3d70d91a96d1fe8237010e2006211b/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/ed85ddf91110d4003626292915da4e8c7a1ba2fd/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/a97715a6785b03e57514369b025db4899d0c7c24/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/02c967a211cfb43dcb5119ea57a0cdef96e5880b/
       nios2 |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/d723002d0206643350a881d5f7ea9624eeba0277/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/ad412c321f29dfb0765313701e3156f11f75d7ae/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/98c8c9c60b9e59eacca81d3955302f1b52a051cc/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/e4b7705e3e148755ae34d498c860a3b9b915e0b0/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/26d29ceeb1745f28711f50305891b6bbd1f8441c/
         arm | vpnc-70f1211f6f26e87e374d66... | NOK | http://autobuild.buildroot.net/results/68e5475899351c3e33e13e156e8daa238486ee73/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/4ecb1a6b10b71b3d1c3e129bad3fedc9ba8ac41e/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/c4f07f40ab8aaeb9c38b9606fde38de7e232f6ad/


-- 
http://autobuild.buildroot.net
