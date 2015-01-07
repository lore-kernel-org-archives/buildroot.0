From: Alex Suykov <alex.suykov@gmail.com>
Date: Wed, 7 Jan 2015 15:02:10 +0200
Subject: [Buildroot] [PATCH] dmalloc: fix parallel builds
In-Reply-To: <20150104214157.4057d1ce@free-electrons.com>
References: <20150103110503.GA11955@vostro>
 <20150104183513.0cdff028@free-electrons.com>
 <20150104190204.GA4224@vostro>
 <20150104214157.4057d1ce@free-electrons.com>
Message-ID: <20150107130210.GA13534@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sun, Jan 04, 2015 at 09:41:57PM +0100, Thomas Petazzoni wrote:

> If you're using dmalloc, I just noticed that the version we have in
> Buildroot is 5.4.3, while upstream has a 5.5.2 release. If you want to
> send a patch to bump the dmalloc version, that would be great.

No, I don't use it myself. I was just looking through autobuild logs
for unrelated reasons and kind of decided to fix what was clearly fixable.

Anyway, I'll send a version bump patch now, it looks like the changes
are minor, and both Gentoo and OpenWRT have 5.5.2 already.

I wonder if it makes sense to contact whoever sent that config
to autobuild and ask for some feedback. Since dmalloc was enabled
there, it was probably used for something.
