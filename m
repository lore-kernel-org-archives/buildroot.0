From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Sep 2015 14:06:11 +0200
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add option to
 enable/disable ipv6 support
In-Reply-To: <0dc07792d2e04be6b1628563695e9e28@LysExc01.nanotronic.local>
References: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
 <20150923230236.5b5c5302@free-electrons.com>
 <0dc07792d2e04be6b1628563695e9e28@LysExc01.nanotronic.local>
Message-ID: <20150925140611.13ec8719@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Fri, 25 Sep 2015 11:12:00 +0000, Wetzel Andreas wrote:

> Ok, I was not aware that you made IPv6 mandantory. Sorry for that.
> 
> Currently, IPv6 is always enabled for libwebsockets.
> In a project we used a kernel without support for IPv6. libwebsockets (with ipv6 support) seem to cause problems if the kernel does not support IPv6 at all. That's why I thought such configuration option would make sense.
> 
> Size is no reason. Including IPv6 support is a matter of a few kilobytes.
> 
> So my resolution is to add IPv6 support to the linux kernel we use to.

What is the size difference of the kernel with/without IPv6 enabled? If
it's very significant, then maybe we need to revisit this? Gustavo?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
