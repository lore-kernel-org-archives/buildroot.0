From: dangbinghoo <dangbinghoo@gmail.com>
Date: Thu, 07 Aug 2008 18:05:45 +0800
Subject: [Buildroot] Problem on uclibc headers !
Message-ID: <1218103545.4958.1.camel@gentoo-dang.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
  I am new in cross toolchain building for ARM.the official uclibc site
pointed to the buildroot for a toolchain building based on uclibc.But I
want to know what details happend. The cross linux from scratch project
has a book (which now still in svn phase),and there is a problem when
build the uclibc headers,and the uclibc header was forced to build when
even the cross toolchain was not ready,clfs solved this by simply
removed the uclibc headers build.But when I use buildroot I found
buildroot is now building the uclibc headers ,what things puzzled me is
that the step for building uclibc headers was failed ,and buildroot
simply ignored that.So,my question is dose it really need build uclibc
headers for the toolchain building ? If not,and what actually the
buildroot do in the uclibc headers building step?
  Anyone who knows this? Help me please! Thank you!
