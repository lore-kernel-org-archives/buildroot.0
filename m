From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jul 2010 23:24:16 +0200
Subject: [Buildroot] [PATCH 1/1] Deprecate the Alpha,
	IA64 and Sparc64 support
In-Reply-To: <b81b1626425651ac1f0db553dad145f05934d973.1280160874.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 26 Jul 2010 18:15:11 +0200")
References: <cover.1280160874.git.thomas.petazzoni@free-electrons.com>
	<cover.1280160874.git.thomas.petazzoni@free-electrons.com>
	<b81b1626425651ac1f0db553dad145f05934d973.1280160874.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pqy8bou7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Those architectures don't exist anymore (Alpha, IA64) or aren't widely
 Thomas> used for embedded systems running Linux. Moreover, no clear Buildroot
 Thomas> maintainer has stepped in to maintain these architectures, so it's
 Thomas> better to not pretend that we support them.

 Thomas> The goal is to mark them as deprecated in 2010.08 and remove them in
 Thomas> 2010.11.

Committed, thanks.

-- 
Bye, Peter Korsgaard
