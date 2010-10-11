From: Giriprasad Deviprasad <g_pr21@yahoo.in>
Date: Mon, 11 Oct 2010 17:43:55 +0530 (IST)
Subject: [Buildroot] Gtk on Arm
In-Reply-To: <80E679EB71174AC5A2DEBB9A03A73A76@beraninstruments.com.local>
Message-ID: <875367.62941.qm@web95714.mail.in.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I enabled WHAR and C++ in the config, errors as :
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

Does your toolchain have C++ and WCHAR support?



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101011/bc9a478a/attachment.html>
