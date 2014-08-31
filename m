From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Sep 2014 00:10:53 +0200
Subject: [Buildroot] [PATCH v2 8/9] package/polarssl: fix static link
In-Reply-To: <1409514922-9509-9-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 31 Aug 2014 21:55:21 +0200")
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
 <1409514922-9509-9-git-send-email-s.martin49@gmail.com>
Message-ID: <871trwmhsi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > - disable shared object build when BR2_PREFER_STATIC_LIB is set
 > - patch the CMake code for handling static/shared object build using
 >   standard CMake flags, instead of the ucstom ones.

 > Fixes:
 >   http://autobuild.buildroot.net/results/754/754947d2a77a4dbe91057d8ce64fc4996e716ece/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 > ---
 > changes v1->v2:
 > - add patch handling static/shared object build using standard CMake
 >   flags, instead of the custom ones.

Committed, thanks.

-- 
Bye, Peter Korsgaard
