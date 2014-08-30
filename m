From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Aug 2014 23:35:46 +0200
Subject: [Buildroot] [PATCH 1/5] package/libiqrf: fix static link
In-Reply-To: <1409392347-16392-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 30 Aug 2014 11:52:23 +0200")
References: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87oav1oe31.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > - libiqrf depends on pthread, so add a patch fixing the build-system that way
 > - disable shared object build when BR2_PREFER_STATIC_LIB is set

 > Fixes:
 >   http://autobuild.buildroot.net/results/210/2108f37e4a41af0b527c78e646e82f1cafa0353d/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
