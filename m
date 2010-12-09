From: Heiko Zuerker <heiko@zuerker.org>
Date: Thu, 09 Dec 2010 10:55:59 -0600
Subject: [Buildroot] iproute2 failing for x86_64 with ext. toolchain
In-Reply-To: <4D00DFEE.7090103@zacarias.com.ar>
References: <20101207162124.20071ez7m458t3lw@www.home.zuerker.org>
	<4D00DFEE.7090103@zacarias.com.ar>
Message-ID: <20101209105559.10305jzi16ub75cs@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Gustavo Zacarias <gustavo@zacarias.com.ar>:

> On 12/07/10 19:21, Heiko Zuerker wrote:
>
>> Hey,
>>
>> the iproute2 compile fails with:
>> -------------------
>> /data/devil-linux/../x-tools/x86_64-unknown-linux-gnu/bin/x86_64-unknown-linux-gnu-gcc
>> --sysroot=/data/devil-linux/output/staging -Wl,-export-dynamic  ip.o
>> ipaddress.o ipaddrlabel.o iproute.o iprule.o rtm_map.o iptunnel.o
>> ip6tunnel.o tunnel.o ipneigh.o ipntable.o iplink.o ipmaddr.o ipmonitor.o
>> ipmroute.o ipprefix.o iptuntap.o ipxfrm.o xfrm_state.o xfrm_policy.o
>> xfrm_monitor.o iplink_vlan.o link_veth.o link_gre.o iplink_can.o
>> iplink_macvlan.o ../lib/libnetlink.a ../lib/libutil.a  -lresolv -L../lib
>> -lnetlink -lutil -ldl -o ip
>> ../lib/libnetlink.a: could not read symbols: Archive has no index; run
>> ranlib to add one
>> collect2: ld returned 1 exit status
>> ------------------------
>
> Can you upload a full build log of the relevant (iproute2) part somewhere?
> Thanks.

It's on pastebin: http://pastebin.com/hRhJKpkN

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
