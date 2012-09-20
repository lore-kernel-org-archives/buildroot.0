From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Sep 2012 22:32:10 +0200
Subject: [Buildroot] [PATCH 1/4] Remove the Xtensa architecture
In-Reply-To: <75b72ff947ad138adcd4b000a1e3bf60c744ffff.1346767209.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 4 Sep 2012 16:04:06 +0200")
References: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
 <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
 <75b72ff947ad138adcd4b000a1e3bf60c744ffff.1346767209.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vcf877w5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As stated in commit 555c2585bf28c3ef71f6d2dcdd983d17a19892af, the
 Thomas> Xtensa architecture has been introduced in 2009 and never changed
 Thomas> since its initial introduction. It requires some special handling that
 Thomas> is a bit annoying, and despite our call to the initial developers, and
 Thomas> the announcement of the deprecation of the architecture during the
 Thomas> 2012.05, nothing has happened. Therefore, drop support for this
 Thomas> architecture.

Committed, thanks.

-- 
Bye, Peter Korsgaard
