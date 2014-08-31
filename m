From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Aug 2014 23:44:08 +0200
Subject: [Buildroot] [PATCH v2 7/9] package/musepack: fix static link
In-Reply-To: <1409514922-9509-8-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 31 Aug 2014 21:55:20 +0200")
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
 <1409514922-9509-8-git-send-email-s.martin49@gmail.com>
Message-ID: <8761h8mj13.fsf@dell.be.48ers.dk>
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
 >   http://autobuild.buildroot.org/results/e5e/e5eef14d5ed76db824c47a7e679e68397a023526/

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
