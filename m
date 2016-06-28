From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jun 2016 22:29:11 +0200
Subject: [Buildroot] [PATCH 5/6] docs/manual/known-issues: remove
	occurrences of eglibc
In-Reply-To: <20160613204653.GG3786@free.fr> (Yann E. MORIN's message of "Mon, 
 13 Jun 2016 22:46:53 +0200")
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160613204653.GG3786@free.fr>
Message-ID: <87d1n1jbvs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > I just discovered we had a konwn-problems section in the manual... That
 > worries me somewhat: it will be hard to ensure this stays current with
 > the new versions of those packages...

Yeah, me too!

 > Are we sure those are still valid? For example. mrouted has been updated
 > once since the known-issue was added; xfsprogs has been updated twice.

I don't know. Perhaps it would be better to have these notes closer to
the package? Perhaps as comment lines in the Config.in or part of the
help text?

-- 
Bye, Peter Korsgaard
