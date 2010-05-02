From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 May 2010 00:03:19 +0200
Subject: [Buildroot] [pull request] Pull request for branch misc-fixes
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 28 Apr 2010 23:40:41 +0200")
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874oiqezbs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a set of patches, some of them are important fixes that should
 Thomas> really be merged before 2010.05, some other are improvements and
 Thomas> cleanups that can be postponed if needed.

 Thomas> The important ones are :

 Thomas>       libxslt: fix host compilation
 Thomas>       uClibc: add UCLIBC_HAS_NFTW to default configuration
 Thomas>       uclibc: make sure the default configuration doesn't ask questions
 Thomas>       Fix autotools configuration cache handling

Thanks, I've committed everything except for 7 and 8 (freetype +
interrupted downloads).

-- 
Bye, Peter Korsgaard
