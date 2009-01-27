From: sddnd <sddndw@gmail.com>
Date: Tue, 27 Jan 2009 23:24:18 +0800
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
In-Reply-To: <20090127150231.1A65F7709E@busybox.osuosl.org>
References: <20090127150231.1A65F7709E@busybox.osuosl.org>
Message-ID: <161618df0901270724x42ed77abv6228d659feee6570@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello:

Recently I developed a project which use FR-V in its core.

It's Big-Endian.

I tried to build libicu manually followed by the doc or the buildroot way,
but I can't find how to build the big-endian binary.

Now I choose to use a Big-Endian machine (such as PPC) to build the
necessary DATA files. It works. But that way I use is ugly.

No much big deal for this,
but if you could find a better way to handle(or solve) this,
I will be much appreciate !

Best Regard.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090127/6e67c15c/attachment.htm 
