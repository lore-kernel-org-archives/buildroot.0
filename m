From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Oct 2019 08:05:25 +0200
Subject: [Buildroot] [PATCH 2019.02.x] qt5base: Add patch to fix compile
 issue with gcc9
In-Reply-To: <20190920083428.28841-1-julien.beraud@orolia.com> ("Julien
 =?utf-8?Q?B=C3=A9raud=22's?= message of "Fri, 20 Sep 2019 08:34:58 +0000")
References: <20190920083428.28841-1-julien.beraud@orolia.com>
Message-ID: <87o8yzy95m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien B?raud <julien.beraud@orolia.com> writes:

 > Fixes an issue when building Qt5 on a machine that has gcc9 as the
 > system compiler.

 > Original commit in qt5base:
 > https://github.com/qt/qtbase/commit/a52d7861edfb5956de38ba80015c4dd0b596259b#diff-0b4819f9df9c43297ba840d1ac401599

 > Signed-off-by: Julien Beraud <julien.beraud@orolia.com>
 > Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  .../0006-Fix-compile-issue-with-gcc-9.patch   | 32 +++++++++++++++++++
 >  1 file changed, 32 insertions(+)
 >  create mode 100644 package/qt5/qt5base/5.11.3/0006-Fix-compile-issue-with-gcc-9.patch

 > diff --git a/package/qt5/qt5base/5.11.3/0006-Fix-compile-issue-with-gcc-9.patch b/package/qt5/qt5base/5.11.3/0006-Fix-compile-issue-with-gcc-9.patch
 > new file mode 100644
 > index 0000000000..a10ab06e35
 > --- /dev/null
 > +++ b/package/qt5/qt5base/5.11.3/0006-Fix-compile-issue-with-gcc-9.patch
 > @@ -0,0 +1,32 @@
 > +From e094806951ff7337b5b0c534db479e3808f153a7 Mon Sep 17 00:00:00 2001
 > +From: Allan Sandfeld Jensen <allan.jensen@qt.io>
 > +Date: Tue, 13 Nov 2018 16:00:23 +0100
 > +Subject: [PATCH 1/1] Fix compile issue with gcc 9

Committed to 2019.02.x after dropping the patch number from the patch, thanks.

-- 
Bye, Peter Korsgaard
