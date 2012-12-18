From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Dec 2012 14:29:06 +0100
Subject: [Buildroot] [PATCH] libseccomp: Fix install option order
In-Reply-To: <1355835825-29410-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Tue, 18 Dec 2012 14:03:45 +0100")
References: <1355835825-29410-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87ip7z5w0t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Commit ca0e5152 introduced a bad option order, leading to another build
 Maxime> failure.

 Maxime> Fixes
 Maxime> http://autobuild.buildroot.org/results/0e7de5e7c792b5ef195ee98fe1e7bb1c6b220bfb/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
