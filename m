From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 23:15:00 +0100
Subject: [Buildroot] [PATCH 2/3] skeleton: optionally wait for network
	interfaces to appear
In-Reply-To: <20151028215748.GC3650@free.fr> (Yann E. MORIN's message of "Wed, 
 28 Oct 2015 22:57:48 +0100")
References: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
 <1446047943-24641-3-git-send-email-jezz@sysmic.org>
 <20151028174653.GA3650@free.fr> <2419445.kGEUX5UIA3@sagittea>
 <20151028213702.GB3650@free.fr> <87mvv27jc6.fsf@dell.be.48ers.dk>
 <20151028215748.GC3650@free.fr>
Message-ID: <87fv0u7i8r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> As far as I can see from the busybox implementation atleast, -a (all)
 >> only causes it to run ifup/ifdown (with IFACE set to the interface name) for
 >> each interface listed as auto, so it doesn't do the "--all" thing, but
 >> the Debian variant does.

 > Since we already have the option to use the full-fledged ifup-down, we
 > should support the case where IFACE=--all in the script.

Yes, agreed - My comment was for information only.

-- 
Venlig hilsen,
Peter Korsgaard 
