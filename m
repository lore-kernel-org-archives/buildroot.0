From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Aug 2014 23:35:52 +0200
Subject: [Buildroot] [PATCH 2/5] package/libwebsockets: fix static link
In-Reply-To: <1409392347-16392-2-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 30 Aug 2014 11:52:24 +0200")
References: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
 <1409392347-16392-2-git-send-email-s.martin49@gmail.com>
Message-ID: <87k35poe2v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > - disable shared object build when BR2_PREFER_STATIC_LIB is set
 > Fixes:
 >   http://autobuild.buildroot.net/results/0a9/0a9f0c3c101550e73f7100f2b88a88c1f2bbad95/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
