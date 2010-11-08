From: Don Smyth <dsmyth@signett.com>
Date: Sun, 7 Nov 2010 21:50:09 -0800
Subject: [Buildroot] java support in buildroot
In-Reply-To: <8739rodcwm.fsf@macbook.be.48ers.dk>
References: <AANLkTins6w3F0edPkF4Tp_J8jCOoJgH+ePqm=oabZNWG@mail.gmail.com>
	<8739rodcwm.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTi=-fVydqw4HBDc8WsJL8kpj956tbkuf0yps0o2p@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches to update java support:

1) enable java in main Config.in (works with external glibc based toolchain)
2) update jamvm to 1.5.4
3) update concierge to 1.0.0, fix sample bundle download, fix sample bundle
paths in init.xargs
--
Don Smyth
dsmyth at signett.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101107/81b5bdc5/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fixjava.patch
Type: text/x-patch
Size: 4306 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101107/81b5bdc5/attachment-0001.bin>
