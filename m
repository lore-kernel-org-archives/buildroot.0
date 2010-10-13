From: Giriprasad Deviprasad <g_pr21@yahoo.in>
Date: Wed, 13 Oct 2010 16:12:04 +0530 (IST)
Subject: [Buildroot] Gtk on Arm
In-Reply-To: <AANLkTikDGchiLkpU0vEiWJGOD7BbCq1CUzu5UHOM4AUN@mail.gmail.com>
Message-ID: <939698.12556.qm@web95715.mail.in.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I enabled WCHAR and C++, build errors as :
/bin/sh ./config.charset 'arm-unknown-linux-gnu' > t-charset.alias
In file included from mbchar.h:285,
???????????????? from mbchar.c:22:
wcwidth.h:62: error: expected ')' before 'wc'
In file included from mbchar.c:22:
mbchar.h:294: error: expected specifier-qualifier-list before 'wchar_t'
mbchar.h: In function 'mb_copy':
mbchar.h:390: error: 'mbchar_t' has no member named 'buf'
mbchar.h:392: error: 'mbchar_t' has no member named 'buf'
mbchar.h:392: error: 'mbchar_t' has no member named 'buf'
mbchar.h:393: error: 'mbchar_t' has no member named 'buf'
mbchar.h:399: error: 'mbchar_t' has no member named 'wc'
mbchar.h:399: error: 'mbchar_t' has no member named 'wc'
make[5]: *** [mbchar.o] Error 1
make[5]: *** Waiting for unfinished jobs....
mv t-charset.alias charset.alias

Isn't this line saying anything to you?
 
  ? ?              -*-
 libpng                                                               



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101013/f3a8a22b/attachment.html>
