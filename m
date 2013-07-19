From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 23:44:18 +0200
Subject: [Buildroot] [PATCH] trivial: add space in 'bool"package"'
	construct in Config.in
In-Reply-To: <c92bd20931ef072a188e.1374235292@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Fri, 19 Jul 2013 14:01:32 +0200")
References: <c92bd20931ef072a188e.1374235292@BEANTN0L019720>
Message-ID: <87txjqtebx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> In early buildroot, it apparently was customary to have
 Thomas> following style in Config.in files: bool"expat"

 Thomas> Nowadays, only two packages remain with this style: diffutils and expat.
 Thomas> This trivial patch lines them up with the style:
 Thomas>     bool "expat"

Committed, thanks.

-- 
Bye, Peter Korsgaard
