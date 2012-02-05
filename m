From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 5 Feb 2012 17:02:50 -0600
Subject: [Buildroot] eth0 in buildroot (vmware)
In-Reply-To: <CAPRmHH2q3bY22dSE0BVooO3OSDr6eXz2U42euRzaU00CJbqn1A@mail.gmail.com>
References: <CAPRmHH2q3bY22dSE0BVooO3OSDr6eXz2U42euRzaU00CJbqn1A@mail.gmail.com>
Message-ID: <201202051702.52040.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun February 5 2012, Stefan Miklosovic wrote:
> Hi,
> 
> I am about making some embedded Linux and all seems to be good but the
> networking does not work. All interfaces I get after making iso and booting
> it in vmware are lo (loopback) and some sit0 (seems like a bridge or what).
>

The sit0 interface is your IPv6-in-IPv4 interface if memory serves.
But that is all I can say with the amount of detail you have given.

Perhaps post again with some more details of what your trying to build
for and what version of things you are using.

Mike
> In vmware, I have checked "NAT" as network adapters. What do I have to do
> in order to get the networking up and running? What magic should I do?
> 
> Thank you
> 
> Stefan
> 
