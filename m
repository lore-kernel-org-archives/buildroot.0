From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Aug 2014 09:01:38 +0200
Subject: [Buildroot] [PATCH] support/script/scancpan: don't generate the
	trailing slash in <PKG>_SITE variable
In-Reply-To: <1409302313-12483-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Fri, 29 Aug 2014 10:51:53 +0200")
References: <1409302313-12483-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87zjempijx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > The trailing slash was removed in all packages, so don't generate it.
 > See http://git.buildroot.net/buildroot/commit/?id=c7f4b964718bc5a3329bb730f59e24091ecbc7a2

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
