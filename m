From: Noam Camus <noamc@ezchip.com>
Date: Sun, 15 Jun 2014 15:15:54 +0000
Subject: [Buildroot] FW: [PATCH 1/1] toolchain-buildroot: create
	a	relocatable one
In-Reply-To: <CAAXf6LUH1JmV3uM_B1meUxCt5BnTzYpxz25GXuydHDNXPBeyaA@mail.gmail.com>
References: <884EA965490E3C4D8E66AEF41E9802502525C8@ezex10.ezchip.com>
 <20140608145430.0125bb29@free-electrons.com>
 <884EA965490E3C4D8E66AEF41E980250252659@ezex10.ezchip.com>
 <20140608154632.1f6f13a6@free-electrons.com>
 <884EA965490E3C4D8E66AEF41E9802502528F6@ezex10.ezchip.com>
 <20140608154420.GF4074@tarshish>
 <884EA965490E3C4D8E66AEF41E980250256965@ezex10.ezchip.com>
 <20140615121602.GC4064@tarshish>
 <CAAXf6LUH1JmV3uM_B1meUxCt5BnTzYpxz25GXuydHDNXPBeyaA@mail.gmail.com>
Message-ID: <884EA965490E3C4D8E66AEF41E980250256C13@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> If it's purely a proxy problem, then you can use socat to let smtp go
> through the tunnel.
> Set up git to use localhost as smtp server, and a port of your choice, for
> example 10587, and set up a socat instance:
> 
> socat TCP4-LISTEN:$localport,reuseaddr,fork
> PROXY:$proxy:$remotehost:$remoteport,proxyport=$proxyport,resolve
> 
> where localport=10587, remotehost=smtp.gmail.com, remoteport=587,
> proxy=proxy.yourcompany.com proxyport=8080 (whatever is the right port for
> your proxy)
> 
> Same trick can be used to forward IRC through the proxy.

Thanks nice trick

Noam Camus 
