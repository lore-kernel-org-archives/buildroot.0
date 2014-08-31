From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Sep 2014 00:11:00 +0200
Subject: [Buildroot] [PATCH v2 9/9] package/taglib: fix static link
In-Reply-To: <1409514922-9509-10-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 31 Aug 2014 21:55:22 +0200")
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
 <1409514922-9509-10-git-send-email-s.martin49@gmail.com>
Message-ID: <87wq9ol37v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > - disable shared object build when BR2_PREFER_STATIC_LIB is set
 > - patch the CMake code for handling static/shared object build using
 >   standard CMake flags, instead of the custom ones.

 > Fixes:
 >   http://autobuild.buildroot.net/results/a9c/a9cfe66c57bffc5a4560b2e4dcb41994da59e294/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 > ---
 > changes v1->v2:
 > - add patch handling static/shared object build using standard CMake
 >   flags, instead of the custom ones.

Committed, thanks.

-- 
Bye, Peter Korsgaard
