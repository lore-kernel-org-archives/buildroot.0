From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Dec 2010 21:45:00 +0100
Subject: [Buildroot] [PATCH 1/1] xkeyboard-config: bump to 2.0 to fix
	bug 2965
In-Reply-To: <7d1e217a300ed9ebcee0cea4bdd55d12370d3ef8.1293010496.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 22 Dec 2010 10:35:04 +0100")
References: <cover.1293010496.git.thomas.petazzoni@free-electrons.com>
	<cover.1293010496.git.thomas.petazzoni@free-electrons.com>
	<7d1e217a300ed9ebcee0cea4bdd55d12370d3ef8.1293010496.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aajxv8oj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> For some odd reason, xkeyboard-config < 1.8 was creating a symbolic
 Thomas> link from /usr/share/X11/xkb/xkbcomp to the xkbcomp binary. But in
 Thomas> cross-compilation mode, this is absurd as the xkbcomp binary to which
 Thomas> the link is pointing is the one in $(HOST_DIR).

Committed, thanks.

-- 
Bye, Peter Korsgaard
