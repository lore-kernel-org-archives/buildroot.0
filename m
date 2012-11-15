From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Nov 2012 21:59:09 +0100
Subject: [Buildroot] [PATCH] support/gnuconfig: update config.{guess,
	sub} to a newer version
In-Reply-To: <1352995994-10048-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 15 Nov 2012 17:13:14 +0100")
References: <1352995994-10048-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txsq37mq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We need more recent versions of config.guess and config.sub in order
 Thomas> to support the aarch64 architecture. Otherwise, all autoconf packages
 Thomas> fail to build with failures like:

 Thomas>   http://autobuild.buildroot.org/results/abcdbe1aaf1c203c82dc3e4ec8c002b9b9e550e0/build-end.log

 Thomas> We take this opportunity to turn the config.* patches into proper Git
 Thomas> patches, and note which Git commit of the config.git repository we
 Thomas> used as the original source.

Committed, thanks.

-- 
Bye, Peter Korsgaard
