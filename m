From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 20:39:06 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <1232998227.2298.106.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 26 Jan 2009 20\:30\:27 +0100")
References: <20090125214834.783FA76D28@busybox.osuosl.org>
	<877i4i6ni7.fsf@macbook.be.48ers.dk>
	<1232998227.2298.106.camel@elrond.atmel.com>
Message-ID: <87hc3l6en9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Something that needs to be cleaned up is the way
 Ulf> things are copied to a directory outside Buildroot.

 Ulf> I think to have a global COPYTO which can
 Ulf> be overridden by a shell variable is the
 Ulf> best approach.

Or simply get rid of it. As I argued before it's very hard to do
generic in a way that pleases everyone without making it very
complicated, and it's clearly outside the core goals of buildroot.

-- 
Bye, Peter Korsgaard
