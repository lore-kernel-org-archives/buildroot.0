From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Feb 2012 23:18:14 +0100
Subject: [Buildroot] [PATCH 3 of 5 v6] dependencies: add function
	suitable-host-package
In-Reply-To: <ac206b814e2a0c5c762a.1328718138@beantl019720> (Thomas De
 Schampheleire's message of "Wed, 08 Feb 2012 17:22:18 +0100")
References: <patchbomb.1328718135@beantl019720>
 <ac206b814e2a0c5c762a.1328718138@beantl019720>
Message-ID: <87r4y33b2x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Sometimes, buildroot needs a certain host tool to do its job,
 Thomas> e.g. tar. In many cases, we expect this tool to be present on
 Thomas> the host system, but this is

Committed, thanks.

-- 
Bye, Peter Korsgaard
