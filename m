From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Thu, 25 Jan 2007 05:14:28 -0800 (PST)
Subject: [Buildroot] __getpgid in glibc but not in uClibc?
Message-ID: <1369.63.193.249.101.1169730868.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have an application that requires __getpgid.
This system call appears to be in glibc.

1.  Is the __getpgid system call in uClibc?
    If so, can someone tell me how to enable the
    compilation of __getpgid in uClibc?

2.  If Q#1's answer is no, is it possible for
    __getpgid to be added from glibc to uClibc as
    source code?  Or does __getpgid need to be
    rewritten for uClibc?  Or can I inline the
    __getpgid source code in my application's
    source code?

Thanks for any pointers,

Nina
