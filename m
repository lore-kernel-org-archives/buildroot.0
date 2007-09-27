From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 27 Sep 2007 19:07:06 +0200
Subject: [Buildroot] Problem with building ARM cross toolchain
	using	buildroot
In-Reply-To: <1190902100.7430.126.camel@localhost.localdomain>
References: <140561.37392.qm@web7910.mail.in.yahoo.com>
	<1190902100.7430.126.camel@localhost.localdomain>
Message-ID: <20070927170706.GD20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 27, 2007 at 09:08:20AM -0500, Brian Austin wrote:
>You should not use the toolchain buildroot package provided by cirrus to
>build a buildroot toolchain.
>
>please download one from the buildroot website.
>
>http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2
>
>
>The buildroot package from arm.cirrus.com is a binary one packaged with
>the sources.

Well, to be fair, you can of course use an external toolchain from a
vendor, be it distributed in binary or in source-form.

See the "Toolchain" menu, "External binary toolchain".

If you run into problems with such toolchains, your best bet is to talk
to the one who provided that external toolchain.
That said, it sounds like this is just a normal ARM target, so there
should be no real need to use such an old compiler, from my POV.

HTH,
