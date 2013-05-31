From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 May 2013 14:04:42 +0200
Subject: [Buildroot] [PATCH 2/6] gettext: don't patch different the host
	and target build
In-Reply-To: <20130531092750.5015e03c@skate> (Thomas Petazzoni's message of
 "Fri, 31 May 2013 09:27:50 +0200")
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87li6wz1ur.fsf@dell.be.48ers.dk> <20130531092750.5015e03c@skate>
Message-ID: <87y5avwe1x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Please don't forget to send the patches upstream.

 Thomas> The one fixing SHELL has been merged upstream:

 Thomas>  http://git.savannah.gnu.org/cgit/gettext.git/commit/?id=fcff059faeba5108298ee1032a0ed6419eae16a6

 Thomas> The one adding the --disable-tools has been more-or-less
 Thomas> rejected by the gettext maintainer, who suggested to only do
 Thomas> the configure in the gettext-runtime directory when all we need
 Thomas> is the runtime libintl:

 Thomas>  http://lists.gnu.org/archive/html/bug-gettext/2013-05/msg00044.html

 Thomas> The last one (allowing to disable examples and tests for the
 Thomas> tools) is not yet in a state ready for upstream, but I'll work
 Thomas> on it.

Great, thanks!

-- 
Bye, Peter Korsgaard
