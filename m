From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jan 2014 22:04:20 +0100
Subject: [Buildroot] [PATCH 1/1] gtest: fix shared building
In-Reply-To: <1390602996-16836-1-git-send-email-kuyurix@gmail.com> ("Marcelo
 =?utf-8?Q?Guti=C3=A9rrez=22's?= message of "Fri, 24 Jan 2014 22:36:36
 +0000")
References: <1390602996-16836-1-git-send-email-kuyurix@gmail.com>
Message-ID: <877g9m1mln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcelo" == Marcelo Guti?rrez <kuyurix@gmail.com> writes:

 > When BR2_PREFER_STATIC_LIB is not selected there is no libgtest.a library.
 > fixes:
 > http://autobuild.buildroot.net/results/0d5/0d54439e7a722680f1988deb035a0236a18fb41c/build-end.log

Thanks, but I've applied Samuel's patch to simply force static linking
instead.

-- 
Bye, Peter Korsgaard
