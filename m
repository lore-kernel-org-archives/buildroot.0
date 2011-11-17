From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Nov 2011 23:20:35 +0100
Subject: [Buildroot] [PATCH 1 of 5 RFC] dependencies: check core
	dependencies before anything else
In-Reply-To: <268352ac0f111e4fdf72.1320911666@devws108> (Thomas De
 Schampheleire's message of "Thu, 10 Nov 2011 20:31:51 +0100")
References: <patchbomb.1320911665@devws108>
 <268352ac0f111e4fdf72.1320911666@devws108>
Message-ID: <87ehx69yrw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Currently, the dependencies target (that runs dependencies.sh)
 Thomas> depends on DEPENDENCIES_HOST_PREREQ. This means that the
 Thomas> dependencies listed in DEPENDENCIES_HOST_PREREQ (currently
 Thomas> host-sstrip if sstrip is selected) are built *before* the
 Thomas> dependencies.sh script is run.

Committed, thanks.

-- 
Bye, Peter Korsgaard
