From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 17 Jun 2016 07:38:22 +0000
Subject: [Buildroot] Emails being substituted when reading via Gmane NNTP
Message-ID: <1466149048.31770.11.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter,

I'm wondering if that's an expected behavior or my NNTP reader is broken
(even though both Evolution's built-in reader and stand-alone Pan reader
behave exactly the same so probably it's not a client who's guilty).

So when reading Buildroot mailing list via NNTP client connected to Gmane
I see this kind of information in message source in Evolution's NNTP reader:
------------------------->8---------------------
Path: news.gmane.org!not-for-mail
From: Romain Naour <romain.naour-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Newsgroups: gmane.comp.lib.uclibc.buildroot
Subject: [PATCH] package/luaposix: add .hash file
Date: Thu, 16 Jun 2016 23:39:40 +0200
Lines: 22
Approved: news at gmane.org
Message-ID: <1466113180-20892-1-git-send-email-romain.naour@gmail.com>
NNTP-Posting-Host: plane.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
------------------------->8---------------------

That's what Pan reader shows as an "Information" about the same article:
------------------------->8---------------------
Subject: [PATCH] package/luaposix: add .hash file
From: Romain Naour <romain.naour-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Thu 11:39 PM
Message-ID: <1466113180-20892-1-git-send-email-romain.naour@gmail.com>
Lines: 22
Size: 6.50195 KB (6658 Bytes)

This article is complete with 1 part.
------------------------->8---------------------

But interesting enough in Buildroot's mailing list
(http://lists.busybox.net/pipermail/buildroot/2016-June/164199.html)
the header is:
------------------------->8---------------------
[Buildroot] [PATCH] package/luaposix: add .hash file

Romain Naour romain.naour at gmail.com?
Thu Jun 16 21:39:40 UTC 2016
------------------------->8---------------------

Similar behavior I notice in recently added uClibc-ng on Gmane but
for example eneric LKML has normal emails in NNTP readers, the same is true for
linux-snps, u-boot, lede/openwrt and many other lists.

Probably that's a matter of some configuration somewhere?
Otherwise with those wierd emails it's quite inconvenient to answer to
messages which were not sent to me directly - I have to specify all
email manually...

Any thoughts are much appreciated.

-Alexey
