From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 May 2013 23:55:04 +0200
Subject: [Buildroot] [PATCH 07/20] flex: needs M4 at runtime
In-Reply-To: <1369606110-8088-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:17 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87li70cclj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> For proper runtime execution, flex requires m4 to be
 Thomas> installed. Passing a M4 variable at configure time is needed,
 Thomas> otherwise flex on the target will try to use a 'm4' binary with a
 Thomas> build machine path.

 Thomas> Fixes bug #4988.

Committed, thanks.

-- 
Bye, Peter Korsgaard
