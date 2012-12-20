From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Dec 2012 09:22:24 +0100
Subject: [Buildroot] [PATCH] mplayer: prevent selection on Microblaze
	and AArch64
In-Reply-To: <1355959627-13525-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 20 Dec 2012 00:27:07 +0100")
References: <1355959627-13525-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehilyvy7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> MPlayer wants to have some "support" for each architecture, and for
 Thomas> now, it doesn't know about Microblaze and AArch64, so prevent the
 Thomas> selection of MPlayer on those architectures.

 Thomas> For Microblaze, fixes:

 Thomas>   http://autobuild.buildroot.org/results/4e6e0d15694345ded649c92251cc2173dc45fe7c/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
