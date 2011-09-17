From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Sep 2011 08:23:43 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.11/misc-cleanups
In-Reply-To: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 31 Aug 2011 23:34:59 +0200")
References: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874o0by9e8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> This set of patches basically creates a new support/ directory, which
 Thomas> is used to group various files needed for the operation of Buildroot
 Thomas> which didn't fit properly in other directories :

 Thomas>  * The various scripts in the scripts/ directory (after removing the
 Thomas>    unused, unmaintained ones)

 Thomas>  * The libtool related patches

 Thomas>  * The patch-kernel.sh script, after renaming it to a more sensible
 Thomas>    name.

 Thomas>  * The kconfig stuff

 Thomas>  * The gnuconfig stuff (config.guess and config.sub)

 Thomas> Best regards,

Committed entire series, thanks!

-- 
Bye, Peter Korsgaard
