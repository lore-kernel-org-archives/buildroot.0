From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Sep 2011 22:58:57 +0200
Subject: [Buildroot] [PATCH 20/21] dependencies: add rsync as a required
	dependency
In-Reply-To: <44c7b2b75d887d124e3cc22704723e09bf1fda71.1316464690.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:53:23 +0200")
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
 <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
 <44c7b2b75d887d124e3cc22704723e09bf1fda71.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wrd30w32.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> rsync can now be used for overriden package, and will also be used for
 Thomas> other purposes in the future (optimization of toolchain copy time,
 Thomas> etc.).

Committed, thanks. You're already using rsync in patch 5, so this
belongs before then in the series.

-- 
Bye, Peter Korsgaard
