From: Heiko Zuerker <heiko@zuerker.org>
Date: Wed, 08 Dec 2010 09:12:33 -0600
Subject: [Buildroot] Fwd: iproute2 failing for x86_64 with ext. toolchain
Message-ID: <20101208091233.280422fcptu80pdw@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(seems like this email never made it to the list, trying again....)

Hey,

the iproute2 compile fails with:
-------------------
/data/devil-linux/../x-tools/x86_64-unknown-linux-gnu/bin/x86_64-unknown-linux-gnu-gcc --sysroot=/data/devil-linux/output/staging -Wl,-export-dynamic  ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o rtm_map.o iptunnel.o ip6tunnel.o tunnel.o ipneigh.o ipntable.o iplink.o ipmaddr.o ipmonitor.o ipmroute.o ipprefix.o iptuntap.o ipxfrm.o xfrm_state.o xfrm_policy.o xfrm_monitor.o iplink_vlan.o link_veth.o link_gre.o iplink_can.o iplink_macvlan.o ../lib/libnetlink.a ../lib/libutil.a  -lresolv -L../lib -lnetlink -lutil -ldl -o  
ip
../lib/libnetlink.a: could not read symbols: Archive has no index; run  
ranlib to add one
collect2: ld returned 1 exit status
------------------------

Any ideas? Suggestions?

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
