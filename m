From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 22:01:29 +0200
Subject: [Buildroot] [PATCH] erlang-p1-stringprep: backport upstream
	commit to fix musl build
In-Reply-To: <1463418358-30464-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 16 May 2016 19:05:58 +0200")
References: <1463418358-30464-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8737p7b4yu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Amusingly, a fix made upstream to fix the build on Windows also fixes
 > the build with the musl C library.

 > Fixes:

 >   http://autobuild.buildroot.net/results/d7b0cacc5d99d8dc91fdeaf770bb5d2b1b1975b6/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
