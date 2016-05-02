From: Geoff Levand <geoff@infradead.org>
Date: Mon, 02 May 2016 09:21:27 -0700
Subject: [Buildroot] [PATCH v3 0/3] Add go language support
In-Reply-To: <20160430140314.4ff30ff1@free-electrons.com>
References: <cover.1459798147.git.geoff@infradead.org>
 <20160421224301.6a05f711@free-electrons.com>
 <1461965160.27026.9.camel@infradead.org>
 <20160430140314.4ff30ff1@free-electrons.com>
Message-ID: <1462206087.27026.15.camel@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2016-04-30 at 14:03 +0200, Thomas Petazzoni wrote:
> Hum, I'm looking at this repository, and I see only 3 branches, and
> none of them seem to contain things that look like fixes. Did I miss
> something?

Here's a browser link:

https://github.com/glevand/buildroot--buildroot/commits/master

You should see these:

b461b3a package/go: Add BR2_TOOLCHAIN_HAS_THREADS
149dbc4 package/go: Add not BR2_TOOLCHAIN_USES_UCLIBC
abb61c6 package/go: Fix powerpc64 config typo
044579e package/go: Upgrade 1.5.3 to 1.6.2

I don't think 'package/go: Add not BR2_TOOLCHAIN_USES_UCLIBC' is the
righ fix though.  I think the problem is something else.  I need to
look at that one some more.

-Geoff
