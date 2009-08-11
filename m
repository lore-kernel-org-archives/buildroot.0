From: Will Newton <will.newton@gmail.com>
Date: Tue, 11 Aug 2009 16:55:37 +0100
Subject: [Buildroot] Explicit dependencies on uclibc in makefiles
Message-ID: <87a5b0800908110855g778df6aanbf9307ca69e676c9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

A number of packages in buildroot express explicit dependencies on
uclibc in their makefiles, e.g.:

 MYPACKAGE_DEPENDENCIES = uclibc

Is this really necessary?
