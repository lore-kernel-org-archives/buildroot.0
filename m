From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 25 Sep 2007 15:09:09 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:
	alsa-utils	dialog directfb fbv freetype etc...
In-Reply-To: <46F922E2.6020702@promwad.com>
References: <20070925123411.EA7E03006B@busybox.net>
	<46F922E2.6020702@promwad.com>
Message-ID: <20070925130909.GA16029@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 25, 2007 at 02:01:54PM -0100, vano wrote:
>Bernhard,
>
>Is it possible for you to convert one of packages to use
>AUTOTARGETS approach? This would allow transition of all
>packages to AUTOTARGETS and thus no need to "rm -f config.cache;" in
>every *.mk file , but the single change to Makefile.autotools.in
>
>As I understand the usages of AUTOTARGETS is preferred way of handling
>new packages? Or I am not right?

See ./TODO

First Makefile.autotools.in needs it's patch-handling fixed. Patches
welcome, i'll first see what i can do in the toolchain, and will not
look at the Makefile.autotools.in soonish.
