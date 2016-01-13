From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 22:42:33 +0100
Subject: [Buildroot] [PATCH] uclibc: update uClibc-ng to latest version
	1.0.11
In-Reply-To: <20160113194941.GY19876@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Wed, 13 Jan 2016 20:49:41 +0100")
References: <20160110175806.GA23441@waldemar-brodkorb.de>
 <87d1t679l2.fsf@dell.be.48ers.dk>
 <20160113194941.GY19876@waldemar-brodkorb.de>
Message-ID: <87si212m2e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

Hi,

>> Does this mean that systemd can be now used with uClibc-NG?

 > In theory yes. OpenEmbedded recently switched to uClibc-ng and
 > I got some bug reports regarding systemd. I debugged and tested
 > some issues with buildroot, but I am not very interested in systemd
 > myself. It needs some patching of systemd and some options disabled.

 > So if anybody cares, you could take a look at oe git.

Ok, thanks. I'm myself also not a systemd user, but if somebody else is
interested, feel free to try it out!


 > But as with all new features and bugfixes for uClibc-ng, it will not
 > work for any external uClibc toolchain or any internal uClibc
 > 0.9.33.2 users.

Indeed :/

-- 
Venlig hilsen,
Peter Korsgaard 
