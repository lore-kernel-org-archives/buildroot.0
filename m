From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Mar 2008 13:29:17 +0100
Subject: [Buildroot] legacy sources in svn
In-Reply-To: <87a5b0800803290508t3b1bd407n1eb2e2c76c2a803a@mail.gmail.com>
	(Will Newton's message of "Sat\, 29 Mar 2008 12\:08\:19 +0000")
References: <1206738394.3224.82.camel@nigel-x60>
	<87k5jmft4j.fsf@macbook.be.48ers.dk>
	<87a5b0800803290508t3b1bd407n1eb2e2c76c2a803a@mail.gmail.com>
Message-ID: <87prtdaf36.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

Hi,

 >> Exactly, feel free to remove them.

 Will> I have some concerns about this. People may want to keep stable
 Will> toolchains to avoid bugs in newer versions or for QA purposes.
 Will> Removing working configurations in the name of "tidying up" sounds
 Will> like a bad idea to me.

The question was about removing old patches that aren't used (the
versions cannot be selected) anymore.

Regarding updating versions - We do that all the time (and have to do
so as bugs are found in old versions or they simply no longer
available upstream). If you want to keep a stable environment, you
should simply not update your buildroot snapshot.

-- 
Bye, Peter Korsgaard
