From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Sep 2010 00:24:10 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2010.11/remove-deprecated-packages
In-Reply-To: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 12 Sep 2010 20:33:12 +0200")
References: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r5gy7g8l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> This set of patches removes five packages that were marked as
 Thomas> deprecated and to be removed in the release notes of 2010.08 :

 Thomas>  * The GTK 1.x stack, and its only user in Buildroot, the Dillo web
 Thomas>    browser. Newer versions of Dillo use FLTK 2, if someone needs it,
 Thomas>    we can package it.

 Thomas>  * The pcmcia-cs package, which is useless with 2.6 kernels.

 Thomas> Peter: the libgtk12 removal contains a patch that has a line longer
 Thomas> than 998, so if you apply the patch using the e-mail sent to the list,
 Thomas> it may not work. Instead, could you pull the branch directly from
 Thomas> git.busybox.net ?

Pulled and pushed, thanks!

-- 
Bye, Peter Korsgaard
