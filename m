From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Jun 2016 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-31
Message-ID: <20160601063019.7BE30101D66@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-31
===============================

        success : 160
       failures : 18 
       timeouts : 0  
          TOTAL : 178

Classification of failures by reason
====================================

host-gdb-6be65fb56ea6694a92... | 3 
                 jack2-v1.9.10 | 2 
vpnc-70f1211f6f26e87e374d66... | 2 
                 mesa3d-11.2.2 | 2 
         qt5imageformats-5.6.0 | 1 
                    mpv-0.17.0 | 1 
                  qemu-2.5.1.1 | 1 
    xserver_xorg-server-1.18.3 | 1 
            host-python3-3.4.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
                   erlang-18.3 | 1 
                  squid-3.5.19 | 1 
                  connman-1.32 | 1 

Detail of failures
===================

      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/709dd72c00280c9af23814bef66c2ceafdfd816b/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/9d2b6e192a057d4f3b163a11de03febf97754e08/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/193bf5d4cbb6c81432f3228be630d76a57c34589/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/48ca66a258eff26ebe990ac1209bf886a72ea089/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/0df83e927d2f1f0a5dbf167b60a14b582e3ccbbf/
        sh4a |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/a8e20a7d60c99615a55bd9b930d60fe5d900bba0/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0e722479a8fa571cb9a370918201c234f8de6be0/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/c05e4a5280f34b2a1dff8a10adfd46f53344e13a/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/8212b9ca27ccd88004135feb2a96130d5906fc92/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/6b29d2dc46a60d7b6aa442d2b2bad2795368bc81/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/9e6128f7d12ed665cb012091c5a8456fe1828e09/
         arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/891fefe8e790f53d3a63e473b58e1ac5d7494bbb/
     aarch64 |          qt5imageformats-5.6.0 | NOK | http://autobuild.buildroot.net/results/17130e5d93f7bde0760126d8af2e45e6cf20792f/
      xtensa |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/380b23c0feee1bf5410486c5e56e8718bb92318a/
      mipsel |                   squid-3.5.19 | NOK | http://autobuild.buildroot.net/results/a401877a2020d4d71ceac0aa422c13fb2010f41c/
         arm | vpnc-70f1211f6f26e87e374d66... | NOK | http://autobuild.buildroot.net/results/8423d58a2c5f6914c746d63f4519711877d21ee8/
         arm | vpnc-70f1211f6f26e87e374d66... | NOK | http://autobuild.buildroot.net/results/449f88478819d7c26d60f5a549f7954d3f5ef593/
        i686 |     xserver_xorg-server-1.18.3 | NOK | http://autobuild.buildroot.net/results/3bbac01626c915d2dcf3b15f330297fa1deec1e4/


-- 
http://autobuild.buildroot.net
