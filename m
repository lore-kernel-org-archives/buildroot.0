From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 15:39:31 +0100
Subject: [Buildroot] [PATCH] package/ofono: bump to version 1.28
In-Reply-To: <20190124105327.65069-1-nicolas.serafini@sensefly.com> (Nicolas
 Serafini's message of "Thu, 24 Jan 2019 10:53:47 +0000")
References: <20190124105327.65069-1-nicolas.serafini@sensefly.com>
Message-ID: <87tvhwu7h8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Serafini <nicolas.serafini@sensefly.com> writes:

 > Add patch to fix musl TEMP_FAILURE_RETRY error
 > Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
 > ---
 >  package/ofono/0002-fix-musl-compile.patch | 37 +++++++++++++++++++++++
 >  package/ofono/ofono.hash                  |  4 ++-
 >  package/ofono/ofono.mk                    |  2 +-
 >  3 files changed, 41 insertions(+), 2 deletions(-)
 >  create mode 100644 package/ofono/0002-fix-musl-compile.patch

 > diff --git a/package/ofono/0002-fix-musl-compile.patch b/package/ofono/0002-fix-musl-compile.patch
 > new file mode 100644
 > index 0000000000..369fb71791
 > --- /dev/null
 > +++ b/package/ofono/0002-fix-musl-compile.patch
 > @@ -0,0 +1,37 @@
 > +From 4a1d114fa3a5d6bef1f71222787c1f6c3a952284 Mon Sep 17 00:00:00 2001
 > +From: Nicolas Serafini <nicolas.serafini@sensefly.com>
 > +Date: Thu, 24 Jan 2019 10:11:42 +0100
 > +Subject: [PATCH] mbim: add optional copy of TEMP_FAILURE_RETRY macro (fix musl
 > + compile)
 > +
 > +TEMP_FAILURE_RETRY is not available on musl.
 > +
 > +Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

Committed, thanks. Do not forget to submit the patch upstream.

-- 
Bye, Peter Korsgaard
