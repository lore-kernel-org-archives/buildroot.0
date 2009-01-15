From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 21:26:30 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <1232050700.4757.22.camel@aeglos.sweden.atmel.com> (Ulf
	Samuelsson's message of "Thu\, 15 Jan 2009 21\:18\:20 +0100")
References: <20090114221114.73CB776C8E@busybox.osuosl.org>
	<20090115083621.GA15748@zelow.no>
	<1232050700.4757.22.camel@aeglos.sweden.atmel.com>
Message-ID: <87hc408geh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> So what is wrong with PATH and makes this hack a necessity?

 Ulf> It looks like the configure script for gtk is totally screwed up.
 Ulf> I have HOST_GLIB = /opt/gnome/bin on OpenSuSE in the path,
 Ulf> but configure does not look at the path, and decides
 Ulf> /usr/bin is where glib-genmarshal is.
 Ulf> There is also an ac_cv_path variable set in
 Ulf> the buildroot script, which is ignored.

So with other words your commit doesn't fix anything and should be
reverted?

Haven't we been through this glib-genmarshal stuff before?

-- 
Bye, Peter Korsgaard
