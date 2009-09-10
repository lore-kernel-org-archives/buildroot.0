From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Sep 2009 09:33:08 +0200
Subject: [Buildroot] [PATCH 4/5] Remove BR2_TOPDIR_PREFIX and
	BR2_TOPDIR_SUFFIX
In-Reply-To: <20090910083010.116ab844@surf> (Thomas Petazzoni's message of
	"Thu\, 10 Sep 2009 08\:30\:10 +0200")
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<2f7f4e844f89b99bde1ab32524d43ee7a82825a5.1252361088.git.thomas.petazzoni@free-electrons.com>
	<20090909173535.GA17081@mx.loc> <20090910083010.116ab844@surf>
Message-ID: <87k507w8y3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> 2) TOPDIR_PREFIX and TOPDIR_SUFFIX don't hurt and are convenient for
 >> some corner-cases. I'd keep them.

 Thomas> As they don't provide any additional value over O=, I'd prefer
 Thomas> to keep O=. One of the reason for which Buildroot is too
 Thomas> complicated today is because there are multiple ways of
 Thomas> achieving the same thing. This multitude of options is
 Thomas> confusing for newcomers.

I agree. I much prefer the KISS principle.

I think the main thing buildroot has going for itself compared to the
other build systems is simplicity. It is (imho) a lot smaller and
simpler to understand and start hacking on for outsiders.

-- 
Bye, Peter Korsgaard
