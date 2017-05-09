From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 09 May 2017 17:14:05 +0200
Subject: [Buildroot] [PATCH] daemon: fix parallel build
In-Reply-To: <b7b648fdc787feae767f23b1a334ce5e7f13072a.1494266507.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 8 May 2017 21:01:47 +0300")
References: <b7b648fdc787feae767f23b1a334ce5e7f13072a.1494266507.git.baruch@tkos.co.il>
Message-ID: <87wp9qm5aa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The 'ready' target creates a symlink in the libslack/ subdirectory to make up
 > the path to header files. Unfortunately, the target building sources files
 > that need on that symlink, does not depend on the 'ready' target. This might

Dropped 'on' from 'need on that' and committed, thanks.

-- 
Bye, Peter Korsgaard
